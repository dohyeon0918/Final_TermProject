<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>상품 상세 정보</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
</head>
<body>
  <jsp:include page="/views/common/header.jsp" />

  <div class="product-container">
    <h2>상품 상세 정보</h2>

    <div class="product-detail-card">
      <c:if test="${not empty product.image}">
        <img src="${pageContext.request.contextPath}/upload/${product.image}" alt="상품 이미지" />
      </c:if>

      <div class="details">
        <h2><c:out value="${product.title}" /></h2>

        <p><strong>카테고리:</strong> <c:out value="${product.category}" /></p>
        <p><strong>가격:</strong> <c:out value="${product.price}" /> 원</p>
        <p><strong>판매자:</strong> <c:out value="${product.sellerId}" /></p>

        <p><strong>설명:</strong><br/>
          <%
            Product prod = (Product) request.getAttribute("product");
            String desc = prod != null && prod.getDescription() != null ? prod.getDescription() : "";
            for (int i = 0; i < desc.length(); i += 100) {
                int end = Math.min(i + 100, desc.length());
                String segment = desc.substring(i, end).replaceAll("\\r?\\n", "<br/>");
                out.print(segment);
                if (end < desc.length()) {
                    out.print("<br/>");
                }
            }
          %>
        </p>

        <!-- 장바구니 버튼 -->
        <form method="get" action="${pageContext.request.contextPath}/cart/add">
          <input type="hidden" name="productId" value="${product.productId}" />
          <button type="submit" class="btn btn-primary">장바구니 담기</button>
        </form>

        <!-- 수정/삭제 버튼 -->
        <c:if test="${not empty loginMember and loginMember.id == product.sellerId}">
          <div style="margin-top: 10px;">
            <a href="${pageContext.request.contextPath}/product/edit.do?productId=${product.productId}" class="btn btn-secondary">수정</a>
            <a href="${pageContext.request.contextPath}/product/delete.do?productId=${product.productId}"
               onclick="return confirm('정말 삭제하시겠습니까?');"
               class="btn btn-danger">삭제</a>
          </div>
        </c:if>
      </div>
    </div><!-- .product-detail-card 종료 -->

    <!-- 지도 영역: 카드 아래로 분리 배치 -->
    <div class="map-section">
      <h3 class="map-title">판매자 위치</h3>
      <p class="location-text">${product.location}</p>
      <div id="map"></div>
    </div>

    <!-- 댓글 작성 -->
    <hr/>
    <form method="post" action="${pageContext.request.contextPath}/comment/add.do">
      <input type="hidden" name="productId" value="${product.productId}">
      <textarea name="content" required class="form-control mb-2"></textarea>
      <button type="submit" class="btn btn-success">댓글 작성</button>
    </form>

    <!-- 댓글 리스트 -->
    <hr/>
    <c:forEach var="comment" items="${commentList}">
      <p><strong>${comment.writerId}</strong> - ${comment.createdAt}</p>
      <p>${comment.content}</p>
      <c:if test="${loginMember != null && loginMember.id == comment.writerId}">
        <form method="get" action="${pageContext.request.contextPath}/comment/delete.do" style="display:inline;" onsubmit="return confirm('댓글을 삭제하시겠습니까?');">
          <input type="hidden" name="commentId" value="${comment.commentId}">
          <input type="hidden" name="productId" value="${product.productId}">
          <button type="submit" class="btn btn-danger btn-sm">삭제</button>
        </form>
      </c:if>
      <hr/>
    </c:forEach>

    <!-- 목록 돌아가기 버튼 -->
    <div style="margin-top: 20px;">
      <a href="${pageContext.request.contextPath}/product/list.do" class="btn btn-back">목록으로 돌아가기</a>
    </div>
  </div><!-- .product-container 종료 -->

  <jsp:include page="/views/common/footer.jsp" />

  <!-- Kakao Map SDK -->
  <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=eaeebd59063462ec115fe94919b549ef&autoload=false&libraries=services"></script>
  <script>
    kakao.maps.load(function () {
      const locationText = '${product.location}';
      const mapContainer = document.getElementById('map');
      const mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 3
      };
      const map = new kakao.maps.Map(mapContainer, mapOption); // 지도 객체 생성
      const geocoder = new kakao.maps.services.Geocoder();

      if (!locationText.trim()) {
        mapContainer.innerHTML = '주소 정보가 없습니다.';
        return;
      }

      geocoder.addressSearch(locationText, (result, status) => { // 주소 -> 좌표 변환
        if (status === kakao.maps.services.Status.OK) {
          const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          new kakao.maps.Marker({ map, position: coords }); // 마커 찍기
          map.setCenter(coords); // 중심 이동
        } else {
          mapContainer.innerHTML = '지도를 불러올 수 없습니다.';
        }
      });
    });
  </script>
</body>
</html>