package com.orgName.springBootProjectWithDatabase.dto;

import com.orgName.springBootProjectWithDatabase.entity.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class OrderDto {
    private Long id;
    private ProductDto product;
    private int quantity;
    private BigDecimal totalPrice;
    private OrderStatus status;
    private LocalDateTime orderDate;
    private UserDto user;
}
