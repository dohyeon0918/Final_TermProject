<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>회원가입</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
  </head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="product-container" style="max-width: 420px;">
  <h2 style="text-align: center; margin-top: 1rem;">회원가입</h2>
  <form method="post" action="${pageContext.request.contextPath}/register.do" class="auth-inner">
    아이디: <input type="text" name="id" value="<c:out value='${param.id}'/>" required />
    비밀번호: <input type="password" name="password" required />
    이름: <input type="text" name="name" value="<c:out value='${param.name}'/>" required />
    이메일: <input type="email" name="email" value="<c:out value='${param.email}'/>" required />
    <input type="submit" class="submit-btn" value="가입하기" />
  </form>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>