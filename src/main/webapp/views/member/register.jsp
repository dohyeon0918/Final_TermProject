<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>회원가입</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>회원가입</h2>

    <form method="post" action="${pageContext.request.contextPath}/register.do">
        아이디: <input type="text" name="id" value="<c:out value='${param.id}'/>" required /><br/>
        비밀번호: <input type="password" name="password" required /><br/>
        이름: <input type="text" name="name" value="<c:out value='${param.name}'/>" required /><br/>
        이메일: <input type="email" name="email" value="<c:out value='${param.email}'/>" required /><br/> 
        <input type="submit" value="가입하기" />
    </form>
    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>