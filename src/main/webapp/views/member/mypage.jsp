<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>내 상품 관리</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="product-container" style="max-width: 600px; margin: 2rem auto;">
  <h2 style="text-align:center;">내 상품 관리</h2>

  <c:if test="${empty productList}">
    <p style="text-align:center;">등록된 상품이 없습니다.</p>
  </c:if>

  <c:forEach var="product" items="${productList}">
    <div class="product-item no-border"> <!-- ← 테두리 제거를 위한 클래스 추가 -->
      <img src="${pageContext.request.contextPath}/upload/${product.image}" alt="${product.title}" />
      <div class="info">
        <h3>${product.title}</h3>
        <p><strong>카테고리:</strong> ${product.category}</p>
        <p>${product.description}</p>
        <p><strong>${product.price}원</strong></p>
        <div>
          <a href="${pageContext.request.contextPath}/product/edit.do?productId=${product.productId}" class="btn btn-secondary">수정</a>
          <a href="${pageContext.request.contextPath}/product/delete.do?productId=${product.productId}" class="btn btn-danger"
             onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>