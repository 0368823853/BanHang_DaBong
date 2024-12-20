<%-- 
    Document   : Ctm_donhang
    Created on : Nov 24, 2024, 3:25:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Ctm_donhang" %>
<%@ page import="Model.Ctm_cart" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="./js/main.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <style>
.form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-width: 350px;
  background-color: #fff;
  padding: 20px;
  border-radius: 20px;
  position: relative;
  margin-left: 300px;
}

.title {
  font-size: 28px;
  color: royalblue;
  font-weight: 600;
  letter-spacing: -1px;
  position: relative;
  display: flex;
  align-items: center;
  padding-left: 30px;
}

.title::before,.title::after {
  position: absolute;
  content: "";
  height: 16px;
  width: 16px;
  border-radius: 50%;
  left: 0px;
  background-color: royalblue;
}

.title::before {
  width: 18px;
  height: 18px;
  background-color: royalblue;
}

.title::after {
  width: 18px;
  height: 18px;
  animation: pulse 1s linear infinite;
}

.message, .signin {
  color: rgba(88, 87, 87, 0.822);
  font-size: 14px;
}

.signin {
  text-align: center;
}

.signin a {
  color: royalblue;
}

.signin a:hover {
  text-decoration: underline royalblue;
}

.flex {
  display: flex;
  width: 100%;
  gap: 6px;
}

.form label {
  position: relative;
}

.form label .input {
  width: 100%;
  padding: 10px 10px 20px 10px;
  outline: 0;
  border: 1px solid rgba(105, 105, 105, 0.397);
  border-radius: 10px;
}

.form label .input + span {
  position: absolute;
  left: 10px;
  top: 15px;
  color: grey;
  font-size: 0.9em;
  cursor: text;
  transition: 0.3s ease;
}

.form label .input:placeholder-shown + span {
  top: 15px;
  font-size: 0.9em;
}

.form label .input:focus + span,.form label .input:valid + span {
  top: 30px;
  font-size: 0.7em;
  font-weight: 600;
}

.form label .input:valid + span {
  color: green;
}

.submit {
  border: none;
  outline: none;
  background-color: royalblue;
  padding: 10px;
  border-radius: 10px;
  color: #fff;
  font-size: 16px;
  transform: .3s ease;
}

.submit:hover {
  background-color: rgb(56, 90, 194);
}

@keyframes pulse {
  from {
    transform: scale(0.9);
    opacity: 1;
  }

  to {
    transform: scale(1.8);
    opacity: 0;
  }
}
    </style>
    <body>
        <h2 style="margin-left: 300px">Xác nhận thanh toán</h2>

            <table class="table table-success table-striped" style="width: 50%; margin-left: 300px">
        <tr>
            
            <td>Tổng tiền</td>
            <td>Trạng thái</td>
            <td>Ngày thanh toán</td>
        </tr>
        <c:forEach items="${listS}" var="x">
        <tr>
            <td><input value="${x.tongtien}" readonly="" style="width: 100px; border: none"></td>
            <td>${x.trangthai}</td>
            <td>${x.ngaytao}</td>
        </tr>
        
        </c:forEach>
    </table>
        <form class="form" action="Ctm_thanhtoanServlet" method="post" onsubmit="return handlePayment(event)">
    <p class="title">Thông tin người nhận </p>
    <p class="message">Mời bạn điền đầy đủ thông tin người nhận </p>
        <div class="flex">
        <c:if test="${tongtien > 0}">
        <label>   
            <input required="" placeholder="" type="text" class="input" name="tongtien" value="${tongtien}" readonly="">
        </label>
        </c:if>
        <label>
            <input required="" placeholder="" type="text" class="input" name="tenkh">
            <span>Tên người nhận</span>
        </label>
    </div>  
            
    <label>
        <input required="" placeholder="" type="number" class="input" name="sdt">
        <span>Số điện thoại</span>
    </label> 
        
    <label>
        <input required="" placeholder="" type="text" class="input" name="diachi">
        <span>Địa chỉ</span>
    </label>
    <label>
        <select class="input" name="phuongthuc" id="phuongthuc">
            <option value="">Chọn phương thức thanh toán</option>
            <option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
            <option value="MoMo">MoMo</option>
            <option value="Adm_khachhangServlet?idkh=${ct.idkh}">Quét QR</option>
            <option value="Visa">Visa</option>
        </select>
        <span>Phương thức thanh toán</span>
    </label>
    <button class="submit" type="submit" onclick="return confirm('Xác nhận thanh toán');">Thanh toán</button>
</form>
<script>
    function handlePayment(event) {
        const selectElement = document.getElementById('phuongthuc');
        const selectedValue = selectElement.value;

        if (selectedValue === "Adm_khachhangServlet?idkh=${ct.idkh}") {
            // Nếu chọn Quét QR, chuyển hướng đến visa.jsp
            window.location.href = "Adm_khachhangServlet?idkh=${ct.idkh}";
            return false; // Ngăn chặn form gửi đi
        }

        if (!selectedValue) {
            // Nếu không chọn phương thức, hiển thị cảnh báo
            alert("Vui lòng chọn phương thức thanh toán!");
            return false; // Ngăn chặn form gửi đi
        }

        // Tiếp tục xử lý với phương thức khác
        return true;
    }
</script>

    <div id="quick-view-modal">
        <!-- Nội dung xem nhanh sẽ được thêm vào đây -->
    </div>
    </body>
</html>
