package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ShippingInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/checkout/shippingInfo.jsp");
        rd.forward(req, res);
    }
}