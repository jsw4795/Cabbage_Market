<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="/resources/css/main/showAll.css" />
<link rel="stylesheet" href="/resources/css/main/main_included_jiwon.css" />
<link rel="stylesheet" href="/resources/css/main/main_haeun.css" />

</head>
<body class="hoian-kr">
	<noscript>
		<img height="1" width="1" style="display:none" alt="facebook" src="https://www.facebook.com/tr?id=992961397411651&ev=PageView&noscript=1" />
	</noscript>
	
	<!-- header -->
	<%@ include file="/WEB-INF/views/main/inc/header.jsp" %>
	
	<section id="content">
  		<h1 class="head-title" id="hot-articles-head-title">
  			<c:if test="${type == 'RV' }">
  			<img src="/resources/pic/img/hot_icon.gif" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기" data-type="${type }">
	        &nbsp;지금 인기 있어요!&nbsp;
	        <img src="/resources/pic/img/hot_icon.gif" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기" >
  			</c:if>
  			<c:if test="${type == 'RI' }">
  			<img src="/resources/pic/img/rcmd_icon.png" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기" data-type="${type }">
	        &nbsp;이 물건 필요하세요?&nbsp;
	        <img src="/resources/pic/img/rcmd_icon.png" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기">
	        </c:if>
	        <c:if test="${type == 'N' }">
  			<img src="/resources/pic/img/new_icon.gif" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기" data-type="${type }">
	        &nbsp;방금 올라 왔어요!&nbsp;
	        <img src="/resources/pic/img/new_icon.gif" width="40px;" height="aute;" style="vertical-align:sub;" alt="인기">
	        </c:if>
  		</h1>
		<section class="cards-wrap">
			<c:forEach var="post" items="${list }">
	    	<article class="card-top ">
	  			<a class="card-link " data-event-label="675477198" href="/post/getPost/${post.postId }">
	    			<div class="card-photo ">
	        			<img src="/resources/pic/postPic/${post.fileName }" onerror="this.onerror=null; this.src='/resources/pic/img/cabbage_icon.png'">
	    			</div>
	   				<div class="card-desc">
	     				<h2 class="card-title">	
							${post.postTitle }
						</h2>
		      			<div class="card-price ">
		        			<fmt:formatNumber type="number" value="${post.postPrice }" />원
		      			</div>
					    <div class="card-region-name">
		        			${post.userNickname }
					    </div>
	      				<div class="card-counts">
					        <span>
					        	<img width="15" height="15" src="https://img.icons8.com/material-outlined/100/like--v1.png" alt="like--v1"/>
					           ${post.postWishCount }
					        </span>
					        ∙
					        <span>
					        	<img width="15" height="15" src="https://img.icons8.com/ios-filled/50/chat.png" alt="chat"/>
					            ${post.chatRoomCount }
					        </span>
						</div>
			   		</div>
				</a>
			</article>
			</c:forEach>
		</section>
	</section>
	<div id="footer-root">
		<div class="light-theme">
			<footer class="_1trxeqs0">
				<div class="_1trxeqs1 _1y9kelh2">
					<section class="_1trxeqsi">
						<section class="_1trxeqs2">
							<div class="_1trxeqs3">
								당근 앱 다운로드
							</div>
							<div class="_1trxeqs7">
								<a class="_1trxeqs4 _1trxeqsp" target="_blank" href="https://daangn.onelink.me/oWdR/duyc3blt?afdp=karrot://open?from=website&amp;deep_link_value=karrot://open?from=website">
									<div class="_1trxeqs5">
										iOS
									</div>
									<span class="_1trxeqs6">
										<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true" width="16" height="16">
											<path d="M19.0189 5.25376C18.9947 5.21362 18.9667 5.17515 18.9348 5.13887C18.9228 5.12522 18.9103 5.11198 18.8974 5.09918C18.7369 4.9395 18.5255 4.862 18.3155 4.86665L7.0002 4.86662C6.55837 4.86662 6.20019 5.22479 6.20019 5.66661C6.20019 6.10844 6.55836 6.46662 7.00019 6.46662L16.4018 6.46665L5.10101 17.7674C4.78859 18.0799 4.78859 18.5864 5.10101 18.8988C5.41343 19.2112 5.91996 19.2112 6.23238 18.8988L17.5336 7.59763V17C17.5336 17.4418 17.8917 17.8 18.3336 17.8C18.7754 17.8 19.1336 17.4418 19.1336 17V5.66665C19.1336 5.51558 19.0917 5.37429 19.0189 5.25376Z" fill="currentColor">
											</path>
										</svg>
									</span>
									<div class="_1trxeqs8">
										<svg width="147" height="44" viewBox="0 0 147 44" fill="none" xmlns="http://www.w3.org/2000/svg">
											<rect width="147" height="44" rx="8">
											</rect>
											<path d="M54.92 17.13L51.49 27H53.66L54.388 24.606H57.874L58.602 27H60.772L57.342 17.13H54.92ZM54.864 23.066L56.068 19.104H56.194L57.398 23.066H54.864ZM64.2499 19.468H62.2479V29.492H64.2499V25.796H64.3759C64.7539 26.622 65.5939 27.112 66.6299 27.112C68.5339 27.112 69.6819 25.656 69.6819 23.234V23.22C69.6819 20.826 68.5059 19.356 66.6299 19.356C65.5659 19.356 64.7679 19.832 64.3759 20.63H64.2499V19.468ZM64.2219 23.234V23.22C64.2219 21.848 64.8939 21.008 65.9439 21.008C67.0079 21.008 67.6519 21.848 67.6519 23.22V23.234C67.6519 24.62 66.9939 25.46 65.9439 25.46C64.8939 25.46 64.2219 24.62 64.2219 23.234ZM73.3144 19.468H71.3124V29.492H73.3144V25.796H73.4404C73.8184 26.622 74.6584 27.112 75.6944 27.112C77.5984 27.112 78.7464 25.656 78.7464 23.234V23.22C78.7464 20.826 77.5704 19.356 75.6944 19.356C74.6304 19.356 73.8324 19.832 73.4404 20.63H73.3144V19.468ZM73.2864 23.234V23.22C73.2864 21.848 73.9584 21.008 75.0084 21.008C76.0724 21.008 76.7164 21.848 76.7164 23.22V23.234C76.7164 24.62 76.0584 25.46 75.0084 25.46C73.9584 25.46 73.2864 24.62 73.2864 23.234ZM85.8045 24.34V24.27H83.8165V24.368C83.9425 26.118 85.4265 27.252 87.7785 27.252C90.2425 27.252 91.7685 26.02 91.7685 24.06C91.7685 22.52 90.8585 21.68 88.7725 21.246L87.7225 21.036C86.5605 20.798 86.0845 20.42 86.0845 19.776V19.762C86.0845 19.034 86.7565 18.558 87.7785 18.558C88.8145 18.558 89.5005 19.048 89.6125 19.748L89.6265 19.832H91.5725L91.5585 19.748C91.4325 18.096 90.0885 16.878 87.7785 16.878C85.5945 16.878 84.0125 18.096 84.0125 19.93C84.0125 21.428 84.8945 22.38 86.9525 22.8L87.9885 23.01C89.2205 23.262 89.6965 23.626 89.6965 24.284C89.6965 25.04 88.9405 25.572 87.8345 25.572C86.6865 25.572 85.8885 25.068 85.8045 24.34ZM92.8998 19.468V20.98H94.0618V24.97C94.0618 26.426 94.8038 27.028 96.6238 27.028C97.0158 27.028 97.3798 26.986 97.6318 26.944V25.46C97.4358 25.474 97.2958 25.488 97.0438 25.488C96.3578 25.488 96.0778 25.194 96.0778 24.508V20.98H97.6318V19.468H96.0778V17.676H94.0618V19.468H92.8998ZM98.921 23.22V23.234C98.921 25.684 100.321 27.154 102.631 27.154C104.955 27.154 106.341 25.698 106.341 23.234V23.22C106.341 20.798 104.927 19.314 102.631 19.314C100.335 19.314 98.921 20.798 98.921 23.22ZM100.965 23.234V23.22C100.965 21.75 101.567 20.868 102.631 20.868C103.681 20.868 104.297 21.75 104.297 23.22V23.234C104.297 24.718 103.695 25.586 102.631 25.586C101.567 25.586 100.965 24.718 100.965 23.234ZM109.969 19.468H107.967V27H109.969V22.786C109.969 21.722 110.683 21.078 111.817 21.078C112.125 21.078 112.433 21.12 112.741 21.19V19.44C112.545 19.384 112.251 19.356 111.985 19.356C111.019 19.356 110.333 19.832 110.095 20.644H109.969V19.468ZM117.369 27.154C119.567 27.154 120.533 25.88 120.771 24.942L120.785 24.872H118.923L118.909 24.914C118.769 25.208 118.279 25.67 117.411 25.67C116.347 25.67 115.689 24.942 115.661 23.71H120.841V23.094C120.841 20.812 119.483 19.314 117.285 19.314C115.087 19.314 113.687 20.84 113.687 23.234V23.248C113.687 25.656 115.073 27.154 117.369 27.154ZM115.689 22.464C115.801 21.4 116.445 20.812 117.313 20.812C118.181 20.812 118.811 21.372 118.923 22.464H115.689Z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M39.8838 16.2426C42.0624 16.2426 43.4555 18.3729 43.4555 18.3729C43.4555 18.3729 41.3303 19.5383 41.3303 22.0694C41.3303 25.0734 44 25.9473 44 25.9473C44 25.9473 41.8928 31 39.5268 31C38.1963 31 38.1074 30.2265 36.3393 30.2265C34.8038 30.2265 34.286 31 33.1164 31C30.8839 31 28 26.0748 28 22.0694C28 17.9088 30.9198 16.2426 32.7501 16.2426C34.3574 16.2426 35.0268 17.1985 36.3213 17.1985C37.4108 17.1985 38.2682 16.2426 39.8838 16.2426ZM39.5093 12C39.8304 14.0393 38.0001 16.5614 35.8127 16.4794C35.4912 13.8846 37.8485 12.1369 39.5093 12Z">
											</path>
										</svg>
									</div>
								</a>
								<a class="_1trxeqs4 _1trxeqsp" target="_blank" href="https://daangn.onelink.me/oWdR/duyc3blt?afdp=karrot://open?from=website&amp;deep_link_value=karrot://open?from=website">
									<div class="_1trxeqs5">
										Android
									</div>
									<span class="_1trxeqs6">
										<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true" width="16" height="16">
											<path d="M19.0189 5.25376C18.9947 5.21362 18.9667 5.17515 18.9348 5.13887C18.9228 5.12522 18.9103 5.11198 18.8974 5.09918C18.7369 4.9395 18.5255 4.862 18.3155 4.86665L7.0002 4.86662C6.55837 4.86662 6.20019 5.22479 6.20019 5.66661C6.20019 6.10844 6.55836 6.46662 7.00019 6.46662L16.4018 6.46665L5.10101 17.7674C4.78859 18.0799 4.78859 18.5864 5.10101 18.8988C5.41343 19.2112 5.91996 19.2112 6.23238 18.8988L17.5336 7.59763V17C17.5336 17.4418 17.8917 17.8 18.3336 17.8C18.7754 17.8 19.1336 17.4418 19.1336 17V5.66665C19.1336 5.51558 19.0917 5.37429 19.0189 5.25376Z" fill="currentColor">
											</path>
										</svg>
									</span>
									<div class="_1trxeqs8">
										<svg width="147" height="44" viewBox="0 0 147 44" fill="none" xmlns="http://www.w3.org/2000/svg">
											<rect width="147" height="44" rx="8" fill="#EAEBEE">
											</rect>
											<path d="M44.756 22.044V22.058C44.756 25.278 46.562 27.252 49.488 27.252C52.19 27.252 53.87 25.614 53.87 22.996V21.736H49.726V23.248H51.854V23.43C51.812 24.676 50.874 25.502 49.53 25.502C47.892 25.502 46.87 24.186 46.87 22.044V22.03C46.87 19.93 47.85 18.628 49.446 18.628C50.594 18.628 51.434 19.216 51.714 20.196L51.728 20.266H53.786L53.772 20.196C53.478 18.222 51.77 16.878 49.446 16.878C46.576 16.878 44.756 18.88 44.756 22.044ZM55.2667 23.22V23.234C55.2667 25.684 56.6667 27.154 58.9767 27.154C61.3007 27.154 62.6867 25.698 62.6867 23.234V23.22C62.6867 20.798 61.2727 19.314 58.9767 19.314C56.6807 19.314 55.2667 20.798 55.2667 23.22ZM57.3107 23.234V23.22C57.3107 21.75 57.9127 20.868 58.9767 20.868C60.0267 20.868 60.6427 21.75 60.6427 23.22V23.234C60.6427 24.718 60.0407 25.586 58.9767 25.586C57.9127 25.586 57.3107 24.718 57.3107 23.234ZM63.9484 23.22V23.234C63.9484 25.684 65.3484 27.154 67.6584 27.154C69.9824 27.154 71.3684 25.698 71.3684 23.234V23.22C71.3684 20.798 69.9544 19.314 67.6584 19.314C65.3624 19.314 63.9484 20.798 63.9484 23.22ZM65.9924 23.234V23.22C65.9924 21.75 66.5944 20.868 67.6584 20.868C68.7084 20.868 69.3244 21.75 69.3244 23.22V23.234C69.3244 24.718 68.7224 25.586 67.6584 25.586C66.5944 25.586 65.9924 24.718 65.9924 23.234ZM72.616 23.052V23.066C72.616 25.208 73.778 26.678 75.668 26.678C76.718 26.678 77.516 26.244 77.922 25.446H78.048V26.846C78.048 27.728 77.432 28.218 76.368 28.218C75.472 28.218 74.954 27.924 74.842 27.49V27.462H72.868V27.49C73.022 28.778 74.24 29.646 76.326 29.646C78.594 29.646 80.036 28.526 80.036 26.762V19.468H78.048V20.7H77.95C77.544 19.86 76.732 19.356 75.71 19.356C73.778 19.356 72.616 20.84 72.616 23.052ZM74.66 23.066V23.052C74.66 21.806 75.276 20.966 76.354 20.966C77.418 20.966 78.076 21.806 78.076 23.052V23.066C78.076 24.298 77.432 25.138 76.354 25.138C75.262 25.138 74.66 24.298 74.66 23.066ZM82.1148 16.598V27H84.1168V16.598H82.1148ZM89.4917 27.154C91.6897 27.154 92.6557 25.88 92.8937 24.942L92.9077 24.872H91.0457L91.0317 24.914C90.8917 25.208 90.4017 25.67 89.5337 25.67C88.4697 25.67 87.8117 24.942 87.7837 23.71H92.9637V23.094C92.9637 20.812 91.6057 19.314 89.4077 19.314C87.2097 19.314 85.8097 20.84 85.8097 23.234V23.248C85.8097 25.656 87.1957 27.154 89.4917 27.154ZM87.8117 22.464C87.9237 21.4 88.5677 20.812 89.4357 20.812C90.3037 20.812 90.9337 21.372 91.0457 22.464H87.8117ZM102.53 17.13H98.4556V27H100.528V23.892H102.53C104.602 23.892 106.002 22.548 106.002 20.518V20.504C106.002 18.474 104.602 17.13 102.53 17.13ZM100.528 22.282V18.768H102.026C103.202 18.768 103.902 19.384 103.902 20.518V20.532C103.902 21.652 103.202 22.282 102.026 22.282H100.528ZM107.763 16.598V27H109.765V16.598H107.763ZM113.88 27.112C114.86 27.112 115.658 26.692 116.036 26.006H116.162V27H118.136V21.862C118.136 20.252 117.002 19.314 115 19.314C113.11 19.314 111.864 20.182 111.71 21.498V21.568H113.544L113.558 21.54C113.726 21.092 114.174 20.84 114.902 20.84C115.714 20.84 116.162 21.204 116.162 21.862V22.478L114.342 22.59C112.466 22.702 111.43 23.486 111.43 24.844V24.858C111.43 26.23 112.438 27.112 113.88 27.112ZM113.376 24.732V24.718C113.376 24.172 113.782 23.85 114.65 23.794L116.162 23.71V24.256C116.162 25.054 115.476 25.656 114.552 25.656C113.852 25.656 113.376 25.306 113.376 24.732ZM121.662 19.468H119.464L122.11 27L122.04 27.294C121.9 27.882 121.494 28.148 120.78 28.148C120.598 28.148 120.402 28.148 120.262 28.134V29.632C120.5 29.646 120.752 29.66 120.976 29.66C122.838 29.66 123.832 28.988 124.504 26.986L127.066 19.468H124.952L123.384 25.18H123.244L121.662 19.468Z" fill="#212124">
											</path>
											<path fill-rule="evenodd" clip-rule="evenodd" d="M20.5227 32C20.2061 31.9138 20 31.596 20 31.1044V14.8742C20 14.4188 20.1745 14.1117 20.4511 14L28.3418 23.0448L20.5227 32ZM21.6089 31.6555L31.1069 26.2143L28.7935 23.5626L21.6089 31.6555ZM31.1723 19.8032L21.8067 14.4366L28.8072 22.5119L31.1723 19.8032ZM31.8077 20.1673L35.4766 22.2696C36.1713 22.6677 36.1776 23.3093 35.4766 23.7109L31.7149 25.866L29.2613 23.0357L31.8077 20.1673Z" fill="#212124">
											</path>
										</svg>
									</div>
								</a>
							</div>
						</section>
						<nav aria-label="footer" class="_1trxeqs9">
							<ul class="_1trxeqsa">
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://www.daangn.com/fleamarket/">
										중고거래
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://www.daangn.com/kr/nearby-stores/">
										동네업체
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://www.daangn.com/kr/jobs/">
										당근알바
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://www.daangn.com/kr/realty/">
										부동산 직거래
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://www.daangn.com/kr/car/">
										중고차 직거래
									</a>
								</li>
							</ul>
							<ul class="_1trxeqsa">
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://business.daangn.com">
										당근비즈니스
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://chat.daangn.com/onboarding">
										채팅하기
									</a>
								</li>
							</ul>
							<ul class="_1trxeqsa">
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://cs.kr.karrotmarket.com/wv/faqs">
										자주 묻는 질문
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://about.daangn.com">
										회사 소개
									</a>
								</li>
								<li class="_1trxeqsq">
									<a class="undefined _1trxeqsp" target="_blank" href="https://about.daangn.com/jobs">
										인재 채용
									</a>
								</li>
							</ul>
						</nav>
					</section>
					<section class="_1trxeqsj">
						<section class="_1trxeqsb">
							<section class="_1trxeqsc">
								<div class="_1s38h9c0">
									<span>
										<b>대표</b> 김하은천재만재
									</span>
									<span class="_1trxeqsd">
										<svg width="2" height="10" viewBox="0 0 2 10" fill="none" xmlns="http://www.w3.org/2000/svg">
											<rect opacity="0.5" x="0.535767" width="1.03646" height="10" fill="#868B94">
											</rect>
										</svg>
									</span>
									<span>
										<b>사업자번호</b> <!-- -->000-00-00000
									</span>
								</div>
								<div>
									<b>직업정보제공사업 신고번호</b> <!-- -->J191919191919
								</div>
								<address class="_1trxeqse">
									<div>
										<b>주소</b> <!-- -->서울특별시 팔로구 아날로로 30길 28, 1004호 (배추서비스)
									</div>
									<div>
										<span>
											<b>전화</b> <!-- -->8888-8888
										</span>
										<span class="_1trxeqsd">
											<svg width="2" height="10" viewBox="0 0 2 10" fill="none" xmlns="http://www.w3.org/2000/svg">
												<rect opacity="0.5" x="0.535767" width="1.03646" height="10" fill="#868B94">
												</rect>
											</svg>
										</span>
										<span>
											<b>고객문의</b> <!-- -->cs@bachuservice.com
										</span>
									</div>
								</address>
							</section>
							<section class="_1trxeqsk">
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="mailto:contact@daangn.com">
									제휴 문의
								</a>
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="mailto:ad@daangn.com">
									광고 문의
								</a>
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="mailto:pr@daangn.com">
									PR 문의
								</a>
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="mailto:ir@daangn.com">
									IR 문의
								</a>
							</section>
						</section>
						<section class="_1trxeqsl">
							<a class="_1trxeqsm _1trxeqsp" target="_blank" aria-label="facebook" href="https://www.facebook.com/daangn">
								<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M22.7158 12.0458C22.7158 6.21012 18.0165 1.48242 12.2158 1.48242C6.41515 1.48242 1.71582 6.21012 1.71582 12.0458C1.71582 17.3181 5.55649 21.689 10.5732 22.4824V15.0974H7.90382V12.0458H10.5732V9.71716C10.5732 7.06928 12.1412 5.60918 14.5398 5.60918C15.6878 5.60918 16.8918 5.81575 16.8918 5.81575V8.412H15.5665C14.2645 8.412 13.8538 9.22421 13.8538 10.0599V12.0411H16.7658L16.2992 15.0927H13.8538V22.473C18.8752 21.6843 22.7158 17.3181 22.7158 12.0458Z" fill="#868B94">
									</path>
								</svg>
							</a>
							<a class="_1trxeqsm _1trxeqsp" target="_blank" aria-label="instagram" href="https://www.instagram.com/daangnmarket/">
								<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M11.7928 3.67695C14.6079 3.67695 14.9413 3.68727 16.053 3.73611C17.081 3.78129 17.6392 3.94668 18.0107 4.08567C18.5028 4.26984 18.854 4.48988 19.223 4.84513C19.5919 5.20037 19.8204 5.53861 20.0116 6.01245C20.156 6.37024 20.3277 6.9078 20.3746 7.8976C20.4253 8.96817 20.4361 9.28924 20.4361 12.0001C20.4361 14.7109 20.4253 15.0319 20.3746 16.1025C20.3277 17.0923 20.156 17.6299 20.0116 17.9877C19.8204 18.4615 19.5919 18.7997 19.223 19.155C18.854 19.5102 18.5028 19.7303 18.0107 19.9144C17.6392 20.0534 17.081 20.2188 16.053 20.264C14.9415 20.3128 14.6081 20.3232 11.7928 20.3232C8.97759 20.3232 8.64417 20.3128 7.53264 20.264C6.50472 20.2188 5.94648 20.0534 5.57498 19.9144C5.08287 19.7303 4.73162 19.5102 4.36271 19.155C3.99381 18.7997 3.76531 18.4615 3.57409 17.9877C3.42971 17.6299 3.25796 17.0923 3.21105 16.1025C3.16032 15.0319 3.14961 14.7109 3.14961 12.0001C3.14961 9.28924 3.16032 8.96817 3.21105 7.89764C3.25796 6.9078 3.42971 6.37024 3.57409 6.01245C3.76531 5.53861 3.99381 5.20037 4.36271 4.84513C4.73162 4.48988 5.08287 4.26984 5.57498 4.08567C5.94648 3.94668 6.50472 3.78129 7.5326 3.73611C8.64434 3.68727 8.97776 3.67695 11.7928 3.67695ZM11.7928 1.84766C8.92955 1.84766 8.57056 1.85934 7.44605 1.90875C6.32384 1.95808 5.55749 2.12968 4.88684 2.38066C4.19356 2.64011 3.60561 2.98726 3.0195 3.55166C2.43339 4.11606 2.0729 4.68223 1.80347 5.34984C1.54282 5.99565 1.36463 6.73362 1.3134 7.81426C1.26209 8.89708 1.25 9.24282 1.25 12.0001C1.25 14.7573 1.26209 15.103 1.3134 16.1859C1.36463 17.2665 1.54282 18.0045 1.80347 18.6503C2.0729 19.3178 2.43339 19.8841 3.0195 20.4485C3.60561 21.0129 4.19356 21.36 4.88684 21.6195C5.55749 21.8704 6.32384 22.042 7.44605 22.0914C8.57056 22.1408 8.92955 22.1524 11.7928 22.1524C14.6561 22.1524 15.0152 22.1408 16.1396 22.0914C17.2618 22.042 18.0282 21.8704 18.6988 21.6195C19.3921 21.36 19.9801 21.0129 20.5662 20.4485C21.1523 19.8841 21.5128 19.3179 21.7822 18.6503C22.0428 18.0045 22.221 17.2665 22.2723 16.1859C22.3236 15.103 22.3357 14.7573 22.3357 12.0001C22.3357 9.24282 22.3236 8.89708 22.2723 7.81426C22.221 6.73362 22.0428 5.99565 21.7822 5.34984C21.5128 4.68223 21.1523 4.11606 20.5662 3.55166C19.9801 2.98726 19.3921 2.64011 18.6988 2.38066C18.0282 2.12968 17.2618 1.95808 16.1396 1.90875C15.0152 1.85934 14.6561 1.84766 11.7928 1.84766ZM11.7928 6.78666C8.80283 6.78666 6.37892 9.12079 6.37892 12.0001C6.37892 14.8793 8.80283 17.2135 11.7928 17.2135C14.7828 17.2135 17.2068 14.8793 17.2068 12.0001C17.2068 9.12079 14.7828 6.78666 11.7928 6.78666ZM11.7928 15.3842C9.85196 15.3842 8.27853 13.869 8.27853 12.0001C8.27853 10.1311 9.85196 8.61591 11.7928 8.61591C13.7337 8.61591 15.3071 10.1311 15.3071 12.0001C15.3071 13.869 13.7337 15.3842 11.7928 15.3842ZM18.6858 6.58068C18.6858 7.25353 18.1194 7.79899 17.4206 7.79899C16.7219 7.79899 16.1555 7.25353 16.1555 6.58068C16.1555 5.90784 16.7219 5.36242 17.4206 5.36242C18.1194 5.36242 18.6858 5.90784 18.6858 6.58068Z" fill="#868B94">
									</path>
								</svg>
							</a>
							<a class="_1trxeqsm _1trxeqsp" target="_blank" aria-label="youtube" href="https://www.youtube.com/channel/UC8tsBsQBuF7QybxgLmStihA">
								<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_1492_32246)">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M21.6404 3.5339C22.6684 3.82139 23.4789 4.66332 23.7557 5.73112C24.2697 7.68193 24.2499 11.7478 24.2499 11.7478C24.2499 11.7478 24.2499 15.7932 23.7557 17.744C23.4789 18.8118 22.6684 19.6537 21.6404 19.9412C19.7623 20.4545 12.2499 20.4545 12.2499 20.4545C12.2499 20.4545 4.75739 20.4545 2.85954 19.9206C1.83154 19.6332 1.021 18.7912 0.744232 17.7234C0.25 15.7932 0.25 11.7273 0.25 11.7273C0.25 11.7273 0.25 7.68193 0.744232 5.73112C1.021 4.66332 1.85131 3.80086 2.85954 3.51337C4.73763 3 12.2499 3 12.2499 3C12.2499 3 19.7623 3 21.6404 3.5339ZM9.85784 7.99009L16.1049 11.7274L9.85784 15.4647V7.99009Z" fill="#868B94">
										</path>
									</g>
									<defs>
										<clipPath id="clip0_1492_32246">
											<rect width="24" height="24" fill="white" transform="translate(0.25)">
											</rect>
										</clipPath>
									</defs>
								</svg>
							</a>
							<a class="_1trxeqsm _1trxeqsp" target="_blank" aria-label="blog" href="https://blog.naver.com/daangn">
								<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_1492_32254)">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M2.86619 3H21.6338C23.0736 3 24.2515 4.17222 24.25 5.60362V16.1668C24.25 17.5982 23.0736 18.7704 21.6338 18.7704H14.2351C14.2351 18.7704 12.6961 22.6376 12.1768 22.6376C11.6588 22.6376 10.2353 18.7704 10.2353 18.7704H2.86619C1.42788 18.7704 0.25 17.5982 0.25 16.1668V5.60362C0.25 4.17222 1.42788 3 2.86619 3ZM5.66291 13.3438C6.2844 13.3438 6.85411 13.1685 7.22552 12.7518C7.59842 12.335 7.78191 11.9404 7.78191 11.2512C7.78191 10.6179 7.54959 10.0451 7.23292 9.67987C6.91477 9.31318 6.38355 8.99509 5.87303 9.01276C5.2767 9.03191 4.77062 9.14236 4.38885 9.46633H4.37109V7.12779H2.96237V13.2436H4.37109V12.9462H4.38885C4.6922 13.1759 5.10209 13.3438 5.66291 13.3438ZM8.81329 13.2893H10.2501V9.55175C10.1332 7.12337 8.11929 7.00115 8.11929 7.00115V8.51649C8.11929 8.51649 8.81329 8.63135 8.81329 9.50462V13.2893ZM15.3612 12.8622C15.5935 12.6472 15.7681 12.4028 15.8894 12.1289C16.0093 11.8564 16.0685 11.5663 16.0714 11.2585C16.0714 10.9507 16.0108 10.6606 15.8909 10.3867C15.7696 10.1128 15.595 9.86836 15.3626 9.65336C15.1333 9.4413 14.8714 9.27784 14.5754 9.16444C14.278 9.05105 13.9658 8.99509 13.6358 8.99509C13.3117 8.99509 13.0039 9.05105 12.7109 9.16444C12.4179 9.27784 12.156 9.43983 11.9237 9.65336C11.6855 9.8772 11.5064 10.1246 11.3836 10.3956C11.2608 10.6665 11.2001 10.9552 11.2001 11.2585C11.2001 11.5619 11.2608 11.8505 11.3821 12.12C11.5049 12.391 11.684 12.6384 11.9222 12.8622C12.1531 13.0743 12.415 13.2378 12.7095 13.3511C13.0024 13.4645 13.3102 13.522 13.6343 13.522C13.9643 13.522 14.278 13.4645 14.5739 13.3511C14.8714 13.2378 15.1333 13.0743 15.3612 12.8622ZM20.8525 14.921C21.3349 14.4659 21.5391 13.8106 21.5391 12.7371V9.0378H20.1393V9.37503H20.1215C19.7812 9.06578 19.4334 8.93324 18.88 8.93324C18.2629 8.93324 17.7228 9.13794 17.3455 9.57678C16.9667 10.0142 16.7773 10.6076 16.7773 11.3528C16.7773 12.0184 16.946 12.5486 17.2863 12.9447C17.6252 13.3408 18.1268 13.5529 18.7054 13.5529C19.3298 13.5529 19.7989 13.3924 20.12 12.9506H20.1378V13.2348C20.1393 13.9741 19.3506 14.3496 18.7779 14.2922V15.4025C19.4645 15.4997 20.2798 15.4614 20.8525 14.921ZM12.9462 10.5489C13.1356 10.356 13.365 10.2603 13.6328 10.2603C13.9051 10.2603 14.1374 10.356 14.3313 10.5489C14.5251 10.7418 14.6213 10.976 14.6213 11.2499C14.6213 11.5238 14.5251 11.7579 14.3313 11.9508C14.1374 12.1423 13.9051 12.2395 13.6328 12.2395C13.365 12.2395 13.1356 12.1438 12.9462 11.9508C12.7568 11.7579 12.6606 11.5252 12.6606 11.2499C12.6606 10.976 12.7553 10.7418 12.9462 10.5489ZM4.64057 10.5577C4.82998 10.3662 5.05934 10.269 5.32717 10.269C5.59945 10.269 5.83177 10.3648 6.02561 10.5577C6.21946 10.7506 6.31564 10.9847 6.31564 11.2587C6.31564 11.534 6.21946 11.7667 6.02561 11.9596C5.83177 12.1525 5.59945 12.2497 5.32717 12.2497C5.05934 12.2497 4.83146 12.1525 4.64057 11.9596C4.44968 11.7667 4.35498 11.5326 4.35498 11.2587C4.35498 10.9847 4.44968 10.7506 4.64057 10.5577ZM19.1714 10.269C18.9036 10.269 18.6742 10.3662 18.4833 10.5577C18.2939 10.7506 18.1978 10.9847 18.1978 11.2587C18.1978 11.5326 18.2939 11.7667 18.4833 11.9596C18.6742 12.1525 18.9036 12.2497 19.1714 12.2497C19.4422 12.2497 19.676 12.1525 19.8699 11.9596C20.0637 11.7667 20.1599 11.534 20.1599 11.2587C20.1599 10.9847 20.0622 10.7506 19.8699 10.5577C19.676 10.3648 19.4437 10.269 19.1714 10.269Z" fill="#868B94">
										</path>
									</g>
									<defs>
										<clipPath id="clip0_1492_32254">
											<rect width="24" height="24" fill="white" transform="translate(0.25)">
											</rect>
										</clipPath>
									</defs>
								</svg>
							</a>
							<div>
								<label class="_1trxeqsn" for="label-select-nation">
									<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true" width="16" height="16">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M12 2.8002C6.91893 2.8002 2.79995 6.91918 2.79995 12.0002C2.79995 17.0812 6.91893 21.2002 12 21.2002C17.081 21.2002 21.2 17.0812 21.2 12.0002C21.2 6.91918 17.081 2.8002 12 2.8002ZM1.19995 12.0002C1.19995 6.03552 6.03528 1.2002 12 1.2002C17.9646 1.2002 22.8 6.03552 22.8 12.0002C22.8 17.9649 17.9646 22.8002 12 22.8002C6.03528 22.8002 1.19995 17.9649 1.19995 12.0002Z" fill="currentColor">
										</path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M11.4618 22.5921C5.2144 16.9126 5.2144 7.08767 11.4618 1.4082L12.5381 2.59211C6.98897 7.63676 6.98897 16.3636 12.5381 21.4082L11.4618 22.5921Z" fill="currentColor">
										</path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M12.5381 22.5921C18.7855 16.9126 18.7855 7.08767 12.5381 1.4082L11.4618 2.59211C17.0109 7.63676 17.0109 16.3636 11.4618 21.4082L12.5381 22.5921Z" fill="currentColor">
										</path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M1.69995 9.0002C1.69995 8.55837 2.05812 8.2002 2.49995 8.2002H21.5C21.9418 8.2002 22.2999 8.55837 22.2999 9.0002C22.2999 9.44202 21.9418 9.8002 21.5 9.8002H2.49995C2.05812 9.8002 1.69995 9.44202 1.69995 9.0002Z" fill="currentColor">
										</path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M1.69995 15.0002C1.69995 14.5584 2.05812 14.2002 2.49995 14.2002H21.5C21.9418 14.2002 22.2999 14.5584 22.2999 15.0002C22.2999 15.442 21.9418 15.8002 21.5 15.8002H2.49995C2.05812 15.8002 1.69995 15.442 1.69995 15.0002Z" fill="currentColor">
										</path>
									</svg>
									<select id="label-select-nation" class="_1trxeqso">
										<option value="kr" selected="">
											한국
										</option>
										<option value="https://uk.karrotmarket.com">
											영국
										</option>
										<option value="https://ca.karrotmarket.com">
											캐나다
										</option>
										<option value="https://us.karrotmarket.com">
											미국
										</option>
										<option value="https://jp.karrotmarket.com">
											일본
										</option>
									</select>
									<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true" width="16" height="16">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M2.93427 7.43427C3.24669 7.12185 3.75322 7.12185 4.06564 7.43427L12 15.3686L19.9343 7.43427C20.2467 7.12185 20.7532 7.12185 21.0656 7.43427C21.3781 7.74669 21.3781 8.25322 21.0656 8.56564L12.5656 17.0656C12.2532 17.3781 11.7467 17.3781 11.4343 17.0656L2.93427 8.56564C2.62185 8.25322 2.62185 7.74669 2.93427 7.43427Z" fill="currentColor">
										</path>
									</svg>
								</label>
							</div>
						</section>
						<section class="_1trxeqsf">
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="https://www.daangn.com/policy/terms">
									이용약관
								</a>
							</div>
							<div class="_1trxeqsg _1trxeqsh">
								<a class="_1trxeqsg _1trxeqsh _1trxeqsp" target="_blank" href="https://privacy.daangn.com/">
									개인정보처리방침
								</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="https://www.daangn.com/policy/location">
									위치기반서비스 이용약관
								</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="https://www.daangn.com/wv/faqs/3994">
									이용자보호 비전과 계획
								</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank" href="https://www.daangn.com/wv/faqs/9010">
									청소년보호정책
								</a>
							</div>
						</section>
					</section>
				</div>
			</footer>
		</div>
	</div>

	<div id="fb-root" class=" fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div>
			</div>
		</div>
	</div>
	
