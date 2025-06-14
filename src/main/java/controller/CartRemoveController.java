package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.util.List;

public class CartRemoveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            @SuppressWarnings("unchecked")
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart != null) {
                int productId = Integer.parseInt(req.getParameter("productId"));
                cart.removeIf(p -> p.getProductId() == productId);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/cart/view");
    }
}