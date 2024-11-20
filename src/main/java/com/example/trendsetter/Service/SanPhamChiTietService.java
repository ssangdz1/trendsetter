package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.SanPham;
import com.example.trendsetter.Entity.SanPhamChiTiet;
import com.example.trendsetter.Repository.SanPhamChiTietRepository;
import com.example.trendsetter.Repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Service
public class SanPhamChiTietService {

    @Autowired
    SanPhamChiTietRepository sanPhamChiTietRepository;

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Value("${upload.path}")
    private String uploadPath;

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
