package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;

public class CommentDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int commentId = Integer.parseInt(request.getParameter("commentId"));
        int productId = Integer.parseInt(request.getParameter("productId"));

        CommentDAO dao = new CommentDAO();
        dao.deleteComment(commentId, loginMember.getId());

        response.sendRedirect(request.getContextPath() + "/product/detail.do?productId=" + productId);
    }
}