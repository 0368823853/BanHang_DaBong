/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_LoginDAO;
import Model.Adm_Login;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Adm_LoginServlet extends HttpServlet {

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
try {
        String email = request.getParameter("email");
        String matkhau = request.getParameter("matkhau");

        if (email == null || email.isEmpty() || matkhau == null || matkhau.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập Email và Mật khẩu.");
            request.getRequestDispatcher("Adm_login.jsp").forward(request, response);
            return;
        }

        Adm_LoginDAO loginDAO = new Adm_LoginDAO();
        Adm_Login nhanvien = loginDAO.checkLogin(email, matkhau);

        if (nhanvien == null) {
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không hợp lệ.");
            request.getRequestDispatcher("Adm_login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInEmployee", nhanvien); // Lưu thông tin nhân viên vào session
            response.sendRedirect("Adm_Servlet"); // Chuyển đến trang dashboard
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Đã xảy ra lỗi. Vui lòng thử lại.");
        request.getRequestDispatcher("Adm_login.jsp").forward(request, response);
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
