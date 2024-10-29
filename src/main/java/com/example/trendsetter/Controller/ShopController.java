package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.HoaDonChiTiet;
import com.example.trendsetter.Entity.SanPhamChiTiet;
import com.example.trendsetter.Service.DanhMucService;
import com.example.trendsetter.Service.SanPhamChiTietService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;

    @Autowired
    private DanhMucService danhMucService;

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

    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam("productId") Integer productId,
                            HttpSession session) {
        List<HoaDonChiTiet> gioHang = (List<HoaDonChiTiet>) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }

        // Lấy sản phẩm chi tiết theo ID
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.getById(productId);

        // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
        Optional<HoaDonChiTiet> existingItem = gioHang.stream()
                .filter(item -> item.getMaSanPhamChiTiet().getId().equals(sanPhamChiTiet.getId()))
                .findFirst();

        if (existingItem.isPresent()) {
            existingItem.get().setSoLuong(existingItem.get().getSoLuong() + 1);
        } else {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setMaSanPhamChiTiet(sanPhamChiTiet);
            hoaDonChiTiet.setSoLuong(1);
            hoaDonChiTiet.setGia(sanPhamChiTiet.getGia()); // Lưu giá sản phẩm
            gioHang.add(hoaDonChiTiet);
        }
        return "redirect:/shop";
    }
}
