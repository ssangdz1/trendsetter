package com.example.trendsetter.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hoa_don")
@EntityListeners(EntityListeners.class)
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ma_khach_hang", referencedColumnName = "id")
    private KhachHang maKhachHang;

    @ManyToOne
    @JoinColumn(name = "ma_nhan_vien", referencedColumnName = "id")
    private NhanVien maNhanVien;

    @Column(name = "tong_tien", nullable = false)
    private Double tongTien;

    @CreatedDate
    @Column(name = "ngay_tao", updatable = false) // Không cho phép cập nhật
    private Date ngayTao;


    @Column(name = "trang_thai", nullable = false)
    private String trangThai;

    @PrePersist
    public void prePersist() {
        this.ngayTao = new Date(); // Gán ngày hiện tại trước khi lưu vào DB
    }


    // Thêm phương thức để lấy danh sách chi tiết hóa đơn
    @OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL)
    private List<HoaDonChiTiet> hoaDonChiTietList;

}

