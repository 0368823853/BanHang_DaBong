<%-- 
    Document   : Ctm_cart
    Created on : Nov 22, 2024, 1:01:03 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Ctm_cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="./css/Ctm_cart.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #d2c9ff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <form action="donhang" method="post">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h1 class="fw-bold mb-0 text-black">Giỏ hàng</h1>
                                            <h6 class="mb-0 text-muted">NTV Sport</h6>
                                        </div>
                                        <c:if test="${not empty cartItems}">
                                        <table class="table">
                                            <tr>
                                                <td>Ảnh sản phẩm</td>
                                                <td>Tên sản phẩm</td>
                                                <td>Số lượng</td>
                                                <td>Đơn giá</td>
                                                <td>Thành tiền</td>
                                                <td>Xoá</td>
                                            </tr>
                                            <c:forEach var="item" items="${cartItems}">
                                            <tr>
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <td>
                                                        <div class="">
                                            
                                                            <img src="${pageContext.request.contextPath}/img/${item.img}"
                                                                class="img-fluid rounded-3" alt="Cotton T-shirt"
                                                                style="width: 120px; height: 80px;">
                                                        </div>
                                                    </td>


                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <td>
                                                            
                                                            <h6 class="text-black mb-0">${item.tenp}
                                                            </h6>
                                                        </td>
                                                    </div>


                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <td>
                                                            <input id="form1" min="1" name="soluong" value="${item.soluong}"
                                                                type="number" class="form-control form-control-sm"
                                                                style="max-width: 100px;" readonly=""/>
                                                        </td>
                                                    </div>


                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <td>
                                                            <h6 class="mb-0">${item.dongia}</h6>
                                                        </td>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <td>
                                                            
                                                            <h6 class="mb-0"><input name="dongia" readonly="" value="${String.format("%.3f", item.soluong * item.dongia)}" style="border: none; outline: none"></h6>
                                                        </td>
                                                    </div>

                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <td>
                                                    <a onclick="showMess(${item.idcart})"
                                                    href="#"
                                                    class="delete"
                                                    data-toggle="modal" style="color: black">
                                                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                              <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                          </svg>
                                                      </a>
                                                        </td>
                                                        <td>
                                                                                                  
<!--                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Tổng tiền</h5>
                                                <h5>${item.totalPrice} VNĐ</h5>
                                            </div>-->
                                                        </td>
                                                    </div>

                                                </div>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                        </c:if>
                                        <c:if test="${empty cartItems}">
                                            <h2>Hiện tại không có sản phẩm nào trong giỏ hàng!</h2>
                                        </c:if>
                                            <div class="pt-5">
                                        <button class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark"><a href="Ctm_Servlet" style="color: white; text-decoration: none">Quay lại</a></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 bg-grey">
                                    <div class="p-5">
                                        <h3 class="fw-bold mb-5 mt-2 pt-1">Hoá đơn</h3>
                                        <hr class="my-4">
                                        <input type="hidden" name="tensp" value="${st.tenp}">
                                      <input type="hidden" id="productImg" value="${st.img}" name="img">

                                        <h5 class="text-uppercase mb-3" style="font-size: 15px;">Hình thức vận chuyển
                                        </h5>
                                        
                                        <div class="mb-4 pb-2">
                                            <select class="select" style="width: 130px;" name="trangthai">
                                                <option value="Mặc định"></option>
                                                <option value="Nhanh">Nhanh</option>
                                                <option value="Hoả tốc">Hoả tốc</option>
                                                <option value="Tiết kiệm">Tiết kiệm</option>
                                            </select>
                                        </div>

                                        <h5 class="text-uppercase mb-3">Voucher</h5>

                                        <div class="mb-5">
                                            <div class="form-outline">
                                                <input type="text" id="form3Examplea2"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Examplea2">Nhập mã của bạn</label>
                                            </div>
                                        </div>
                                        <hr class="my-4">        
                                        <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark" onclick="return confirm('Xác nhận mua hàng');">Mua hàng</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script>
    function  showMess(idcart){
        var option = confirm("Bạn có chắc chắn muốn xoá?");
        if(option === true){
            window.location.href = "deletecart?idcart="+idcart;
        }
    }
</script>
        
        
    </body>
</html>
