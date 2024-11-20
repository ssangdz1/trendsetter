package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.KhachHang;
import com.example.trendsetter.Service.KhachHangService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping
public class KhachHangController {

    @Autowired
    KhachHangService khachHangService;

    @GetMapping("/hien-thi-khach-hang")
    public String hienThiKH(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
        }

        model.addAttribute("danhSachKhachHang", khachHangService.getAll());
        return "KhachHang/hien-thi";
    }


    @PostMapping("/hien-thi-khach-hang/add")
    public String addKhachHang(@ModelAttribute KhachHang khachHang) {
        khachHangService.save(khachHang);
        return "redirect:/shop";
    }

    @GetMapping("/hien-thi-khach-hang/update/{id}")
    public String showUpdate(@PathVariable("id") Integer id, Model model, RedirectAttributes redirectAttributes) {
        Optional<KhachHang> khachHangOptional = khachHangService.findById(id);
        if (khachHangOptional.isPresent()) {
            model.addAttribute("khachHang", khachHangOptional.get());
            return "KhachHang/update";
        } else {
            redirectAttributes.addFlashAttribute("error", "Khách hàng không tồn tại.");
            return "redirect:/main#!/hien-thi-khach-hang";
        }
    }

    @PostMapping("/hien-thi-khach-hang/update")
    public String updateKhachHang(KhachHang khachHang) {
        khachHangService.save(khachHang);
        return "redirect:/main#!/hien-thi-khach-hang";
    }

    @GetMapping("/hien-thi-khach-hang/delete")
    public String deleteKhachHang(@RequestParam("id") Integer id) {
        khachHangService.delete(id);
        return "redirect:/main#!/hien-thi-khach-hang";
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }
}
