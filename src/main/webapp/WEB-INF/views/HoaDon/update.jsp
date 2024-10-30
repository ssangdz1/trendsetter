<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Cập Nhật Hóa Đơn</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Cập Nhật Hóa Đơn</h1>
    <form action="/hien-thi-hoa-don/update" method="post">
        <input type="hidden" name="id" value="${hoaDon.id}"/>
        <div class="form-group">
            <label for="maKhachHang">Khách Hàng:</label>
            <select id="maKhachHang" name="maKhachHang" class="form-control">
                <c:forEach var="maKhachHang" items="${listKhachHang}">
                    <option value="${maKhachHang.id}" label="${maKhachHang.hoTen}" ${maKhachHang.id == hoaDon.maKhachHang.id ? "selected":""}>${maKhachHang.hoTen}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="maNhanVien">Nhân Viên:</label>
            <select id="maNhanVien" name="maNhanVien" class="form-control" required>
                <c:forEach var="maNhanVien" items="${listNhanVien}">
                    <option value="${maNhanVien.id}" label="${maNhanVien.hoTen}" ${maNhanVien.id == hoaDon.maNhanVien.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="tongTien">Tổng Tiền:</label>
            <input type="text" id="tongTien" name="tongTien" class="form-control" value="${hoaDon.tongTien}" required>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng Thái:</label>
            <select id="trangThai" name="trangThai" class="form-control" required>
                <option value="Đã thanh toán" ${hoaDon.trangThai == 'Đã thanh toán'}>Đã thanh toán</option>
                <option value="Chưa thanh toán" ${hoaDon.trangThai == 'Chưa thanh toán'}>Chưa thanh toán</option>
                <option value="Đã hủy" ${hoaDon.trangThai == 'Đã hủy'}>Đã hủy</option>
            </select>
        </div>
        <button type="submit" class="btn btn-warning">Cập Nhật</button>
        <a href="/hoa-don/hien-thi" class="btn btn-secondary">Trở về</a>
    </form>
</div>
</body>
</html>
