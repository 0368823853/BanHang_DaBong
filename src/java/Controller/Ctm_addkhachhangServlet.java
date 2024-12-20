/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_sanphamDAO;
import DAO.khachhangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Ctm_addkhachhangServlet", urlPatterns = {"/addkh"})
public class Ctm_addkhachhangServlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_addkhachhangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_addkhachhangServlet at " + request.getContextPath() + "</h1>");
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
        String tenkh = request.getParameter("tenkh");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("diachi");
        String gioitinh = request.getParameter("gioitinh");
        String matkhau = request.getParameter("matkhau");
        String img = request.getParameter("img");

        khachhangDAO dao = new khachhangDAO();
        if (dao.isEmailOrPhoneExists(email, sdt)) {
            // Truyền thông báo lỗi đến trang JSP
            request.setAttribute("errorMessage", "Email hoặc số điện thoại đã tồn tại.");
            request.getRequestDispatcher("Ctm_signup.jsp").forward(request, response);
        } else {
            // Thêm khách hàng mới
            dao.insertKhachHang(tenkh, email, sdt, diachi, gioitinh, matkhau, img);
            response.sendRedirect("Ctm_login.jsp");
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
