package com.example.trendsetter.Controller;

import com.example.trendsetter.Entity.*;
import com.example.trendsetter.Repository.DanhMucRepository;
import com.example.trendsetter.Repository.KichThuocRepository;
import com.example.trendsetter.Repository.MauSacRepository;
import com.example.trendsetter.Repository.SanPhamRepository;
import com.example.trendsetter.Service.DanhMucService;
import com.example.trendsetter.Service.SanPhamChiTietService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Controller
@RequestMapping
public class SanPhamChiTietController {
    @Autowired
    private SanPhamChiTietService sanPhamChiTietService;
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private MauSacRepository mauSacRepository;
    @Autowired
    private KichThuocRepository kichThuocRepository;
    @Autowired
    private DanhMucService danhMucService;

    @ModelAttribute("listSanPham")
    public List<SanPham> getSanPham() {
        return sanPhamRepository.findAll();
    }

    @ModelAttribute("listMauSac")
    public List<MauSac> getMauSac() {
        return mauSacRepository.findAll();
    }

    @ModelAttribute("listKichThuoc")
    public List<KichThuoc> getKichThuoc() {
        return kichThuocRepository.findAll();
    }

    // Hiển thị danh sách sản phẩm chi tiết
    @GetMapping("/hien-thi-san-pham-chi-tiet")
    public String hienThiHDCT(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        if (!isLoggedIn(session)) {
            redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
        }

        NhanVien loggedInUser = (NhanVien) session.getAttribute("loggedInUser");
        if (loggedInUser.getVaiTro().equals("admin")) { // Kiểm tra nếu là quản lý
            model.addAttribute("danhSachSanPhamChiTiet", sanPhamChiTietService.getAll());
            return "SanPhamChiTiet/hien-thi";
        } else {
            redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập vào trang này.");
            return "redirect:/main"; // Chuyển hướng về trang chính nếu không phải quản lý
        }
    }

    // Xử lý thêm sản phẩm
    @PostMapping("/hien-thi-san-pham-chi-tiet/add")
    public String addSanPhamChiTiet(
            @RequestParam("maSanPham") Integer maSanPham,
            @RequestParam("moTa") String moTa,
            @RequestParam("soLuong") Integer soLuong,
            @RequestParam("gia") Float gia,
            @RequestParam("maMauSac") Integer maMauSacId,
            @RequestParam("maKichThuoc") Integer maKichThuocId,
            @RequestParam("hinhAnh") MultipartFile hinhAnhFile,
            Model model) {

        SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();
        sanPhamChiTiet.setSoLuong(soLuong);
        sanPhamChiTiet.setMoTa(moTa);
        sanPhamChiTiet.setGia(gia);
        sanPhamChiTiet.setMaSanPham(sanPhamRepository.findById(maSanPham).orElse(null));
        sanPhamChiTiet.setMaMauSac(mauSacRepository.findById(maMauSacId).orElse(null));
        sanPhamChiTiet.setMaKichThuoc(kichThuocRepository.findById(maKichThuocId).orElse(null));

        // Xử lý upload hình ảnh
        // Xử lý upload hình ảnh
        if (hinhAnhFile != null && !hinhAnhFile.isEmpty()) {
            try {
                String originalFileName = hinhAnhFile.getOriginalFilename();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                String newFileName = originalFileName; // Bắt đầu với tên file gốc

                Path uploadPath = Paths.get("src/main/resources/static/images/");
                if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);

                // Kiểm tra và thêm số vào tên file nếu file đã tồn tại
                int counter = 1;
                while (Files.exists(uploadPath.resolve(newFileName))) {
                    newFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) // Lấy phần tên file không có phần mở rộng
                            + "_" + counter + fileExtension; // Thêm số đếm vào tên file
                    counter++;
                }

                // Lưu ảnh vào thư mục
                Path filePath = uploadPath.resolve(newFileName);
                Files.copy(hinhAnhFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                sanPhamChiTiet.setHinhAnh(newFileName);
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Lỗi khi tải lên hình ảnh!");
                return "SanPhamChiTiet/add";
            }
        }


