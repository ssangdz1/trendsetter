<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Chi Tiết Sản Phẩm</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mt-5">Danh Sách Chi Tiết Sản Phẩm</h2>
    <form action="${pageContext.request.contextPath}/hien-thi-san-pham-chi-tiet/add" method="post"
          enctype="multipart/form-data">
        <div class="form-group">
            <label>Sản Phẩm:</label>
            <select name="maSanPham" class="form-control" required>
                <c:forEach items="${listSanPham}" var="maSanPham">
                    <option value="${maSanPham.id}">${maSanPham.tenSanPham}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="mauSac">Màu Sắc:</label>
            <select name="maMauSac" id="mauSac" class="form-control" required>
                <c:forEach items="${listMauSac}" var="maMauSac">
                    <option value="${maMauSac.id}">${maMauSac.tenMauSac}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="kichThuoc">Kích Thước:</label>
            <select name="maKichThuoc" id="kichThuoc" class="form-control" required>
                <c:forEach items="${listKichThuoc}" var="maKichThuoc">
                    <option value="${maKichThuoc.id}">${maKichThuoc.tenKichThuoc}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="soLuong">Số Lượng:</label>
            <input type="number" id="soLuong" name="soLuong" class="form-control" value="1" readonly>
        </div>

        <div class="form-group">
            <label for="gia">Giá:</label>
            <input type="number" id="gia" name="gia" class="form-control" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="hinhAnh">Hình Ảnh:</label>
            <input type="file" id="hinhAnh" name="hinhAnh" class="form-control">
        </div>

        <div class="form-group">
            <label for="moTa">Mô Tả:</label>
            <textarea id="moTa" name="moTa" class="form-control"></textarea>
        </div>

        <button type="submit" class="btn btn-success">Thêm</button>
    </form>
    <!-- Bảng Danh Sách Chi Tiết Sản Phẩm -->
    <table class="table table-bordered mt-3">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Tên Sản Phẩm</th>
            <th>Màu Sắc</th>
            <th>Size</th>
            <th>Số Lượng</th>
            <th>Giá</th>
            <th>Danh Mục</th>
            <th>Hình Ảnh</th>
            <th>Mô Tả</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="chiTiet" items="${danhSachSanPhamChiTiet}">
            <tr>
                <td>${chiTiet.id}</td>
                <td>${chiTiet.maSanPham.tenSanPham}</td>
                <td>${chiTiet.maMauSac.tenMauSac}</td>
                <td>${chiTiet.maKichThuoc.tenKichThuoc}</td>
                <td>${chiTiet.soLuong}</td>
                <td>${chiTiet.gia}</td>
                <td>${chiTiet.maSanPham.maDanhMuc.tenDanhMuc}</td>
                <td>
                    <img src="/images/${chiTiet.hinhAnh}" alt="Hình ảnh sản phẩm" style="width: 100px; height: auto;"/>
                </td>
                <td>${chiTiet.moTa}</td>
                <td>
                    <a href="/hien-thi-san-pham-chi-tiet/delete?id=${chiTiet.id}" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
