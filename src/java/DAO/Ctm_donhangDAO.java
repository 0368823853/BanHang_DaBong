/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Ctm_cart;
import Model.Ctm_donhang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Ctm_donhangDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Ctm_donhangDAO() {}
    
    public void insertDonHang(int idkh, float tongTien, String trangThai, String tensp, String img){
        String query = "INSERT INTO tbldonhang (idkh, tongtien, trangthai, tensp, img) VALUES (?,?,?,?,?);";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);  
            ps.setInt(1, idkh);
            ps.setFloat(2, tongTien);
            ps.setString(3, trangThai);
            ps.setString(4, tensp);
            ps.setString(5, img);
            ps.executeUpdate();
            
        } catch(Exception e){
            
        }
    }
    
//    public List<Ctm_donhang> getAllDonHangByID(int idkh){
//        List<Ctm_donhang> donhang = new ArrayList<>();
//        String query = "SELECT * FROM tbldonhang where idkh=?";
//        try{
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            ps.setInt(1, idkh);
//            while(rs.next()){
//                donhang.add(new Ctm_donhang(rs.getInt(1),
//                rs.getInt(2),
//                rs.getFloat(3),
//                rs.getString(4),
//                rs.getDate(5)));
//            }
//        }catch(SQLException e){
//            e.printStackTrace();
//        }finally{
//            closeResources();
//        }
//        return donhang;
//    }
    
        public List<Ctm_donhang> getAllDonHangByID(int idkh) {
        List<Ctm_donhang> cartItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM tbldonhang WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cartItems.add(new Ctm_donhang(
                        rs.getInt("iddh"),
                        rs.getInt("idkh"),
                        rs.getFloat("tongtien"),
                        rs.getString("trangthai"),
                        rs.getDate("ngaytao"),
                        rs.getString("tensp"),
                        rs.getString("img")
                ));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }
    
    public Ctm_donhang getDonHangByID(int iddh){
        String query = "select * from tbldonhang where iddh=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, iddh);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Ctm_donhang(rs.getInt(1),
                rs.getInt(2),
                rs.getFloat(3),
                rs.getString(4),
                rs.getDate(5),
                rs.getString(6),
                rs.getString(7));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    
        public Ctm_donhang getDonHangByIDKH(int idkh){
        String query = "select * from tbldonhang where idkh=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Ctm_donhang(rs.getInt(1),
                rs.getInt(2),
                rs.getFloat(3),
                rs.getString(4),
                rs.getDate(5),
                rs.getString(6),
                rs.getString(7));
            }
        }catch(Exception e){
            
        }
        return null;
    }
        
    public float getTongTien(int idkh) {
    float tongTien = 0;
    try (Connection conn = DBConnection.getConnection()) {
        String query = "SELECT SUM(tongtien) AS total FROM tblcart WHERE idkh = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, idkh);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            tongTien = rs.getFloat("total"); // Lấy tổng tiền từ kết quả truy vấn
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return tongTien;
}

    
    public List<Ctm_donhang> getAllDonHang(){
        List<Ctm_donhang> donhang = new ArrayList<>();
        String query = "SELECT * FROM tbldonhang";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                donhang.add(new Ctm_donhang(rs.getInt(1),
                        rs.getInt(2),
                        rs.getFloat(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return donhang;
    }
    
    public List<Ctm_cart> getCartByCustomerId(int idkh) {
        List<Ctm_cart> cartItems = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM tblcart WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cartItems.add(new Ctm_cart(
                        rs.getInt("idcart"),
                        rs.getInt("idkh"),
                        rs.getInt("idsp"),
                        rs.getString("tenp"),
                        rs.getString("img"),
                        rs.getInt("soluong"),
                        rs.getFloat("dongia"),
                        rs.getFloat("tongtien")
                ));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }
    
    public void clearCart(int idkh) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM tblcart WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
    }
        
    }
    
     public float getTongTienByKhachHangId(int idkh) {
        float tongtien = 0;
        String query = "SELECT SUM(tongtien) AS totalAmount FROM tbldonhang WHERE idkh = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                tongtien = rs.getFloat("totalAmount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tongtien;
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
