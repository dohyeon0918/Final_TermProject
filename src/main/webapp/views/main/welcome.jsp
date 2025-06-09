<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>환영합니다</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <c:if test="${empty loginMember}">
        <c:redirect url="/views/member/login.jsp"/>
    </c:if>

    <h2>${loginMember.name}님, 환영합니다!</h2>
    <p>이메일: ${loginMember.email}</p>
    
    <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
    
    <c:if test="${not empty loginMember}">
    <a href="${pageContext.request.contextPath}/member/delete.do"
       onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
</c:if>

    <a href="${pageContext.request.contextPath}/views/main/index.jsp">메인</a>
    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>