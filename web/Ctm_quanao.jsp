<%-- 
    Document   : Ctm_quanao
    Created on : Nov 22, 2024, 9:28:22 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_sanpham" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/png" href="../img/logo_btl.png">
    <title>NTV Sport</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/Ctm_quanao.css">
    <link rel="stylesheet" href="../css/hotro.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/Ctm_style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
</head>
<body>

    <!--Tiêu đề trên cùng-->
    <!--Tiêu đề trên cùng-->
    <div class="top-header" id="top-header">
        <div class="out-box">
            <div class="inside-box">
                <div class="col-1">
                    <span><i class='bx bxs-envelope'></i>vietloz122@gmail.com</span>
                    <span><i class='bx bxs-phone-call'></i>(+84) 368823853</span>
                    <span><i class='bx bxs-alarm'></i>Monda - Sunday (07:00 AM - 18:00 PM)</span>
                </div>

                <div class="col-2">
                    <a href="Ctm_LoginServlet"><i class='bx bx-arrow-to-right'></i>Đăng nhập</a>
                    <a href="Ctm_signup.jsp"><i class='bx bxs-user'></i>Đăng ký</a>
                    <span>Follow me</span>
                    <div class="social">
                        <i class='bx bxl-facebook'></i>
                        <i class='bx bxl-tiktok'></i>
                        <i class='bx bxl-instagram-alt'></i>
                        <i class='bx bxl-youtube'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Phần điều hướng-->
    <header class="header" style="padding: 0">
        <div class="logo">
            <img src="./img/giay/logo.jpg" alt="" style="padding: 10px">
        </div>
        <nav>
            <div class="navbar">
                <ul class="navLink" id="productList">
                    <li><a href="Ctm_Servlet" class="active">Home</a></li>
                    <li><a href="#arrivals">Quần Áo Đá Bóng <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">     
                            <c:forEach items="${listS}" var="x">
                            <li><a href="Ctm_quanao?idsp=${x.idsp}">${x.ten}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="#">Giày Đá Bóng <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <li><a href="">Giày Wika</a></li>
                            <li><a href="">Giày Rocker</a></li>
                            <li><a href="">Giày Nike</a></li>
                        </ul>
                    </li>
                    <li><a href="">Đơn hàng <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <li><a href="">Chi tiết đơn hàng</a></li>
                            <li><a href="Ctm_lichsuServlet">Lịch sử đơn hàng</a></li>
                            <li><a href="">Sản phẩm đã huỷ</a></li>
                            <li><a href="#client">Đánh giá</a></li>
                        </ul>
                    </li>
                    <li><a href="">Về chúng tôi <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <li><a href="#market">Thương hiệu</a></li>
                            <li><a href="#blog">Sứ mệnh</a></li>
                            <li><a href="">Địa chỉ</a></li>
                        </ul>
                    </li>
                    <li><a href="#footer">Liên hệ <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <li><a href="">Chính sách bảo hành</a></li>
                            <li><a href="#">Hỗ trợ khách hàng</a></li>
                            <li><a href="">Tuyển dụng</a></li>
                            <li><a href="">Hướng dẫn mua hàng</a></li>
                            <li><a href="#">Liên hệ trực tiếp</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="others">
                <i class='bx bx-search' id="search-icon" title="Tìm kiếm"></i>
                <div class="search-box ">
                    <input type="text" name="" id="searchInput" placeholder="Mời bạn nhập...">
                </div>
                <a href="cart"><i class='bx bx-cart-download cart'><span id="cart-count">0</span></i></a>
                <button class="addBtn" type="submit"><i class='bx bx-plus-circle'></i><a href="#"> Thêm giỏ
                        hàng</a></button>
                <i class='bx bx-menu' id="menuBtn"></i>
            </div>

        </nav>
    </header>
    <div class="card-wrapper" style="margin-top: 50px">
    <div class="card">
        <!-- card left -->
        <div class="product-imgs" style="padding-top: 50px">
            <div class="img-display">
                <div class="img-showcase">
                    <img src="${pageContext.request.contextPath}/img/${st.img}" alt="shoe image">
                    <img src="img/giay/logo.jpg" alt="shoe image">
                    <img src="img/giay/size.jpg" alt="shoe image">
                    <img src="img/giay/zalo.jpg" alt="shoe image">
                </div>
            </div>
            <div class="img-select">
                <div class="img-item" style="width: 50px">
                    <a href="#" data-id="1">
                        <img src="${pageContext.request.contextPath}/img/${st.img}" alt="shoe image">
                    </a>
                </div>
                <div class="img-item" style="width: 50px">
                    <a href="#" data-id="2">
                        <img src="img/giay/logo.jpg" alt="shoe image">
                    </a>
                </div>
                <div class="img-item" style="width: 50px">
                    <a href="#" data-id="3">
                        <img src="img/giay/size.jpg" alt="shoe image">
                    </a>
                </div>
                <div class="img-item" style="width: 50px">
                    <a href="#" data-id="4">
                        <img src="img/giay/zalo.jpg" alt="shoe image">
                    </a>
                </div>
            </div>
        </div>
        <!-- card right -->
        <div class="product-content" style="padding-top: 50px;">
            <form id="addCartForm">
            <a href="Ctm_Servlet" class="product-link">Quay lại trang chủ</a>
            <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span>4.7(21)</span>
            </div>

            <div class="product-price">
                <input type="hidden" id="productImg" value="${st.img}" name="img">
                <p class="last-price">Giá cũ: <span>198.000 VNĐ</span></p>
                <p class="new-price">Giá khuyến mãi: <span><input name="dongia" readonly="" value="${st.dongia}" style="width: 70px"> VNĐ (25%)</span></p>
            </div>

            <div class="product-detail">
                <input type="hidden" name="idsp" value="${st.idsp}">
                <h2>Tên sản phẩm: <input name="tenp" readonly="" value="${st.ten}" style="color: red; font-size: 20px; text-transform: capitalize; width: 100%"></h2>
                <p>${st.mota}</p>
                <ul>
                    <li>Màu: <span>${st.mau}</span></li>
                    <li>Chất vải: <span>${st.size}</span></li>
                    <li>Xuất sứ: <span>${st.xuatsu}</span></li>
                    <li>Số lượng: <span>${st.soluong}</span></li>
                    
                </ul>
