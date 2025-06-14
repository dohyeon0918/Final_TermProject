package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Product;
import model.ProductDAO;


public class ProductSearchByNameController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/product/list.do");
            return;
        }

        List<Product> results = ProductDAO.searchByName(keyword.trim());

        request.setAttribute("productList", results);
        request.setAttribute("searchQuery", keyword);
        request.getRequestDispatcher("/views/product/productList.jsp")
               .forward(request, response);
    }
}