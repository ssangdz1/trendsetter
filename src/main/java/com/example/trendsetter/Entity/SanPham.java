package com.example.trendsetter.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "san_pham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten_san_pham", nullable = false)
    private String tenSanPham;

    @ManyToOne
    @JoinColumn(name = "ma_danh_muc", referencedColumnName = "id")
    private DanhMuc maDanhMuc;

}
