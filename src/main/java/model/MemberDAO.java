package model;

import java.sql.*;
import util.DBUtil;

public class MemberDAO {

    // 회원가입용 메서드 - 입력받은 회원 정보를 데이터베이스에 저장
    public boolean insertMember(Member member) {
        String sql = "INSERT INTO members (id, password, name, email) VALUES (?, ?, ?, ?)";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 // 회원탈퇴용 메서드
    public boolean deleteMember(String id) {
        String sql = "DELETE FROM members WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            return pstmt.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 로그인 검증용 메서드 - id,password 입력 시 해당 맴버 데이터베이스 보여줌
    public Member getMemberByIdAndPassword(String id, String password) {
        String sql = "SELECT * FROM members WHERE id = ? AND password = ?";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Member(
                    rs.getString("id"),
                    rs.getString("password"),
                    rs.getString("name"),
                    rs.getString("email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}