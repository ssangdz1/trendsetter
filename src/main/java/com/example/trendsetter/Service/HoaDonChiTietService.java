package com.example.trendsetter.Service;

import com.example.trendsetter.Entity.HoaDonChiTiet;
import com.example.trendsetter.Repository.HoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class HoaDonChiTietService {

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    HoaDonService hoaDonService;

    public List<HoaDonChiTiet> getAll() {
        return hoaDonChiTietRepository.findAll();
    }

    public void save(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepository.save(hoaDonChiTiet);
    }


    public void delete(Integer id) {
        hoaDonChiTietRepository.deleteById(id);
    }


    public HoaDonChiTiet findById(Integer id) {
        return hoaDonChiTietRepository.findById(id).orElse(null); // Trả về null nếu không tìm thấy
    }

    public List<HoaDonChiTiet> getHoaDonChiTietList(Integer maHoaDon) { // Phương thức trả về danh sách chi tiết hóa đơn
        return hoaDonChiTietRepository.findByHoaDon_Id(maHoaDon); // Gọi phương thức từ repository để tìm chi tiết hóa đơn theo mã hóa đơn
    }
}
