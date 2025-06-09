<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>상품 상세 정보</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>상품 상세 정보</h2>

    <p><strong>상품명:</strong> ${product.title}</p>
    <p><strong>설명:</strong> ${product.description}</p>
    <p><strong>가격:</strong> ${product.price} 원</p>
    <p><strong>판매자:</strong> ${product.sellerId}</p>
    <c:if test="${not empty product.image}">
    <img src="${pageContext.request.contextPath}/upload/${product.image}" width="300" />
</c:if>

<c:if test="${not empty loginMember and loginMember.id == product.sellerId}">
    <a href="${pageContext.request.contextPath}/product/edit.do?productId=${product.productId}">수정</a>
    |
    <a href="${pageContext.request.contextPath}/product/delete.do?productId=${product.productId}"
       onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
</c:if>

    <a href="${pageContext.request.contextPath}/product/list.do"> 목록으로 돌아가기</a>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>