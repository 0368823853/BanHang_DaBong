/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class DBConnection {
        private static final String URL = "jdbc:mysql://localhost:3306/dbbanhang";
    private static final String USER = "root";
    private static final String PASSWORD = "123456@Ab";
    private static Connection connection;

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {

        try {
            Connection con = DBConnection.getConnection();
            System.out.println("Kết nối CSDL thành công!");
            DBConnection.closeConnection();
            System.out.println("Đóng kết nối.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
