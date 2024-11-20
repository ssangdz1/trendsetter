package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.*;
import com.example.trendsetter.Repository.HoaDonRepository;
import com.example.trendsetter.Repository.SanPhamChiTietRepository;
import com.example.trendsetter.Service.HoaDonChiTietService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private SanPhamChiTietRepository sanPhamChiTietRepository;

    @ModelAttribute("listHoaDon")
    List<HoaDon> getHoaDon() {
        return hoaDonRepository.findAll();
    }

    @ModelAttribute("listSanPhamChiTiet")
    List<SanPhamChiTiet> getSanPhamChitiet() {
        return sanPhamChiTietRepository.findAll();
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }

    @GetMapping("/hien-thi-hoa-don-chi-tiet")
    public String hienThiHDCT(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login";
        }

        NhanVien loggedInUser = (NhanVien) session.getAttribute("loggedInUser");
        if (!"admin".equals(loggedInUser.getVaiTro())) { // Kiểm tra nếu là quản lý
            redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập vào trang này.");
            return "redirect:/main"; // Chuyển hướng về trang chính nếu không phải quản lý
        }

        model.addAttribute("danhSachHoaDonChiTiet", hoaDonChiTietService.getAll());
        return "HoaDonChiTiet/hien-thi"; // Trả về trang hiển thị
    }

    @PostMapping("/hien-thi-hoa-don-chi-tiet/add")
    public String addHoaDonChiTiet(@ModelAttribute HoaDonChiTiet hoaDonChiTiet) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(hoaDonChiTiet.getMaSanPhamChiTiet().getId()).orElse(null);
        if (sanPhamChiTiet == null) {
            // Xử lý lỗi nếu sản phẩm chi tiết không tồn tại
            return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";
        }

        HoaDon hoaDon = hoaDonRepository.findById(hoaDonChiTiet.getHoaDon().getId()).orElse(null);
        if (hoaDon == null) {
            // Xử lý lỗi nếu hóa đơn không tồn tại
            return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";
        }

        hoaDonChiTietService.save(hoaDonChiTiet);
        updateTongTienHoaDon(hoaDon); // Cập nhật tổng tiền cho hóa đơn
        return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";

    }

    @GetMapping("/hien-thi-hoa-don-chi-tiet/update/{id}")
    public String showUpdate(@PathVariable("id") Integer id, Model model) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietService.findById(id);
        if (hoaDonChiTiet == null) {
            // Xử lý lỗi nếu không tìm thấy chi tiết hóa đơn
            model.addAttribute("error", "Chi tiết hóa đơn không tồn tại");
            return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";
        }
        model.addAttribute("hoaDonChiTiet", hoaDonChiTiet);
        return "HoaDonChiTiet/update"; // Tên file JSP để cập nhật
    }

    @PostMapping("/hien-thi-hoa-don-chi-tiet/update")
    public String updateHoaDonChiTiet(@ModelAttribute HoaDonChiTiet hoaDonChiTiet) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepository.findById(hoaDonChiTiet.getMaSanPhamChiTiet().getId()).orElse(null);
        if (sanPhamChiTiet != null) {
            hoaDonChiTiet.setGia(sanPhamChiTiet.getGia().floatValue()); // Chuyển đổi từ Double sang Float
        }

        hoaDonChiTietService.save(hoaDonChiTiet);
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonChiTiet.getHoaDon().getId()).orElse(null);
        if (hoaDon != null) {
            updateTongTienHoaDon(hoaDon); // Cập nhật tổng tiền cho hóa đơn
        }

        return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";
    }

    @GetMapping("/hien-thi-hoa-don-chi-tiet/delete")
    public String deleteHoaDonChiTiet(@RequestParam("id") Integer id) {
        hoaDonChiTietService.delete(id);
        return "redirect:/main#!/hien-thi-hoa-don-chi-tiet";
        // Chuyển hướng về danh sách sau khi xóa
    }

    private void updateTongTienHoaDon(HoaDon hoaDon) {
        double tongTien = hoaDonChiTietService.getHoaDonChiTietList(hoaDon.getId())
                .stream()
                .mapToDouble(ct -> ct.getSoLuong() * ct.getGia())
                .sum();
        hoaDon.setTongTien(tongTien);
        hoaDonRepository.save(hoaDon);
    }
}