<script>
	var curPage = 1; //페이지 초기값
	var isLoading = false; //현재 페이지가 로딩중인지 여부
	 
	$(window).on("scroll", function() {
		var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
		var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
		var documentHeight = $(document).height(); // 문서 전체의 높이
		var isBottom = scrollTop + windowsHeight + 10 >= documentHeight; //바닥에 갔는지 여부
		
		if (isBottom) {
			//만일 현재 마지막 페이지라면
			if (curPage >= ${totalP}) {
				return false; //함수종료
			} else {
				isLoading = true; //위에서 종료되지 않으면 로딩상태를 true로 변경
				$("#load").show(); //로딩바 표시
				curPage++; //현재페이지 1증가
				getList(curPage); //추가로 받을 리스트 ajax처리
			}
		}
	});
	 
	// 리스트 불러오기 함수
	function getList(curPage) {
		let type = $("#hot-articles-head-title < img").eq(0).attr("data-type");
		$.ajax({
			type: "POST",
			url : "All",
			data : { "curPage" : curPage, "type" : type},
			success:function(data){
	        	//서버에서 전송된 데이터를 list-wrap에 추가하기
				$(".cards-wrap").append(data); 
				$("#load").hide(); //로딩바 숨기기
				isLoading = false; // 로딩여부를 false로 변경
			}
		});
	}
	
	function toggleDiv() {
        var myPageDiv = document.getElementById('myPageDiv');
        if (!myPageDiv.style.display || myPageDiv.style.display === 'none') {
            myPageDiv.style.display = 'block';
        } else {
            myPageDiv.style.display = 'none';
        }
    }
</script>
	
</body>
</html>