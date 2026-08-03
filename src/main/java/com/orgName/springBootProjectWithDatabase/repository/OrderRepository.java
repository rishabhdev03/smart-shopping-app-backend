package com.orgName.springBootProjectWithDatabase.repository;

import com.orgName.springBootProjectWithDatabase.entity.Order;
import com.orgName.springBootProjectWithDatabase.entity.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> getByUserId(Long userId);
    Optional<Order> findByIdAndUserId(Long id, Long userId);
    List<Order> findByStatus(OrderStatus status);
}