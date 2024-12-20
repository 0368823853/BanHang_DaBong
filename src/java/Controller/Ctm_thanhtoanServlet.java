/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Ctm_donhangDAO;
import DAO.Ctm_thanhtoanDAO;
import Model.Adm_khachhang;
import Model.Ctm_donhang;
import Model.Ctm_thanhtoan;
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
@WebServlet(name = "Ctm_thanhtoanServlet", urlPatterns = {"/Ctm_thanhtoanServlet"})
public class Ctm_thanhtoanServlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_thanhtoanServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_thanhtoanServlet at " + request.getContextPath() + "</h1>");
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
        int iddh = Integer.parseInt(request.getParameter("iddh"));
        
        Ctm_donhangDAO dao = new Ctm_donhangDAO();
        Ctm_donhang s = dao.getDonHangByID(iddh);
        request.setAttribute("st", s);
        
//        int idkh = Integer.parseInt(request.getParameter("idkh"));
//        Ctm_donhang c = dao.getDonHangByIDKH(idkh);
//        request.setAttribute("ct", c);
//        List<Ctm_donhang> sanpham = dao.getAllDonHang();
//        request.setAttribute("listS", sanpham);
        request.getRequestDispatcher("Ctm_donhang.jsp").forward(request, response);
        
//        int idkh = Integer.parseInt(request.getParameter("idkh"));
//        Ctm_thanhtoanDAO cc = new Ctm_thanhtoanDAO();
//        Ctm_thanhtoan t = cc.getThanhToanByID(idkh);
//        request.setAttribute("st", t);
//        request.getRequestDispatcher("visa.jsp").forward(request, response);
        
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
        
        HttpSession session = request.getSession();
        Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
        int idkh = currentUser.getIdkh();
        
        
        String tenkh = request.getParameter("tenkh");
        int sdt = Integer.parseInt(request.getParameter("sdt"));       
        String diachi = request.getParameter("diachi");
        String phuongthuc = request.getParameter("phuongthuc");
        float tongtien = Float.parseFloat(request.getParameter("tongtien"));

        try {
            // Gọi DAO để lưu thông tin đơn hàng
            Ctm_thanhtoanDAO dao = new Ctm_thanhtoanDAO();
            dao.insertThanhToan(idkh, tenkh, sdt, diachi, phuongthuc, tongtien);
            

            // Xóa sản phẩm trong giỏ hàng
            Ctm_thanhtoanDAO cartDAO = new Ctm_thanhtoanDAO();
            cartDAO.clearCart(idkh);
            float tongTien = cartDAO.getTongTien(); // Lấy tổng tiền

        // Gửi dữ liệu về JSP
            request.setAttribute("tongTien", tongTien);

            // Chuyển hướng về trang xác nhận
            response.sendRedirect("cart");
        } catch (Exception e) {
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
