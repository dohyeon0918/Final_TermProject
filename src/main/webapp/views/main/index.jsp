<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${param.lang != null ? param.lang : sessionScope.locale != null ? sessionScope.locale : 'ko'}" scope="session" />
<fmt:setBundle basename="bundle.messages" />

<!DOCTYPE html>
<html lang="${pageContext.response.locale.language}">
<head>
  <meta charset="UTF-8">
  <title><fmt:message key="index.page.title"/></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index-style.css">
</head>
<body>
<!-- 언어 변경 -->
<div style="text-align:right; margin:1em;">
  <fmt:message key="index.changeLang"/>:
  <a href="?lang=ko"><fmt:message key="index.lang.ko"/></a> |
  <a href="?lang=en"><fmt:message key="index.lang.en"/></a>
</div>

  <jsp:include page="/views/common/header.jsp" />

  <!-- 상단 이미지 영역 -->
  <div class="top-visual">
    <div class="overlay">
      <h1 class="visual-title"><fmt:message key="nav.brand"/></h1>
    </div>
  </div>

  <!-- 하단 콘텐츠 영역 -->
  <main class="main-content">
    <p class="description">
      <fmt:message key="index.welcome"/>
    </p>

    <a href="${pageContext.request.contextPath}/product/list.do" class="btn">
      <fmt:message key="nav.products"/>
    </a>

    <p class="timestamp">
      현재 접속 시간: <%= new java.text.SimpleDateFormat("hh:mm:ss a").format(new java.util.Date()) %>
    </p>
  </main>

  <jsp:include page="/views/common/footer.jsp" />
</body>
</html>