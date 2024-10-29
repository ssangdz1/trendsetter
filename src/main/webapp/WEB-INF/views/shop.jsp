<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Thời Trang</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const elementsToShow = document.querySelectorAll('.scroll-animation');

            const elementInView = (element) => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150; // Chỉ số mà bạn muốn kích hoạt hiệu ứng

                return (elementTop <= window.innerHeight - elementVisible);
            };

            const displayScrollAnimation = () => {
                elementsToShow.forEach((element) => {
                    if (elementInView(element)) {
                        element.classList.add('visible');
                    }
                });
            };

            window.addEventListener('scroll', displayScrollAnimation);
            displayScrollAnimation(); // Gọi để hiển thị các phần tử nếu đã cuộn xuống
        });
    </script>
    <script>
        const cartButtons = document.querySelectorAll('form[action="/shop/add-to-cart"]');

        cartButtons.forEach(button => {
            button.addEventListener('submit', function (event) {
                event.preventDefault(); // Ngăn chặn gửi form mặc định

                const formData = new FormData(this);
                const productId = formData.get('productId');
                const cartIcon = document.querySelector('.cart-icon');

                // Hiển thị thông báo
                const notification = document.createElement('div');
                notification.className = 'notification';
                notification.textContent = `Sản phẩm với ID: ${productId} đã được thêm vào giỏ hàng!`;
                document.body.appendChild(notification);

                // Tạo hiệu ứng cho thông báo
                setTimeout(() => {
                    notification.style.opacity = '0';
                    setTimeout(() => {
                        document.body.removeChild(notification);
                    }, 600); // Thời gian biến mất
                }, 2000); // Thời gian hiển thị
            });
        });
    </script>

</head>
<body>

<!-- Header -->
<header class="bg-dark text-light py-3">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div class="logo">
                <h1 class="text-warning"><a href="/shop" class="text-warning">Thương Hiệu</a></h1>
            </div>
            <div class="search-bar flex-grow-1 mx-3">
                <form action="${pageContext.request.contextPath}/shop/search" method="get">
                    <input type="text" name="ten" class="form-control" placeholder="Tìm kiếm sản phẩm..." value="${query}">
                </form>
            </div>
            <nav class="nav">
                <div class="d-flex align-items-center">
                    <div class="cart-icon" onclick="toggleCartForm()">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="badge badge-light" id="cart-count">${gioHang.size()}</span>
                    </div>
                    <div id="cart-form" class="cart-form shadow p-3 mb-5 bg-white rounded" style="display: none;" class="categories scroll-animation">
                        <h3>Giỏ Hàng</h3>
                        <ul id="cart-items" class="list-group">
                            <c:forEach items="${gioHang}" var="item">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                        ${item.maSanPhamChiTiet.maSanPham.tenSanPham} - Số lượng: ${item.soLuong}
                                    <button class="btn btn-danger btn-sm" onclick="removeItem('${item.maSanPhamChiTiet.id}')">Xóa</button>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="mt-3">
                            <button class="btn btn-primary" onclick="checkout()">Thanh toán</button>
                        </div>
                    </div>
                    <a class="nav-link text-light" href="#">Đăng nhập/Đăng ký</a>
                </div>
            </nav>
        </div>
        <nav class="text-center">
            <div class="d-flex justify-content-center">
                <a class="nav-link text-light" href="#">Trang chủ</a>
                <a class="nav-link text-light" href="#">Sản phẩm</a>
                <a class="nav-link text-light" href="#">Giới thiệu</a>
                <a class="nav-link text-light" href="#">Liên hệ</a>
                <a class="nav-link text-light" href="#">Khuyến mãi</a>
                <a class="nav-link text-light" href="#">Blog</a>
            </div>
        </nav>
    </div>
</header>

<!-- Main Content -->
<main class="container-fluid my-4">
    <div class="row mb-4 mx-3">
        <div class="col-md-3 p-0" class="categories scroll-animation">
            <h2 class="text-center mb-4">Danh Mục Sản Phẩm</h2>
            <c:forEach items="${danhSachDanhMuc}" var="danhMuc">
                <h4 class="text-muted">
                    <a class="text-muted" href="${pageContext.request.contextPath}/shop/danh-muc/${danhMuc.id}">${danhMuc.tenDanhMuc}</a>
                </h4>
            </c:forEach>
        </div>
        <div class="col-md-9 p-0">
            <h2 class="text-center mb-4">Sản Phẩm Nổi Bật</h2>
            <div class="row product-grid scroll-animation">
                <c:forEach var="chiTiet" items="${danhSachChiTietSanPham}">
                    <div class="col-md-4 product">
                        <div class="card product-card">
                            <img src="${pageContext.request.contextPath}/images/${chiTiet.hinhAnh}" alt="${chiTiet.maSanPham.tenSanPham}" class="card-img-top">
                            <div class="card-body">
                                <h3 class="card-title">${chiTiet.maSanPham.tenSanPham}</h3>
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
</main>

<!-- Footer -->
<footer class="bg-dark text-light py-3">
    <div class="container text-center">
        <h5>Thông tin liên hệ</h5>
        <p>Địa chỉ: Dong Anh , Thanh Pho Ha Noi</p>
        <p>Email: trendsetter@gamil.com</p>
        <div class="newsletter">
            <h5>Đăng ký nhận tin tức</h5>
            <form action="/subscribe" method="post">
                <input type="email" class="text-center" placeholder="Nhập email của bạn" required>
                <button class="btn btn-warning" type="submit">Đăng ký</button>
            </form>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function toggleCartForm() {
        const cartForm = document.getElementById("cart-form");
        cartForm.style.display = cartForm.style.display === "none" ? "block" : "none";
    }
    function removeItem(itemId) {
        // Logic to remove item from cart
    }
    function checkout() {
        // Logic to checkout
    }
</script>
</body>
</html>
