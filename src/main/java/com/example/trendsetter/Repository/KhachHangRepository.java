package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
    KhachHang findByEmailAndMatKhau(String email, String matKhau);
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}
