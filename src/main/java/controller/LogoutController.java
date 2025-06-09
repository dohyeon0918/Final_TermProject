package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false); // 기존 세션 가져오기 (없으면 null)
        if (session != null) {
            session.invalidate(); // 세션 종료
        }

        response.sendRedirect(request.getContextPath() + "/views/main/index.jsp"); // 메인 페이지로 이동
    }
}