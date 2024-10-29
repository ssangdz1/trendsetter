package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.HoaDon;
import com.example.trendsetter.Entity.HoaDonChiTiet;
import com.example.trendsetter.Repository.HoaDonChiTietRepository;
import com.example.trendsetter.Repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    public List<HoaDonChiTiet> getHoaDonChiTietList(Integer maHoaDon) {
        return hoaDonChiTietRepository.findByHoaDon_Id(maHoaDon);
    }

    public List<HoaDon> getAll() {
        List<HoaDon> hoaDons = hoaDonRepository.findAll();
        for (HoaDon hoaDon : hoaDons) {
            double tongTien = 0.0;
            for (HoaDonChiTiet chiTiet : hoaDon.getHoaDonChiTietList()) {
                tongTien += chiTiet.getSoLuong() * chiTiet.getGia();
            }
            hoaDon.setTongTien(tongTien); // Cập nhật tổng tiền
        }
        return hoaDons;
    }

    public HoaDon findById(Integer id) {
        return hoaDonRepository.findById(id).orElse(null);
    }

    public void save(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        hoaDonRepository.deleteById(id);
    }
}
