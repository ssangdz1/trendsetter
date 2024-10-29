package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    // Truy vấn để tính tồn kho thực tế cho sản phẩm theo ID
}
