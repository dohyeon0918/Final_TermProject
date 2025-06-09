<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>중고거래 메인</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>중고거래 사이트에 오신 걸 환영합니다!</h2>

    <c:choose>
        <%-- 로그인 안 한 경우 --%>
        <c:when test="${empty loginMember}">
            <p><a href="${pageContext.request.contextPath}/views/member/login.jsp">로그인</a></p>
            <p><a href="${pageContext.request.contextPath}/views/member/register.jsp">회원가입</a></p>
        </c:when>

         <%-- 로그인 한 경우 --%>
        <c:otherwise>
            <p><a href="${pageContext.request.contextPath}/product/list.do">상품 목록 보기</a></p>
            <p><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></p>
        </c:otherwise>
    </c:choose>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>