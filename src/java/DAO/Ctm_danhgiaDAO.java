/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Ctm_danhgia;
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
public class Ctm_danhgiaDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
        public List<Ctm_danhgia> getAllDanhGia(){
        List<Ctm_danhgia> danhgia = new ArrayList<>();
        String query = "SELECT * FROM tbldanhgia";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                danhgia.add(new Ctm_danhgia(rs.getInt(1),
                rs.getInt(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return danhgia;
    }
        
        
        public void insertDanhGia(int idkh, String danhgia, String mota, String img, String tenkh){
        String query = "INSERT INTO tbldanhgia (idkh, danhgia, mota, img, tenkh) VALUES (?,?,?,?,?);";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);  
            ps.setInt(1, idkh);
            ps.setString(2, danhgia);
            ps.setString(3, mota);
            ps.setString(4, img);
            ps.setString(5, tenkh);
            ps.executeUpdate();
            
        } catch(Exception e){
            
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
