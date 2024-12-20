/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Ctm_cartDAO;
import Model.Adm_khachhang;
import Model.Ctm_cart;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Ctm_cartServlet", urlPatterns = {"/cart"})
public class Ctm_cartServlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_cartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_cartServlet at " + request.getContextPath() + "</h1>");
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
        // Kiểm tra nếu người dùng đã đăng nhập
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("Ctm_login.jsp");  // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy thông tin người dùng hiện tại
        Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
        int idkh = currentUser.getIdkh();  // ID khách hàng
        
//        int idsp = Integer.parseInt(request.getParameter("idsp"));
//        Adm_sanphamDAO dao = new Adm_sanphamDAO();
//        Adm_sanpham s = dao.getSanPhamByID(idsp);
//        request.setAttribute("st", s);

        // Gọi DAO để lấy giỏ hàng của khách hàng
        Ctm_cartDAO cartDAO = new Ctm_cartDAO();
        List<Ctm_cart> cartItems = cartDAO.getCartItemsByCustomerId(idkh);
        
        Ctm_cart s = cartDAO.getCartByID(idkh);
        request.setAttribute("st", s);

        float totalPrice = cartDAO.getTotalCartPrice(idkh); // Tùy chọn

        // Truyền dữ liệu giỏ hàng vào trang JSP
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalCartPrice", totalPrice); 
        request.getRequestDispatcher("Ctm_cart.jsp").forward(request, response);
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
        processRequest(request, response);
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
