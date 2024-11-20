<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shop Thời Trang</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .modal-dialog {
            position: absolute;
            right: 0;
            top: 0;
            margin: 20px; /* Khoảng cách từ trên và bên phải */
        }
        .card-img-top {
            max-height: 400px;
        }
    </style>

</head>
<body>

<div class="p-5 bg-primary text-white text-center">
    <h1>Shop Thời Trang</h1>
    <p>Khám phá bộ sưu tập mới nhất của chúng tôi</p>
</div>

<!-- Phần Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/shop">Thương Hiệu</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="d-flex flex-grow-1 align-items-center">
                <form action="/shop/search" method="get" class="w-100 me-3">
                    <input type="text" name="ten" class="form-control" placeholder="Tìm kiếm sản phẩm..." value="${query}">
                </form>
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUser}">
                                <i class="fas fa-user"></i> Xin chào, ${sessionScope.loggedInUser.hoTen}!
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-user"></i> Tài Khoản
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <ul class="dropdown-menu">
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUser}">
                                <li><a class="dropdown-item" href="">Thông Tin</a></li>
                                <li><a class="dropdown-item" href="/shop/dangxuat">Đăng Xuất</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="dropdown-item" href="/shop/dangnhap">Đăng Nhập</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <button type="button" class="btn btn-warning ms-3" data-bs-toggle="modal" data-bs-target="#myModal">
                    <i class="fas fa-shopping-cart"></i>
                </button>
            </div>
        </div>
    </div>
</nav>


<div class="container mt-4">
    <div class="row">
        <div class="col-md-3">
            <h2 class="text-center">Danh Mục Sản Phẩm</h2>
            <div class="list-group">
                <c:forEach items="${danhSachDanhMuc}" var="danhMuc">
                    <a href="/shop/danh-muc/${danhMuc.id}"
                       class="list-group-item list-group-item-action">${danhMuc.tenDanhMuc}</a>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-9">
            <h2 class="text-center">Sản Phẩm Nổi Bật</h2>
            <div class="row">
                <c:forEach var="chiTiet" items="${danhSachChiTietSanPham}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="/images/${chiTiet.hinhAnh}" alt="${chiTiet.maSanPham.tenSanPham}"
                                 class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${chiTiet.maSanPham.tenSanPham}</h5>
                                <p class="card-text">Giá: ${chiTiet.gia} VNĐ</p>
                                <p class="card-text">Mô Tả: ${chiTiet.moTa}</p>
                                <p class="card-text">Màu Sắc: ${chiTiet.maMauSac.tenMauSac}</p>
                                <p class="card-text">Kích Thước: ${chiTiet.maKichThuoc.tenKichThuoc}</p>
                                <form action="${pageContext.request.contextPath}/shop/add-to-cart" method="post">
                                    <input type="hidden" name="productId" value="${chiTiet.id}">
                                    <button type="submit" class="btn btn-primary">Mua ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal Giỏ Hàng -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg"> <!-- Thay đổi thành modal-lg để làm cho modal lớn hơn -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông Tin Giỏ Hàng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <h5>Chưa có sản phẩm nào trong giỏ hàng.</h5>
                <p>Hãy thêm sản phẩm vào giỏ hàng để thanh toán.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Thanh Toán</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>



<div class="footer text-center bg-dark text-white py-4 mt-4">
    <div class="container">
        <h5>Thông tin liên hệ</h5>
        <p>Địa chỉ: Dong Anh, Thanh Pho Ha Noi</p>
        <p>Email: trendsetter@gmail.com</p>
        <div class="newsletter">
            <h5>Đăng ký nhận tin tức</h5>
            <form action="/subscribe" method="post" class="d-inline-block">
                <input type="email" class="form-control d-inline-block" style="width: auto;"
                       placeholder="Nhập email của bạn" required>
                <button class="btn btn-warning" type="submit">Đăng ký</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
