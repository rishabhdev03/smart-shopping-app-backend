package com.orgName.springBootProjectWithDatabase.controller;

import com.orgName.springBootProjectWithDatabase.dto.AddToCartDto;
import com.orgName.springBootProjectWithDatabase.dto.CartItemDto;
import com.orgName.springBootProjectWithDatabase.service.CartService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/cart")
@AllArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping
    public ResponseEntity<List<CartItemDto>> getCart(@AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(cartService.getCart(userDetails.getUsername()));
    }

    @PostMapping
    public ResponseEntity<CartItemDto> addToCart(@AuthenticationPrincipal UserDetails userDetails,
                                                 @Valid @RequestBody AddToCartDto addToCartDto) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(cartService.addToCart(userDetails.getUsername(), addToCartDto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CartItemDto> updateCartItem(@AuthenticationPrincipal UserDetails userDetails,
                                                      @PathVariable Long id,
                                                      @RequestParam int quantity) {
        return ResponseEntity.ok(cartService.updateCartItem(userDetails.getUsername(), id, quantity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> removeFromCart(@AuthenticationPrincipal UserDetails userDetails,
                                               @PathVariable Long id) {
        cartService.removeFromCart(userDetails.getUsername(), id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @DeleteMapping
    public ResponseEntity<Void> clearCart(@AuthenticationPrincipal UserDetails userDetails) {
        cartService.clearCart(userDetails.getUsername());
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
