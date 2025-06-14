<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginMember}">
    <c:redirect url="/views/member/login.jsp"/>
</c:if>

<html>
<head>
  <title>상품 등록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-style.css" />
  <script type="text/javascript">
    function validateProductForm(form) {
      var title = form.title.value.trim();
      var desc  = form.description.value.trim();

      if (title.length === 0) {
        alert("제목을 입력해주세요.");
        form.title.focus();
        return false;
      }
      if (title.length > 30) {
        alert("제목은 30자 이내로 입력해 주세요. (현재 " + title.length + "자)");
        form.title.focus();
        return false;
      }
      if (desc.length === 0) {
        alert("설명을 입력해주세요.");
        form.description.focus();
        return false;
      }
      if (desc.length > 500) {
        alert("설명은 500자 이내로 입력해 주세요. (현재 " + desc.length + "자)");
        form.description.focus();
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />

<div class="form-container">
  <h2>상품 등록</h2>
  <form method="post" action="${pageContext.request.contextPath}/product/add.do"
        enctype="multipart/form-data" onsubmit="return validateProductForm(this);">

    <div class="form-group">
      <label>상품명</label>
      <input type="text" name="title" maxlength="30" required />

      <label>카테고리</label>
      <select name="category" required>
        <option value="의류">의류</option>
        <option value="쥬얼리">쥬얼리</option>
        <option value="가전제품">가전제품</option>
        <option value="기타">기타</option>
      </select>

      <label>설명</label>
      <textarea name="description" rows="5" maxlength="500" required></textarea>

      <label>가격</label>
      <input type="number" name="price" required />
      
      <label for="location">주소</label>
      <input type="text" class="form-control" name="location" id="location" placeholder="서울시 강남구 역삼동..." required>

      <label>이미지</label>
      <input type="file" name="imageFile" accept="image/*" />

    <button type="submit" class="btn btn-primary">등록하기</button>
  </form>
</div>

<jsp:include page="/views/common/footer.jsp" />
</body>
</html>