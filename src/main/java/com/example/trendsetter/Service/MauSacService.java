package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.MauSac;
import com.example.trendsetter.Repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MauSacService {
    @Autowired
    MauSacRepository mauSacRepository;

    public List<MauSac> getAll() {
        return mauSacRepository.findAll();
    }

    public void save(MauSac mauSac) {
        mauSacRepository.save(mauSac);
    }

    public void delete(Integer id) {
        mauSacRepository.deleteById(id);
    }

    public MauSac findById(Integer id) {
        return mauSacRepository.findById(id).orElse(null);
    }
}
