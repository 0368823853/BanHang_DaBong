/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_sanphamDAO;
import Model.Adm_sanpham;
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
@WebServlet(name = "updatesanphamServlet", urlPatterns = {"/update"})
public class updatesanphamServlet extends HttpServlet {

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
            out.println("<title>Servlet updatesanphamServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatesanphamServlet at " + request.getContextPath() + "</h1>");
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
        int idsp = Integer.parseInt(request.getParameter("idsp"));
        Adm_sanphamDAO dao = new Adm_sanphamDAO();
        Adm_sanpham s = dao.getSanPhamByID(idsp);
        request.setAttribute("st", s);
        request.getRequestDispatcher("Adm_updatequanao.jsp").forward(request, response);
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
        int idsp = Integer.parseInt(request.getParameter("idsp"));
        String ten = request.getParameter("ten");
        String img = request.getParameter("img");
        int soluong = Integer.parseInt(request.getParameter("soluong"));
        float dongia = Float.parseFloat(request.getParameter("dongia"));
        String mau = request.getParameter("mau");
        String size = request.getParameter("size");
        String xuatsu = request.getParameter("xuatsu");
        String mota = request.getParameter("mota");
        Adm_sanphamDAO dao = new Adm_sanphamDAO();
        dao.updateSanPham(idsp, ten, img, soluong, dongia, mau, size, xuatsu, mota);
        response.sendRedirect("loads");
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