<!--                <div class="form-group">
                <form id="myForm" onsubmit="return validateForm()">
                    <label for="birthday">Chọn size: </label>
                    <select class="form-control" id="validationDefault04" name="size" style="color: red">
                        <option value="" selected disabled>...</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                        <option value="XXL">XXL</option>
                    </select>
                    
                </form>

                </div>-->
            </div>

            <div class="purchase-info">
                <input type="number" min="0" value="1" name="soluong" style="width: 20%; font-size: 20px">
            </div>
                    
            <button type="submit" onclick="addToCart()" style="margin-bottom: 30px; font-size: 30px; background: white"><i class='bx bxs-cart-add'></i></button>
            <div class="social-links">
                <p>Chia sẻ: </p>
                <a href="#">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="#">
                    <i class="fab fa-whatsapp"></i>
                </a>
                <a href="#">
                    <i class="fab fa-pinterest"></i>
                </a>
            </div>
                    
                    
            </form>
                    <div id="cartNotification" style="display: none; color: green;"></div>
        </div>
    </div>
</div>
                        <script>
function addToCart() {
    const idsp = document.getElementById('idsp').value;
    const tenp = document.getElementById('tenp').value;
    const img = document.getElementById('img').value;
    const dongia = document.getElementById('dongia').value;
    const soluong = document.getElementById('soluong').value;

    const cartNotification = document.getElementById('cartNotification');

    fetch('addToCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `idsp=${idsp}&tenp=${tenp}&img=${img}&dongia=${dongia}&soluong=${soluong}`,
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'success') {
                cartNotification.style.display = 'block';
                cartNotification.textContent = data.message + ` Tổng số lượng: ${data.totalQuantity}`;
            } else {
                cartNotification.style.display = 'block';
                cartNotification.textContent = `Lỗi: ${data.message}`;
                cartNotification.style.color = 'red';
            }

            // Ẩn thông báo sau 3 giây
            setTimeout(() => {
                cartNotification.style.display = 'none';
            }, 3000);
        })
        .catch((error) => {
            cartNotification.style.display = 'block';
            cartNotification.textContent = 'Có lỗi xảy ra, vui lòng thử lại!';
            cartNotification.style.color = 'red';
            console.error('Lỗi:', error);
        });
}
document.getElementById("addCartForm").addEventListener("submit", function (event) {
    // Ngăn hành vi mặc định của form
    event.preventDefault();

    // Lấy dữ liệu từ form
    const formData = new FormData(this);
    const cartNotification = document.getElementById('cartNotification');

    // Gửi dữ liệu đến servlet bằng Fetch API
    fetch('addToCart', {
        method: 'POST',
        body: new URLSearchParams(formData),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'success') {
                cartNotification.style.display = 'block';
                cartNotification.textContent = data.message + ` Tổng số lượng: ${data.totalQuantity}`;
                cartNotification.style.color = 'green';
            } else {
                cartNotification.style.display = 'block';
                cartNotification.textContent = `Lỗi: ${data.message}`;
                cartNotification.style.color = 'red';
            }

            // Ẩn thông báo sau 3 giây
            setTimeout(() => {
                cartNotification.style.display = 'none';
            }, 3000);
        })
        .catch((error) => {
            cartNotification.style.display = 'block';
            cartNotification.textContent = 'Có lỗi xảy ra, vui lòng thử lại!';
            cartNotification.style.color = 'red';
            console.error('Lỗi:', error);
        });
});

</script>
    <script>
        // Hàm lấy tổng số lượng sản phẩm khi tải trang
        function updateCartCount() {
            fetch('cartQuantity')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('cart-count').innerText = data;
                })
                .catch(error => console.error('Lỗi khi cập nhật số lượng giỏ hàng:', error));
        }

        // Gọi hàm khi trang được tải
        document.addEventListener('DOMContentLoaded', updateCartCount);
    </script>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="./js/Ctm_quanao.js"></script>
    <script src="./js/Ctm_main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--    <script>
        function validateForm() {
    const size = document.getElementById("validationDefault04").value;
    if (size === "") {
        alert("Vui lòng chọn size trước khi tiếp tục!");
        return false; // Ngăn form gửi nếu chưa chọn size
    }
    return true;
}

    </script>-->
</body>
</html>
