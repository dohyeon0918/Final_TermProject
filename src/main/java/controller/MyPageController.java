package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Product;
import model.Member; 
import model.ProductDAO;


public class MyPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Member loginMember = null;
        if (session != null) {
            Object obj = session.getAttribute("loginMember");
            if (obj instanceof Member) {
                loginMember = (Member) obj;
            }
        }
        if (loginMember == null) {
            // 로그인이 안 된 상태는 다시 로그인 페이지로 이동
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = loginMember.getId();

        List<Product> productList = ProductDAO.getMyProducts(userId);

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/views/member/mypage.jsp")
               .forward(request, response);
    }
}