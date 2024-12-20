<%-- 
    Document   : Ctm_danhgia
    Created on : Nov 27, 2024, 6:29:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Adm_khachhang" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');

html,
body {
    height: 100%
}

body {
    display: grid;
   place-items: center;
    font-family: 'Manrope', sans-serif;
    
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    padding: 20px;
    width: 450px;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border-radius: 6px;
    -moz-box-shadow: 0px 0px 5px 0px rgba(212, 182, 212, 1)
}

.comment-box{
    
    padding:5px;
}



.comment-area textarea{
   resize: none; 
        border: 1px solid #ad9f9f;
}


.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #ffffff;
    outline: 0;
    box-shadow: 0 0 0 1px rgb(255, 0, 0) !important;
}

.send {
    color: #fff;
    background-color: #ff0000;
    border-color: #ff0000;
}

.send:hover {
    color: #fff;
    background-color: #f50202;
    border-color: #f50202;
}


.rating {
 display: flex;
        margin-top: -10px;
    flex-direction: row-reverse;
    margin-left: -4px;
        float: left;
}

.rating>input {
    display: none
}

.rating>label {
        position: relative;
    width: 19px;
    font-size: 25px;
    color: #ff0000;
    cursor: pointer;
}

.rating>label::before {
    content: "\2605";
    position: absolute;
    opacity: 0
}

.rating>label:hover:before,
.rating>label:hover~label:before {
    opacity: 1 !important
}

.rating>input:checked~label:before {
    opacity: 1
}

.rating:hover>input:checked~label:before {
    opacity: 0.4
}
    </style>
    <body>
        <div class="card">
            <form action="Ctm_adddanhgiaServlet" method="post">
              <div class="row"> 
                  
                  <div class="col-2">  
                      <img src="${pageContext.request.contextPath}/img/${st.img}" width="70px" height="70px" class="rounded-circle mt-2">
                      <input type="hidden" id="productImg" value="${st.img}" name="img">
                      <input type="hidden" value="${st.tenkh}" name="tenkh">
                  </div>
                  
                  <div class="col-10">
                      
                      <div class="comment-box ml-2">
                          <h3>Đánh Giá Cửa Hàng</h3>
                          <h6>${st.tenkh}</h6>
                          
                          <div class="rating"> 
                              <input type="radio" name="danhgia" value="Xuất sắc" id="5"><label for="5">☆</label>
                              <input type="radio" name="danhgia" value="Tốt" id="4"><label for="4">☆</label> 
                              <input type="radio" name="danhgia" value="Bình thường" id="3"><label for="3">☆</label>
                              <input type="radio" name="danhgia" value="Kém" id="2"><label for="2">☆</label>
                              <input type="radio" name="danhgia" value="Rất kém" id="1"><label for="1">☆</label>
                          </div>                      
                          <div class="comment-area">             
                              <textarea class="form-control" placeholder="what is your view?" rows="4" name="mota"></textarea>                         
                          </div>                          
                          <div class="comment-btns mt-2">                             
                              <div class="row">                                 
                                  <div class="col-6">                                      
                                      <div class="pull-left">                                      
                                      <button class="btn btn-success btn-sm">Quay lại</button>                                               
                                      </div>                                  
                                  </div>                                  
                                  <div class="col-6">                         
                                      <div class="pull-right">
                                          <button type="submit" class="btn btn-success send btn-sm">Gửi <i class="fa fa-long-arrow-right ml-1"></i></button>            
                                      </div>     
                                  </div>
                              
                              </div>
                          
                          </div>
                          
                      </div>         
                  </div> 
                          
              </div>
                          </form>
          </div>
    </body>
</html>
