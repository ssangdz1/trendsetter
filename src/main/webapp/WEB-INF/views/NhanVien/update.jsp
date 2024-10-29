<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Sửa Nhân Viên</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Sửa Nhân Viên</h1>
    <form action="${pageContext.request.contextPath}/hien-thi-nhan-vien/update" method="post">
        <input type="hidden" name="id" value="${nhanVien.id}"/>
        <div class="form-group">
            <label for="hoTen">Họ Tên:</label>
            <input type="text" id="hoTen" name="hoTen" class="form-control" value="${nhanVien.hoTen}" required>
        </div>
        <div class="form-group">
            <label>Vai Trò:</label><br>
            <div class="form-check">
                <input type="radio" id="vaiTroAdmin" name="vaiTro" value="admin" class="form-check-input"
                       <c:if test="${nhanVien.vaiTro == 'admin'}">checked</c:if>
                >
                <label for="vaiTroAdmin" class="form-check-label">Admin</label>
            </div>
            <div class="form-check">
                <input type="radio" id="vaiTroNhanVien" name="vaiTro" value="nhan_vien" class="form-check-input"
                       <c:if test="${nhanVien.vaiTro == 'nhan_vien'}">checked</c:if>
                >
                <label for="vaiTroNhanVien" class="form-check-label">Nhân Viên</label>
            </div>
        </div>
        <div class="form-group">
            <label for="taiKhoan">Tài Khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" class="form-control" value="${nhanVien.taiKhoan}" required>
        </div>
        <div class="form-group">
            <label for="matKhau">Mật Khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" value="${nhanVien.matKhau}" required>
        </div>
        <button type="submit" class="btn btn-warning">Cập Nhật</button>
    </form>
</div>
</body>
</html>
