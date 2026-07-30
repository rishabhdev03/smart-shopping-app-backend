package com.orgName.springBootProjectWithDatabase.controller;

import com.orgName.springBootProjectWithDatabase.dto.CreateUserDto;
import com.orgName.springBootProjectWithDatabase.dto.UserDto;
import com.orgName.springBootProjectWithDatabase.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users")
@AllArgsConstructor
public class UserController {

    private final UserService userservice;

    // ---------- USER (identity from JWT) ----------

    @GetMapping("/me")
    public ResponseEntity<UserDto> getCurrentUser(@AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.status(HttpStatus.OK)
                .body(userservice.getCurrentUserProfile(userDetails.getUsername()));
    }

    @PutMapping("/me")
    public ResponseEntity<UserDto> updateCurrentUser(@AuthenticationPrincipal UserDetails userDetails,
                                                     @RequestBody CreateUserDto createUserDto) {
        return ResponseEntity.status(HttpStatus.OK)
                .body(userservice.updateCurrentUserProfile(userDetails.getUsername(), createUserDto));
    }

    // ---------- ADMIN ----------

    @GetMapping
    public ResponseEntity<List<UserDto>> getAllUsers() {
        return ResponseEntity.status(HttpStatus.OK).body(userservice.getAllUsers());
    }

    @GetMapping("/paginated")
    public ResponseEntity<List<UserDto>> getAllUsersPaginated(@RequestParam int page, @RequestParam int pageSize,
                                                              @RequestParam(defaultValue = "asc") String direction,
                                                              @RequestParam(defaultValue = "name") String sortBy) {
        return ResponseEntity.status(HttpStatus.OK)
                .body(userservice.getAllUsersPaginated(page, pageSize, direction, sortBy));
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDto> getUserById(@PathVariable Long id) {
        return ResponseEntity.status(HttpStatus.OK).body(userservice.getUserById(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userservice.deleteUser(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}