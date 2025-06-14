package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.CartItem;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

public class OrderConfirmationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        Cookie[] cookies = req.getCookies();
        String name="", address="", phone="";
        if (cookies != null) {
            for (Cookie c : cookies) {
                switch (c.getName()) {
                    case "shipName"    -> name    = URLDecoder.decode(c.getValue(), "UTF-8");
                    case "shipAddress" -> address = URLDecoder.decode(c.getValue(), "UTF-8");
                    case "shipPhone"   -> phone   = URLDecoder.decode(c.getValue(), "UTF-8");
                }
            }
        }
        req.setAttribute("shipName",    name);
        req.setAttribute("shipAddress", address);
        req.setAttribute("shipPhone",   phone);

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) req.getSession().getAttribute("cart");
        req.setAttribute("cartItems", cart);

        RequestDispatcher rd = req.getRequestDispatcher("/views/checkout/orderConfirmation.jsp");
        rd.forward(req, res);
    }
}