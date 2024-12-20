/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Ctm_thanhtoan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Ctm_thanhtoanDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Ctm_thanhtoanDAO() {}
    
    public List<Ctm_thanhtoan> getAllThanhToan(){
        List<Ctm_thanhtoan> thanhtoan = new ArrayList<>();
        String query = "SELECT * FROM tblthanhtoan";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                thanhtoan.add(new Ctm_thanhtoan(rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5),
                rs.getString(6),
                rs.getFloat(7)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return thanhtoan;
    }
    
    public List<Ctm_thanhtoan> getAllThanhToanByID(int idkh) {
        List<Ctm_thanhtoan> cartItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM tblthanhtoan WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cartItems.add(new Ctm_thanhtoan(
                        rs.getInt("idtt"),
                        rs.getInt("idkh"),
                        rs.getString("tenkh"),
                        rs.getInt("sdt"),
                        rs.getString("diachi"),
                        rs.getString("phuongthuc"),
                        rs.getFloat("tongtien")
                ));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }
    public Ctm_thanhtoan getThanhToanByID(int idkh) {
    String query = "SELECT * FROM tblthanhtoan WHERE idkh=?";
    try {
        conn = new DBConnection().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, idkh);
        rs = ps.executeQuery();
        while (rs.next()) {
            return new Ctm_thanhtoan(
                rs.getInt("idtt"),
                rs.getInt("idkh"),
                rs.getString("tenkh"),
                rs.getInt("sdt"),
                rs.getString("diachi"),
                rs.getString("phuongthuc"),
                rs.getFloat("tongTien")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
    
//        public Ctm_thanhtoan getThanhToanByID(int idkh){
//        String query = "select * from tblthanhtoan where idkh=?";
//        try{
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, idkh);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                return new Ctm_thanhtoan(rs.getInt(1),
//                rs.getInt(2),
//                rs.getString(3),
//                rs.getInt(4),
//                rs.getString(5),
//                rs.getString(6),
//                rs.getFloat(7));
//            }
//        }catch(Exception e){
//            
//        }
//        return null;
//    }
    
    public void insertThanhToan(int idkh, String tenkh, int sdt, String diachi, String phuongthuc, float tongtien){
        String query = "INSERT INTO tblthanhtoan (idkh, tenkh, sdt, diachi, phuongthuc, tongtien) VALUES (?,?,?,?,?,?);";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);  
            ps.setInt(1, idkh);
            ps.setString(2, tenkh);
            ps.setInt(3, sdt);
            ps.setString(4, diachi);
            ps.setString(5, phuongthuc);
            ps.setFloat(6, tongtien);
            ps.executeUpdate();
            
        } catch(Exception e){
            
        }
    }
    
    public void clearCart(int idkh) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM tbldonhang WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
    }
    }
    
    public float getTongTien() {
    float tongTien = 0;
    try (Connection conn = DBConnection.getConnection()) {
        String query = "SELECT SUM(tongtien) AS total FROM tblthanhtoan";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            tongTien = rs.getFloat("total"); // Lấy tổng tiền từ kết quả truy vấn
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return tongTien;
}
    public float getTongDoanhThu() {
    String query = "SELECT SUM(tongtien) FROM tblthanhtoan";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            return rs.getFloat(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
public int getSoLuongHoaDon() {
    String query = "SELECT COUNT(*) FROM tblthanhtoan";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            return rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
public String getPhuongThucPhoBienNhat() {
    String query = "SELECT phuongthuc, COUNT(*) AS soluong FROM tblthanhtoan GROUP BY phuongthuc ORDER BY soluong DESC LIMIT 1";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            return rs.getString("phuongthuc");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    public int getTotalProducts() {
        int totalProducts = 0;
        String query = 
            "SELECT (SELECT SUM(soluong) FROM tblquanao) + (SELECT SUM(soluong) FROM tblgiay) AS totalProducts";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalProducts = rs.getInt("totalProducts");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalProducts;
    }
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }  
}
