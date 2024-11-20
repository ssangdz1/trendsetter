package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.DanhMuc;
import com.example.trendsetter.Entity.KichThuoc;
import com.example.trendsetter.Entity.MauSac;
import com.example.trendsetter.Entity.SanPham;
import com.example.trendsetter.Service.DanhMucService;
import com.example.trendsetter.Service.KichThuocService;
import com.example.trendsetter.Service.MauSacService;
import com.example.trendsetter.Service.SanPhamService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping
public class SanPhamController {

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichThuocService kichThuocService;

    @ModelAttribute("listDanhMuc")
    List<DanhMuc> getDanhMuc() {
        return danhMucService.getAll();
    }

    @GetMapping("/hien-thi-san-pham")
    public String hienThiThongTin(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
        }

        // Lấy danh sách sản phẩm, danh mục, màu sắc và kích thước
        model.addAttribute("danhSachSanPham", sanPhamService.getAll());
        model.addAttribute("danhSachDanhMuc", danhMucService.getAll());
        model.addAttribute("danhSachMauSac", mauSacService.getAll());
        model.addAttribute("danhSachKichThuoc", kichThuocService.getAll());
        return "SanPham/hien-thi"; // Trả về trang JSP mới để hiển thị thông tin
    }

    @PostMapping("/hien-thi-san-pham/add")
    public String addSanPham(SanPham sanPham) {
        sanPham.setTenSanPham(sanPham.getTenSanPham());
        sanPham.setMaDanhMuc(sanPham.getMaDanhMuc());
        sanPhamService.save(sanPham);
        return "redirect:/main#!/hien-thi-san-pham";

    }


    // Cập nhật sản phẩm
    @GetMapping("/hien-thi-san-pham/update/{id}")
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("sanPham", sanPhamService.findById(id));
        return "/SanPham/update";
    }

    @PostMapping("/hien-thi-san-pham/update")
    public String updateSanPham(SanPham sanPham) {
        sanPhamService.save(sanPham);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    // Xóa sản phẩm
    @GetMapping("/hien-thi-san-pham/delete")
    public String delete(@RequestParam("id") Integer id) {
        sanPhamService.delete(id);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @PostMapping("/hien-thi-san-pham/addDanhMuc")
    public String addDanhMuc(@RequestParam("tenDanhMuc") String tenDanhMuc) {
        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setTenDanhMuc(tenDanhMuc);
        danhMucService.save(danhMuc);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @PostMapping("/hien-thi-san-pham/addMauSac")
    public String addMauSac(@RequestParam("tenMauSac") String tenMauSac) {
        MauSac mauSac = new MauSac();
        mauSac.setTenMauSac(tenMauSac);
        mauSacService.save(mauSac);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @PostMapping("/hien-thi-san-pham/addKichThuoc")
    public String addKichThuoc(@RequestParam("tenKichThuoc") String tenKichThuoc) {
        KichThuoc kichThuoc = new KichThuoc();
        kichThuoc.setTenKichThuoc(tenKichThuoc);
        kichThuocService.save(kichThuoc);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @GetMapping("/hien-thi-san-pham/deleteDM")
    public String deleteDanhMuc(@RequestParam("id") Integer id) {
        danhMucService.delete(id);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @GetMapping("/hien-thi-san-pham/deleteMS")
    public String deleteMauSac(@RequestParam("id") Integer id) {
        mauSacService.delete(id);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    @GetMapping("/hien-thi-san-pham/deleteKT")
    public String deleteKichThuoc(@RequestParam("id") Integer id) {
        kichThuocService.delete(id);
        return "redirect:/main#!/hien-thi-san-pham";
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }
}
