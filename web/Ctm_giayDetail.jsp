<%-- 
    Document   : Ctm_giayDetail
    Created on : Nov 28, 2024, 1:18:47 PM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </head>
    <style>
        body{
    background:#E0E0E0;
}
.details {
            border: 1.5px solid grey;
            color: #212121;
            width: 100%;
            height: auto;
            box-shadow: 0px 0px 10px #212121;
        }

        .cart {
            background-color: #212121;
            color: white;
            margin-top: 10px;
            font-size: 12px;
            font-weight: 900;
            width: 100%;
            height: 39px;
            padding-top: 9px;
            box-shadow: 0px 5px 10px  #212121;
        }

        .card {
            width: fit-content;
        }

        .card-body {
            width: fit-content;
        }

        .btn {
            border-radius: 0;
        }

        .img-thumbnail {
            border: none;
        }

        .card {
            box-shadow: 0 20px 40px rgba(0, 0, 0, .2);
            border-radius: 5px;
            padding-bottom: 10px;
        }
    </style>
<body>
    <div class='container'>
        <div class="row">
            <c:forEach items="${list}" var="x">
                <div class="col-md-3 col-sm-6 col-12 d-flex justify-content-center">
                    <div class="card mt-3">
                        <img class='mx-auto img-thumbnail'
                            src="${pageContext.request.contextPath}/img/giay/${x.img}"
                            width="auto" height="auto" style="border-radius: 50%"/>
                        <div class="card-body text-center mx-auto">
                            <div class='cvp'>
                                <h5 class="card-title font-weight-bold">${x.ten}</h5>
                                <p class="card-text">${x.dongia} $</p>
                                <a href="Ctm_giay?idgiay=${x.idgiay}" class="btn details px-auto">Xem chi tiết</a><br />
                                <a href="#" class="btn cart px-auto">Liên Hệ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>
