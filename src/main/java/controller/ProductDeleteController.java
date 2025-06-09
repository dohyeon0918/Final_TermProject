package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Member;
import model.Product;
import model.ProductDAO;

import java.io.IOException;

public class ProductDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (product == null || loginMember == null || !loginMember.getId().equals(product.getSellerId())) {
            response.sendRedirect("views/common/error.jsp");
            return;
        }

        boolean deleted = dao.deleteProduct(productId);

        if (deleted) {
            response.sendRedirect("list.do");
        } else {
        	request.setAttribute("errorMsg", "상품 삭제에 실패했습니다.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/common/error.jsp");
            rd.forward(request, response);
        }
    }
}