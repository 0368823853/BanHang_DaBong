/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.Adm_nhanvienDAO;
import DAO.Ctm_thanhtoanDAO;
import DAO.DBConnection;
import Model.Adm_nhanvien;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BaoCaoThongKePDFServlet", urlPatterns = {"/BaoCaoThongKePDFServlet"})
public class BaoCaoThongKePDFServlet extends HttpServlet {

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
            out.println("<title>Servlet BaoCaoThongKePDFServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BaoCaoThongKePDFServlet at " + request.getContextPath() + "</h1>");
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
    private Ctm_thanhtoanDAO dao = new Ctm_thanhtoanDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=BaoCaoThongKe.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Tải font Unicode từ file .ttf (chọn đúng đường dẫn tới file font của bạn)
            BaseFont baseFont = BaseFont.createFont("C:\\Users\\ADMIN\\Downloads\\bodoni\\BodoniFLF-Roman.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(baseFont, 12);

            // Thêm tiêu đề
            Paragraph title = new Paragraph("BÁO CÁO THÔNG KÊ", font);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);

            // Thêm khoảng cách giữa các đoạn văn
            document.add(new Paragraph("\n", font));

            // Lấy dữ liệu thống kê
            float tongDoanhThu = dao.getTongDoanhThu();
            int soLuongHoaDon = dao.getSoLuongHoaDon();
            String phuongThucPhoBien = dao.getPhuongThucPhoBienNhat();
            int soluongsp = dao.getTotalProducts();

            // Thêm ngày giờ hiện tại
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String currentDateTime = sdf.format(new Date());
            Paragraph dateParagraph = new Paragraph("Ngày In: " + currentDateTime, font);
            dateParagraph.setAlignment(Paragraph.ALIGN_LEFT);
            document.add(dateParagraph);


            // Thêm khoảng cách giữa các đoạn văn
            document.add(new Paragraph("\n", font));

            // Thêm dữ liệu vào bảng
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);  // Thiết lập chiều rộng của bảng

            // Cài đặt header cho bảng
            table.addCell(new Paragraph("THÔNG TIN", font));
            table.addCell(new Paragraph("GIA TRI", font));

            // Thêm các giá trị vào bảng
            table.addCell(new Paragraph("Tong Doanh Thu", font));
            table.addCell(new Paragraph(String.valueOf(tongDoanhThu), font));

            table.addCell(new Paragraph("So luong hoa don", font));
            table.addCell(new Paragraph(String.valueOf(soLuongHoaDon), font));

            table.addCell(new Paragraph("Phuong Thuc Thanh Toan Pho Bien Nhat:", font));
            table.addCell(new Paragraph(phuongThucPhoBien, font));
            
            table.addCell(new Paragraph("Luong Hang Trong Kho:", font));
            table.addCell(new Paragraph(String.valueOf(soluongsp), font));

            // Thêm bảng vào tài liệu PDF
            document.add(table);

            // Đóng tài liệu
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
