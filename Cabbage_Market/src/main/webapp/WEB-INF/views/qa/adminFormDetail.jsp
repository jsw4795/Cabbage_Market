<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" rel="stylesheet"/>
   <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/qa/adminFormDetail.css">
<title>관리자모드 댓글 입력/삭제 [adminFormDetail.jsp]</title>
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
					<img src="/resources/pic/admin_baechu.png" width="70" height="70" /></svg>
					쉿!🤫 여기는 관리자 페이지
			</c:if>
		</h1>
		<br>

		<div id="document" class="idx-type">
			<div class="panel">
				<div id="container" class="bg-color">
					<!-- 헤더 영역 -->
					<form action="adminFormInsert" method="post">
						<header class="fb__communityDetail__header">

							<c:set var="admin" value="${adminFormDetail }" />
							<!-- 타이틀 -->
							<p>[${admin.qaCatName }]</p>
							<p class="header__title js__communityDetail__title">
								${admin.qaTitle }</p>

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
							<p class="contents__text default">${admin.qaContent }</p>
						</div>

						<div class="fb__communityDetail__comments js__communityDetail__comments">
						<!-- 댓글 작성 -->
							<div class="comments__write">
								<p> 
								첨부이미지 : ${admin.fileId }
								<a href="/resources/pic/qaPic/${admin.fileName}" data-fancybox="gallery">
									<img alt="" src="/resources/pic/qaPic/${admin.fileName}" width="50px" height="50px">
								</a>
								</p>
										
								</div>
								
								
								<!-- 댓글이 있을 때 -->
					            <c:if test="${not empty admin.qaComment}">
					                <h3>${admin.qaComment}</h3>
					            </c:if>
					
					            <!-- 댓글이 없을 때 -->
					            <c:if test="${empty admin.qaComment}">
					                <form action="adminCommentAction" method="post">
					                    <p>
					                        <textarea rows="10" cols="50" name="qaComment" placeholder="댓글을 입력하세요" style="font-size: 20px"></textarea>
					                    </p>
					                    <p>
					                        <input type="hidden" name="qaId" value="${admin.qaId}">
					                        <input type="hidden" name="userId" value="${loggedInUser.userId}">
					                        <input type="submit" value="등록">
					                    </p>
					                </form>
					            </c:if>
								</div>
								
								<%-- <!-- 댓글 영역 -->
								<c:if test="${not empty admin.qaComment}">
								    <h1>${admin.qaComment}</h1>
								</c:if>
								
								<c:if test="${empty admin.qaComment}">
								    <p>
								        <textarea rows="5" cols="50" name="qaComment" placeholder="댓글을 입력하세요"></textarea>
								    </p>
								    <p>
								        <input type="hidden" name="qaId" value="${admin.qaId}">
								        <input type="hidden" name="userId" value="${loggedInUser.userId}">
								        <input type="submit" value="댓글 등록">
								    </p>
								</c:if>

								
								<h1>${admin.qaComment }</h1>
								<!-- 댓글 영역 -->

								<p>
									<textarea rows="5" cols="50" name="qaComment"
										placeholder="댓글을 입력하세요"></textarea>
								</p>
								<p>
									<input type="hidden" name="qaId" value="${admin.qaId}">
									<input type="hidden" name="userId"
										value="${loggedInUser.userId}"> <input type="submit"
										value="댓글 등록">
								</p> --%>
					</form>
					<%-- 					<form action="adminCommentAction" method="post">
					    <textarea name="qaContent" placeholder="댓글을 입력하세요">${adminFormDetail.qaContent}</textarea>
					    <input type="hidden" name="qaId" value="${adminFormDetail.qaId}">
					    <input type="hidden" name="action" value="${empty adminFormDetail.qaContent ? 'insert' : 'update'}">
					    <input type="submit" value="${empty adminFormDetail.qaContent ? '댓글 등록' : '댓글 수정'}">
					    
					    <!-- 댓글이 있을 경우에만 삭제 링크 표시 -->
					    <c:if test="${not empty adminFormDetail.qaContent}">
					        <a href="deleteAdminComment?qaId=${adminFormDetail.qaId}">삭제</a>
					    </c:if>
					</form> --%>

					<!-- 댓글 등록 -->
					<%-- <form action="adminFormInsert" method="post">
					    <textarea name="qaContent" placeholder="댓글을 입력하세요"></textarea>
					    <input type="hidden" name="qaId" value="${adminFormDetail.qaId}">
					    <input type="submit" value="댓글 등록">
					</form> --%>

					<!-- 댓글 수정 -->
					<%-- <form action="updateAdminComment" method="post">
					    <textarea name="qaContent" placeholder="댓글을 수정하세요">${adminFormDetail.qaContent}</textarea>
					    <input type="hidden" name="qaId" value="${adminFormDetail.qaId}">
					    <input type="submit" value="댓글 수정">
					</form> --%>

					<!-- 댓글 삭제 -->
					<%-- <c:if test="${not empty adminFormDetail.userId}">
					    <p>${adminFormDetail.qaContent} 
					        <a href="deleteAdminComment?qaId=${adminFormDetail.qaId}">삭제</a>
					    </p>
					</c:if> --%>

					<p>
						<a href="adminQaFormList">목록</a>
						<a href="deleteAdminComment?qaId=${admin.qaId }">삭제</a>	
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>