/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Adm_khachhang;
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
public class khachhangDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public khachhangDAO(){}
    public Adm_khachhang checkLogin(String email, String matkhau){
            Adm_khachhang kh = null;
    try {
        String query = "SELECT * FROM tblkhachhang WHERE email = ? AND matkhau = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, matkhau);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            kh = new Adm_khachhang();
            kh.setIdkh(rs.getInt("idkh"));
            kh.setEmail(rs.getString("email"));
            kh.setMatkhau(rs.getString("matkhau"));
            kh.setTenkh(rs.getString("tenkh"));
            // Thêm các trường khác nếu cần
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return kh;
//        try{
//            String query = "SELECT * FROM tblkhachhang WHERE email = ? AND matkhau = ?";
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, email);
//            ps.setString(2, matkhau);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Adm_khachhang account = new Adm_khachhang(rs.getString(1),rs.getString(2));
//                return account;
//            }
//        }catch (Exception e) {
//            
//        }
//        return null;
    }
    
    public List<Adm_khachhang> getAllKhachHang(){
        List<Adm_khachhang> khachhang = new ArrayList<>();
        String query = "SELECT * FROM tblkhachhang";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                khachhang.add(new Adm_khachhang(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),
                rs.getString(8)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return khachhang;
    }

    public boolean isEmailOrPhoneExists(String email, String sdt) {
    String query = "SELECT COUNT(*) FROM tblkhachhang WHERE email = ? OR sdt = ?";
    try {
        conn = new DBConnection().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, sdt);
        rs = ps.executeQuery();
        if (rs.next() && rs.getInt(1) > 0) {
            return true; // Email hoặc số điện thoại đã tồn tại
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return false; // Không tồn tại
}

    
    public void insertKhachHang(String tenkh, String email, String sdt, String diachi, String gioitinh, String matkhau, String img) {
        String query = "INSERT INTO tblkhachhang (tenkh, email, sdt, diachi, gioitinh, matkhau, img) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, tenkh);
            ps.setString(2, email);
            ps.setString(3, sdt);
            ps.setString(4, diachi);
            ps.setString(5, gioitinh);
            ps.setString(6, matkhau);
            ps.setString(7, img);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    
    public Adm_khachhang getKhachHangByID(int idkh){
        String query = "select * from tblkhachhang where idkh=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Adm_khachhang(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7),        
                rs.getString(8));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    public void updateKhachHang(int idkh, String img){
        String query = "UPDATE tblkhachhang SET img = ? WHERE idkh = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
//            ps.setString(1, tenkh);
//            ps.setString(2, email);
//            ps.setString(3, sdt);
//            ps.setString(4, diachi);
//            ps.setString(5, gioitinh);
//            ps.setString(6, matkhau);
            ps.setString(1, img);
            ps.setInt(2, idkh); 
            ps.executeUpdate();
        } catch (Exception e) {
        }
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
