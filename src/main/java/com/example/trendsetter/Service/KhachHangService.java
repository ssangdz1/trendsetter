package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.KhachHang;
import com.example.trendsetter.Repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangService {

    @Autowired
    KhachHangRepository khachHangRepository;

    public List<KhachHang> getAll() {
        return khachHangRepository.findAll();
    }

    public void save(KhachHang khachHang) {
        khachHangRepository.save(khachHang);
    }

    public void delete(Integer id) {
        khachHangRepository.deleteById(id);
    }

    public KhachHang findById(Integer id) {
        return khachHangRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy
    }
}
