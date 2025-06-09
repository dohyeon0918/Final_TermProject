package controller;

import model.Member;
import model.MemberDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        // 1. 폼 데이터 가져오기
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // 2. DAO로 회원 정보 조회
        MemberDAO dao = new MemberDAO();
        Member member = dao.getMemberByIdAndPassword(id, password);

        // 3. 로그인 성공 여부 처리
        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", member); // 세션에 로그인 정보 저장

            response.sendRedirect("views/main/welcome.jsp");
        } else {
        	request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸거나, 없는 아이디 입니다");
        	RequestDispatcher rd = request.getRequestDispatcher("views/common/error.jsp");
        	rd.forward(request, response);
        }
    }
}