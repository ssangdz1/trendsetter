// KhachHang.java
package com.example.trendsetter.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "khach_hang")
@EntityListeners(AuditingEntityListener.class)
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ho_ten", nullable = false)
    private String hoTen;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "so_dien_thoai", nullable = false)
    private String soDienThoai;

    @Column(name = "dia_chi")
    private String diaChi;

//    @Column(name = "tai_khoan", nullable = false, unique = true)
//    private String taiKhoan;

    @Column(name = "mat_khau", nullable = false)
    private String matKhau; // Nên mã hóa mật khẩu
}
