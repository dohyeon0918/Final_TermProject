package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.util.List;

public class CartViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        List<Product> cart = session != null
            ? (List<Product>) session.getAttribute("cart")
            : null;

        req.setAttribute("cartItems", cart);
        RequestDispatcher rd = req.getRequestDispatcher("/views/cart/Cart.jsp");
        rd.forward(req, resp);
    }
}