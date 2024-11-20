package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.*;
import com.example.trendsetter.Repository.*;
import com.example.trendsetter.Service.DanhMucService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class MainController {

    @Autowired
    NhanVienRepository nhanVienRepository;
    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/main")
    public String showMainPage(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login";
        }
        return "home"; // Trả về trang JSP chính
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Trang JSP cho login
    }


    @PostMapping("/login")
    public String login(@RequestParam("taiKhoan") String taiKhoan,
                        @RequestParam("matKhau") String matKhau,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        NhanVien nhanVien = nhanVienRepository.findByTaiKhoanAndMatKhau(taiKhoan, matKhau);

        // Kiểm tra đăng nhập cho nhân viên
        if (nhanVien != null) {
            session.setAttribute("loggedInUser", nhanVien); // Lưu thông tin nhân viên đã đăng nhập vào session
            return "redirect:/main"; // Chuyển hướng đến trang chính sau khi đăng nhập thành công
        } else {
            redirectAttributes.addFlashAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            return "redirect:/login"; // Trở lại trang đăng nhập nếu thất bại
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Hủy session khi logout
        return "redirect:/login"; // Chuyển hướng về trang login
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null; // Kiểm tra xem người dùng đã đăng nhập chưa
    }
}