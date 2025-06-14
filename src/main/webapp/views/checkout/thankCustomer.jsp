<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>주문 완료</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>

<div class="form-container" style="max-width: 500px; text-align: center;">
  <h2 style="color: var(--primary-dark);">주문 완료</h2>
  <p>주문해주셔서 감사합니다!</p>
  <a href="${pageContext.request.contextPath}/product/list.do" class="btn btn-primary">메인으로 이동</a>
</div>

<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>