<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Danh Sách Khách Hàng</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Danh Sách Khách Hàng</h1>
    <form action="/hien-thi-khach-hang/add" method="post">
        <div class="form-group">
            <label for="hoTen">Họ Tên:</label>
            <input type="text" id="hoTen" name="hoTen" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="soDienThoai">Số Điện Thoại:</label>
            <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="diaChi">Địa Chỉ:</label>
            <input type="text" id="diaChi" name="diaChi" class="form-control">
        </div>
        <div class="form-group">
            <label for="taiKhoan">Tài Khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="matKhau">Mật Khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Thêm</button>
    </form>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Số Điện Thoại</th>
            <th>Địa Chỉ</th>
            <th>Tài Khoản</th>
            <th>Mật Khẩu</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="khachHang" items="${danhSachKhachHang}">
            <tr>
                <td>${khachHang.id}</td>
                <td>${khachHang.hoTen}</td>
                <td>${khachHang.email}</td>
                <td>${khachHang.soDienThoai}</td>
                <td>${khachHang.diaChi}</td>
                <td>${khachHang.taiKhoan}</td>
                <td>${khachHang.matKhau}</td>
                <td>
                    <a href="/hien-thi-khach-hang/update/${khachHang.id}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="/hien-thi-khach-hang/delete?id=${khachHang.id}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
