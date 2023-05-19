package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.RefreshToken;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.token.TokenService;

import java.util.List;

public interface RefreshTokenService {
    RefreshToken save(RefreshToken token);

    User findUserByToken(String token);

    List<RefreshToken> findByUserId(int userId);

    RefreshToken findByTokenId(int tokenId);

    RefreshToken findByToken(String token);

    void deleteByRfToken(String token);

    void deleteById(int id);

    void deleteAllByUserId(int id);
}
