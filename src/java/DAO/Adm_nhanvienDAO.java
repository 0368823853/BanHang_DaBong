/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Adm_nhanvien;
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
public class Adm_nhanvienDAO {
    
        private Connection conn;
        private PreparedStatement ps;
        private ResultSet rs;
        
        
        public List<Adm_nhanvien> getAllNhanVien(){
        List<Adm_nhanvien> nhanvien = new ArrayList<>();
        String query = "SELECT * FROM tblnhanvien";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                nhanvien.add(new Adm_nhanvien(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return nhanvien;
    }
    public Adm_nhanvien getNhanVienByID(int idnv){
        String query = "select * from tblnhanvien where idnv=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idnv);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Adm_nhanvien(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    public Adm_nhanvien getNhanVienByEmail(String email) {
    String query = "SELECT * FROM tblnhanvien WHERE email=?";
    try {
        conn = new DBConnection().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, email);  // Sử dụng email để truy vấn
        rs = ps.executeQuery();
        while (rs.next()) {
            return new Adm_nhanvien(
                rs.getInt(1),    // idnv
                rs.getString(2), // tennv
                rs.getString(3), // email
                rs.getString(4)  // matkhau
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return null;
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
