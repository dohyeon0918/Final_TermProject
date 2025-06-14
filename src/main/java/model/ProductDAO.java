package model;

import java.sql.*;
import java.util.*;
import util.DBUtil;
import java.util.ArrayList;
import java.util.List; 

public class ProductDAO {

    // 상품 등록
    public boolean insertProduct(Product product) {
        String sql = "INSERT INTO products (title, category, description, price, seller_id, image, location)" + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, product.getTitle());
            pstmt.setString(2, product.getCategory());
            pstmt.setString(3, product.getDescription());
            pstmt.setInt(4, product.getPrice());
            pstmt.setString(5, product.getSellerId());
            pstmt.setString(6, product.getImage()); 
            pstmt.setString(7, product.getLocation());
            
            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 상품 목록 조회 - 데이터베이스를 자바에서 쓸 수 있는 객체로 만들어줌
 // 1) 카테고리별 전체 조회 메서드
    public List<Product> getAllProducts(String category) {
        List<Product> list = new ArrayList<>();
        // category가 "전체"면 WHERE절 생략, 아니면 필터링
        String sql = "SELECT * FROM products"
                   + (category != null && !"전체".equals(category)
                      ? " WHERE category = ?"
                      : "")
                   + " ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            if (category != null && !"전체".equals(category)) {
                pstmt.setString(1, category);
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("title"),
                        rs.getString("category"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("seller_id"),
                        rs.getString("image"),
                        rs.getString("location")
                    );
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2) 기존 파라미터 없는 호출은 "전체"를 넘겨주도록 리팩토링
    public List<Product> getAllProducts() {
        return getAllProducts("전체");
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
                    rs.getString("category"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getString("seller_id"),
                    rs.getString("image"),
                    rs.getString("location")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
//로그인했을때만 마이페이지
    public static List<Product> getMyProducts(String sellerId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products "
                   + "WHERE seller_id = ? "
                   + "ORDER BY created_at DESC";

        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, sellerId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("title"),
                        rs.getString("category"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("seller_id"),
                        rs.getString("image"),
                        rs.getString("location")
                    );
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    // 상품 수정
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET title = ?, category = ?, description = ?, price = ?, image = ?, WHERE product_id = ? , location =?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

        	pstmt.setString(1, product.getTitle());
        	pstmt.setString(2, product.getCategory());
            pstmt.setString(3, product.getDescription());
            pstmt.setInt(4, product.getPrice());
            pstmt.setString(5, product.getImage()); 
            pstmt.setInt(6, product.getProductId());
            pstmt.setString(7, product.getLocation()); 

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
    
    //상품 검색
    public static List<Product> searchByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products "
                   + "WHERE title LIKE ? "
                   + "ORDER BY created_at DESC";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("title"),
                        rs.getString("category"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("seller_id"),
                        rs.getString("image"),
                        rs.getString("location")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    

}