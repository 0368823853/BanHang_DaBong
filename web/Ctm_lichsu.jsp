<%-- 
    Document   : Ctm_lichsu
    Created on : Nov 26, 2024, 12:05:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Ctm_donhang" %>
<%@page import="Model.Ctm_thanhtoan" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');body{background-color: #eeeeee;font-family: 'Open Sans',serif}.container{margin-top:50px;margin-bottom: 50px}.card{position: relative;display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;min-width: 0;word-wrap: break-word;background-color: #fff;background-clip: border-box;border: 1px solid rgba(0, 0, 0, 0.1);border-radius: 0.10rem}.card-header:first-child{border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0}.card-header{padding: 0.75rem 1.25rem;margin-bottom: 0;background-color: #fff;border-bottom: 1px solid rgba(0, 0, 0, 0.1)}.track{position: relative;background-color: #ddd;height: 7px;display: -webkit-box;display: -ms-flexbox;display: flex;margin-bottom: 60px;margin-top: 50px}.track .step{-webkit-box-flex: 1;-ms-flex-positive: 1;flex-grow: 1;width: 25%;margin-top: -18px;text-align: center;position: relative}.track .step.active:before{background: #FF5722}.track .step::before{height: 7px;position: absolute;content: "";width: 100%;left: 0;top: 18px}.track .step.active .icon{background: #ee5435;color: #fff}.track .icon{display: inline-block;width: 40px;height: 40px;line-height: 40px;position: relative;border-radius: 100%;background: #ddd}.track .step.active .text{font-weight: 400;color: #000}.track .text{display: block;margin-top: 7px}.itemside{position: relative;display: -webkit-box;display: -ms-flexbox;display: flex;width: 100%}.itemside .aside{position: relative;-ms-flex-negative: 0;flex-shrink: 0}.img-sm{width: 80px;height: 80px;padding: 7px}ul.row, ul.row-sm{list-style: none;padding: 0}.itemside .info{padding-left: 15px;padding-right: 7px}.itemside .title{display: block;margin-bottom: 5px;color: #212529}p{margin-top: 0;margin-bottom: 1rem}.btn-warning{color: #ffffff;background-color: #ee5435;border-color: #ee5435;border-radius: 1px}.btn-warning:hover{color: #ffffff;background-color: #ff2b00;border-color: #ff2b00;border-radius: 1px}
    </style>
    <body>
        <div class="container">
    <article class="card">
        <header class="card-header"> Lịch sử đặt hàng / Theo dõi </header>
        <div class="card-body">
            <h6>Order ID: OD45345345435</h6>
            <article class="card">
                
                <table>
                    <div class="card-body row">
                    <tr>
                        <th><div class="col"> <strong>Order ID:</div></strong></th>
                        <th><div class="col"> <strong>Người nhận:</div></strong></th>
                        <th><div class="col"> <strong>Hình thức vận chuyển:</div></strong></th>
                        <th><div class="col"> <strong>Tổng tiền:</div></strong></th>
                    </tr>
                    <tr>
                        <td>
                        <c:forEach items="${listS}" var="x">
                        <div class="col">${x.idtt}</div>
                        </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${listS}" var="x">
                        <div class="col">${x.tenkh} | <i class="fa fa-phone"></i> ${x.sdt}</div>
                            </c:forEach>
                        </td>
                        
                        <td>             
                            <c:forEach items="${listS}" var="x">
                            <div class="col">${x.phuongthuc}</div>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${listS}" var="x">
                            <div class="col">${x.tongtien}</div>  
                            </c:forEach>
                        </td>
                        
                    </tr>
                    </div>
                </table>
                    
<!--                <div class="card-body row">
                    <c:forEach items="${list}" var="x">
                    <div class="col"> <strong>Ngày đặt hàng:</strong> <br>${x.ngaytao} </div>
                    </c:forEach>
                    <div class="col"> <strong>Người nhận:</strong> <br> BLUEDART, | <i class="fa fa-phone"></i> +1598675986 </div>
                    <c:forEach items="${list}" var="x">
                    <div class="col"> <strong>Hình thức vận chuyển:</strong> <br> ${x.trangthai} </div>
                    <div class="col"> <strong>Tổng tiền:</strong> <br> ${x.tongtien} </div>
                    </c:forEach>
                </div>-->
            </article>
            <div class="track">
                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Thêm giỏ hàng</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> Mua hàng</span> </div>
                <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> Đang vận chuyển </span> </div>
                <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Đã nhận được hàng</span> </div>
            </div>
            <hr>
            <ul class="row">
                <c:forEach items="${list}" var="x">
                <li class="col-md-4">
                    <figure class="itemside mb-3">
                        <div class="aside"><img src="${pageContext.request.contextPath}/img/${x.img}" class="img-sm border"></div>
                        <figcaption class="info align-self-center">
                            <p class="title">${x.tensp} <br> Chưa Thanh Toán</p> <span class="text-muted">${x.tongtien} VNĐ</span>
                        </figcaption>
                    </figure>
                </li>
                </c:forEach>
            </ul>
            <hr>
            <a href="Ctm_Servlet" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Quay lại</a>
        </div>
    </article>
</div>
    </body>
</html>
