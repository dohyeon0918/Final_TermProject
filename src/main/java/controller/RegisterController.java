package controller;

import model.Member;
import model.MemberDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        // 1. 파라미터 추출
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // 2. Member 객체 생성
        Member member = new Member(id, password, name, email);

        // 3. DAO로 회원 정보 저장
        MemberDAO dao = new MemberDAO();
        boolean result = dao.insertMember(member);

        // 4. 결과 처리
        if (result) {
            response.sendRedirect("views/member/login.jsp"); // 회원가입 성공 시 로그인 페이지로
        } else {
        	request.setAttribute("errorMsg", "이미 있는 아이디 입니다.");
        	RequestDispatcher rd = request.getRequestDispatcher("views/common/error.jsp");
        	rd.forward(request, response);
        }
    }
}