        sanPhamChiTietService.save(sanPhamChiTiet);
        return "redirect:/main#!/hien-thi-san-pham-chi-tiet";
    }

    // Hiển thị form cập nhật sản phẩm chi tiết
    @GetMapping("/hien-thi-san-pham-chi-tiet/update/{id}")
    public String showUpdate(@PathVariable("id") Integer id, Model model) {
        SanPhamChiTiet existingChiTiet = sanPhamChiTietService.findById(id);
        if (existingChiTiet != null) {
            model.addAttribute("chiTietSanPham", existingChiTiet);
            return "SanPhamChiTiet/update";
        } else {
            return "redirect:/hien-thi-san-pham-chi-tiet"; // Nếu không tìm thấy, trở về trang hiển thị
        }
    }

    // Xử lý cập nhật sản phẩm chi tiết
    @PostMapping("/hien-thi-san-pham-chi-tiet/update")
    public String updateSanPham(
            @RequestParam("id") Integer id, // thêm id vào các tham số
            @RequestParam("maSanPham") Integer maSanPham,
            @RequestParam("moTa") String moTa,
            @RequestParam("soLuong") Integer soLuong,
            @RequestParam("gia") Float gia,
            @RequestParam("maMauSac") Integer maMauSacId,
            @RequestParam("maKichThuoc") Integer maKichThuocId,
            @RequestParam("hinhAnh") MultipartFile hinhAnhFile,
            Model model) {

        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.findById(id); // Lấy đối tượng hiện tại từ DB
        if (sanPhamChiTiet == null) {
            model.addAttribute("errorMessage", "Sản phẩm chi tiết không tồn tại!");
            return "redirect:/hien-thi-san-pham-chi-tiet"; // Nếu không tìm thấy, quay lại trang hiển thị
        }

        // Cập nhật các thuộc tính
        sanPhamChiTiet.setSoLuong(soLuong);
        sanPhamChiTiet.setMoTa(moTa);
        sanPhamChiTiet.setGia(gia);
        sanPhamChiTiet.setMaSanPham(sanPhamRepository.findById(maSanPham).orElse(null));
        sanPhamChiTiet.setMaMauSac(mauSacRepository.findById(maMauSacId).orElse(null));
        sanPhamChiTiet.setMaKichThuoc(kichThuocRepository.findById(maKichThuocId).orElse(null));

        // Xử lý upload hình ảnh
        // Xử lý upload hình ảnh
        if (hinhAnhFile != null && !hinhAnhFile.isEmpty()) {
            try {
                String originalFileName = hinhAnhFile.getOriginalFilename();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                String newFileName = originalFileName; // Bắt đầu với tên file gốc

                Path uploadPath = Paths.get("src/main/resources/static/images/");
                if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);

                // Kiểm tra và thêm số vào tên file nếu file đã tồn tại
                int counter = 1;
                while (Files.exists(uploadPath.resolve(newFileName))) {
                    newFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) // Lấy phần tên file không có phần mở rộng
                            + "_" + counter + fileExtension; // Thêm số đếm vào tên file
                    counter++;
                }

                // Lưu ảnh vào thư mục
                Path filePath = uploadPath.resolve(newFileName);
                Files.copy(hinhAnhFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                sanPhamChiTiet.setHinhAnh(newFileName);
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Lỗi khi tải lên hình ảnh!");
                return "SanPhamChiTiet/update";
            }
        }


        sanPhamChiTietService.save(sanPhamChiTiet);
        return "redirect:/main#!/hien-thi-san-pham-chi-tiet";
    }

    // Xóa sản phẩm chi tiết
    @GetMapping("/hien-thi-san-pham-chi-tiet/delete/{id}")
    public String deleteSanPhamChiTiet(@PathVariable("id") Integer id) {
        sanPhamChiTietService.delete(id);
        return "redirect:/main#!/hien-thi-san-pham-chi-tiet"; // Quay lại trang danh sách sau khi xóa
    }

    // Kiểm tra người dùng đã đăng nhập
    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null;
    }
}
