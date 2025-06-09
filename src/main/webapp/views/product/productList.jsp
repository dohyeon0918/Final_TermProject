<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>상품 목록</title></head>
<body>
<jsp:include page="/views/common/header.jsp" />

    <h2>상품 목록</h2>

    <table border="1" cellpadding="10">
        <tr>
            <th>번호</th>
            <th>상품명</th>
            <th>가격</th>
            <th>판매자</th>
        </tr>

        <c:forEach var="p" items="${productList}">
            <tr>
                <td>${p.productId}</td>
                <td> <a href="${pageContext.request.contextPath}/product/detail.do?productId=${p.productId}">
                ${p.title} </a></td>
                <td>${p.price} 원</td>
                <td>${p.sellerId}</td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <a href="${pageContext.request.contextPath}/views/product/productAdd.jsp">상품 등록</a>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>