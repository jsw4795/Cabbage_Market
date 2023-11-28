<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/qa/qaCategory.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>QA Category</title>
<script>
</script>
</head>

<body id="wv-feedbacks-new">
<form action="/qa/qaForm" method="post">
	<!-- 세션에서 로그인된 사용자 정보 읽어오기 -->
    <c:set var="loggedInUser" value="${sessionScope.loggedInUser}" />
    <!-- 로그인 정보 출력 -->
    <c:if test="${loggedInUser ne null}">
        <p style="margin: 3em 16px 16px;">${loggedInUser.userId}님 안녕하세요! 🤚</p>
    </c:if>
    
    
    
    <div data-v-8b3d39b8="">
    <div data-v-aed0d24c="" data-v-8b3d39b8="">
    <h3 data-v-aed0d24c="" class="category-title ">
	😊 문의하기 전, 카테고리를 선택해주세요! 😊
    </h3>
<!--     <ul data-v-aed0d24c="" class="feedbacks-category-list">
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=68">계정 문의</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=75">채팅, 알림</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=925">중고거래</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=101">동네 생활(커뮤니티) 문의</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=133">광고 문의</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=100">비즈프로필 문의</a></li>
	    <li data-v-aed0d24c="" class="feedbacks-category-item"><a data-v-aed0d24c="" href="/wv/feedbacks/new?category_id=926">다른 문제가 있어요</a></li>
    </ul> -->
    </div>
    </div>
    
 	<!-- 카테고리 리스트 -->
    <div data-v-8b3d39b8="">
	    <div data-v-aed0d24c="" data-v-8b3d39b8="">
	        <ul data-v-aed0d24c="" class="feedbacks-category-list">
	            <c:forEach var="category" items="${qaCategoryList}">
	                <li data-v-aed0d24c="" class="feedbacks-category-item">
	                    <a data-v-aed0d24c="" href="/qa/qaForm?categoryId=${category.qaCatId}">
	                        ${category.qaCatName}<hr>
	                    </a>
	                </li>
	            </c:forEach>
	        </ul>
	    </div>
	</div>
   <!-- 이전 자바 코드 -->
  <%--  <h2>QA Category 목록</h2>
	<ul class="feedbacks-category-list">
	    <c:forEach var="category" items="${qaCategoryList}">
	        <li class="feedbacks-category-item">
	            <a href="/qa/qaForm?categoryId=${category.qaCatId}">
	                ${category.qaCatName}
	            </a>
	        </li>
	    </c:forEach>
	</ul>
	
	<c:forEach var="category" items="${qaCategoryList}">
        <!-- 각 카테고리에 대한 링크 -->
        <a href="/qa/qaForm?categoryId=${category.qaCatId}">
            ${category.qaCatName}
        </a>
    </c:forEach> --%>
    
    <!-- Hidden Input으로 선택한 카테고리 ID 전달 -->
    <input type="hidden" id="categoryId" name="categoryId" value="${qaCatContent}">

</form>
        
</body>
</html>