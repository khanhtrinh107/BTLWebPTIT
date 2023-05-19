package com.example.demo.repository;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken , Integer> {
    RefreshToken findByRfToken(String token);

    @Query("select r.user  from RefreshToken r where r.rfToken = ?1")
    User findUserByToken(String token);
    @Query("select t from RefreshToken t where t.user.userId = ?1")
    List<RefreshToken> findByUserId(int id);
    @Modifying
    void deleteByRfToken(String token);

    RefreshToken findById(int id);

    @Modifying
    @Query("delete from RefreshToken r where r.user.userId = ?1")
    void deleteAllByUserId(int id);
}
