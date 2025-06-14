<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Product" %>

<html>
<head>
  <title>상품 수정</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="form-container">
  <h2>상품 수정</h2>
  <form method="post" action="${pageContext.request.contextPath}/product/edit.do" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.productId}" />

    <div class="form-group">
  <label>상품명</label>
  <input type="text" name="title" value="${product.title}" required />

  <label>설명</label>
  <textarea name="description" rows="6" required><c:out value="${product.description}" /></textarea>

  <label>카테고리</label>
  <input type="text" name="category" value="${product.category}" required />

  <label>가격</label>
  <input type="number" name="price" value="${product.price}" required />

  <label>상품 이미지</label>
  <input type="file" name="image" />
  <c:if test="${not empty product.image}">
    <br/>
    <img src="${pageContext.request.contextPath}/upload/${product.image}" width="120" />
  </c:if>
</div>

    <button type="submit" class="btn">상품 수정</button>
    <a href="${pageContext.request.contextPath}/product/detail.do?productId=${product.productId}" class="btn btn-secondary">취소</a>
  </form>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>