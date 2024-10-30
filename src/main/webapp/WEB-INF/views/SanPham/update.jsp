<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Sửa Sản Phẩm</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
    <h1 class="text-center">Sửa Sản Phẩm</h1>
    <form action="/hien-thi-san-pham/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${sanPham.id}"/>
        <div class="form-group">
            <label for="tenSanPham">Tên Sản Phẩm:</label>
            <input type="text" id="tenSanPham" name="tenSanPham" class="form-control" value="${sanPham.tenSanPham}" required>
        </div>
        <div class="form-group">
            <label>Danh Mục:</label>
            <select name="maDanhMuc" >
                <c:forEach items="${listDanhMuc}" var="maDanhMuc">
                    <option value="${maDanhMuc.id}" label="${maDanhMuc.tenDanhMuc}" ${maDanhMuc.id == sanPham.maDanhMuc.id ? "selected":""}></option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-warning">Cập Nhật</button>
        <a href="/san-pham/hien-thi" class="btn btn-secondary">Trở về</a>
    </form>
</div>
</body>
</html>
