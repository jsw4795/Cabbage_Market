<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" rel="stylesheet"/>
   <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/qa/qaFormDetail.css">
<title>1:1 문의내역 디테일 보기/삭제 [qaFormDetail.jsp]</title>
</head>
<body>
	<div id="container">

		<div title="" class="content-container"></div>
			<h1 title="" class="">
			<!-- 세션에서 로그인된 사용자 정보 읽어오기 -->
				<c:set var="loggedInUser" value="${sessionScope.loggedInUser}" />
				<!-- 로그인 정보 출력 -->
				<c:if test="${loggedInUser ne null}">
					<svg title="" width="1.8rem" height="3rem" viewBox="0 0 474 801"
					fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="" fill="#FF6F0F"></path> 
					<img src="/resources/pic/baechu.png" width="45" height="45" /></svg>
					문의내역
				</c:if>		
			</h1>
		<br>
		
		<div id="document" class="idx-type">
			<div class="panel">
				<div id="container" class="bg-color">
					<!-- 헤더 영역 -->
					<form action="getQaFormDetail" method="get">
					<header class="fb__communityDetail__header">
						<c:set var="qaFormDetail" value="${qaFormDetail}" />
						
						<!-- 타이틀 -->
						<p>[${qaFormDetail.qaCatName }]</p>
						<p class="header__title js__communityDetail__title">
							${qaFormDetail.qaTitle }
						</p>
	
						<!-- 글 정보 -->
						<div class="header__info">
							<!-- 유저 이미지 -->
							<!-- <figure class="header__info__thumb">
								<a
									href="/community/userProfile?code=1757faca2bf9b200b3d7825fac53108c&amp;pageMode=userProfile"
									class="fb__communityDetail__userImageLink"> <img
									alt="유저이미지" class="profile-image loadimage"
									src="https://eytzjvrxjleq11337293.cdn.ntruss.com/data/mall_data/images/user_profile/1757faca2bf9b200b3d7825fac53108c/after_aa8cb8d20fd61677980fff04708bf642.jpg"
									style="">
								</a>
							</figure> -->
						</div>
					</header>
					
					<!-- 내용 영역 -->
					<div class="fb__communityDetail__contents">
					<p class="contents__text default">
				        ${qaFormDetail.qaContent }
					</p>
					</div>
					
					

					<!-- 댓글 영역 -->
					<div class="fb__communityDetail__comments js__communityDetail__comments">
						<!-- 댓글 작성 -->
						<div class="comments__write">
						<p> 
						<!-- 첨부이미지 : ${qaFormDetail.fileId } -->
						<p>이미지를 확대해보세요 🔎 </p>
						<p>
						<a href="/resources/pic/qaPic/${qaFormDetail.fileName}" data-fancybox="gallery">
							<img alt="" src="/resources/pic/qaPic/${qaFormDetail.fileName}" width="50px" height="50px">
						</a>
						</p>
						</div>
					</div>
					</form>
					<!-- 관리자 댓글 표시 -->
					<img src="/resources/pic/adminPic.png" width="70" height="70" /></svg>
					<p class="commentContainer">
					${qaFormDetail.qaComment }
					</p>
					<p>
						<a href="qaFormList">목록</a>
						<a href="deleteQaFormDetail?qaId=${qaFormDetail.qaId }">삭제</a>	
					</p>	
			</div>
		</div>
	</div>
<script>
	
	function clearCommentForm() {
        document.querySelector('textarea[name="qaComment"]').value = ''; // 댓글 입력란 초기화
    }
    
    
    
    
</script>	
</body>
</html>