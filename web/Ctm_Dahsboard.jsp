<%-- 
    Document   : Ctm_Dahsboard
    Created on : Nov 15, 2024, 3:29:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_khachhang" %>
<%@page import="Model.Adm_sanpham" %>
<%@page import="Model.Adm_giay" %>
<%@page import="Model.Ctm_danhgia" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="./img/giay/logo.jpg">
    <title>NTV Sport</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/Ctm_style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

</head>

<body>

    <!--Tiêu đề trên cùng-->
    <div class="top-header" id="top-header">
        <div class="out-box">
            <div class="inside-box">
                <div class="col-1">
                    
                    <span><i class='bx bxs-envelope'></i><a href="Ctm_canhanServlet?idkh=${st.idkh}" style="color: #fff">${st.tenkh}</a></span>
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
            <img src="./img/giay/logo.jpg" alt="" style="padding: 10px;">
        </div>
        <nav>
            <div class="navbar">
                <ul class="navLink" id="productList">
                    <li><a href="#top-header" class="active">Home</a></li>
                    <li><a href="#arrivals">Quần Áo Đá Bóng <i class='bx bx-chevron-down'></i></a>
                        
                        <ul class="drop-down">
                            <c:forEach items="${listS}" var="x">
                            <li><a href="Ctm_quanao?idsp=${x.idsp}">${x.ten}</a></li>
                            </c:forEach>
                        </ul>
                        
                    </li>
                    <li><a href="Ctm_giayDetailServlet">Giày Đá Bóng <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <c:forEach items="${list}" var="x">
                            <li><a href="Ctm_giay?idgiay=${x.idgiay}">${x.ten}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="">Đơn hàng <i class='bx bx-chevron-down'></i></a>
                        <ul class="drop-down">
                            <li><a href="">Chi tiết đơn hàng</a></li>
                            <li><a href="Ctm_lichsuServlet">Lịch sử mua hàng</a></li>
                            <li><a href="">Sản phẩm đã huỷ</a></li>
                            <li><a href="Ctm_adddanhgiaServlet?idkh=${st.idkh}">Đánh giá shop</a></li>
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
                <button class="addBtn"><i class='bx bx-plus-circle'></i><a href="loaddonhang"> Thanh toán</a></button>
                <i class='bx bx-menu' id="menuBtn"></i>
            </div>

        </nav>
    </header>
    <style>
    #searchResults {
        border: 1px solid red;
        width: 300px;
        margin-right: 100px;
        display: flex;
        flex-wrap: wrap;
    }
    </style>
    <div id="searchResults" class="searchresults"></div>
    <!----header slide---->
    <div class="slider">
        <div class="list">
            <div class="item">
                <img src="./img/background_3.jpg" alt="">
            </div>
            <div class="item">
                <img src="./img/quan-ao-bong-da-hido-sport-1.jpg" alt="">
            </div>
            <div class="item">
                <img src="./img/background_1.jpg" alt="">
            </div>
            <div class="item">
                <img src="./img/background_2.jpg" alt="">
            </div>
        </div>

        <div class="buttons">
            <button id="prev">
                < </button>
                    <button id="next">></button>
        </div>

        <ul class="dots">
            <li class="active"></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>

    <!--Tìm kiếm dịch vụ-->
    <div class="search">
        <div class="find">
            <h3>Hãy tìm kiếm sản phẩm mà bạn cần</h3>
            <div class="find-row">
                <div class="find-item">
                    <h4>Quần Áo</h4>
                    <select name="" id="">
                        <option value="">Tất cả quần áo</option>
                        <c:forEach items="${listS}" var="x">
                        <option value="">${x.ten}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="find-item">
                    <h4>Giày đá bóng</h4>
                    <select name="" id="">
                        <option value="">Các loại giày</option>
                        <c:forEach items="${list}" var="x">
                        <option value="">${x.ten}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="find-item">
                    <h4>Phụ kiện</h4>
                    <select name="" id="">
                        <option value="">Các loại phụ kiện</option>
                        <option value="">Áo tập</option>
                        <option value="">Lưới</option>
                    </select>
                </div>

                <div class="search-btn">
                    <button><i class='bx bx-search'></i>Tìm kiếm</button>
                </div>
            </div>
        </div>
    </div>

    <!--Về chúng tôi-->

    <section class="market" id="market">
        <div class="col-3">
            <img class="one" src="./img/background_4.jpg" alt="">
            <div class="market-icon">
                <i class='bx bxs-heart'></i>
                <i class='bx bxs-share-alt'></i>
                <i class='bx bxs-cart-download'></i>
            </div>
            <div class="service">
                <img class="two" src="./img/giay/logo.jpg" alt="" style="border-radius: 50%;">
                <span class="text">Hơn 10 năm <br> Chất lượng-Niềm tin-Uy tín</span>
            </div>
        </div>
        <div class="col-4">
            <h4>Về chúng tôi</h4>
            <h3>Hệ thống trung tâm <span>bán quần áo đá bóng</span> chuyên nghiệp</h3>
            <p class="text"><span>NTV Sport </span>được rất nhiều khách hàng quan tâm và tin tưởng sử dụng với đa dạng
                các mẫu mã như: quần áo đá bóng, giày thể thao, phụ kiện đá bóng,…</p>

            <p class="p1"><i class='bx bxs-car-mechanic'></i> In tên in sô lấy ngay</p>
            <p class="p1"><i class='bx bxs-car'></i> Phụ kiện an toàn</p>
            <p class="p1"><i class='bx bxs-car-crash'></i> Nhân viên giàu kinh nghiệm</p>
            <button>Xem thêm<i class='bx bx-right-arrow-alt'></i></button>
        </div>
    </section>

    <!--Chăm sóc xe-->
    <section class="arrivals" id="arrivals">
        <h4><i class='bx bxs-car'></i>NTV Sport</h4>
        <h1>Sản phẩm <span>Quần áo đá bóng</span></h1>

        <div class="arr-row">
            <c:forEach items="${listS}" var="x">
            <div class="arr-col">
                <div class="image">
                    <img src="${pageContext.request.contextPath}/img/${x.img}" alt="">
                </div>
               
                   <h5>${x.ten}</h5>
                
                <div class="rating">
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star-half'></i>
                    </div>
                    <div class="review">
                        <span>5.0 (78 Đánh giá)</span>
                    </div>
                </div>
                <div class="features">
                    <span><i class='bx bxs-error-alt'></i> Chuyên nghiệp</span>
                    <span><i class='bx bxs-label'></i> Chất lượng</span>
                    <span><i class='bx bxs-shield-plus'></i> Uy tín</span>
                    <span><i class='bx bxs-car'></i> NTV Sport</span>
                </div>
                <div class="price">
                    <p>${x.dongia} VNĐ<span>  218.000 VNĐ</span></p>
                    <button><a href="Ctm_quanao?idsp=${x.idsp}" style="color: #fff;">Chi tiết</a></button>
                </div>
            </div>
                   </c:forEach>
        </div>
    </section>

    <div class="popup">
        <div class="contentBox">
            <div class="close"></div>
            <div class="imgBx">
                <img src="img/giay/logo.jpg" alt="" style="border-radius: 50%;">
            </div>
            <div class="content">
                <div>
                    <h4>Chào mừng bạn đến với NTV Sport</h4>
                    <form action="">
                        <table class="user">
                            <tr>
                                <td><label for="">🌟 Khám phá bộ sưu tập mới nhất và nhận ưu đãi đặc biệt hôm nay </label> </td>
                            </tr>
                            <tr>
                                <td><label for="">Hãy để chúng tôi giúp bạn tìm phong cách hoàn hảo! 💃🕺 </label> </td>
                            </tr>
                        </table>
                        <table class="col-user">
                            <tr>
                                <td>
                                    <p>Chưa có tài khoản?</p><a href="Ctm_signup.jsp">Đăng ký</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--Sứ mệnh-->
    <section class="blog" id="blog">
        <div class="heading">
            <span>Sứ mệnh của chúng tôi</span>
            <h3>Chào mừng các độc giả thân yêu đến với web bán quần áo đá bóng <span>NTV Sport</span></h3>
            <p>Nơi mà sự hòa mình vào thế giới của những bộ quần áo đẳng cấp và đam mê thể thao không ngừng. Chúng tôi tự
                hào là đối tác đáng tin cậy của bạn trong việc tìm kiếm những bộ quần áo hoàn hảo, mang đến cho bạn trải nghiệm
                mua sắm độc đáo và thoải mái.</p>
        </div>
        <div class="blog-container container">
            <div class="box">
                <img src="./img/background_1.jpg" alt="">
                <span>Khám Phá Sự Hoàn Hảo</span>
                <h3>Đa Dạng và Chất Lượng</h3>
                <p>Chúng tôi tự tin giới thiệu đến bạn một bảng phong phú các mẫu quần áo từ các nhãn hiệu nổi tiếng
                    trên thị trường,mang đến cho bạn một kho sản phẩm đa dạng, từ những mô hình quần áo cho đến những
                    chiếc giày sang trọng</p>
                <a href="#" class="blog-btn">Đọc thêm<i class='bx bx-right-arrow-alt'></i></a>
            </div>
            <div class="box">
                <img src="./img/background_2.jpg" alt="">
                <span>Tiện Ích và Hiệu Năng</span>
                <h3> Hơn Cả Một Bộ Quần Áo Chất Lươngk</h3>
                <p>Từ hệ thống thời trang tiên tiến đến công nghệ an toàn hàng đầu, mỗi bộ quần áo trên trang web của chúng
                    tôi đều là biểu tượng của sự tiện lợi và sang trọng, cung cấp dịch vụ đặt hẹn thử nghiệm và giao
                    hàng tận nhà.</p>
                <a href="#" class="blog-btn">Đọc thêm<i class='bx bx-right-arrow-alt'></i></a>
            </div>
            <div class="box">
                <img src="./img/background_3.jpg" alt="">
                <span>Dịch Vụ Hỗ Trợ Đắc Lực</span>
                <h3>Mua Sắm Tận Hưởng và An Tâm</h3>
                <p>Bạn sẽ cảm nhận được sự chăm sóc và tận tâm mà chúng tôi dành cho khách hàng, đảm bảo mọi trải nghiệm
                    mua sắm đều là một hành trình đáng nhớ. Chúng tôi luôn mở cửa 24/7 để đảm bảo rằng bạn nhận được sự
                    hỗ trợ khi bạn cần.</p>
                <a href="#" class="blog-btn">Đọc thêm<i class='bx bx-right-arrow-alt'></i></a>
            </div>
            <div class="box">
                <img src="./img/background_4.jpg" alt="" style="margin-top: 2px;">
                <span>Chấp Nhận Thách Thức</span>
                <h3> Hãy Đặt Làm Chủ Cuộc Chơi</h3>
                <p>Hãy đặt làm chủ cuộc chơi và khám phá thế giới thể thao thông qua đôi mắt của chúng tôi. Bạn đơn giản
                    chỉ cần ngồi thoải mái và để chúng tôi làm nên những điều tuyệt vời trong thế giới thể thao.</p>
                <a href="#" class="blog-btn">Đọc thêm<i class='bx bx-right-arrow-alt'></i></a>
            </div>
        </div>
    </section>

    <!--Đánh giá của khách hàng-->

    <section class="client" id="client">
        <h4><i class='bx bxs-car'></i>Đánh giá từ khách hàng</h4>
        <h1>Khách hàng nói gì về <span>NTV Sport</span></h1>
        <div class="swiper myClient">
            <div class="swiper-wrapper">
                <c:forEach items="${lis}" var="x">
                <div class="swiper-slide slide">
                    <img src="${pageContext.request.contextPath}/img/${x.img}" alt="">
                    <h5>${x.tenkh}</h5>
                    <span>Khách hàng</span>
                    <p>${x.mota}</p>
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star-half'></i>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </section>
    <!--Linh kiện-->
    <section class="cars" id="cars">
        <div class="heading">
            <span>Tất cả những  mẫu giày thể thao chúng tôi có</span>
            <h2>Mời bạn tham khảo!</h2>
            <p>Chúng tôi tự hào là cửa hàng bán quần áo đá bóng đáng tin cậy của bạn trong hành trình đánh bóng cho chiếc giày
                của mình.</p>
            <br>
        </div>
        
        <div class="cars-container">
            <c:forEach items="${list}" var="x">
            <div class="box" title="Xem chi tiết">
                <img src="${pageContext.request.contextPath}/img/giay/${x.img}" alt="">
                <a href="Ctm_giay?idgiay=${x.idgiay}">
                    <h2>${x.ten}</h2>
                </a>
            </div>
                </c:forEach>
        </div>
        
    </section>


    <!--Chân trang-->
    <section class="footer" id="footer">
        <div class="footer-container container">
            <div class="footer-boxx">
                <a href="" class="logo">NTV<span>Sport</span></a>
                <div class="social">
                    <a href="https://www.facebook.com/profile.php?id=100024948677618&mibextid=LQQJ4d"><i
                            class='bx bxl-facebook'></i></a>
                    <a href="https://instagram.com/vietbo14?igshid=M2RkZGJiMzhjOQ%3D%3D&utm_source=qr"><i
                            class='bx bxl-instagram-alt'></i></a>
                    <a href="https://youtube.com/@ntvanimebro6816?si=6Wu9LM7LQsv4dDCU"><i
                            class='bx bxl-youtube'></i></a>
                    <a href="https://github.com/0368823853"><i class='bx bxl-github'></i></a>
                    <a href="https://www.tiktok.com/@viet17110?_t=8hITpzZgNbr&_r=1"><i class='bx bxl-tiktok'></i></a>
                </div>
            </div>
            <div class="footer-box">
                <h3>Trang web</h3>
                <a href="#">Trang chủ</a>
                <a href="#">Quần áo đá bóng</a>
                <a href="#">Giày thể thao</a>
                <a href="#">Đơn hàng</a>
                <a href="#">Về chúng tôi</a>
                <a href="#">Liên hệ</a>
            </div>
            <div class="footer-box">
                <h3>Về chúng tôi</h3>
                <a href="">Lịch sử thương hiệu</a>
                <a href="">Tầm nhìn sứ mệnh</a>
                <a href="">Hệ thống cửa hàng</a>
            </div>
            <div class="footer-box">
                <h3>Liên hệ với chúng tôi</h3>
                <a href="">Hướng dẫn mua hàng</a>
                <a href="">Tuyển dụng</a>
                <a href="">Hỗ trợ khách hàng</a>
                <a href="https://0368823853.github.io/">Tài khoản</a>
                <a href="">Liên hệ trực tiếp</a>
            </div>
            <div class="footer-box">
                <h3>Hotline</h3>
                <a href="https://maps.app.goo.gl/y1DKib8iKa5wRhP16" style="color: #fff;"><i class='bx bxs-map'></i> Đại
                    học công nghệ đông á</a>
                <p><i class='bx bxs-phone'></i> Mua hàng online: 0393.249.214</p>
                <p><i class='bx bxs-phone'></i> Hotline CSKH: 0344.511.138</p>
                <p><i class='bx bxs-envelope'></i> Phản hồi khiếu nại: ntvsport12@gmail.com</p>
            </div>
        </div>
    </section>
    
    <script>
    // const onSearch = () => {
    //     const input = document.querySelector("#search");
    //     const filter = input.value.toUpperCase();
    //     const list = document.querySelectorAll("#list li");
    //     list.forEach((el) => {
    //         const text = el.textContent.toUpperCase();
    //         el.style.display = text.includes(filter) ? "" : "none";
    //     });
    // }
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy các phần tử DOM cần thiết
        var searchInput = document.getElementById("searchInput");
        var productList = document.getElementById("productList");
        var searchResults = document.getElementById("searchResults");

        // Lắng nghe sự kiện khi người dùng nhập vào ô tìm kiếm
        searchInput.addEventListener("input", function() {
            // Xóa kết quả tìm kiếm trước đó
            searchResults.innerHTML = "";

            // Lấy từ khóa tìm kiếm và chuyển đổi thành chữ thường để so sánh
            var keyword = searchInput.value.toLowerCase();

            // Lặp qua danh sách sản phẩm và lọc kết quả
            for (var i = 0; i < productList.children.length; i++) {
                var product = productList.children[i].textContent.toLowerCase();

                // Nếu từ khóa xuất hiện trong tên sản phẩm, hiển thị kết quả
                if (product.includes(keyword)) {
                    var resultItem = document.createElement("div");
                    resultItem.textContent = productList.children[i].textContent;
                    searchResults.appendChild(resultItem);
                }
            }
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
    <!--
        <div class="rating">
            <input value="5" name="rating" id="star5" type="radio">
            <label for="star5"></label>
            <input value="4" name="rating" id="star4" type="radio">
            <label for="star4"></label>
            <input value="3" name="rating" id="star3" type="radio">
            <label for="star3"></label>
            <input value="2" name="rating" id="star2" type="radio">
            <label for="star2"></label>
            <input value="1" name="rating" id="star1" type="radio">
            <label for="star1"></label>
        </div>
        -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script src="./js/Ctm_main.js"></script>
</body>

</html>
