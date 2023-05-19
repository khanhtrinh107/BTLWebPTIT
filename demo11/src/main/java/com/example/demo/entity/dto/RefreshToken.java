package com.example.demo.entity.dto;

import com.example.demo.entity.User;
import com.example.demo.security.UserDetail;
import jakarta.persistence.*;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RefreshToken {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    private String rfToken;
}
