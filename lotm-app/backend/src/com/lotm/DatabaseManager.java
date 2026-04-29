package com.lotm;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatabaseManager {
    private String url = "jdbc:mysql://localhost:3306/lord_of_the_mysteries";
    private String user = "root";
    private String password = "adibankai@12";

    public DatabaseManager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public List<Map<String, Object>> executeQuery(String query) {
        List<Map<String, Object>> results = new ArrayList<>();
        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(metaData.getColumnName(i), rs.getObject(i));
                }
                results.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public boolean executeUpdate(String query, Object... params) {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        DatabaseManager dm = new DatabaseManager();
        try (Connection conn = dm.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("Connection to MySQL was SUCCESSFUL!");
            }
        } catch (SQLException e) {
            System.err.println("Connection to MySQL FAILED: " + e.getMessage());
        }
    }
}
