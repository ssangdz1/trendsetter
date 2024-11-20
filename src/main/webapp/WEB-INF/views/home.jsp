<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <script src="js/anguler.js"></script>
    <link rel="stylesheet" href="css/home.css">

</head>
<body ng-app="myApp">
<header class="bg-dark text-white py-3">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="h3"><a href="/main">Hệ Thống Quản Lý</a></h1>
            <div>
                <c:choose>
                    <c:when test="${not empty loggedInUser}">
                        <span class="me-2">Xin chào, ${loggedInUser.hoTen}   !</span>
                        <form action="/logout" method="get" style="display:inline;">
                            <button class="btn btn-danger">Đăng xuất</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form action="/login" method="get" style="display:inline;">
                            <button class="btn btn-primary">Đăng nhập</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#!/hien-thi-san-pham">Quản Lý Sản Phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!/hien-thi-san-pham-chi-tiet">Quản Lý Sản Phẩm Chi Tiết</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!/hien-thi-nhan-vien">Quản Lý Nhân Viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!/hien-thi-khach-hang">Quản Lý Khách Hàng</a>
                    </li>

                    <!-- Kiểm tra vai trò trước khi hiển thị các mục quản lý hóa đơn -->
                    <c:if test="${loggedInUser.vaiTro == 'admin'}">
                        <li class="nav-item">
                            <a class="nav-link" href="#!/hien-thi-hoa-don-chi-tiet">Quản Lý Hóa Đơn Chi Tiết</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#!/hien-thi-hoa-don">Quản Lý Hóa Đơn</a>
                        </li>
                    </c:if>
                </ul>

            </div>
        </nav>
    </div>
</header>


<div class="container mt-4">
    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">
                ${error}
        </div>
    </c:if>
    <div class="alert alert-info" role="alert">
        Chào mừng bạn đến với Hệ Thống Quản Lý. Chọn một trong các liên kết trên để bắt đầu quản lý.
    </div>
    <div ng-view></div> <!-- Nguyên tắc này sẽ hiển thị nội dung của các trang khác -->
</div>
<footer class="bg-dark text-white text-center py-3 mt-5">
    <div class="container">
        <p>@ 2024 Hệ Thống Quản Lý</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
