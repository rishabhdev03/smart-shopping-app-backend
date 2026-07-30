package com.orgName.springBootProjectWithDatabase.service;

import com.orgName.springBootProjectWithDatabase.dto.CreateUserDto;
import com.orgName.springBootProjectWithDatabase.dto.UserDto;
import com.orgName.springBootProjectWithDatabase.entity.User;
import com.orgName.springBootProjectWithDatabase.exception.UserNotFoundException;
import com.orgName.springBootProjectWithDatabase.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.jspecify.annotations.Nullable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userrepository;

    // ---------- USER (identity from JWT) ----------

    public @Nullable UserDto getCurrentUserProfile(String email) {
        User user = userrepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));
        return new UserDto(user.getId(), user.getName(), user.getEmail());
    }

    @Transactional
    public @Nullable UserDto updateCurrentUserProfile(String email, CreateUserDto createUserDto) {
        User user = userrepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));

        if (createUserDto.getName() != null) {
            user.setName(createUserDto.getName());
        }
        if (createUserDto.getEmail() != null) {
            user.setEmail(createUserDto.getEmail());
        }
        return new UserDto(user.getId(), user.getName(), user.getEmail());
    }

    // ---------- ADMIN ----------

    public @Nullable List<UserDto> getAllUsers() {
        List<User> users = userrepository.findAll();
        List<UserDto> userDtoList = new ArrayList<>();
        for (User user : users) {
            userDtoList.add(new UserDto(user.getId(), user.getName(), user.getEmail()));
        }
        return userDtoList;
    }

    public @Nullable UserDto getUserById(Long id) {
        User user = userrepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found with the id : " + id));
        return new UserDto(user.getId(), user.getName(), user.getEmail());
    }

    public void deleteUser(Long id) {
        if (!userrepository.existsById(id)) {
            throw new UserNotFoundException("User not found with the id : " + id);
        }
        userrepository.deleteById(id);
    }

    public @Nullable List<UserDto> getAllUsersPaginated(int page, int pageSize, String direction, String sortBy) {
        Sort sort = direction.equalsIgnoreCase("asc") ? Sort.by(sortBy).ascending() : Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        Page<User> userPage = userrepository.findAll(pageable);

        List<UserDto> userDtoList = new ArrayList<>();
        userPage.forEach(user -> userDtoList.add(new UserDto(user.getId(), user.getName(), user.getEmail())));
        return userDtoList;
    }
}