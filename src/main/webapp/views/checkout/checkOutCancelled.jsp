<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>주문 취소</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>

<div class="form-container" style="max-width: 500px; text-align: center;">
  <h2 style="color: var(--danger);">주문이 취소되었습니다.</h2>
  <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-back">장바구니로 돌아가기</a>
</div>

<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>