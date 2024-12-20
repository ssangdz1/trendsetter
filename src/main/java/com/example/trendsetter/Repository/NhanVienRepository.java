package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {
    NhanVien findByTaiKhoanAndMatKhau(String taiKhoan, String matKhau);

    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}
