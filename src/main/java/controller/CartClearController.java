package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

public class CartClearController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.removeAttribute("cart");
        }
        resp.sendRedirect(req.getContextPath() + "/cart/view");
    }
}