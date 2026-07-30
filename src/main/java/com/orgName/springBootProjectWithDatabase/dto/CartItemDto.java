package com.orgName.springBootProjectWithDatabase.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
public class CartItemDto {
    private Long id;
    private ProductDto product;
    private int quantity;
    private BigDecimal subtotal;
}
