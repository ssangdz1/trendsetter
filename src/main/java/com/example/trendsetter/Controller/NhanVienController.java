package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.NhanVien;
import com.example.trendsetter.Service.NhanVienService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping
public class NhanVienController {

    @Autowired
    NhanVienService nhanVienService;

    @GetMapping("/hien-thi-nhan-vien")
    public String hienThiNV(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
        }

        model.addAttribute("danhSachNhanVien", nhanVienService.getAll());
        return "NhanVien/hien-thi";
    }


    @PostMapping("/hien-thi-nhan-vien/add")
    public String addNhanVien(NhanVien nhanVien) {
        nhanVienService.save(nhanVien);
        return "redirect:/main#!/hien-thi-nhan-vien";
    }

    @GetMapping("/hien-thi-nhan-vien/update/{id}")
    public String showUpdate(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("nhanVien", nhanVienService.findById(id));
        return "NhanVien/update";
    }

    @PostMapping("/hien-thi-nhan-vien/update")
    public String updateNhanVien(NhanVien nhanVien) {
        nhanVienService.save(nhanVien);
        return "redirect:/main#!/hien-thi-nhan-vien";
    }

    @GetMapping("/hien-thi-nhan-vien/delete")
    public String deleteNhanVien(@RequestParam("id") Integer id) {
        nhanVienService.delete(id);
        return "redirect:/main#!/hien-thi-nhan-vien";
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }
}
