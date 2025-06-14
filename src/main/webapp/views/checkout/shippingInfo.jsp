<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>배송 정보 입력</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="form-container" style="max-width: 500px;">
  <h2>배송 정보 입력</h2>

  <form method="post" action="${pageContext.request.contextPath}/checkout/processShipping">

    <div class="form-group">
      <label>이름</label>
      <input type="text" name="name" required />
    </div>

    <div class="form-group">
      <label>주소</label>
      <input type="text" name="address" required />
    </div>

    <div class="form-group">
      <label>연락처</label>
      <input type="text" name="phone" required />
    </div>

    <button type="submit" class="btn btn-primary">다음</button>
    <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-secondary">취소</a>
  </form>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>