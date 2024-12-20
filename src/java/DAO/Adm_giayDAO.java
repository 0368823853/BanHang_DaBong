/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Adm_giay;
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
public class Adm_giayDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
        public List<Adm_giay> getAllGiay(){
        List<Adm_giay> giay = new ArrayList<>();
        String query = "SELECT * FROM tblgiay";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                giay.add(new Adm_giay(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getFloat(5),
                rs.getString(6),
                rs.getString(7),
                rs.getString(8),
                rs.getString(9)));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            closeResources();
        }
        return giay;
    }
        
    public void insertGiay(String ten, String img, int soluong, float dongia, String mau, String size, String xuatsu, String mota){
        String query = "INSERT INTO tblgiay (ten, img, soluong, dongia, mau, size, xuatsu, mota) VALUES (?,?,?,?,?,?,?,?);";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);  
            ps.setString(1, ten);
            ps.setString(2, img);
            ps.setInt(3, soluong);
            ps.setFloat(4, dongia);
            ps.setString(5, mau);
            ps.setString(6, size);
            ps.setString(7, xuatsu);
            ps.setString(8, mota);
            ps.executeUpdate();
            
        } catch(Exception e){
            
        }
    }        
    
    public void deleteGiay(int idgiay){
        String query = "DELETE FROM tblgiay WHERE idgiay = ?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idgiay);
            ps.executeUpdate();
        } catch(Exception e){
            
        }
    }
    
    public Adm_giay getGiayByID(int idgiay){
        String query = "select * from tblgiay where idgiay=?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idgiay);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Adm_giay(rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getFloat(5),
                rs.getString(6),
                rs.getString(7),
                rs.getString(8),
                rs.getString(9));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    
    public void updateGiay(int idgiay, String ten, String img, int soluong, float dongia, String mau, String size, String xuatsu, String mota){
        String query = "UPDATE tblgiay SET ten = ?, img = ?, soluong = ?, dongia = ?, mau = ?, size = ?, xuatsu = ?, mota = ? WHERE idgiay = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ten);
            ps.setString(2, img);
            ps.setInt(3, soluong);
            ps.setFloat(4, dongia);
            ps.setString(5, mau);
            ps.setString(6, size);
            ps.setString(7, xuatsu);
            ps.setString(8, mota);
            ps.setInt(9, idgiay);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<Adm_giay> timkiem(String ten){
        ArrayList<Adm_giay> list = new ArrayList<>();
        String sql = "SELECT * FROM tblgiay WHERE ten LIKE ?";
        try {
            DBConnection db = new DBConnection();
            PreparedStatement st = db.getConnection().prepareStatement(sql);
            st.setString(1,"%" + ten + "%" );
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                   Adm_giay cc = new Adm_giay();

                    cc.setIdgiay(rs.getInt("idgiay"));
                    cc.setTen(rs.getString("ten"));
                    cc.setImg(rs.getString("img"));
                    cc.setSoluong(rs.getInt("soluong"));
                    cc.setDongia(rs.getFloat("dongia"));
                    cc.setMau(rs.getString("mau"));
                    cc.setSize(rs.getString("size"));
                    cc.setXuatsu(rs.getString("xuatsu"));
                    cc.setMota(rs.getString("mota"));

                    list.add(cc);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return  list;
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
