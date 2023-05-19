package com.example.demo.entity.dto;

import com.example.demo.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseUser {
    private String token;
    private String refreshToken;
    private String username;
    private int status;
    private List<GrantedAuthority> roles;
}
