package com.example.demo.service.impl;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.RefreshToken;
import com.example.demo.repository.RefreshTokenRepository;
import com.example.demo.service.RefreshTokenService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.token.TokenService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class RefreshTokenServiceImpl implements RefreshTokenService {
    @Autowired
    private RefreshTokenRepository repository;
    @Override
    public RefreshToken save(RefreshToken token) {
        return repository.save(token);
    }

    @Override
    public User findUserByToken(String token) {
        return repository.findUserByToken(token);
    }

    @Override
    public List<RefreshToken> findByUserId(int userId) {
        return repository.findByUserId(userId);
    }

    @Override
    public RefreshToken findByTokenId(int tokenId) {
        return repository.findById(tokenId);
    }

    @Override
    public RefreshToken findByToken(String token) {
        return repository.findByRfToken(token);
    }

    @Override
    public void deleteByRfToken(String token) {
        repository.deleteByRfToken(token);
    }

    @Override
    public void deleteById(int id) {
        repository.deleteById(id);
    }

    @Override
    public void deleteAllByUserId(int id) {
        repository.deleteAllByUserId(id);
    }
}
