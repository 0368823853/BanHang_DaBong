<%-- 
    Document   : Adm_button
    Created on : Oct 25, 2024, 12:53:46 AM
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
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="Adm_Dahsboard.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>NTV Sport</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Nguyễn Tiến Việt</h6>
                        <span>Nhân viên</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="Adm_Servlet" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Trang Chủ</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Sản Phẩm</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="loads" class="dropdown-item">Quần Áo</a>
                            <a href="Adm_loadgiayServlet" class="dropdown-item active">Giày</a>
                        </div>
                    </div>
                    <a href="loadkh" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Khách Hàng</a>
                    <a href="Adm_nhanvienServlet" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Nhân Viên</a>
                    <a href="Adm_loaddanhgiaServlet" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Đánh giá</a>
                    <a href="admdonhang" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Đơn Hàng</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="Adm_login.jsp" class="dropdown-item">Đăng Xuất</a>
                            <a href="BaoCaoThongKeServlet" class="dropdown-item">Báo Cáo Thống Kê</a>
                            <a href="Ctm_Dahsboard.jsp" class="dropdown-item">Giao Diện Người Dùng</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="Adm_Dahsboard.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <form class="d-none d-md-flex ms-4" action="searchsanpham" method="get">
                    <input class="form-control border-0" type="text" placeholder="Search" name="searchName" required style="margin-right: 20px">
                    <input type="submit" name="btnGo" value="Tìm Kiếm" class="btn btn-primary">
                </form>
                
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Tin Nhắn</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="ms-2">
                                        <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                        <small>15 phút trước</small>
                                    </div>
                                </div>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all message</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Thông Báo</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Profile updated</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all notifications</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">Nguyễn Tiến Việt</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">Cá Nhân</a>
                            <a href="#" class="dropdown-item">Cài Đặt</a>
                            <a href="Adm_login.jsp" class="dropdown-item">Đăng Xuất</a>
                        </div>
                    </div>
                </div>
            </nav>
            
            <!-- Navbar End -->
            <div class="container-fluid pt-4 px-4">
            <div class="col-sm-12 col-xl-6" style="width: 100%">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Basic Form</h6>
                            <form action="add" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6" style="padding-bottom: 15px">
                                      <label for="inputEmail4">Tên Quần Áo</label>
                                      <input type="text" class="form-control" id="inputEmail4" name="ten" placeholder="Mời bạn nhập tên sản phẩm...">
                                    </div>
                                    <div class="form-group col-md-6" style="padding-bottom: 15px">
                                      <label for="inputPassword4">Ảnh quần áo</label>
                                      <input type="file" class="form-control" id="inputPassword4" name="img">
                                    </div>
                                  </div>
                                  <div class="form-row">
                                    <div class="form-group col-md-6" style="padding-bottom: 15px">
                                      <label for="inputCity">Số lượng</label>
                                      <input type="number" class="form-control" id="inputCity" name="soluong">
                                    </div>
                                    <div class="row">
                                        <!-- Cột đầu tiên -->
                                        <div class="col-md-6" style="padding-bottom: 15px;">
                                            <label for="inputDongia">Đơn giá</label>
                                            <input type="text" class="form-control" id="inputDongia" placeholder="VNĐ" name="dongia">
                                        </div>
                                        <div class="col-md-6" style="padding-bottom: 15px;">
                                            <label for="inputMau">Màu</label>
                                            <input type="text" class="form-control" id="inputMau" name="mau">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Cột đầu tiên -->
                                        <div class="col-md-6" style="padding-bottom: 15px;">
                                            <label for="inputChatlieu">Chất liệu</label>
                                            <input type="text" class="form-control" id="inputChatlieu" name="size">
                                        </div>
                                        <div class="col-md-6" style="padding-bottom: 15px;">
                                            <label for="inputXuatsu">Xuất sứ</label>
                                            <input type="text" class="form-control" id="inputXuatsu" name="xuatsu">
                                        </div>
                                    </div>

                                    <div class="form-group" style="padding-bottom: 15px">
                                      <label for="inputAddress">Mô tả sản phẩm</label>
                                      <input type="text" class="form-control" id="inputAddress" name="mota" placeholder="Mô tả quần áo">
                                    </div>
                                  </div>
                                    <div class="col-12">
                                      <div class="form-check" style="padding-bottom: 20px">
                                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                                        <label class="form-check-label" for="invalidCheck2">
                                          Xác nhận thông tin sản phẩm
                                        </label>
                                      </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit"
                                                onclick="return confirm('Xác nhận thêm sản phẩm');">Thêm sản phẩm</button>
                                    </div>
                                </form>
                        </div>
                    </div>
            </div>
            <!-- Button Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Quần áo đá bóng</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col" style="width: 150px">Tên sản phẩm</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col"style="width: 50px">Số lượng</th>
                                    <th scope="col"style="width: 50px">Đơn giá</th>
                                    <th scope="col"style="width: 50px">Màu sắc</th>
                                    <th scope="col"style="width: 50px">Chất liệu</th>
                                    <th scope="col"style="width: 50px">Xuất sứ</th>
                                    <th scope="col" style="width: 150px">Mô tả</th>
                                    <th scope="col" style="width: 50px">Cập nhật</th>
                                    <th scope="col"style="width: 50px">Xoá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listS}" var="x" >
                                    <tr>
                                    <td>
                                    <span class="custom-checkbox">
                                      <input
                                        type="checkbox"
                                        id="checkbox5"
                                        name="options[]"
                                        value="1"
                                      />
                                      <label for="checkbox5"></label>
                                    </span>
                                  </td>
                                        <td>${x.ten}</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/img/${x.img}" width="70px" height="70px"/>
                                        </td>
                                        <td>${x.soluong}</td>
                                        <td>${x.dongia}</td>
                                        <td>${x.mau}</td>
                                        <td>${x.size}</td>
                                        <td>${x.xuatsu}</td>
                                        <td scope="col" style="width: 150px; max-width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="${x.mota}">${x.mota}</td>
                                    <td>
                                    <a href="update?idsp=${x.idsp}" class="edit" data-toggle="modal" >
                                        <i class="bi bi-exclamation-triangle-fill"></i>
                                       
                                    </a>
                                    </td>
                                    <td>
                                        <a onclick="showMess(${x.idsp})"
                                      href="#"
                                      class="delete"
                                      data-toggle="modal">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                            </svg>
                                        </a>
                                    </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Button End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
    function  showMess(idsp){
        var option = confirm("Bạn có chắc chắn muốn xoá?");
        if(option === true){
            window.location.href = "delete?idsp="+idsp;
        }
    }
</script>
</body>

</html>
