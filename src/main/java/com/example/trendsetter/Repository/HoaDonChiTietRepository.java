package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {
    List<HoaDonChiTiet> findByHoaDon_Id(Integer maHoaDon); // Phương thức trả về danh sách các chi tiết hóa đơn dựa trên mã hóa đơn
}

