<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Cập Nhật Chi Tiết Sản Phẩm</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Cập Nhật Chi Tiết Sản Phẩm</h1>
    <form action="/hien-thi-san-pham-chi-tiet/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${chiTietSanPham.id}"/>

        <div class="form-group">
            <label>Sản Phẩm:</label>
            <select name="maSanPham" class="form-control">
                <c:forEach items="${listSanPham}" var="maSanPham">
                    <option value="${maSanPham.id}"
                            label="${maSanPham.tenSanPham}" ${maSanPham.id == chiTietSanPham.maSanPham.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Mau Sac:</label>
            <select name="maMauSac" class="form-control">
                <c:forEach items="${listMauSac}" var="maMauSac">
                    <option value="${maMauSac.id}"
                            label="${maMauSac.tenMauSac}" ${maMauSac.id == chiTietSanPham.maMauSac.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Size:</label>
            <select name="maKichThuoc" class="form-control">
                <c:forEach items="${listKichThuoc}" var="maKichThuoc">
                    <option value="${maKichThuoc.id}"
                            label="${maKichThuoc.tenKichThuoc}" ${maKichThuoc.id == chiTietSanPham.maKichThuoc.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="soLuong">Số Lượng:</label>
            <input type="number" id="soLuong" name="soLuong" class="form-control" value="${chiTietSanPham.soLuong = 1 }"
                   readonly>
        </div>
        <div class="form-group">
            <label for="gia">Giá:</label>
            <input type="number" id="gia" name="gia" class="form-control" value="${chiTietSanPham.gia}" required>
        </div>
        <div class="form-group">
            <label for="hinhAnh">Hình Ảnh:</label>
            <input type="file" id="hinhAnh" name="hinhAnh" class="form-control" value="${chiTietSanPham.hinhAnh}"
                   required>
        </div>
        <div class="form-group">
            <label for="moTa">Mô Tả:</label>
            <input type="text" id="moTa" name="moTa" class="form-control" value="${chiTietSanPham.moTa}" required>
        </div>
        <button type="submit" class="btn btn-success">Cập Nhật</button>
    </form>
</div>
</body>
</html>
