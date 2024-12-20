/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Ctm_cartDAO;
import DAO.Ctm_donhangDAO;
import Model.Adm_khachhang;
import Model.Ctm_cart;
import Model.Ctm_donhang;
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
@WebServlet(name = "Ctm_donhangServlet", urlPatterns = {"/donhang"})
public class Ctm_donhangServlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_donhangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_donhangServlet at " + request.getContextPath() + "</h1>");
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
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("currentUser") == null) {
//            response.sendRedirect("Ctm_login.jsp");  // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
//            return;
//        }
//        Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
//        int idkh = currentUser.getIdkh();
//        Ctm_donhangDAO dao = new Ctm_donhangDAO();
//        List<Ctm_donhang> donhang = dao.getAllDonHangByID(idkh);
//        request.setAttribute("listS", donhang);
//        request.getRequestDispatcher("Ctm_donhang.jsp").forward(request, response);
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
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("currentUser") == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("Bạn cần đăng nhập để thanh toán.");
                return;
            }

            // Lấy thông tin khách hàng đăng nhập
            Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
            int idkh = currentUser.getIdkh();

            // Tính tổng tiền từ giỏ hàng bằng hàm getTongTien
            Ctm_donhangDAO cartDAO = new Ctm_donhangDAO();
            float totalAmount = cartDAO.getTongTien(idkh);
            String trangthai = request.getParameter("trangthai");
            String tensp = request.getParameter("tensp");
            String img = request.getParameter("img");
            // Thêm đơn hàng mới
            cartDAO.insertDonHang(idkh, totalAmount, trangthai, tensp, img);

            // Xóa toàn bộ sản phẩm trong giỏ hàng
            cartDAO.clearCart(idkh);
            response.sendRedirect("loaddonhang");
//
//            // Trả về thông báo thành công
//            response.getWriter().write("Thanh toán thành công! Tổng tiền: " + totalAmount);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi: " + e.getMessage());
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
