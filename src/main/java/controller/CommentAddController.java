package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;

public class CommentAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/views/member/login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String content = request.getParameter("content");

        Comment comment = new Comment();
        comment.setProductId(productId);
        comment.setWriterId(loginMember.getId());
        comment.setContent(content);

        CommentDAO dao = new CommentDAO();
        dao.addComment(comment);

        response.sendRedirect( request.getContextPath() + "/product/detail.do?productId=" + productId); // 다시 상세 페이지로
    }
}