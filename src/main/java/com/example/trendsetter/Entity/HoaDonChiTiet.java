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
@Table(name = "hoa_don_chi_tiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ma_hoa_don") // Tên cột trong bảng HoaDonChiTiet
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "ma_san_pham_chi_tiet", referencedColumnName = "id")
    private SanPhamChiTiet maSanPhamChiTiet;

    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

    @Column(name = "gia", nullable = false)
    private Float gia;

    // Tính tổng tiền cho sản phẩm trong giỏ hàng
    public Float getTongTien() {
        return soLuong * gia;
    }
}
