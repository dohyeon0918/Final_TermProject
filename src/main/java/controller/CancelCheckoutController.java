package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CancelCheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("shipName".equals(c.getName()) ||
                    "shipAddress".equals(c.getName()) ||
                    "shipPhone".equals(c.getName())) {
                    c.setMaxAge(0);
                    res.addCookie(c);
                }
            }
        }
        // 장바구니 세션은 유지
        RequestDispatcher rd = req.getRequestDispatcher("/views/checkout/checkOutCancelled.jsp");
        rd.forward(req, res);
    }
}