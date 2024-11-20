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
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        h1, h3 {
            font-weight: 700;
            color: #444;
        }

        .container {
            max-width: 1000px;
        }

        .header a {
            text-decoration: none;
            color: #28a745;
            font-size: 24px;
        }

        .form-control-sm {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
        }

        .table-container {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        .table {
            margin: 0;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 0.9em;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="header">
        <h1 class="text-center"><a href="/main">Hệ Thống Quản Lý</a></h1>
    </div>

    <!-- Form thêm -->
    <div class="row form-container justify-content-between text-center">
        <!-- Form Thêm Danh Mục -->
        <div class="col-md-4">
            <form action="/hien-thi-san-pham/addDanhMuc" method="post">
                <input type="hidden" name="id" value="danhMuc">
                <div class="form-group">
                    <label>Danh Mục:</label>
                    <input type="text" name="tenDanhMuc" class="form-control form-control-sm" required>
                </div>
                <button type="submit" class="btn btn-success btn-sm btn-block">Thêm</button>
            </form>
        </div>
        <!-- Form Thêm Màu Sắc -->
        <div class="col-md-4">
            <form action="/hien-thi-san-pham/addMauSac" method="post">
                <input type="hidden" name="id" value="mauSac">
                <div class="form-group">
                    <label>Màu Sắc:</label>
                    <input type="text" name="tenMauSac" class="form-control form-control-sm" required>
                </div>
                <button type="submit" class="btn btn-success btn-sm btn-block">Thêm</button>
            </form>
        </div>
        <!-- Form Thêm Kích Thước -->
        <div class="col-md-4">
            <form action="/hien-thi-san-pham/addKichThuoc" method="post">
                <input type="hidden" name="id" value="kichThuoc">
                <div class="form-group">
                    <label>Size :</label>
                    <input type="text" name="tenKichThuoc" class="form-control form-control-sm" required>
                </div>
                <button type="submit" class="btn btn-success btn-sm btn-block">Thêm</button>
            </form>
        </div>
    </div>


    <!-- Danh Sách -->
    <div class="row mt-4 text-center">
        <!-- Danh Sách Danh Mục -->
        <div class="col-md-4 table-container">
            <h3 class="text-center py-2">Danh Sách Danh Mục</h3>
            <table class="table table-bordered table-sm">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Danh Mục</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="danhMuc" items="${danhSachDanhMuc}">
                    <tr>
                        <td>${danhMuc.id}</td>
                        <td>${danhMuc.tenDanhMuc}</td>
                        <td>
                            <a href="/hien-thi-san-pham/deleteDM?id=${danhMuc.id}" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Danh Sách Màu Sắc -->
        <div class="col-md-4 table-container">
            <h3 class="text-center py-2">Danh Sách Màu Sắc</h3>
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
                            <a href="/hien-thi-san-pham/deleteMS?id=${mauSac.id}" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Danh Sách Kích Thước -->
        <div class="col-md-4 table-container">
            <h3 class="text-center py-2">Danh Sách Kích Thước</h3>
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
                            <a href="/hien-thi-san-pham/deleteKT?id=${kichThuoc.id}"
                               class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Form Tìm Kiếm và Danh Sách Sản Phẩm -->
    <div class="form-container mt-5">
        <h2 class="text-center">Thêm Sản Phẩm</h2>
        <form action="/hien-thi-san-pham/add" method="post">
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
            <button type="submit" class="btn btn-success btn-block">Thêm</button>
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
                        <a href="/hien-thi-san-pham/delete?id=${sanPham.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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
