package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Generated;
import lombok.NoArgsConstructor;

import java.util.Set;

@Entity
@Table(name = "voucher")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "voucherId")
    private Integer voucherId;
    private String code;
    private int persen;
    @OneToMany(fetch = FetchType.EAGER , cascade = CascadeType.ALL , mappedBy = "voucher")
    @JsonIgnore
    private Set<SaleOrder> saleOrders;
    @OneToMany(fetch = FetchType.EAGER , cascade =  CascadeType.ALL , mappedBy = "voucher")
    @JsonIgnore
    private Set<User_Voucher> user_vouchers;
}
