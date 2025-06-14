<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>주문 확인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>

<div class="form-container" style="max-width: 700px; text-align: center;">
  <h2 style="color: var(--primary-dark);">주문 확인</h2>

  <p><strong>이름:</strong> <c:out value="${shipName}"/></p>
  <p><strong>주소:</strong> <c:out value="${shipAddress}"/></p>
  <p><strong>연락처:</strong> <c:out value="${shipPhone}"/></p>

  <table class="board" style="margin-top: 2rem;">
    <thead>
      <tr>
        <th>상품명</th>
        <th>단가</th>
        <th>수량</th>
        <th>소계</th>
      </tr>
    </thead>
    <tbody>
      <c:set var="total" value="0" />
      <c:forEach var="p" items="${cartItems}">
        <tr>
          <td class="title"><c:out value="${p.title}"/></td>
          <td><c:out value="${p.price}"/>원</td>
          <td>1</td>
          <td><c:out value="${p.price}"/>원</td>
          <c:set var="total" value="${total + p.price}" />
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <h3 style="margin-top: 1.5rem;">총합계: <c:out value="${total}"/>원</h3>

  <div style="margin-top: 2rem;">
    <form action="${pageContext.request.contextPath}/checkout/thank" method="get" style="display:inline;">
      <button type="submit" class="btn btn-primary">주문 완료</button>
    </form>
    <form action="${pageContext.request.contextPath}/checkout/cancel" method="get" style="display:inline;">
      <button type="submit" class="btn btn-danger">주문 취소</button>
    </form>
  </div>
</div>

<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>