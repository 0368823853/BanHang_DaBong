/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Ctm_cartDAO;
import Model.Adm_khachhang;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addToCart"})
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 try {
        // Lấy tham số từ yêu cầu
        String idspParam = request.getParameter("idsp");
        String soluongParam = request.getParameter("soluong");

        // Kiểm tra tham số null
        if (idspParam == null || soluongParam == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Thiếu tham số: idsp hoặc soluong.\"}");
            return;
        }

        // Chuyển đổi sang kiểu số
        int idsp = Integer.parseInt(idspParam);
        int soluong = Integer.parseInt(soluongParam);

        // Lấy các thông tin còn lại
        String tenp = request.getParameter("tenp");
        String img = request.getParameter("img");
        float dongia = Float.parseFloat(request.getParameter("dongia"));
        // Kiểm tra phiên đăng nhập
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Bạn cần đăng nhập để thêm vào giỏ hàng.\"}");
            return;
        }

        // Lấy thông tin người dùng đăng nhập
        Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
        int idkh = currentUser.getIdkh();

        // Gọi DAO để thêm sản phẩm vào giỏ hàng
        Ctm_cartDAO cartDAO = new Ctm_cartDAO();
        cartDAO.addToCart(idkh, idsp, tenp, img, soluong, dongia);

        // Trả về tổng số lượng sản phẩm trong giỏ hàng
        int totalQuantity = cartDAO.getTotalQuantityByCustomerId(idkh);
        response.getWriter().write("{\"status\":\"success\", \"message\":\"Thêm vào giỏ hàng thành công!\", \"totalQuantity\":" + totalQuantity + "}");
    } catch (NumberFormatException e) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"status\":\"error\", \"message\":\"Lỗi chuyển đổi dữ liệu số: " + e.getMessage() + "\"}");
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("{\"status\":\"error\", \"message\":\"Lỗi máy chủ: " + e.getMessage() + "\"}");
        e.printStackTrace();
    }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
