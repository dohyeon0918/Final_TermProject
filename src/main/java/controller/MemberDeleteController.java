package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.MemberDAO;
import model.Member;

import java.io.IOException;

public class MemberDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            request.setAttribute("errorMsg", "로그인이 필요합니다.");
            request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
            return;
        }

        MemberDAO dao = new MemberDAO();
        boolean deleted = dao.deleteMember(loginMember.getId());

        if (deleted) {
            session.invalidate(); // 세션 제거
            response.sendRedirect(request.getContextPath() + "/views/main/index.jsp");
        } else {
        	request.setAttribute("errorMsg", "회원 탈퇴에 실패했습니다.");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/common/error.jsp");
        	rd.forward(request, response);
        }
    }
}