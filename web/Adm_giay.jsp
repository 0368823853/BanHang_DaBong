<%-- 
    Document   : Adm_element
    Created on : Oct 25, 2024, 12:03:19 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_giay" %>
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
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
<style>
    body{color: #000;overflow-x: hidden;height: 100%;background-image: url("https://i.imgur.com/GMmCQHC.png");background-repeat: no-repeat;background-size: 100% 100%}.card{padding: 30px 40px;margin-top: 60px;margin-bottom: 60px;border: none !important;box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2)}.blue-text{color: #00BCD4}.form-control-label{margin-bottom: 0}input, textarea, button{padding: 8px 15px;border-radius: 5px !important;margin: 5px 0px;box-sizing: border-box;border: 1px solid #ccc;font-size: 18px !important;font-weight: 300}input:focus, textarea:focus{-moz-box-shadow: none !important;-webkit-box-shadow: none !important;box-shadow: none !important;border: 1px solid #00BCD4;outline-width: 0;font-weight: 400}.btn-block{text-transform: uppercase;font-size: 15px !important;font-weight: 400;height: 43px;cursor: pointer}.btn-block:hover{color: #fff !important}button:focus{-moz-box-shadow: none !important;-webkit-box-shadow: none !important;box-shadow: none !important;outline-width: 0}
</style>

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
                            <a href="element.html" class="dropdown-item active">Giày</a>
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
                <form class="d-none d-md-flex ms-4" action="Adm_searchgiayServlet" method="get">
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
            
            <div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <h3>Nhập thông tin giày</h3>
            
            <div class="card">
                <h5 class="text-center mb-4">Mời bạn nhập thông tin đầy đủ</h5>
                <form action="addgiay" method="post" class="form-card">
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Tên giày<span class="text-danger"> *</span></label> <input type="text" id="fname" name="ten" placeholder="Enter your first name" onblur="validate(1)"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Đơn giá<span class="text-danger"> *</span></label> <input type="number" id="lname" name="dongia" placeholder="Enter your last name" onblur="validate(2)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Màu<span class="text-danger"> *</span></label> <input type="text" id="email" name="mau" placeholder="" onblur="validate(3)"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Số lượng<span class="text-danger"> *</span></label> <input type="number" id="mob" name="soluong" placeholder="" onblur="validate(4)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Chất liệu<span class="text-danger"> *</span></label> <input type="text" id="job" name="size" placeholder="" onblur="validate(5)"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Xuất sứ<span class="text-danger"> *</span></label> <input type="text" id="job" name="xuatsu" placeholder="" onblur="validate(6)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-12 flex-column d-flex"> <label class="form-control-label px-3">Mô tả sản phẩm<span class="text-danger"> *</span></label> <input type="text" id="ans" name="mota" placeholder="" onblur="validate(7)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Ảnh sản phẩm<span class="text-danger"> *</span></label> <input type="file" id="job" name="img" placeholder="" onblur="validate(8)"> </div>
                    </div>                    
                    <div class="row justify-content-end">
                        <div class="form-group col-sm-6"> <button type="submit" class="btn-block btn-primary" onclick="return confirm('Xác nhận thêm sản phẩm');">Thêm sản phẩm</button> </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
            <!-- Navbar End -->


            <!-- Other Elements Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6" style="width: 100%">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Thông tin giày</h6>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Tên giày</th>
                                        <th scope="col">Ảnh giày</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Đơn giá</th>
                                        <th scope="col">Màu sắc</th>
                                        <th scope="col">Chất liệu</th>
                                        <th scope="col">Xuất sứ</th>
                                        <th scope="col">Mô tả</th>
                                        <th scope="col">Xoá</th>
                                        <th scope="col">Sửa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listS}" var="x" >
                                    <tr>
                                        <td>${x.ten}</td>
                                        <td><img src="${pageContext.request.contextPath}/img/giay/${x.img}" width="70px" height="70px"/></td>
                                        <td>${x.soluong}</td>
                                        <td>${x.dongia}</td>
                                        <td>${x.mau}</td>
                                        <td>${x.size}</td>
                                        <td>${x.xuatsu}</td>
                                        <td scope="col" style="width: 150px; max-width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="${x.mota}">${x.mota}</td>
                                        <td><a onclick="showMess(${x.idgiay})"
                                      href="#"
                                      class="addgiay"
                                      data-toggle="modal"><i class='bx bxs-trash-alt'></i></a></td>
                                      <td><a href="updategiayServlet?idgiay=${x.idgiay}"><i class='bx bxs-edit-alt'></i></a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Other Elements End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">ntvsport@gmail.com</a> NTV Sport 
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
     <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
        <script>
    function  showMess(idgiay){
        var option = confirm("Bạn có chắc chắn muốn xoá?");
        if(option === true){
            window.location.href = "addgiay?idgiay="+idgiay;
        }
    }
</script>
</body>

</html>
