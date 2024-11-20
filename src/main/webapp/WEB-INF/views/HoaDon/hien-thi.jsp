<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Danh Sách Hóa Đơn</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Thêm Hóa Đơn</h1>
    <form action="/hien-thi-hoa-don/add" method="post">
        <div class="form-group">
            <label for="maKhachHang">Khách Hàng:</label>
            <select id="maKhachHang" name="maKhachHang" class="form-control">
                <option value="">Chọn khách hàng</option>
                <c:forEach var="khachHang" items="${listKhachHang}">
                    <option value="${khachHang.id}" label="${khachHang.hoTen}"></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="maNhanVien">Nhân Viên:</label>
            <select id="maNhanVien" name="maNhanVien" class="form-control" required>
                <option value="">Chọn nhân viên</option>
                <c:forEach var="nhanVien" items="${listNhanVien}">
                    <option value="${nhanVien.id}" label="${nhanVien.hoTen}"></option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="trangThai">Trạng Thái:</label>
            <select id="trangThai" name="trangThai" class="form-control" required>
                <option value="Đã thanh toán">Đã thanh toán</option>
                <option value="Chưa thanh toán">Chưa thanh toán</option>
                <option value="Đã hủy">Đã hủy</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Thêm</button>
        <a href="/hoa-don/hien-thi" class="btn btn-secondary">Trở về</a>
    </form>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên Khách Hàng</th>
            <th>Tên Nhân Viên</th>
            <th>Tổng Tiền</th>
            <th>Ngày Tạo</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${danhSachHoaDon}">
            <tr>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.maKhachHang.hoTen}</td>
                <td>${hoaDon.maNhanVien.hoTen}</td>
                <td><fmt:formatNumber value="${hoaDon.tongTien}" type="currency"/></td> <!-- Hiển thị tổng tiền -->
                <td><fmt:formatDate value="${hoaDon.ngayTao}" pattern="dd/MM/yyyy"/></td> <!-- Định dạng ngày tạo -->
                <td>${hoaDon.trangThai}</td>
                <td>
                    <a href="/hien-thi-hoa-don/delete?id=${hoaDon.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
