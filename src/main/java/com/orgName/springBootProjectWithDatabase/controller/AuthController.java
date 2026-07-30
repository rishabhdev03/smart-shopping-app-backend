package com.orgName.springBootProjectWithDatabase.controller;

import com.orgName.springBootProjectWithDatabase.dto.CreateUserDto;
import com.orgName.springBootProjectWithDatabase.dto.LoginDto;
import com.orgName.springBootProjectWithDatabase.dto.LoginResponseDto;
import com.orgName.springBootProjectWithDatabase.dto.RegisterUserResponseDto;
import com.orgName.springBootProjectWithDatabase.service.AuthService;
import com.orgName.springBootProjectWithDatabase.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<RegisterUserResponseDto> registerUser(@RequestBody CreateUserDto createUserDto){
        return ResponseEntity.status(HttpStatus.CREATED).body(authService.registerUser(createUserDto));
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponseDto> loginUser(@RequestBody LoginDto loginDto){
      return  ResponseEntity.status(HttpStatus.OK).body(authService.loginUser(loginDto));
    }

}
