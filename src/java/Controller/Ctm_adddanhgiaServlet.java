/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Ctm_danhgiaDAO;
import DAO.khachhangDAO;
import Model.Adm_khachhang;
import Model.Ctm_danhgia;
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
@WebServlet(name = "Ctm_adddanhgiaServlet", urlPatterns = {"/Ctm_adddanhgiaServlet"})
public class Ctm_adddanhgiaServlet extends HttpServlet {

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
            out.println("<title>Servlet Ctm_adddanhgiaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctm_adddanhgiaServlet at " + request.getContextPath() + "</h1>");
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
        
        int idkh = Integer.parseInt(request.getParameter("idkh"));
        khachhangDAO khachhangDAO = new khachhangDAO();
        Adm_khachhang khachhang = khachhangDAO.getKhachHangByID(idkh);
        request.setAttribute("st", khachhang);
        
        Ctm_danhgiaDAO dao = new Ctm_danhgiaDAO();
        List<Ctm_danhgia> sanpham = dao.getAllDanhGia();
        request.setAttribute("lis", sanpham);
        request.getRequestDispatcher("Ctm_danhgia.jsp").forward(request, response);
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
                // Lấy idkh từ session (giả sử khách hàng đã đăng nhập)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("Ctm_login.jsp");  // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy thông tin người dùng hiện tại
        Adm_khachhang currentUser = (Adm_khachhang) session.getAttribute("currentUser");
        int idkh = currentUser.getIdkh();
try {
            // Lấy dữ liệu từ form
            String danhgia = request.getParameter("danhgia");
            String mota = request.getParameter("mota");
            String img = request.getParameter("img");
            String tenkh = request.getParameter("tenkh");
            // Tạo DAO và lưu đánh giá
            Ctm_danhgiaDAO dao = new Ctm_danhgiaDAO();
            dao.insertDanhGia(idkh, danhgia, mota, img, tenkh);

            // Chuyển hướng về trang danh sách đánh giá hoặc thông báo thành công
            response.sendRedirect("Ctm_Servlet");
        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu người dùng nhập sai định dạng số
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ");
        } catch (Exception e) {
            // Xử lý lỗi khác
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi xảy ra: " + e.getMessage());
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
