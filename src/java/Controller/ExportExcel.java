/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Ctm_thanhtoan;
import DAO.Ctm_thanhtoanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ExportExcel", urlPatterns = {"/ExportExcel"})
public class ExportExcel extends HttpServlet {

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
            out.println("<title>Servlet ExportExcel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcel at " + request.getContextPath() + "</h1>");
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
        Ctm_thanhtoanDAO dao = new Ctm_thanhtoanDAO();
    List<Ctm_thanhtoan> listThanhToan = dao.getAllThanhToan();
    float tongDoanhThu = dao.getTongTien();

        // Tạo workbook và sheet
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Thanh Toan");

        // Tạo tiêu đề cho bảng
        Row titleRow = sheet.createRow(0);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("Thống kê đơn hàng");

        // Style cho tiêu đề
        CellStyle titleStyle = workbook.createCellStyle();
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short) 14); // Cỡ chữ lớn hơn
        titleStyle.setFont(titleFont);
        titleStyle.setAlignment(HorizontalAlignment.CENTER); // Căn giữa
        titleCell.setCellStyle(titleStyle);

        // Hợp nhất các ô cho tiêu đề
        sheet.addMergedRegion(new org.apache.poi.ss.util.CellRangeAddress(0, 0, 0, 6));

        // Tạo header
        Row headerRow = sheet.createRow(1);
        String[] headers = {"ID Thanh Toán", "ID Khách Hàng", "Tên Khách Hàng", "Số Điện Thoại", "Địa Chỉ", "Phương Thức", "Tổng Tiền"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);

            // Style cho header
            CellStyle style = workbook.createCellStyle();
            Font font = workbook.createFont();
            font.setBold(true);
            style.setFont(font);
            cell.setCellStyle(style);
        }

        // Điền dữ liệu vào các dòng tiếp theo
        int rowNum = 2; // Bắt đầu từ dòng thứ 2 (sau tiêu đề và header)
        for (Ctm_thanhtoan tt : listThanhToan) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(tt.getIdtt());
            row.createCell(1).setCellValue(tt.getIdkh());
            row.createCell(2).setCellValue(tt.getTenkh());
            row.createCell(3).setCellValue(tt.getSdt());
            row.createCell(4).setCellValue(tt.getDiachi());
            row.createCell(5).setCellValue(tt.getPhuongthuc());
            row.createCell(6).setCellValue(tt.getTongtien());
        }

        // Ghi tổng doanh thu vào dòng cuối cùng
        Row totalRow = sheet.createRow(rowNum);
        Cell totalLabelCell = totalRow.createCell(5);
        totalLabelCell.setCellValue("Tổng Doanh Thu:");

        Cell totalValueCell = totalRow.createCell(6);
        totalValueCell.setCellValue(tongDoanhThu);

        // Style cho tổng doanh thu
        CellStyle totalStyle = workbook.createCellStyle();
        Font totalFont = workbook.createFont();
        totalFont.setBold(true);
        totalStyle.setFont(totalFont);
        totalLabelCell.setCellStyle(totalStyle);
        totalValueCell.setCellStyle(totalStyle);


    // Định dạng response cho file Excel
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=ThanhToan.xlsx");

    // Ghi file Excel vào output stream
    OutputStream out = response.getOutputStream();
    workbook.write(out);
    workbook.close();
    out.close();
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
