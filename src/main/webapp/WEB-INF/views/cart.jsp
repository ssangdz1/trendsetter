<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
</head>
<body>
<h1>Giỏ hàng của bạn</h1>

<c:choose>
    <c:when test="${empty gioHang}">
        <p>Giỏ hàng hiện đang trống.</p>
    </c:when>
    <c:otherwise>
        <table border="1">
            <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Tổng</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${gioHang}">
                <tr>
                    <td>${item.maSanPhamChiTiet.maSanPham.tenSanPham}</td>
                    <td>
                        <form action="/shop/updateQuantity" method="post">
                            <input type="hidden" name="id" value="${item.maSanPhamChiTiet.id}">
                            <input type="number" name="soLuong" value="${item.soLuong}" min="1" style="width: 50px;">
                            <button type="submit">Cập nhật</button>
                        </form>
                    </td>
                    <td>${item.gia}</td>
                    <td>${item.gia * item.soLuong}</td>
                    <td>
                        <form action="/shop/removeFromCart" method="post">
                            <input type="hidden" name="id" value="${item.maSanPhamChiTiet.id}">
                            <button type="submit">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <h3>Tổng tiền:
            <c:set var="total" value="0"/>
            <c:forEach var="item" items="${gioHang}">
                <c:set var="total" value="${total + (item.gia * item.soLuong)}"/>
            </c:forEach>
                ${total} VND
        </h3>

        <form action="/shop/checkout" method="get">
            <button type="submit">Thanh toán</button>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
