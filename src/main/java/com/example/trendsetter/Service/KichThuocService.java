package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.KichThuoc;
import com.example.trendsetter.Repository.KichThuocRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KichThuocService {
    @Autowired
    KichThuocRepository kichThuocRepository;

    public List<KichThuoc> getAll() {
        return kichThuocRepository.findAll();
    }

    public void save(KichThuoc kichThuoc) {
        kichThuocRepository.save(kichThuoc);
    }

    public void delete(Integer id) {
        kichThuocRepository.deleteById(id);
    }

    public KichThuoc findById(Integer id) {
        return kichThuocRepository.findById(id).orElse(null);
    }
}
