package com.orgName.springBootProjectWithDatabase.dto;

import com.orgName.springBootProjectWithDatabase.entity.ProductCategory;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class CreateProductDto {

    @NotBlank
    private String name;

    private String description;

    @NotNull
    @DecimalMin(value = "0.01")
    private BigDecimal price;

    private String imageUrl;

    @NotNull
    private ProductCategory category;

    @Min(0)
    private int stock;
}
