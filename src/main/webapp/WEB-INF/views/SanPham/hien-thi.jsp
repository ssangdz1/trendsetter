<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Quản Lý Danh Mục và Sản Phẩm</title>
    <style>
        /* Custom CSS to reduce table size */
        .table-sm th, .table-sm td {
            padding: 0.3rem;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="${pageContext.request.contextPath}/main">Hệ Thống Quản Lý</a></h1>

    <!-- Form thêm -->
    <div class="d-flex justify-content-between">
        <!-- Form Thêm Danh Mục -->
        <form action="${pageContext.request.contextPath}/hien-thi-san-pham/addDanhMuc" method="post" class="mr-3">
            <input type="hidden" name="id" value="danhMuc">
            <div class="form-group">
                <label>Tên Danh Mục:</label>
                <input type="text" name="tenDanhMuc" class="form-control form-control-sm" required>
            </div>
            <button type="submit" class="btn btn-success btn-sm">Thêm</button>
        </form>
        <!-- Form Thêm Màu Sắc -->
        <form action="${pageContext.request.contextPath}/hien-thi-san-pham/addMauSac" method="post" class="mr-3">
            <input type="hidden" name="id" value="mauSac">
            <div class="form-group">
                <label>Tên Màu Sắc:</label>
                <input type="text" name="tenMauSac" class="form-control form-control-sm" required>
            </div>
            <button type="submit" class="btn btn-success btn-sm">Thêm</button>
        </form>
        <!-- Form Thêm Kích Thước -->
        <form action="${pageContext.request.contextPath}/hien-thi-san-pham/addKichThuoc" method="post">
            <input type="hidden" name="id" value="kichThuoc">
            <div class="form-group">
                <label>Tên Kích Thước:</label>
                <input type="text" name="tenKichThuoc" class="form-control form-control-sm" required>
            </div>
            <button type="submit" class="btn btn-success btn-sm">Thêm</button>
        </form>
    </div>

    <!-- Danh Sách Danh Mục, Màu Sắc và Kích Thước cùng một dòng -->
    <div class="row mt-4">
        <!-- Danh Sách Danh Mục -->
        <div class="col-md-4">
            <h3 class="text-center">Danh Sách Danh Mục</h3>
            <table class="table table-bordered table-sm">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Tên Danh Mục</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="danhMuc" items="${danhSachDanhMuc}">
                    <tr>
                        <td>${danhMuc.id}</td>
                        <td>${danhMuc.tenDanhMuc}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/hien-thi-san-pham/deleteDM?id=${danhMuc.id}" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Danh Sách Màu Sắc -->
        <div class="col-md-4">
            <h3 class="text-center">Danh Sách Màu Sắc</h3>
            <table class="table table-bordered table-sm">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Màu Sắc</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="mauSac" items="${danhSachMauSac}">
                    <tr>
                        <td>${mauSac.id}</td>
                        <td>${mauSac.tenMauSac}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/hien-thi-san-pham/deleteMS?id=${mauSac.id}" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Danh Sách Kích Thước -->
        <div class="col-md-4">
            <h3 class="text-center">Danh Sách Kích Thước</h3>
            <table class="table table-bordered table-sm">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Size</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kichThuoc" items="${danhSachKichThuoc}">
                    <tr>
                        <td>${kichThuoc.id}</td>
                        <td>${kichThuoc.tenKichThuoc}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/hien-thi-san-pham/deleteKT?id=${kichThuoc.id}" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Form Tìm Kiếm và Danh Sách Sản Phẩm -->
    <div class="mt-5">
        <h1 class="text-center">Thêm Sản Phẩm</h1>
        <form action="${pageContext.request.contextPath}/hien-thi-san-pham/add" method="post">
            <div class="form-group">
                <label for="tenSanPham">Tên Sản Phẩm:</label>
                <input type="text" id="tenSanPham" name="tenSanPham" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="maDanhMuc">Danh Mục:</label>
                <select name="maDanhMuc" id="maDanhMuc" class="form-control">
                    <c:forEach items="${listDanhMuc}" var="maDanhMuc">
                        <option value="${maDanhMuc.id}">${maDanhMuc.tenDanhMuc}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Thêm</button>
        </form>
        <table class="table table-bordered mt-3">
            <thead class="thead-dark">
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Danh Mục</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="sanPham" items="${danhSachSanPham}">
                <tr>
                    <td>${sanPham.tenSanPham}</td>
                    <td>${sanPham.maDanhMuc.tenDanhMuc}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/hien-thi-san-pham/update/${sanPham.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/hien-thi-san-pham/delete?id=${sanPham.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
