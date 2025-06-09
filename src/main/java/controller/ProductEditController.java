package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;
import model.ProductDAO;
import model.Member;

import java.io.IOException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        // 예외가 나올수있기 때문에 방어용
        if (product == null || loginMember == null || !loginMember.getId().equals(product.getSellerId())) {
            response.sendRedirect("views/common/error.jsp");
            return;
        }

        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/product/productEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
        String savePath = request.getServletContext().getRealPath("/upload");
        int maxSize = 5 * 1024 * 1024; // 5MB

        MultipartRequest multi = new MultipartRequest(
            request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        

        int productId = Integer.parseInt(multi.getParameter("productId"));
        String title = multi.getParameter("title");
        String description = multi.getParameter("description");
        int price = Integer.parseInt(multi.getParameter("price"));
        String image = multi.getFilesystemName("imageFile");
        
        if (image == null) {
            // 기존 이미지 유지
            Product existing = new ProductDAO().getProductById(productId);
            if (existing != null) {image = existing.getImage();}
        }
        
        Member login = (Member) request.getSession().getAttribute("loginMember");
        String sellerId = login.getId();

       
        ProductDAO dao = new ProductDAO();
        boolean result = dao.updateProduct(new Product(productId, title, description, price, sellerId, image));

        if (result) {
            response.sendRedirect("detail.do?productId=" + productId);
        } else {
        	request.setAttribute("errorMsg", "상품 수정에 실패했습니다. 입력값을 다시 확인해 주세요.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/common/error.jsp");
            rd.forward(request, response);
        }
    }
}