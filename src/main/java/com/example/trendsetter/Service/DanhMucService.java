package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.DanhMuc;
import com.example.trendsetter.Repository.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanhMucService {

    @Autowired
    private DanhMucRepository danhMucRepository;

    public List<DanhMuc> getAll() {
        return danhMucRepository.findAll();
    }

    public void save(DanhMuc danhMuc) {
        danhMucRepository.save(danhMuc);
    }


    public void delete(Integer id) {
        danhMucRepository.deleteById(id);
    }

    public DanhMuc findById(Integer id) {
        return danhMucRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy;
    }
}


