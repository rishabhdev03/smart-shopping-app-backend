package com.orgName.springBootProjectWithDatabase.service;

import com.orgName.springBootProjectWithDatabase.dto.CreateOrderDto;
import com.orgName.springBootProjectWithDatabase.dto.OrderDto;
import com.orgName.springBootProjectWithDatabase.dto.ProductDto;
import com.orgName.springBootProjectWithDatabase.dto.UserDto;
import com.orgName.springBootProjectWithDatabase.entity.Order;
import com.orgName.springBootProjectWithDatabase.entity.OrderStatus;
import com.orgName.springBootProjectWithDatabase.entity.Product;
import com.orgName.springBootProjectWithDatabase.entity.User;
import com.orgName.springBootProjectWithDatabase.exception.OrderNotFoundException;
import com.orgName.springBootProjectWithDatabase.exception.ProductNotFoundException;
import com.orgName.springBootProjectWithDatabase.exception.UserNotFoundException;
import com.orgName.springBootProjectWithDatabase.repository.OrderRepository;
import com.orgName.springBootProjectWithDatabase.repository.ProductRepository;
import com.orgName.springBootProjectWithDatabase.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@AllArgsConstructor
@Transactional
public class OrderService {

    private final OrderRepository orderrepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final ProductService productService;

    // ---------- USER (own data only, identity from JWT) ----------

    public OrderDto createOrder(String email, CreateOrderDto createOrderDto) {
        User user = getUserByEmail(email);
        Product product = productRepository.findById(createOrderDto.getProductId())
                .orElseThrow(() -> new ProductNotFoundException("Product not found with id: " + createOrderDto.getProductId()));

        BigDecimal totalPrice = product.getPrice().multiply(BigDecimal.valueOf(createOrderDto.getQuantity()));

        Order order = new Order();
        order.setUser(user);
        order.setProduct(product);
        order.setQuantity(createOrderDto.getQuantity());
        order.setTotalPrice(totalPrice);
        order.setStatus(OrderStatus.PENDING);
        order.setOrderDate(LocalDateTime.now());

        Order savedOrder = orderrepository.save(order);
        return toDto(savedOrder);
    }

    public List<OrderDto> getMyOrders(String email) {
        User user = getUserByEmail(email);
        return orderrepository.getByUserId(user.getId()).stream().map(this::toDto).toList();
    }

    public OrderDto getMySpecificOrder(String email, Long orderId) {
        User user = getUserByEmail(email);
        Order order = orderrepository.findByIdAndUserId(orderId, user.getId())
                .orElseThrow(() -> new OrderNotFoundException("Order not found with id: " + orderId));
        return toDto(order);
    }

    // ---------- ADMIN (full access) ----------

    public List<OrderDto> getAllOrders() {
        return orderrepository.findAll().stream().map(this::toDto).toList();
    }

    public List<OrderDto> getOrdersByUserId(Long userId) {
        return orderrepository.getByUserId(userId).stream().map(this::toDto).toList();
    }

    public void deleteOrder(Long id) {
        if (!orderrepository.existsById(id)) {
            throw new OrderNotFoundException("Order not found with id: " + id);
        }
        orderrepository.deleteById(id);
    }

    // ---------- helpers ----------

    private User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));
    }

    private OrderDto toDto(Order order) {
        UserDto userDto = new UserDto(
                order.getUser().getId(),
                order.getUser().getName(),
                order.getUser().getEmail()
        );
        ProductDto productDto = productService.toDto(order.getProduct());
        return new OrderDto(
                order.getId(),
                productDto,
                order.getQuantity(),
                order.getTotalPrice(),
                order.getStatus(),
                order.getOrderDate(),
                userDto
        );
    }
}