<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Sửa Khách Hàng</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Sửa Khách Hàng</h1>
    <form action="${pageContext.request.contextPath}/hien-thi-khach-hang/update" method="post">
        <input type="hidden" name="id" value="${khachHang.id}"/>
        <div class="form-group">
            <label for="hoTen">Họ Tên:</label>
            <input type="text" id="hoTen" name="hoTen" class="form-control" value="${khachHang.hoTen}" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" value="${khachHang.email}" required>
        </div>
        <div class="form-group">
            <label for="soDienThoai">Số Điện Thoại:</label>
            <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" value="${khachHang.soDienThoai}" required>
        </div>
        <div class="form-group">
            <label for="diaChi">Địa Chỉ:</label>
            <input type="text" id="diaChi" name="diaChi" class="form-control" value="${khachHang.diaChi}">
        </div>
        <div class="form-group">
            <label for="taiKhoan">Tài Khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" class="form-control" value="${khachHang.taiKhoan}" required>
        </div>
        <div class="form-group">
            <label for="matKhau">Mật Khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" value="${khachHang.matKhau}" required>
        </div>
        <button type="submit" class="btn btn-warning">Cập Nhật</button>
    </form>
</div>
</body>
</html>
