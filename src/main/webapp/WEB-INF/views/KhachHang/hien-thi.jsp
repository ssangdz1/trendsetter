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
    <h1 class="text-center">Danh Sách Khách Hàng</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Số Điện Thoại</th>
            <th>Địa Chỉ</th>
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
                <td>${khachHang.matKhau}</td>
                <td>
                    <a href="/hien-thi-khach-hang/delete?id=${khachHang.id}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
