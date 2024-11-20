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
@Table(name = "san_pham_chi_tiet")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "ma_san_pham", referencedColumnName = "id")
    private SanPham maSanPham;
    @ManyToOne
    @JoinColumn(name = "ma_mau_sac", referencedColumnName = "id")
    private MauSac maMauSac;
    @ManyToOne
    @JoinColumn(name = "ma_kich_thuoc", referencedColumnName = "id")
    private KichThuoc maKichThuoc;
    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;
    @Column(name = "gia", nullable = false)
    private Float gia;
    @Column(name = "hinh_anh")
    private String hinhAnh;
    @Column(name = "mo_ta")
    private String moTa;
}
