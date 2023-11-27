<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/main/main_included_jiwon.css" />
<link rel="stylesheet" href="/resources/css/main/main_haeun.css" />
<div id="gnb-root">
	<div class="light-theme">
		<div class="_1knjz490">
			<div class="_1knjz491 _1s38h9c0" style="border-bottom-style: hidden;">
				<nav class="_1knjz49j _1s38h9c0">
					<ul class="_1knjz49l _1s38h9c5">
						<li class="_1knjz49n"><a
							class="_1knjz49o _1s38h9c4 _1s38h9c2 _1knjz49p"
							href="/postList?category=1"> 의류 </a></li>
						<li class="_1knjz49n"><a
							class="_1knjz49o _1s38h9c4 _1s38h9c2 undefined"
							href="/postList?category=2"> 전자기기 </a></li>
						<li class="_1knjz49n"><a
							class="_1knjz49o _1s38h9c4 _1s38h9c2 undefined"
							href="/postList?category=3"> 가구 </a></li>
						<li class="_1knjz49n"><a
							class="_1knjz49o _1s38h9c4 _1s38h9c2 undefined"
							href="/postList?category=4"> 도서 </a></li>
						<li class="_1knjz49n"><a
							class="_1knjz49o _1s38h9c4 _1s38h9c2 undefined"
							href="/postList?category=5"> 기타 </a></li>
					</ul>
				</nav>
				<div class="_1s38h9c1 _1s38h9c0"></div>
			</div>
		</div>
	</div>
</div>
<div class="div-haeun1">
	<div class="div-haeun2">
		<div class="div-haeun3">
			<a class="_1knjz492" href="/"> <span> <svg width="65"
						height="36" viewBox="0 0 65 36" fill="none"
						xmlns="http://www.w3.org/2000/svg">
							<image href="/resources/pic/img/cabbage_market_logo.png"
							width="65" height="34" />
						</svg>
			</span>
			</a>
			<div class="a-haeun1">
				<!-- 				<div class="_1s38h9c1 _1s38h9c0">
 -->
				<ul id="rollingNotice" class="rolling">
					<li><a href="#">Lorem ipsum dolor sit amet..</a></li>
					<li><a href="#">Lorem ipsum dolor sit amet, consectetur..</a></li>
					<li><a href="#">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit..</a></li>
				</ul>
				-->
			</div>
			<div class="div-haeun4">
				<span class="div-haeun5"> <input class="input-haeun1"
					type="text" id="searchInput" placeholder="물품이나 동네를 검색해보세요"
					autocomplete="off">
					<div class="input-group-append">
						<span class="input-group-text" id="clearSearchInput"
							style="cursor: pointer; display: none; height: 38px">&times;</span>
					</div>
					<ul class="list-group" id="searchResults"></ul> <a class="a-haeun2">
						<img class="img-haeun2" src="/resources/pic/img/cabbage_icon.png"
						width="16" height="17" alt="검색버튼 아이콘">
				</a>
				</span>
			</div>
			<div class="div-haeun6">
				<!-- <span> -->
				<c:if test="${not empty userId}">
					<div class="none-haeun" id="alrim">

						<ul class="none-haeun-ul" id="alrimList"
							style="max-height: 430px; overflow-y: auto;">
							<li
								style="margin: 0px; margin-left: 17px; margin-right: 17px; height: 36px; margin-top: 14px; display: flex; justify-content: space-between; align-items: center;">
								<span> 알림 </span>
								<button style="margin: 0;">
									<img class="img-haeun4" src="/resources/pic/img/user_icon.png"
										width="23" height="25" alt="마이페이지 버튼 이미지">
								</button>
								<button style="margin: 0;">
									<img class="img-haeun4" src="/resources/pic/img/user_icon.png"
										width="23" height="25" alt="마이페이지 버튼 이미지">
								</button>
							</li>
						</ul>
					</div>
					<button type="button" class="button-haeun1"
						onclick="toggleDiv('alrim')">
						<img class="img-haeun4" src="/resources/pic/img/noti_icon.png"
							width="23" height="25" alt="마이페이지 버튼 이미지">
						<div id="someElement">
							<span class="alrim" id="alrimCount"> 0 </span>
						</div>
					</button>
				</c:if>
				<c:if test="${empty userId}">
					<a type="button" href="/user/login"
						class="button-haeun1">
						<img class="img-haeun4" src="/resources/pic/img/user_icon.png"
							width="23" height="25" alt="마이페이지 버튼 이미지">
					</a>

				</c:if>
				<c:if test="${not empty userId}">
					<div class="none-haeun" id="my">
						<!-- style="z-index: 1000; position:fixed; padding-top:120px;" -->
						<ul class="none-haeun-ul">
							<li class="none-haeun-li"><a class="none-haeun-a" href="/user/myInfo">
									마이페이지 </a></li>
							<li style="margin-top: 4px;"><a class="none-haeun-a"
								onclick="logout()" href="/user/logout"> 로그아웃 </a></li>
						</ul>
					</div>

					<button type="button" onclick="toggleDiv('my')"
						class="button-haeun1">
						<img class="img-haeun4" src="/resources/pic/img/user_icon.png"
							width="23" height="25" alt="마이페이지 버튼 이미지">
					</button>

				</c:if>

				<!-- </span> -->
				<a class="button-haeun1" href="/chat">
					<img class="img-haeun3" src="/resources/pic/img/cabbage_icon.png"
						alt="배추톡 버튼 이미지"> 배추톡
				</a>
				<!-- <a class="a-haeun3" href="">
						<img class="img-hauen4" src="/resources/pic/img/cabbage_icon.png" width="23" height="25" alt="마이페이지 버튼 이미지">
						"MY"
					</a> -->
				<a class="button-haeun1" href="/post/create">
					<img class="img-haeun3" src="/resources/pic/img/cabbage_icon.png"
						alt="마이페이지 버튼 이미지"> 글쓰기
				</a>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/main/header.js" type="text/javascript"></script>