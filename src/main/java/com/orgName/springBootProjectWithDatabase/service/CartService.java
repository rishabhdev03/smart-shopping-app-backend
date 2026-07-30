package com.orgName.springBootProjectWithDatabase.service;

import com.orgName.springBootProjectWithDatabase.dto.AddToCartDto;
import com.orgName.springBootProjectWithDatabase.dto.CartItemDto;
import com.orgName.springBootProjectWithDatabase.entity.CartItem;
import com.orgName.springBootProjectWithDatabase.entity.Product;
import com.orgName.springBootProjectWithDatabase.entity.User;
import com.orgName.springBootProjectWithDatabase.exception.CartItemNotFoundException;
import com.orgName.springBootProjectWithDatabase.exception.ProductNotFoundException;
import com.orgName.springBootProjectWithDatabase.exception.UserNotFoundException;
import com.orgName.springBootProjectWithDatabase.repository.CartItemRepository;
import com.orgName.springBootProjectWithDatabase.repository.ProductRepository;
import com.orgName.springBootProjectWithDatabase.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
@Transactional
public class CartService {

    private final CartItemRepository cartItemRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final ProductService productService;

    public List<CartItemDto> getCart(String email) {
        User user = getUserByEmail(email);
        return cartItemRepository.findByUserId(user.getId())
                .stream().map(this::toDto).toList();
    }

    public CartItemDto addToCart(String email, AddToCartDto dto) {
        User user = getUserByEmail(email);
        Product product = productRepository.findById(dto.getProductId())
                .orElseThrow(() -> new ProductNotFoundException("Product not found with id: " + dto.getProductId()));

        // If this product is already in the cart, increase quantity instead of creating a duplicate
        Optional<CartItem> existing = cartItemRepository.findByUserIdAndProductId(user.getId(), product.getId());
        if (existing.isPresent()) {
            CartItem item = existing.get();
            item.setQuantity(item.getQuantity() + dto.getQuantity());
            return toDto(item);
        }

        CartItem cartItem = new CartItem();
        cartItem.setUser(user);
        cartItem.setProduct(product);
        cartItem.setQuantity(dto.getQuantity());
        return toDto(cartItemRepository.save(cartItem));
    }

    public CartItemDto updateCartItem(String email, Long cartItemId, int quantity) {
        User user = getUserByEmail(email);
        CartItem cartItem = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new CartItemNotFoundException("Cart item not found with id: " + cartItemId));

        // Ensure the cart item belongs to the requesting user
        if (!cartItem.getUser().getId().equals(user.getId())) {
            throw new CartItemNotFoundException("Cart item not found with id: " + cartItemId);
        }

        cartItem.setQuantity(quantity);
        return toDto(cartItem);
    }

    public void removeFromCart(String email, Long cartItemId) {
        User user = getUserByEmail(email);
        CartItem cartItem = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new CartItemNotFoundException("Cart item not found with id: " + cartItemId));

        // Ensure the cart item belongs to the requesting user
        if (!cartItem.getUser().getId().equals(user.getId())) {
            throw new CartItemNotFoundException("Cart item not found with id: " + cartItemId);
        }

        cartItemRepository.deleteById(cartItemId);
    }

    public void clearCart(String email) {
        User user = getUserByEmail(email);
        cartItemRepository.deleteByUserId(user.getId());
    }

    // ---------- helpers ----------

    private User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));
    }

    private CartItemDto toDto(CartItem item) {
        BigDecimal subtotal = item.getProduct().getPrice()
                .multiply(BigDecimal.valueOf(item.getQuantity()));
        return new CartItemDto(
                item.getId(),
                productService.toDto(item.getProduct()),
                item.getQuantity(),
                subtotal
        );
    }
}
