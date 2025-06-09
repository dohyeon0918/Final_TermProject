<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<!-- header -->
<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <!-- 왼쪽: 로고 및 제목 -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/views/main/index.jsp">
            <img src="${pageContext.request.contextPath}/upload/스콘.png" alt="Logo">
            서경장터
        </a>

        <!-- 가운데: 검색창 -->
        <form class="d-flex" role=" search">
            <input class="form-control search-box" type="search" placeholder="상품명 입력" aria-label="Search">
            <button class="btn btn-link" type="submit" style=" margin-top: 10px;">🔍</button>
        </form>

        <!-- 오른쪽: 유저 메뉴 -->
        <div class="user-section d-flex align-items-center gap-3">
            <a href="${pageContext.request.contextPath}/product/list.do" class="nav-link">상품목록</a>

            <c:choose>
                <c:when test="${empty loginMember}">
                    <a href="${pageContext.request.contextPath}/views/member/login.jsp" class="nav-link">로그인</a>
                    <a href="${pageContext.request.contextPath}/views/member/register.jsp" class="nav-link">회원가입</a>
                </c:when>
                <c:otherwise>
                    <span class="nav-link">${loginMember.name}님</span>
                    <a href="${pageContext.request.contextPath}/logout.do" class="nav-link">로그아웃</a>
                    <a href="${pageContext.request.contextPath}/member/delete.do" class="nav-link">회원탈퇴</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
