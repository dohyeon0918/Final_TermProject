<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>상품 목록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="product-container">
  <h2>상품 목록</h2>

  <div class="category-list">
    <a href="${pageContext.request.contextPath}/product/list.do" class="category-item">전체</a>
    <a href="${pageContext.request.contextPath}/product/list.do?category=전자제품" class="category-item">전자제품</a>
    <a href="${pageContext.request.contextPath}/product/list.do?category=의류" class="category-item">의류</a>
    <a href="${pageContext.request.contextPath}/product/list.do?category=도서" class="category-item">도서</a>
    <a href="${pageContext.request.contextPath}/product/list.do?category=기타" class="category-item">기타</a>
  </div>

  <table class="board">
    <thead>
      <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>카테고리</th>
        <th>가격</th>
        <th>판매자</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
          <td>${status.count}</td>
          <td class="title">
            <a href="${pageContext.request.contextPath}/product/detail.do?productId=${product.productId}">
              <c:out value="${product.title}" />
            </a>
          </td>
          <td><c:out value="${product.category}" /></td>
          <td><c:out value="${product.price}" /> 원</td>
          <td><c:out value="${product.sellerId}" /></td>
        </tr>
      </c:forEach>
      <c:if test="${empty productList}">
        <tr><td colspan="5">등록된 상품이 없습니다.</td></tr>
      </c:if>
    </tbody>
  </table>

  <div style="text-align: right; margin-top: 1rem;">
    <a href="${pageContext.request.contextPath}/views/product/productAdd.jsp" class="btn">상품 등록</a>
  </div>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>