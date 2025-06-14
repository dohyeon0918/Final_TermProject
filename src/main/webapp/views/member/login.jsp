<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="product-container" style="max-width: 420px;">
  <form action="${pageContext.request.contextPath}/login.do" method="post" class="auth-inner">
    <input type="text" name="id" placeholder="아이디" required />
    <input type="password" name="password" placeholder="비밀번호" required />

    <button type="submit" class="login-btn">로그인</button>
  </form>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>