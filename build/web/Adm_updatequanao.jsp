<%-- 
    Document   : Update_NghiPhep
    Created on : Jun 11, 2024, 6:50:34 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_sanpham" %>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Sửa nghỉ phép</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
</head>
<style>
.container-fluiid {
    line-height: 50px;
    border: 1px solid black;
    width: 700px;
    box-shadow: 3px 3px 7px black;
    height: 500px;
    overflow: scroll;
    border-radius: 5px;
}
</style>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image" style="background-image: url(img/bgr_2.jpg)"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Cập nhật quần áo</h1>
                            </div>
                            <form action="update" method="post">
                                <div class="form-group">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="">ID Sản phẩm</label>
                                    <input type="text" name="idsp" class="form-control"
                                           value="${st.idsp}" readonly="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Tên sản phẩm</label>
                                        <input type="text" name="ten" class="form-control"
                                            value="${st.ten}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Ảnh sản phẩm</label>
                                        <img src="${pageContext.request.contextPath}/img/${st.img}" width="70px" height="70px"/>
                                        <input type="file" name="img" class="form-control"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Số lượng sản phẩm</label>
                                        <input type="number" class="form-control form-control-user" id="exampleFirstName"
                                            name="soluong"
                                            value="${st.soluong}"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Đơn giá </label>
                                        <input type="number" class="form-control form-control-user" id="exampleFirstName"
                                            name="dongia"
                                            value="${st.dongia}"/>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Màu sắc </label>
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            name="mau"
                                            value="${st.mau}"/>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Chất liệu </label>
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            name="size"
                                            value="${st.size}"/>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Xuất sứ </label>
                                        <input type="number" class="form-control form-control-user" id="exampleFirstName"
                                            name="xuatsu"
                                            value="${st.xuatsu}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="">Số lượng sản phẩm</label>
                                    <textarea class="form-control" id="exampleFirstName"
                                              name="mota" rows="5">${st.mota}</textarea>
                                </div>

                                    <br>
                                <button name="btn_update" class="btn btn-success" type="submit" onclick="return confirm('Xác nhận sửa sản phẩm');">Cập nhật sản phẩm</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
