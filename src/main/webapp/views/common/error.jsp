<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>오류 발생</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/message-style.css" />
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="message-box">
  <h2>⚠️ 오류가 발생했습니다</h2>
  <p style="color: red; font-weight: bold;">
    <c:out value="${errorMsg}" default="알 수 없는 오류가 발생했습니다." />
  </p>
  <a href="${pageContext.request.contextPath}/views/main/index.jsp">메인으로 돌아가기</a>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>