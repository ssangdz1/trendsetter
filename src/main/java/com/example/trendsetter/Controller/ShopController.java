package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.HoaDon;
import com.example.trendsetter.Entity.HoaDonChiTiet;
import com.example.trendsetter.Entity.KhachHang;
import com.example.trendsetter.Entity.SanPhamChiTiet;
import com.example.trendsetter.Repository.KhachHangRepository;
import com.example.trendsetter.Service.DanhMucService;
import com.example.trendsetter.Service.HoaDonChiTietService;
import com.example.trendsetter.Service.HoaDonService;
import com.example.trendsetter.Service.SanPhamChiTietService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private HoaDonService hoaDonService;


    // Hiển thị danh sách sản phẩm
    @GetMapping
    public String shop(Model model) {
        model.addAttribute("danhSachDanhMuc", danhMucService.getAll());
        model.addAttribute("danhSachChiTietSanPham", sanPhamChiTietService.getAll());
        return "shop";
    }

    @GetMapping("/search")
    public String searchSanPhamChiTiet(@RequestParam("ten") String ten, Model model) {
        List<SanPhamChiTiet> ketQuaTimKiem = sanPhamChiTietService.getAll().stream()
                .filter(sp -> sp.getMaSanPham().getTenSanPham().toLowerCase().contains(ten.toLowerCase()))
                .collect(Collectors.toList());
        model.addAttribute("danhSachChiTietSanPham", ketQuaTimKiem);
        return "shop";
    }

    @GetMapping("/danh-muc/{id}")
    public String filterByDanhMuc(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("danhSachDanhMuc", danhMucService.getAll());
        model.addAttribute("danhSachChiTietSanPham", sanPhamChiTietService.getByDanhMucId(id));
        return "shop";
    }

    @GetMapping("/dangky")
    public String dangKy(){
        return "/Shop/DangKy";
    }

    @GetMapping("/dangnhap")
    public String dangNhap(){
        return "/Shop/DangNhap";
    }

    @PostMapping("/dangnhap")
    public String DangNhap(@RequestParam("email") String email,
                           @RequestParam("matKhau") String matKhau,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        KhachHang khachHang = khachHangRepository.findByEmailAndMatKhau(email, matKhau);

        // Kiểm tra đăng nhập cho khách hàng
        if (khachHang != null) {
            session.setAttribute("loggedInUser", khachHang); // Lưu thông tin khách hàng đã đăng nhập vào session
            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaKhachHang(hoaDon.getMaKhachHang());
            hoaDon.setMaNhanVien(hoaDon.getMaNhanVien());
            hoaDon.setTongTien(hoaDon.getTongTien());
            hoaDonService.save(hoaDon);
            return "redirect:/shop"; // Chuyển hướng đến trang shop.jsp sau khi đăng nhập thành công
        } else {
            redirectAttributes.addFlashAttribute("error", "Email hoặc mật khẩu không đúng!");
            return "redirect:/shop/dangnhap"; // Trở lại trang đăng nhập nếu thất bại
        }
    }


    @GetMapping("/dangxuat")
    public String logout(HttpSession session) {
        session.invalidate(); // Hủy session khi logout
        return "redirect:/shop"; // Chuyển hướng về trang login
    }


}
