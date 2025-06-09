package model;

import java.sql.*;
import java.util.*;
import util.DBUtil;

public class ProductDAO {

    // 상품 등록
    public boolean insertProduct(Product product) {
        String sql = "INSERT INTO products (title, description, price, seller_id,image)" + "VALUES (?, ?, ?, ?,?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, product.getTitle());
            pstmt.setString(2, product.getDescription());
            pstmt.setInt(3, product.getPrice());
            pstmt.setString(4, product.getSellerId());
            pstmt.setString(5, product.getImage()); 
            
            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 상품 목록 조회 - 데이터베이스를 자바에서 쓸 수 있는 객체로 만들어줌
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        // product 테이블에 모든 열 조회, 내림차순(최신등록 상품부터)
        String sql = "SELECT * FROM products ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql); // sql을 받고
             ResultSet rs = pstmt.executeQuery()) { // 그 sql 쿼리를 rs에 저장

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("product_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getString("seller_id"),
                    rs.getString("image")
                );
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
 // 특정 상품 1개 조회
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Product(
                    rs.getInt("product_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getString("seller_id"),
                    rs.getString("image")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // 상품 수정
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET title = ?, description = ?, price = ?, image = ? WHERE product_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, product.getTitle());
            pstmt.setString(2, product.getDescription());
            pstmt.setInt(3, product.getPrice());
            pstmt.setString(4, product.getImage());     
            pstmt.setInt(5, product.getProductId());

            return pstmt.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 상품 삭제
    public boolean deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, productId);
            return pstmt.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}