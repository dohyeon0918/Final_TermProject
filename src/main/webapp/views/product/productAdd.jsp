<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginMember}">
    <c:redirect url="/views/member/login.jsp"/>
</c:if>

<html>
<head><title>상품 등록</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>상품 등록</h2>
    <form method="post" action="${pageContext.request.contextPath}/product/add.do" enctype="multipart/form-data">
        상품명: <input type="text" name="title" required /><br/>
        설명: <textarea name="description" rows="5" cols="30"></textarea><br/>
        가격: <input type="number" name="price" required /><br/>
        이미지: <input type="file" name="imageFile" accept="image/*" /><br/>
        <input type="submit" value="등록하기" />
    </form>
    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>