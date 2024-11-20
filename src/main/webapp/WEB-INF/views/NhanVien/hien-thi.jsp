<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Danh Sách Nhân Viên</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Danh Sách Nhân Viên</h1>
    <form action="/hien-thi-nhan-vien/add" method="post">
        <div class="form-group">
            <label for="hoTen">Họ Tên:</label>
            <input type="text" id="hoTen" name="hoTen" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Vai Trò:</label><br>
            <div class="form-check">
                <input type="radio" id="vaiTroAdmin" name="vaiTro" value="admin" class="form-check-input" required>
                <label for="vaiTroAdmin" class="form-check-label">Admin</label>
            </div>
            <div class="form-check">
                <input type="radio" id="vaiTroNhanVien" name="vaiTro" value="nhan_vien" class="form-check-input"
                       required>
                <label for="vaiTroNhanVien" class="form-check-label">Nhân Viên</label>
            </div>
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
        <a href="/nhan-vien/hien-thi" class="btn btn-secondary">Trở về</a>
    </form>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Họ Tên</th>
            <th>Tài Khoản</th>
            <th>Mật Khẩu</th>
            <th>Chức Vụ</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="nhanVien" items="${danhSachNhanVien}">
            <tr>
                <td>${nhanVien.id}</td>
                <td>${nhanVien.hoTen}</td>
                <td>${nhanVien.taiKhoan}</td>
                <td>${nhanVien.matKhau}</td>
                <td>${nhanVien.vaiTro}</td>
                <td>
                    <a href="/hien-thi-nhan-vien/delete?id=${nhanVien.id}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
