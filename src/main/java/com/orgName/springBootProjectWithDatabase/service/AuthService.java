package com.orgName.springBootProjectWithDatabase.service;

import com.orgName.springBootProjectWithDatabase.dto.CreateUserDto;
import com.orgName.springBootProjectWithDatabase.dto.LoginDto;
import com.orgName.springBootProjectWithDatabase.dto.LoginResponseDto;
import com.orgName.springBootProjectWithDatabase.dto.RegisterUserResponseDto;
import com.orgName.springBootProjectWithDatabase.entity.Role;
import com.orgName.springBootProjectWithDatabase.entity.User;
import com.orgName.springBootProjectWithDatabase.repository.UserRepository;
import com.orgName.springBootProjectWithDatabase.security.JwtService;
import lombok.AllArgsConstructor;
import org.jspecify.annotations.Nullable;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@AllArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    public RegisterUserResponseDto registerUser(CreateUserDto createUserDto){
        User user = new User();
        user.setName(createUserDto.getName());
        user.setEmail(createUserDto.getEmail());
        user.setRole(Role.USER);
        user.setPassword(passwordEncoder.encode(createUserDto.getPassword()));

        User savedUser = userRepository.save(user);

        return new RegisterUserResponseDto(savedUser.getName(), savedUser.getId());
    }

    public @Nullable LoginResponseDto loginUser(LoginDto loginDto) {
       Authentication authentication = authenticationManager.authenticate(
               new UsernamePasswordAuthenticationToken(loginDto.getEmail(), loginDto.getPassword())
       );

//       String jwtToken = jwtService.generateJwtToken(authentication.getPrincipal())
        String jwtToken = jwtService.generateJwtToken((UserDetails) Objects.requireNonNull(authentication.getPrincipal()));
        return new LoginResponseDto(jwtToken);
    }
}
