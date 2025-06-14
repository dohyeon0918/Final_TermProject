package model;

import java.sql.*;
import java.util.*;
import util.DBUtil;

public class CommentDAO {
    public List<Comment> getCommentsByProductId(int productId) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE product_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setCommentId(rs.getInt("comment_id"));
                c.setProductId(rs.getInt("product_id"));
                c.setWriterId(rs.getString("writer_id"));
                c.setContent(rs.getString("content"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addComment(Comment comment) {
        String sql = "INSERT INTO comments (product_id, writer_id, content) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, comment.getProductId());
            pstmt.setString(2, comment.getWriterId());
            pstmt.setString(3, comment.getContent());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteComment(int commentId, String writerId) {
        String sql = "DELETE FROM comments WHERE comment_id = ? AND writer_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, commentId);
            pstmt.setString(2, writerId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
