<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Danh Sách Hóa Đơn Chi Tiết</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Thêm Hóa Đơn Chi Tiết</h1>
    <form action="/hien-thi-hoa-don-chi-tiet/add" method="post" class="bg-light p-4 rounded shadow-sm">
        <div class="form-group">
            <label for="hoaDon">Mã Hóa Đơn:</label>
            <select id="hoaDon" name="hoaDon" class="form-control" required>
                <c:forEach var="hoaDon" items="${listHoaDon}">
                    <option value="${hoaDon.id}">${hoaDon.id}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="maSanPhamChiTiet">Chọn sản phẩm:</label>
            <select id="maSanPhamChiTiet" name="maSanPhamChiTiet" class="form-control"
                    onchange="document.getElementById('gia').value=this.options[this.selectedIndex].getAttribute('data-gia');">
                <c:forEach var="sanPhamChiTiet" items="${listSanPhamChiTiet}">
                    <option value="${sanPhamChiTiet.id}"
                            data-gia="${sanPhamChiTiet.gia}">${sanPhamChiTiet.maSanPham.tenSanPham}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="gia">Giá:</label>
            <input type="text" id="gia" name="gia" class="form-control" readonly/>
        </div>

        <div class="form-group">
            <label for="soLuong">Số lượng:</label>
            <input type="number" id="soLuong" name="soLuong" class="form-control" required min="1" max="10" step="1"/>
        </div>


        <button type="submit" class="btn btn-primary">Thêm hóa đơn chi tiết</button>
    </form>

    <table class="table table-bordered table-hover mt-4">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Mã Hóa Đơn</th>
            <th>Tên Sản Phẩm</th>
            <th>Màu Sắc</th>
            <th>Kích Thước</th>
            <th>Số Lượng</th>
            <th>Giá Khi Đặt</th>
            <th>Tổng Giá</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDonChiTiet" items="${danhSachHoaDonChiTiet}">
            <tr>
                <td>${hoaDonChiTiet.id}</td>
                <td>${hoaDonChiTiet.hoaDon.id}</td>
                <td>${hoaDonChiTiet.maSanPhamChiTiet.maSanPham.tenSanPham}</td>
                <td>${hoaDonChiTiet.maSanPhamChiTiet.maMauSac.tenMauSac}</td>
                <td>${hoaDonChiTiet.maSanPhamChiTiet.maKichThuoc.tenKichThuoc}</td>
                <td>${hoaDonChiTiet.soLuong}</td>
                <td>${hoaDonChiTiet.gia}</td>
                <td>${hoaDonChiTiet.soLuong * hoaDonChiTiet.gia}</td>
                <td>
                    <a href="/hien-thi-hoa-don-chi-tiet/delete?id=${hoaDonChiTiet.id}"
                       class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
