package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;
import model.ProductDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CartAddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        HttpSession session = req.getSession();
       
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // 파라미터로 넘어온 productId 로 상품 조회
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product p = new ProductDAO().getProductById(productId);
        if (p != null && cart.stream().noneMatch(x -> x.getProductId() == productId)) {
            cart.add(p);
        }

        resp.sendRedirect(req.getContextPath() + "/cart/view");
    }
}