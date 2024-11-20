package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.KhachHang;
import com.example.trendsetter.Repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    // Tìm khách hàng theo ID
    public Optional<KhachHang> findById(Integer id) {
        return khachHangRepository.findById(id); // Trả về Optional để xử lý linh hoạt hơn
    }


}
