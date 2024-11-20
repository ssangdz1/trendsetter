package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.HoaDon;
import com.example.trendsetter.Entity.HoaDonChiTiet;
import com.example.trendsetter.Entity.KhachHang;
import com.example.trendsetter.Entity.NhanVien;
import com.example.trendsetter.Repository.KhachHangRepository;
import com.example.trendsetter.Repository.NhanVienRepository;
import com.example.trendsetter.Service.HoaDonChiTietService;
import com.example.trendsetter.Service.HoaDonService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping
public class HoaDonController {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    NhanVienRepository nhanVienRepository;

    @ModelAttribute("listKhachHang")
    List<KhachHang> getKhachHang() {
        return khachHangRepository.findAll();
    }

    @ModelAttribute("listNhanVien")
    List<NhanVien> getNhanVien() {
        return nhanVienRepository.findAll();
    }

    @GetMapping("/hien-thi-hoa-don")
    public String hienThiHD(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
        }

        NhanVien loggedInUser = (NhanVien) session.getAttribute("loggedInUser");
        if (loggedInUser.getVaiTro().equals("admin")) { // Kiểm tra nếu là quản lý
            model.addAttribute("danhSachHoaDon", hoaDonService.getAll());
            return "HoaDon/hien-thi";
        } else {
            redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập vào trang này.");
            return "redirect:/main"; // Chuyển hướng về trang chính nếu không phải quản lý
        }
    }

    @PostMapping("/hien-thi-hoa-don/add")
    public String addHoaDon(@ModelAttribute HoaDon hoaDon) {
        hoaDonService.save(hoaDon);
        return "redirect:/main#!/hien-thi-hoa-don"; // Chuyển hướng về danh sách hóa đơn sau khi thêm
    }

    @GetMapping("/hien-thi-hoa-don/update/{id}")
    public String showUpdate(@PathVariable("id") Integer id, Model model) {
        HoaDon hoaDon = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hoaDon);
        return "HoaDon/update"; // Trả về view để sửa hóa đơn
    }

    @PostMapping("/hien-thi-hoa-don/update")
    public String updateHoaDon(@ModelAttribute HoaDon hoaDon) {
        hoaDonService.save(hoaDon);
        return "redirect:/main#!/hien-thi-hoa-don"; // Chuyển hướng về danh sách hóa đơn sau khi cập nhật
    }

    @GetMapping("/hien-thi-hoa-don/delete")
    public String deleteHoaDon(@RequestParam("id") Integer id) {
        hoaDonService.delete(id);
        return "redirect:/main#!/hien-thi-hoa-don"; // Chuyển hướng về danh sách hóa đơn sau khi xóa
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }
}
