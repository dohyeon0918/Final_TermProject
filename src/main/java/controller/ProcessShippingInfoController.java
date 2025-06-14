package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;

public class ProcessShippingInfoController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String name    = req.getParameter("name");
        String address = req.getParameter("address");
        String phone   = req.getParameter("phone");

        int maxAge = 24 * 60 * 60;

        Cookie c1 = new Cookie("shipName",    URLEncoder.encode(name,    "UTF-8"));
        Cookie c2 = new Cookie("shipAddress", URLEncoder.encode(address, "UTF-8"));
        Cookie c3 = new Cookie("shipPhone",   URLEncoder.encode(phone,   "UTF-8"));

        c1.setMaxAge(maxAge);
        c2.setMaxAge(maxAge);
        c3.setMaxAge(maxAge);

        res.addCookie(c1);
        res.addCookie(c2);
        res.addCookie(c3);

        res.sendRedirect(req.getContextPath() + "/checkout/confirm");
    }
}