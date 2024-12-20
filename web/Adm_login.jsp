<%-- 
    Document   : Adm_Login
    Created on : Oct 23, 2024, 2:01:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- ===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!-- ===== CSS ===== -->
    <link rel="stylesheet" href="css/Login.css">
         
    <title>Login & Registration Form</title> 
</head>
<body>
    
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Login Admin</span>

                <%-- Hiển thị thông báo lỗi nếu có --%>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                    <div style="color: red; text-align: center; margin-bottom: 15px;">
                        <%= errorMessage %>
                    </div>
                <% } %>

                <form action="Adm_LoginServlet" method="post">
                    <div class="input-field">
                        <input name="email" type="email" placeholder="Nhập email..." required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input name="matkhau" type="password" class="password" placeholder="Nhập mật khẩu..." required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>

                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="logCheck">
                            <label for="logCheck" class="text">Lưu tài khoản</label>
                        </div>
                        
                        <a href="#" class="text">Quên mật khẩu?</a>
                    </div>

                    <div class="input-field button">
                        <input type="submit" value="Login">
                    </div>
                    
                    <div class="login-signup">
                    <span class="text">Nhóm8_IT6</span>
                </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/Login.js"></script> 
</body>
</html>
