<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<footer class="footer mt-auto py-4">
    <div class="container text-center">
        <div style="border-top: 1px solid #d0e8d0; margin-bottom: 15px;"></div>
        <div style="color: #333; font-size: 14px; line-height: 1.6;">
            <div><fmt:message key="footer.copy"/></div>
            <div><fmt:message key="footer.support"/></div>
        </div>
    </div>
</footer>