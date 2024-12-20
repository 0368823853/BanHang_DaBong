/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Ctm_cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ADMIN
 */
public class Ctm_cartDAO {
    private Connection connection;
    public void addToCart(int idkh, int idsp, String tenp, String img, int soluong, float dongia) {
        try {
            Connection conn = DBConnection.getConnection();

            // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
            String checkQuery = "SELECT soluong FROM tblcart WHERE idkh = ? AND idsp = ?";
            PreparedStatement psCheck = conn.prepareStatement(checkQuery);
            psCheck.setInt(1, idkh);
            psCheck.setInt(2, idsp);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // Nếu có, cập nhật số lượng
                int currentQuantity = rs.getInt("soluong");
                String updateQuery = "UPDATE tblcart SET soluong = ? WHERE idkh = ? AND idsp = ?";
                PreparedStatement psUpdate = conn.prepareStatement(updateQuery);
                psUpdate.setInt(1, currentQuantity + soluong);
                psUpdate.setInt(2, idkh);
                psUpdate.setInt(3, idsp);
                psUpdate.executeUpdate();
            } else {
                // Nếu không, thêm mới sản phẩm vào giỏ hàng
                String insertQuery = "INSERT INTO tblcart (idkh, idsp, tenp, img, soluong, dongia) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement psInsert = conn.prepareStatement(insertQuery);
                psInsert.setInt(1, idkh);
                psInsert.setInt(2, idsp);
                psInsert.setString(3, tenp);
                psInsert.setString(4, img);
                psInsert.setInt(5, soluong);
                psInsert.setFloat(6, dongia);
                
                psInsert.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
        public Ctm_cart getCartByID(int idkh){
        String query = "select * from tblcart where idkh=?";
        try{
            Connection conn = new DBConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Ctm_cart(rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getString(4),
                rs.getString(5),
                rs.getInt(6),
                rs.getFloat(7),
                rs.getFloat(8));
            }
        }catch(Exception e){
            
        }
        return null;
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
    public Ctm_cartDAO() {
        // Khởi tạo kết nối (bạn cần đảm bảo đã có lớp kết nối CSDL)
        connection = DBConnection.getConnection();
    }
       // Lấy danh sách sản phẩm trong giỏ hàng theo idkh
    public List<Ctm_cart> getCartItemsByCustomerId(int idkh) {
        List<Ctm_cart> cartItems = new ArrayList<>();
        String query = "SELECT idcart, idkh, idsp, tenp, img, soluong, dongia, soluong * dongia AS tongtien " +
                       "FROM tblcart WHERE idkh = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, idkh);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Ctm_cart item = new Ctm_cart();
                    item.setIdcart(rs.getInt("idcart"));
                    item.setIdkh(rs.getInt("idkh"));
                    item.setIdsp(rs.getInt("idsp"));
                    item.setTenp(rs.getString("tenp"));
                    item.setImg(rs.getString("img"));
                    item.setSoluong(rs.getInt("soluong"));
                    item.setDongia(rs.getFloat("dongia"));
                    item.setTotalPrice(rs.getFloat("tongtien")); // Tính tổng tiền = soluong * dongia
                    cartItems.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }
    public float getTotalCartPrice(int idkh) {
    float totalPrice = 0;
    String query = "SELECT SUM(tongtien) FROM tblcart WHERE idkh = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, idkh);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                totalPrice = rs.getFloat("totalPrice");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return totalPrice;
}


    public int getTotalQuantityByCustomerId(int idkh) {
        int totalQuantity = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT SUM(soluong) AS totalQuantity FROM tblcart WHERE idkh = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idkh);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalQuantity = rs.getInt("totalQuantity");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalQuantity;
    }
    
    public boolean updateQuantity(int idcart, int soluong) {
        String sql = "UPDATE tblcart SET soluong = ? WHERE idcart = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, soluong);
            stmt.setInt(2, idcart);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void deleteCart(int idcart){
        String query = "DELETE FROM tblcart WHERE idcart = ?";
        try{
            Connection conn = new DBConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idcart);
            ps.executeUpdate();
        } catch(Exception e){
            
        }
    }
}
