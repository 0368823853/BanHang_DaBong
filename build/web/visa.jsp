<%-- 
    Document   : visa
    Created on : Nov 26, 2024, 11:03:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thanh Toán</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    />
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .payment-container {
        background: white;
        width: 500px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      }

      .payment-header {
        text-align: center;
        margin-bottom: 20px;
      }

      .payment-header h2 {
        margin: 0;
        color: #333;
      }

      .payment-info {
        margin-bottom: 20px;
      }

      .payment-info .row {
        margin-bottom: 10px;
      }

      .qr-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
      }

      .qr-code {
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 5px;
      }

      .btn-pay {
        width: 100%;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
      }

      .btn-pay:hover {
        background-color: #0056b3;
      }

      .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        display: none;
        justify-content: center;
        align-items: center;
      }

      .modal-content {
        background: white;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        width: 400px;
      }

      .modal-content img {
        width: 300px;
        height: 300px;
        margin-bottom: 10px;
      }

      .modal-close {
        position: absolute;
        top: 15px;
        right: 15px;
        font-size: 20px;
        cursor: pointer;
        color: red;
      }

      .modal-close:hover {
        color: black;
      }
    </style>
  </head>
  <body>
    <div class="payment-container">
      <div class="payment-header">
        <h2>Thanh Toán</h2>
        <p>Hoàn tất giao dịch của bạn</p>
      </div>
      <div class="payment-info">
        <div class="row">
          <div class="col-6">Khách hàng:</div>
          <div class="col-6">${st.tenkh}</div>
        </div>
        <div class="row">
          <div class="col-6">Số tiền:</div>
          <div class="col-6 text-danger">${st.tongtien}</div>
        </div>
        <div class="row">
          <div class="col-6">Nội dung:</div>
          <div class="col-6">${st.tenkh} thanh toán với ID hoá đơn_${st.idtt}</div>
        </div>
      </div>
      <div class="qr-container">
        <div id="qrCode" class="qr-code"></div>
      </div>
      <button class="btn-pay" id="btnShowQR">Xem Mã QR</button>
    </div>

    <!-- Modal -->
    <div class="modal-overlay" id="qrModal">
      <div class="modal-content">
        <span class="modal-close" id="closeModal">&times;</span>
        <h4>Quét Mã QR</h4>
        <img id="modalQRImage" src="" alt="QR Code" />
        <p>Nội dung: <span id="modalContent"></span></p>
        <p>Số tiền: <span id="modalAmount"></span></p>
      </div>
    </div>

    <script>
const paymentData = {
  customer: "${st.tenkh}",
  amount: ${st.tongtien}, // Tổng tiền từ backend
  content: "${st.tenkh} thanh toán với ID hoá đơn_${st.idtt}", // Nội dung
  qrURL: `https://img.vietqr.io/image/VCB-1019364188-compact2.png?amount=${st.tongtien}&addInfo=${encodedContent}`,
};

document.addEventListener("DOMContentLoaded", () => {
  // Generate QR code in the box
  const qrCode = new QRCode(document.getElementById("qrCode"), {
    text: paymentData.qrURL,
    width: 150,
    height: 150,
  });

  const btnShowQR = document.getElementById("btnShowQR");
  const qrModal = document.getElementById("qrModal");
  const modalContent = document.getElementById("modalContent");
  const modalAmount = document.getElementById("modalAmount");
  const modalQRImage = document.getElementById("modalQRImage");
  const closeModal = document.getElementById("closeModal");

  // Show modal on button click
  btnShowQR.addEventListener("click", () => {
    modalContent.innerText = paymentData.content;
    modalAmount.innerText = paymentData.amount.toLocaleString() + " VNĐ";
    modalQRImage.src = paymentData.qrURL;
    qrModal.style.display = "flex";
  });

  // Close modal
  closeModal.addEventListener("click", () => {
    qrModal.style.display = "none";
  });
});
    </script>
  </body>
</html>

