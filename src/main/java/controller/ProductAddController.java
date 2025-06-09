package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product;
import model.ProductDAO;
import model.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.IOException;

public class ProductAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 로그인한 사용자 확인
        HttpSession session = request.getSession(false); // 세션이 있으면 가져오고, 없으면 null 반환
        Member member = (Member) session.getAttribute("loginMember");

        if (member == null) {
            response.sendRedirect("views/member/login.jsp");
            return;
        }

        String savePath = request.getServletContext().getRealPath("/upload");
        int maxSize = 5 * 1024 * 1024; // 5MB

        MultipartRequest multi = new MultipartRequest(
            request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        // 폼 데이터 추출
        String title = multi.getParameter("title");
        String description = multi.getParameter("description");
        int price = Integer.parseInt(multi.getParameter("price"));
        String image = multi.getFilesystemName("imageFile"); 
        
        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        String sellerId = loginMember.getId();
        
       
        Product product = new Product(0, title, description, price, sellerId, image);

        // DB에 등록
        ProductDAO dao = new ProductDAO();
        boolean result = dao.insertProduct(product);

        if (result) {
            response.sendRedirect(request.getContextPath()  +"/product/list.do");
        } else {
        	request.setAttribute("errorMsg", "상품 등록에 실패했습니다. 입력값을 다시 확인해 주세요.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/common/error.jsp");
            rd.forward(request, response);
        }
    }
}