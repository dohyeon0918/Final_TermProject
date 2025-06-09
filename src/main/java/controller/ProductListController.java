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

        ProductDAO dao = new ProductDAO();
        List<Product> productList = dao.getAllProducts();

        request.setAttribute("productList", productList); //데이터를 jsp로 넘김 jstl에 쓰기 위해
      //세션이 아닌 그 페이지에만 필요하기 때문에 리퀘스트에 저장
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/productList.jsp");
        dispatcher.forward(request, response); //jsp에서 화면이 이 정보의 화면이 보이게끔 함
        // 리퀘스트는 보내줘야됨
    }
}