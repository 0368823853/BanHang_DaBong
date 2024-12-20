<%-- 
    Document   : Ctm_signup
    Created on : Oct 23, 2024, 2:00:51 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="icon" type="image/png" href="./img/logo_btl.png">

    <title>Đăng ký</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>
<style>
body {
    background: url(./img/backgound/background_5.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center left;
}

.container {
    padding: 20px;
}

.container .panel {
    background: gainsboro;
    border: 1px solid black;
    padding: 20px;
    box-shadow: 3px 3px 9px rgba(0, 0, 0, 1);
    border-radius: 10px;
    width: 400px;
    margin: 0px auto;
}

.panel-body {
    line-height: 10px;
}

.panel-body input:hover {
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
}
</style>

<body>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Đăng ký tài khoản</h2>

            </div>
            <div class="panel-body">
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                <div class="alert alert-danger">
                    <label><i class="bi bi-exclamation-triangle-fill"></i></label><%= errorMessage %>
                    </div>
                        <% } %> <br>

                <form action="addkh" method="post" onsubmit="return validateForm();">
                    <div class="form-group">
                        <label for="usr">Họ và tên</label>
                        <input required="true" type="text" class="form-control" id="usr" name="tenkh">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>                      
                        <input required="true" type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="birthday">Số điện thoại</label>
                        <input required="true" type="number" class="form-control" id="phone" name="sdt" minlength="10">
                    </div>
                    <div class="form-group">
                        <label for="birthday">Địa chỉ</label>
                        <input required="true" type="text" class="form-control" id="phone" name="diachi">
                    </div>
                    <div class="form-group">
                        <label for="birthday">Chọn ảnh đại diện</label>
                        <input required="true" type="file" class="form-control" id="phone" name="img">
                    </div>
                    <div class="form-group">
                        <label for="birthday">Giới tính</label>
                        <select class="form-control" id="validationDefault04" name="gioitinh" required>
                            <option selected disabled>...</option>
                            <option>Nam</option>
                            <option>Nữ</option>
                            <option>Khác</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Mật khẩu</label>
                        <div class="input-group">
                            <input required="true" type="password" class="form-control" id="pwd" name="matkhau" minlength="6">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="togglePwd">
                                    <i class="fas fa-eye" id="pwdIcon"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmation_pwd">Nhập lại mật khẩu</label>
                        <div class="input-group">
                            <input required="true" type="password" class="form-control" id="confirmation_pwd" minlength="6">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="toggleConfirmationPwd">
                                    <i class="fas fa-eye" id="confirmationPwdIcon"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <p>Bạn đã có tài khoản?<a href="">Đăng nhập ngay</a></p>
                    <button class="btn btn-success" type="submit" >Đăng ký</button>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function validateForm() {
        $pwd = $('#pwd').val();
        $confirmPwd = $('#confirmation_pwd').val();
        if ($pwd != $confirmPwd) {
            alert("Mật khẩu không khớp, vui lòng kiểm tra!");
            return false;
        }
        return true;
    }
    </script>
    <script>
    // Toggle visibility for the first password field
    document.getElementById('togglePwd').addEventListener('click', function () {
        const pwdField = document.getElementById('pwd');
        const pwdIcon = document.getElementById('pwdIcon');
        if (pwdField.type === 'password') {
            pwdField.type = 'text';
            pwdIcon.classList.remove('fa-eye');
            pwdIcon.classList.add('fa-eye-slash');
        } else {
            pwdField.type = 'password';
            pwdIcon.classList.remove('fa-eye-slash');
            pwdIcon.classList.add('fa-eye');
        }
    });

    // Toggle visibility for the confirmation password field
    document.getElementById('toggleConfirmationPwd').addEventListener('click', function () {
        const confirmationPwdField = document.getElementById('confirmation_pwd');
        const confirmationPwdIcon = document.getElementById('confirmationPwdIcon');
        if (confirmationPwdField.type === 'password') {
            confirmationPwdField.type = 'text';
            confirmationPwdIcon.classList.remove('fa-eye');
            confirmationPwdIcon.classList.add('fa-eye-slash');
        } else {
            confirmationPwdField.type = 'password';
            confirmationPwdIcon.classList.remove('fa-eye-slash');
            confirmationPwdIcon.classList.add('fa-eye');
        }
    });
</script>
</body>

</html>
