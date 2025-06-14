<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>장바구니</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>

<div class="product-container" style="max-width: 800px; margin: 2rem auto;">
  <h2 style="text-align: center;">🛒 장바구니</h2>

  <c:if test="${empty cartItems}">
    <p style="text-align:center;">장바구니가 비어 있습니다.</p>
    <div style="text-align:center;">
      <a href="${pageContext.request.contextPath}/product/list.do" class="btn btn-back">상품 보러 가기</a>
    </div>
  </c:if>

  <c:if test="${not empty cartItems}">
    <form method="post" action="${pageContext.request.contextPath}/cart/clear" style="text-align: right; margin-bottom: 1rem;">
      <button type="submit" class="btn btn-danger">전체 비우기</button>
    </form>

    <table class="board">
      <thead>
        <tr>
          <th>상품명</th>
          <th>가격</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="p" items="${cartItems}">
          <tr>
            <td class="title">
              <a href="${pageContext.request.contextPath}/product/detail.do?productId=${p.productId}">
                <c:out value="${p.title}" />
              </a>
            </td>
            <td><c:out value="${p.price}" />원</td>
            <td>
              <a href="${pageContext.request.contextPath}/cart/remove?productId=${p.productId}" class="btn btn-secondary">삭제</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div style="text-align: right; margin-top: 1.5rem; font-size: 1.1rem;">
      <strong>
        총합계:
        <c:set var="total" value="0" />
        <c:forEach var="p" items="${cartItems}">
          <c:set var="total" value="${total + p.price}" />
        </c:forEach>
        <c:out value="${total}" />원
      </strong>
    </div>

    <div style="text-align: center; margin-top: 2rem;">
      <a href="${pageContext.request.contextPath}/checkout/shipping" class="btn btn-primary">주문하기</a>
      <a href="${pageContext.request.contextPath}/product/list.do" class="btn btn-back">계속 쇼핑하기</a>
    </div>
  </c:if>
</div>

<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>