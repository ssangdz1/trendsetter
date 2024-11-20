<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <h2 class="text-center">Login</h2>

            <form action="/login" method="post">
                <div class="mb-3">
                    <label for="taiKhoan" class="form-label">Tài Khoản:</label>
                    <input type="text" id="taiKhoan" name="taiKhoan" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu:</label>
                    <input type="password" id="matKhau" name="matKhau" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3" role="alert">
                        ${error} <!-- Hiển thị thông báo lỗi nếu có -->
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Thêm Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
