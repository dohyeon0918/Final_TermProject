<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>로그인</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>로그인</h2>

    <form method="post" action="${pageContext.request.contextPath}/login.do">
        아이디: <input type="text" name="id" required /><br/>
        비밀번호: <input type="password" name="password" required /><br/>
        <input type="submit" value="로그인" />
    </form>
    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>