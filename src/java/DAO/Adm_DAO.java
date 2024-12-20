/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 *
 * @author ADMIN
 */
public class Adm_DAO {
    public double getTotalRevenue() {
        double totalRevenue = 0;
        String query = "SELECT SUM(tongtien) AS totalRevenue FROM tblthanhtoan";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalRevenue = rs.getDouble("totalRevenue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }
    
    public int getCustomerCount() {
        int customerCount = 0;
        String query = "SELECT COUNT(*) AS customerCount FROM tblkhachhang";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                customerCount = rs.getInt("customerCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerCount;
    }
    
    public int getOrderCount() {
        int orderCount = 0;
        String query = "SELECT COUNT(*) AS orderCount FROM tblthanhtoan";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                orderCount = rs.getInt("orderCount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderCount;
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
    
    public Map<String, Integer> getOrderCountByDay() {
    Map<String, Integer> orderData = new LinkedHashMap<>();
    String query = "SELECT DATE(ngaydat) AS orderDate, COUNT(*) AS orderCount " +
                   "FROM tbldonhang " +
                   "GROUP BY DATE(ngaydat) " +
                   "ORDER BY DATE(ngaydat) ASC";
    try (Connection connection = DBConnection.getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            String date = rs.getString("orderDate");
            int count = rs.getInt("orderCount");
            orderData.put(date, count);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return orderData;
}
}
