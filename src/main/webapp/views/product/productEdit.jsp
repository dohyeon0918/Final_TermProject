<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty product}">
    <c:redirect url="/product/list.do"/>
</c:if>

<html>
<head><title>상품 수정</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>상품 수정</h2>
    <form method="post" action="${pageContext.request.contextPath}/product/edit.do"enctype="multipart/form-data" >
        <input type="hidden" name="productId" value="${product.productId}" />
        상품명: <input type="text" name="title" value="${product.title}" required /><br/>
        설명: <textarea name="description" rows="5" cols="30">${product.description}</textarea><br/>
        가격: <input type="number" name="price" value="${product.price}" required /><br/>
        기존 이미지: 
    <c:if test="${not empty product.image}">
        <img src="${pageContext.request.contextPath}/upload/${product.image}" width="100" /><br/>
    </c:if>
        이미지 변경: <input type="file" name="imageFile" accept="image/*" /><br/>

        <input type="submit" value="수정 완료" />
    </form>
    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>