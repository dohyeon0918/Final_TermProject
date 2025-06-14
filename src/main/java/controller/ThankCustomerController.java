package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;
import model.ProductDAO;

import java.io.IOException;
import java.util.List;

public class ThankCustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            // 세션에서 cart(장바구니) 꺼내기
            List<Product> cart = (List<Product>) session.getAttribute("cart");

            // 주문 완료된 상품은 DB에서 삭제
            if (cart != null) {
                ProductDAO dao = new ProductDAO();
                for (Product p : cart) {
                    dao.deleteProduct(p.getProductId());
                }
            }

            // 세션에서 장바구니 비우기
            session.removeAttribute("cart");
        }

        // 쿠키 삭제 (배송정보)
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

        // 5) 주문 완료 페이지로 포워드
        RequestDispatcher rd = req.getRequestDispatcher("/views/checkout/thankCustomer.jsp");
        rd.forward(req, res);
    }
}