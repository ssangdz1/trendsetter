package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.SanPham;
import com.example.trendsetter.Entity.SanPhamChiTiet;
import com.example.trendsetter.Repository.SanPhamChiTietRepository;
import com.example.trendsetter.Repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamChiTietService {

    @Autowired
    SanPhamChiTietRepository sanPhamChiTietRepository;

    @Autowired
    SanPhamRepository sanPhamRepository;

    // Lấy danh sách tất cả sản phẩm chi tiết
    public List<SanPhamChiTiet> getAll() {
        return sanPhamChiTietRepository.findAll();
    }

    // Lưu sản phẩm chi tiết mới
    public void save(SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTietRepository.save(sanPhamChiTiet);
    }

    // Cập nhật sản phẩm chi tiết
    public void update(SanPhamChiTiet sanPhamChiTiet) {
            sanPhamChiTietRepository.save(sanPhamChiTiet);
    }

    // Xóa sản phẩm chi tiết
    public void delete(Integer id) {
        sanPhamChiTietRepository.deleteById(id);
    }

    // Tìm sản phẩm chi tiết theo ID
    public SanPhamChiTiet findById(Integer id) {
        return sanPhamChiTietRepository.findById(id).orElse(null);
    }

    public List<SanPhamChiTiet> getByDanhMucId(Integer danhMucId) {
        return sanPhamChiTietRepository.findByMaSanPham_MaDanhMuc_Id(danhMucId);
    }

    public SanPhamChiTiet getById(Integer id) {
        return sanPhamChiTietRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy
    }
}
