package com.orgName.springBootProjectWithDatabase.service;

import com.orgName.springBootProjectWithDatabase.dto.CreateProductDto;
import com.orgName.springBootProjectWithDatabase.dto.ProductDto;
import com.orgName.springBootProjectWithDatabase.entity.Product;
import com.orgName.springBootProjectWithDatabase.entity.ProductCategory;
import com.orgName.springBootProjectWithDatabase.exception.ProductNotFoundException;
import com.orgName.springBootProjectWithDatabase.repository.ProductRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    // ---------- PUBLIC ----------

    public List<ProductDto> getAllProducts() {
        return productRepository.findAll().stream().map(this::toDto).toList();
    }

    public ProductDto getProductById(Long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ProductNotFoundException("Product not found with id: " + id));
        return toDto(product);
    }

    public List<ProductDto> searchProducts(String query, String category) {
        boolean hasQuery = query != null && !query.isBlank();
        boolean hasCategory = category != null && !category.isBlank();

        if (hasQuery && hasCategory) {
            ProductCategory cat = ProductCategory.valueOf(category.toUpperCase());
            return productRepository.findByCategoryAndNameContainingIgnoreCase(cat, query)
                    .stream().map(this::toDto).toList();
        } else if (hasQuery) {
            return productRepository.findByNameContainingIgnoreCase(query)
                    .stream().map(this::toDto).toList();
        } else if (hasCategory) {
            ProductCategory cat = ProductCategory.valueOf(category.toUpperCase());
            return productRepository.findByCategory(cat)
                    .stream().map(this::toDto).toList();
        } else {
            return getAllProducts();
        }
    }

    // ---------- ADMIN ----------

    @Transactional
    public ProductDto createProduct(CreateProductDto dto) {
        Product product = new Product();
        mapDtoToEntity(dto, product);
        return toDto(productRepository.save(product));
    }

    @Transactional
    public ProductDto updateProduct(Long id, CreateProductDto dto) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ProductNotFoundException("Product not found with id: " + id));
        mapDtoToEntity(dto, product);
        return toDto(product);
    }

    public void deleteProduct(Long id) {
        if (!productRepository.existsById(id)) {
            throw new ProductNotFoundException("Product not found with id: " + id);
        }
        productRepository.deleteById(id);
    }

    // ---------- helpers ----------

    public ProductDto toDto(Product product) {
        return new ProductDto(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getImageUrl(),
                product.getCategory(),
                product.getStock()
        );
    }

    private void mapDtoToEntity(CreateProductDto dto, Product product) {
        product.setName(dto.getName());
        product.setDescription(dto.getDescription());
        product.setPrice(dto.getPrice());
        product.setImageUrl(dto.getImageUrl());
        product.setCategory(dto.getCategory());
        product.setStock(dto.getStock());
    }
}
