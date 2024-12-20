/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Adm_Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class Adm_LoginDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Adm_Login checkLogin(String email, String matkhau){
        try{
            String query = "SELECT * FROM tblnhanvien WHERE email = ? AND matkhau = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, matkhau);
            rs = ps.executeQuery();
            while (rs.next()) {
                Adm_Login account = new Adm_Login(rs.getString(1),rs.getString(2));
                return account;
            }
        }catch (Exception e) {
            
        }
        return null;
    }
}
