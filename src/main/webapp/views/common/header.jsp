<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!-- URL 파라미터 lang 우선, 없으면 세션 locale, 없으면 기본 ko -->
<fmt:setLocale
    value="${param.lang != null 
             ? param.lang 
             : sessionScope.locale != null 
               ? sessionScope.locale 
               : 'ko'}"
    scope="session" />
<!--리소스 번들 지정 -->
<fmt:setBundle basename="bundle.messages" />

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom 스타일 -->
<style>
    body {
        background-color: #ffffff;
        margin: 0;
        padding: 0;
    }
    .navbar {
        background-color: white;
        border-bottom: 1px solid #d0e8d0;
        margin-bottom: 50px;
        padding-top: 50px;
        padding-bottom: 20px;
    }
    .navbar-brand {
        font-weight: 600;
        font-size: 32px;
        color: #2e7d32 !important;
        font-family: 'Segoe UI', 'Malgun Gothic', sans-serif;
        display: flex;
        align-items: center;
    }
    .navbar-brand img {
        height: 50px;
        margin-right: 12px;
    }
    .search-box {
        border: 2px solid #81c784;
        border-radius: 6px;
        padding: 6px 10px;
        width: 500px;
        margin-top: 15px;
    }
    .search-box::placeholder {
        color: #999;
    }
    .nav-link {
        color: #2e7d32 !important;
        font-weight: 500;
        text-decoration: none;
    }
    .nav-link:hover {
        color: #1b5e20 !important;
    }
    .user-section {
        white-space: nowrap;
    }
</style>

<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <!-- 왼쪽: 로고 및 브랜드명 -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/views/main/index.jsp">
            <img src="${pageContext.request.contextPath}/upload/스콘.png" alt="Logo">
            <fmt:message key="nav.brand"/>
        </a>

        <!-- 가운데: 검색창 -->
        <form class="d-flex" role="search"
              method="get"
              action="${pageContext.request.contextPath}/product/searchName.do">
            <input class="form-control search-box"
                   type="search"
                   name="keyword"
                   value="${param.keyword}"
                   placeholder="<fmt:message key='search.placeholder'/>"
                   aria-label="Search" />
            <button class="btn btn-link"
                    type="submit"
                    style="margin-top: 10px;">
                🔍
            </button>
        </form>

        <!-- 오른쪽: 유저 메뉴 -->
        <div class="user-section d-flex align-items-center gap-3">
            <a href="${pageContext.request.contextPath}/product/list.do" class="nav-link">
                <fmt:message key="nav.products"/>
            </a>

        
    
            <c:choose>
                <c:when test="${empty sessionScope.loginMember}">
                    <a href="${pageContext.request.contextPath}/views/member/login.jsp" class="nav-link">
                        <fmt:message key="nav.login"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/views/member/register.jsp" class="nav-link">
                        <fmt:message key="nav.register"/>
                    </a>
                </c:when>
                <c:otherwise>
            
                    <a href="${pageContext.request.contextPath}/mypage.do" class="nav-link">
                        <fmt:message key="nav.mypage"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/cart/view" class="nav-link">
                     장바구니
                    </a>
                    <a href="${pageContext.request.contextPath}/logout.do" class="nav-link">
                        <fmt:message key="nav.logout"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/member/delete.do" class="nav-link">
                        <fmt:message key="nav.withdraw"/>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>