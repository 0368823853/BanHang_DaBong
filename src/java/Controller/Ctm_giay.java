/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_giayDAO;
import DAO.Adm_sanphamDAO;
import Model.Adm_giay;
import Model.Adm_sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Ctm_giay", urlPatterns = {"/Ctm_giay"})
public class Ctm_giay extends HttpServlet {

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
            out.println("<title>Servlet Ctm_giay</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_giay at " + request.getContextPath() + "</h1>");
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
        int idgiay = Integer.parseInt(request.getParameter("idgiay"));
        Adm_giayDAO deo = new Adm_giayDAO();
        Adm_giay c = deo.getGiayByID(idgiay);
        request.setAttribute("st", c);
        List<Adm_giay> giay = deo.getAllGiay();
        request.setAttribute("list", giay);
        
        
//        int idsp = Integer.parseInt(request.getParameter("idsp"));
//        Adm_sanphamDAO dao = new Adm_sanphamDAO();
//        Adm_sanpham s = dao.getSanPhamByID(idsp);
//        request.setAttribute("st", s);
//        List<Adm_sanpham> sanpham = dao.getAllSanPham();
//        request.setAttribute("listS", sanpham);
        request.getRequestDispatcher("Ctm_giay.jsp").forward(request, response);
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
