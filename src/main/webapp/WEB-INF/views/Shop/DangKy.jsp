<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .avatar-preview {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #ddd;
            margin: 0 auto 20px;
        }
        .avatar-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

<div class="card p-4 shadow-sm" style="width: 100%; max-width: 400px;">
    <h3 class="text-center mb-4">Đăng Ký</h3>
    <form action="/hien-thi-khach-hang/add" method="post">
        <!-- Xem trước ảnh đại diện -->
        <div class="avatar-preview" id="avatarPreview">
            <img src="/images/${khachHang.hinhAnh}" alt="Avatar">
        </div>
        <div class="mb-3 text-center">
            <label for="avatarInput" class="btn btn-outline-secondary btn-sm">Chọn ảnh đại diện</label>
            <input type="file" id="avatarInput" accept="/images/${khachHang.hinhAnh}" class="d-none" onchange="previewAvatar(event)">
        </div>
        <div class="form-group">
            <label for="hoTen">Họ Tên:</label>
            <input type="text" id="hoTen" name="hoTen" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control" required autocomplete="username">
        </div>
        <div class="form-group">
            <label for="soDienThoai">Số Điện Thoại:</label>
            <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="diaChi">Địa Chỉ:</label>
            <input type="text" id="diaChi" name="diaChi" class="form-control">
        </div>
        <div class="form-group">
            <label for="matKhau">Mật Khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" required autocomplete="current-password">
        </div>
        <br>
        <button type="submit" class="btn btn-primary w-100">Đăng Ký</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function previewAvatar(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('avatarPreview').querySelector('img').src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    }
</script>
</body>
</html>
