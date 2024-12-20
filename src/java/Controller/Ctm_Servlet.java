/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_giayDAO;
import DAO.Adm_sanphamDAO;
import DAO.Ctm_danhgiaDAO;
import DAO.khachhangDAO;
import Model.Adm_giay;
import Model.Adm_khachhang;
import Model.Adm_sanpham;
import Model.Ctm_danhgia;
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
@WebServlet(name = "Ctm_Servlet", urlPatterns = {"/Ctm_Servlet"})
public class Ctm_Servlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_Servlet at " + request.getContextPath() + "</h1>");
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
// Lấy thông tin khách hàng từ session
    Adm_khachhang currentUser = (Adm_khachhang) request.getSession().getAttribute("currentUser");

    if (currentUser == null) {
        // Nếu chưa đăng nhập, chuyển hướng về trang login
        response.sendRedirect("Ctm_login.jsp");
        return;
    }

    // Lấy ID khách hàng từ session
    int idkh = currentUser.getIdkh();

    // Lấy danh sách sản phẩm
    Adm_sanphamDAO dao = new Adm_sanphamDAO();
    List<Adm_sanpham> sanpham = dao.getAllSanPham();
    request.setAttribute("listS", sanpham);
    
    Adm_giayDAO deo = new Adm_giayDAO();
    List<Adm_giay> giay = deo.getAllGiay();
    request.setAttribute("list", giay);

    Ctm_danhgiaDAO dg = new Ctm_danhgiaDAO();
    List<Ctm_danhgia> danhgia = dg.getAllDanhGia();
    request.setAttribute("lis", danhgia);
    
    // Lấy thông tin chi tiết khách hàng
    khachhangDAO khachhangDAO = new khachhangDAO();
    Adm_khachhang khachhang = khachhangDAO.getKhachHangByID(idkh);
    request.setAttribute("st", khachhang);

    // Chuyển tiếp đến trang Dashboard
    request.getRequestDispatcher("Ctm_Dahsboard.jsp").forward(request, response);
    
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
