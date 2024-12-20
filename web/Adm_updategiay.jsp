<%-- 
    Document   : Adm_updategiay
    Created on : Nov 27, 2024, 10:31:45 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_giay" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <style>
        
.get-in-touch {
  max-width: 800px;
  margin: 50px auto;
  position: relative;

}
.get-in-touch .title {
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 3.2em;
  line-height: 48px;
  padding-bottom: 48px;
     color: #5543ca;
    background: #5543ca;
    background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
    background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
    background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important;
    -webkit-background-clip: text !important;
    -webkit-text-fill-color: transparent !important;
}

.contact-form .form-field {
  position: relative;
  margin: 32px 0;
}
.contact-form .input-text {
  display: block;
  width: 100%;
  height: 36px;
  border-width: 0 0 2px 0;
  border-color: #5543ca;
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
}
.contact-form .input-text:focus {
  outline: none;
}
.contact-form .input-text:focus + .label,
.contact-form .input-text.not-empty + .label {
  -webkit-transform: translateY(-24px);
          transform: translateY(-24px);
}
.contact-form .label {
  position: absolute;
  left: 20px;
  bottom: 11px;
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
  color: #5543ca;
  cursor: text;
  transition: -webkit-transform .2s ease-in-out;
  transition: transform .2s ease-in-out;
  transition: transform .2s ease-in-out, 
  -webkit-transform .2s ease-in-out;
}
.contact-form .submit-btn {
  display: inline-block;
  background-color: #000;
   background-image: linear-gradient(125deg,#a72879,#064497);
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 16px;
  padding: 8px 16px;
  border: none;
  width:200px;
  cursor: pointer;
}


    </style>
    <body>
        <section class="get-in-touch">
   <h1 class="title">Sửa thông tin giày</h1>
   <form class="contact-form row" action="updategiayServlet" method="post">
      <div class="form-field col-lg-6">
          <input id="name" class="input-text js-input" name="idgiay" value="${st.idgiay}" readonly="" type="text" required>
         <label for="name">ID Giày</label>
      </div>
      <div class="form-field col-lg-6">
          <input id="name" class="input-text js-input" value="${st.ten}" name="ten" type="text" required>
         <label for="name">Tên giày</label>
      </div>
         <img src="${pageContext.request.contextPath}/img/giay/${st.img}" width="70px" height="70px"/>
      <div class="form-field col-lg-6">
          
         <input id="name" class="input-text js-input" type="file" name="img" required>
         
      </div>
      <div class="form-field col-lg-6 ">
          <input id="email" class="input-text js-input" name="soluong" value="${st.soluong}" type="number" required>
         <label  for="email">Số lượng</label>
      </div>
      <div class="form-field col-lg-6 ">
          <input id="company" class="input-text js-input" name="dongia" value="${st.dongia}" type="number" required>
         <label  for="company">Đơn giá</label>
      </div>
       <div class="form-field col-lg-6 ">
           <input id="phone" class="input-text js-input" name="mau" value="${st.mau}" type="text" required>
         <label  for="phone">Màu sắc</label>
      </div>
      <div class="form-field col-lg-6 ">
          <input id="phone" class="input-text js-input" value="${st.size}" name="size" type="text" required>
         <label  for="phone">Chất liệu</label>
      </div>
       <div class="form-field col-lg-6 ">
           <input id="phone" class="input-text js-input" value="${st.xuatsu}" name="xuatsu" type="text" required>
         <label  for="phone">Xuất sử</label>
      </div>
      <div class="form-field col-lg-12">
        <textarea id="message" class="input-text js-input" class="form-control" id="exampleFirstName"
        name="mota" rows="5">${st.mota}</textarea>
         <label  for="message">Mô tả giày</label>
      </div>
      <div class="form-field col-lg-12">
         <input class="submit-btn" type="submit" value="Submit">
      </div>
   </form>
</section>
    </body>
</html>
