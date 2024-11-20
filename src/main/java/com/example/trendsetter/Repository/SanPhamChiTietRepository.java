package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Integer> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
    List<SanPhamChiTiet> findByMaSanPham_MaDanhMuc_Id(Integer danhMucId);

}
