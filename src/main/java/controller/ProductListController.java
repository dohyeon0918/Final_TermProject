package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;
import model.ProductDAO;

import java.io.IOException;
import java.util.List;

public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    	// 카테고리 (없거나 빈문자열이면 "전체"로 처리)
        String category = request.getParameter("category");
        if (category == null || category.trim().isEmpty()) {
            category = "전체";
        }

       
        ProductDAO dao = new ProductDAO();
        List<Product> productList = dao.getAllProducts(category);

        
        request.setAttribute("productList", productList);
        request.setAttribute("selectedCategory", category);

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/productList.jsp");
        dispatcher.forward(request, response);
    }
}