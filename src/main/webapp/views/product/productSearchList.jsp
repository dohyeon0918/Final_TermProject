<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>상품 검색 결과</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
  <style>
    table.board {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1.5rem;
    }
    table.board th, table.board td {
      border-bottom: 1px solid #ddd;
      padding: 0.75rem;
      text-align: center;
      font-size: 0.95rem;
    }
    table.board th {
      background-color: #f7f7f7;
      color: #444;
    }
    table.board td.title {
      text-align: left;
    }
  </style>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="product-container">
  <h2>상품 검색 결과</h2>

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
        <tr><td colspan="5">검색 결과가 없습니다.</td></tr>
      </c:if>
    </tbody>
  </table>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>