package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.NhanVien;
import com.example.trendsetter.Repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class NhanVienService {

    @Autowired
    NhanVienRepository nhanVienRepository;


    public List<NhanVien> getAll() {
        return nhanVienRepository.findAll();
    }

    public void save(NhanVien nhanVien) {
        nhanVienRepository.save(nhanVien);
    }

    public void delete(Integer id) {
        nhanVienRepository.deleteById(id);
    }

    public NhanVien findById(Integer id) {
        return nhanVienRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy
    }
}
