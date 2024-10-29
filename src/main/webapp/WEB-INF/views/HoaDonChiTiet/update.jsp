<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Cập Nhật Hóa Đơn Chi Tiết</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Cập Nhật Hóa Đơn Chi Tiết</h1>
    <form action="${pageContext.request.contextPath}/hien-thi-hoa-don-chi-tiet/update" method="post">
        <input type="hidden" name="id" value="${hoaDonChiTiet.id}"/>

        <div class="form-group">
            <label for="hoaDon">Mã Hóa Đơn:</label>
            <select id="hoaDon" name="hoaDon" class="form-control" required>
                <c:forEach var="hoaDon" items="${listHoaDon}">
                    <option value="${hoaDon.id}" ${hoaDon.id == hoaDonChiTiet.hoaDon.id ? "selected" : ""} label="${hoaDon.id}"></option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="maSanPhamChiTiet">Mã Hóa Đơn:</label>
            <select id="maSanPhamChiTiet" name="maSanPhamChiTiet" class="form-control" required>
                <c:forEach var="maSanPhamChiTiet" items="${listSanPhamChiTiet}">
                    <option value="${maSanPhamChiTiet.id}" label="${maSanPhamChiTiet.maSanPham.tenSanPham}" ${maSanPhamChiTiet.id == hoaDonChiTiet.maSanPhamChiTiet.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="soLuong">Số Lượng:</label>
            <input type="number" id="soLuong" name="soLuong" class="form-control" value="${hoaDonChiTiet.soLuong}" required>
        </div>

        <div class="form-group">
            <label for="gia">Giá Khi Đặt:</label>
            <input type="text" id="gia" name="gia" class="form-control" value="${hoaDonChiTiet.gia}" required>
        </div>

        <button type="submit" class="btn btn-warning">Cập Nhật</button>
    </form>
</div>
</body>
</html>
