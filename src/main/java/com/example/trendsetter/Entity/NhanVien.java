// NhanVien.java
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
@Table(name = "nhan_vien")
@EntityListeners(AuditingEntityListener.class)
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ho_ten", nullable = false)
    private String hoTen;


    @Column(name = "vai_tro", nullable = false)
    private String vaiTro = "nhan_vien"; // Mặc định là 'nhan_vien'

    @Column(name = "tai_khoan", nullable = false, unique = true)
    private String taiKhoan;

    @Column(name = "mat_khau", nullable = false)
    private String matKhau; // Nên mã hóa mật khẩu
}
