package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây nếu cần

}
