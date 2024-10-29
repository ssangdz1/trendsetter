package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.DanhMuc;
import com.example.trendsetter.Entity.SanPham;
import com.example.trendsetter.Repository.SanPhamChiTietRepository;
import com.example.trendsetter.Repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamService {

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    SanPhamChiTietRepository sanPhamChiTietRepository;

    public List<SanPham> getAll() {
        List<SanPham> danhSachSanPham = sanPhamRepository.findAll();
        return danhSachSanPham;

    }

    public void save(SanPham sanPham) {
        sanPhamRepository.save(sanPham);
    }

    public void delete(Integer id) {
        sanPhamRepository.deleteById(id);
    }

    public SanPham findById(Integer id) {
        return sanPhamRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy
    }


}
