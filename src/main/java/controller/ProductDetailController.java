package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;
import model.Product;
import model.ProductDAO;
import model.Comment;
import model.CommentDAO;

import java.io.IOException;

public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (product == null) {
            response.sendRedirect("/views/common/error.jsp");
            return;
        }
        
        CommentDAO commentDao = new CommentDAO();
        List<Comment> commentList = commentDao.getCommentsByProductId(productId);
        request.setAttribute("commentList", commentList);

        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/productDetail.jsp");
        dispatcher.forward(request, response);
    }
}