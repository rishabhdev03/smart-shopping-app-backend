package com.orgName.springBootProjectWithDatabase.controller;

import com.orgName.springBootProjectWithDatabase.dto.CreateOrderDto;
import com.orgName.springBootProjectWithDatabase.dto.OrderDto;
import com.orgName.springBootProjectWithDatabase.service.OrderService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
@AllArgsConstructor
public class OrderController {

    private final OrderService orderservice;

    // ---------- USER (own data only) ----------

    @PostMapping
    public ResponseEntity<OrderDto> createOrder(@AuthenticationPrincipal UserDetails userDetails,
                                                @RequestBody CreateOrderDto createOrderDto) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(orderservice.createOrder(userDetails.getUsername(), createOrderDto));
    }

    @GetMapping("/my")
    public ResponseEntity<List<OrderDto>> getMyOrders(@AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.status(HttpStatus.OK)
                .body(orderservice.getMyOrders(userDetails.getUsername()));
    }

    @GetMapping("/my/{id}")
    public ResponseEntity<OrderDto> getMySpecificOrder(@AuthenticationPrincipal UserDetails userDetails,
                                                       @PathVariable Long id) {
        return ResponseEntity.status(HttpStatus.OK)
                .body(orderservice.getMySpecificOrder(userDetails.getUsername(), id));
    }

    // ---------- ADMIN (full access) ----------

    @GetMapping
    public ResponseEntity<List<OrderDto>> getAllOrders() {
        return ResponseEntity.status(HttpStatus.OK).body(orderservice.getAllOrders());
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<List<OrderDto>> getOrdersByUserId(@PathVariable Long id) {
        return ResponseEntity.status(HttpStatus.OK).body(orderservice.getOrdersByUserId(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable Long id) {
        orderservice.deleteOrder(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}