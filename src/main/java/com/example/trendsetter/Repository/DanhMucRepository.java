package com.example.trendsetter.Repository;

import com.example.trendsetter.Entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DanhMucRepository extends JpaRepository<DanhMuc, Integer> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây
}
