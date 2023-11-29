<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>김하은천재만재</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="/resources/css/main/main.css" />
<link rel="stylesheet" href="/resources/css/main/main_included_jiwon.css" />
<link rel="stylesheet" href="/resources/css/main/main_haeun.css" />

<script>
    function All(type) {
    	// 이동하고자 하는 URL 설정
        var url = '/All?type=' + type; // 실제로는 적절한 URL로 변경해야 합니다.

        // JavaScript를 사용하여 리다이렉션 수행
        window.location.href = url;
    }
</script>
</head>
<body class="hoian-kr">
	<noscript>
		<img height="1" width="1" style="display: none" alt="facebook"
			src="https://www.facebook.com/tr?id=992961397411651&ev=PageView&noscript=1" />
	</noscript>

	<!-- header -->
	<%@ include file="/WEB-INF/views/main/inc/header.jsp" %>
	
	<main>
		<section class="fleamarket-cover" style="margin-bottom:35px;">
			<div class="cover-content">
				<h1 class="cover-title">
					믿을만한<br>이웃 간 중고거래
				</h1>
				<span class="cover-description">동네 주민들과 가깝고 따뜻한 거래를<br>지금
					경험해보세요.
				</span>
				<div class="cover-image">
					<span class="fleamarket-cover-image"> 
					<img
						
						alt="믿을만한 이웃 간 중고거래"
						src="/resources/pic/img/haeuncheonjae.png">
					</span> <span class="fleamarket-cover-image-mobile"> <img
						srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/mobile/3x/fleamarket-1caf5c24c82acb20bd86fa8c018987be7812a1f0ce0858dcf175568bfc3cf87d.webp 3x"
						alt="믿을만한 이웃 간 중고거래"
						src="/resources/pic/img/haeuncheonjae.png">
					</span>
				</div>
			</div>
		</section>
		<c:if test="${not empty userId and fn:length(recomendPostById) > 0}">
		<section class="fleamarket-article-list">
			<!-- <h1 class="text-center article-list-title">중고거래 인기매물</h1> -->
			<div class="cards-wrap" style="width:1024px;">
			<div class="canada-haeun1" style="width:100%;">
				<div class="canada-haeun2" style="margin-left:7px;">
					<img src="/resources/pic/img/rcmd_icon.png" width="30px;" height="aute;" style="vertical-align:bottom;" alt="인기">
					이 물건 필요하세요?
				</div>
				<a class="canada-haeun3" href="/All?type=RI">
					<span class="canada-haeun4" style="color:#609966;">
					모두보기
					</span>
					<span class="canada-haeun5">
						<span class="canada-haeun6">
						 	<img src="/resources/pic/img/right_arrow.png" alt="오늘쪽 화살표">
						</span>
					</span>
				</a> 
			</div>
			</div>
			<div class="cards-wrap">
				<c:forEach var="recomendPostById" items="${recomendPostById }">
				<article class="card-top ">
					<a class="card-link " data-event-label="675477198"
						href="/post/getPost/${recomendPostById.postId }">
						<div class="card-photo ">
							<img alt="${recomendPostById.fileName }"
								src="/resources/pic/postPic/${recomendPostById.fileName }" onerror="this.onerror=null; this.src='/resources/pic/img/cabbage_icon.png'">
						</div>
						<div class="card-desc">
							<h2 class="card-title">${recomendPostById.postTitle}</h2>
							<div class="card-price "><fmt:formatNumber type="number" value="${recomendPostById.postPrice }" />원</div>
							<div class="card-region-name">${recomendPostById.userNickname }</div>
							<div class="card-counts">
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/material-outlined/100/like--v1.png" alt="like--v1"/>
									${recomendPostById.postWishCount }
								</span> ∙ 
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/ios-filled/50/chat.png" alt="chat"/>
									${recomendPostById.chatRoomCount }
							 	</span>
							 	<span>
								 	<c:if test="${recomendPostById.postStatus == 'RESERVE' }">
										<span style="
										    float: right;
										    margin-right: 12px;
										    border: 1px solid #000;
										    border-radius: 10px;
										    padding: 0;
										    padding-left: 10px;
										    padding-right: 10px;
										    padding-bottom: 3px;
										    padding-top: 3px;
										    line-height: -8;
										">
										예약중
										</span>
									</c:if>
								</span>
							</div>
						</div>
					</a>
				</article>
				</c:forEach>
			</div>
		</section>
		</c:if>
		
		<section class="fleamarket-article-list">
			<!-- <h1 class="text-center article-list-title">중고거래 인기매물</h1> -->
			<div class="cards-wrap" style="width:1024px;">
			<div class="canada-haeun1" style="width:100%;">
				<div class="canada-haeun2" style="margin-left:7px;">
					<img src="/resources/pic/img/new_icon.gif" width="30px;" height="aute;" style="vertical-align:bottom;" alt="인기">
					방금 올라 왔어요!
				</div>
				<a class="canada-haeun3" href="/All?type=N">
					<span class="canada-haeun4" style="color:#609966;">
					모두보기
					</span>
					<span class="canada-haeun5">
						<span class="canada-haeun6">
						 	<img src="/resources/pic/img/right_arrow.png" alt="오늘쪽 화살표">
						</span>
					</span>
				</a> 
			</div>
			</div>
			<div class="cards-wrap">
				<c:forEach var="somethingNew" items="${somethingNew }">
				<article class="card-top ">
					<a class="card-link " data-event-label="675477198"
						href="/post/getPost/${somethingNew.postId }">
						<div class="card-photo ">
							<img alt="${somethingNew.fileName }"
								src="/resources/pic/postPic/${somethingNew.fileName }" onerror="this.onerror=null; this.src='/resources/pic/img/cabbage_icon.png'">
						</div>
						<div class="card-desc">
							<h2 class="card-title">
								${somethingNew.postTitle}
							</h2>
							<div class="card-price ">
								<fmt:formatNumber type="number" value="${somethingNew.postPrice }" />원
							</div>
							<div class="card-region-name">
								${somethingNew.userNickname }
							</div>
							<div class="card-counts">
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/material-outlined/100/like--v1.png" alt="like--v1"/>
									${somethingNew.postWishCount }
								</span> ∙ 
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/ios-filled/50/chat.png" alt="chat"/>
									${somethingNew.chatRoomCount }
							 	</span>
							 	<span>
								 	<c:if test="${somethingNew.postStatus == 'RESERVE' }">
										<span style="
										    float: right;
										    margin-right: 12px;
										    border: 1px solid #000;
										    border-radius: 10px;
										    padding: 0;
										    padding-left: 10px;
										    padding-right: 10px;
										    padding-bottom: 3px;
										    padding-top: 3px;
										    line-height: -8;
										">
										예약중
										</span>
									</c:if>
								</span>
							</div>
						</div>
					</a>
				</article>
				</c:forEach>
			</div>
		</section>
		
		<section class="fleamarket-article-list">
			<!-- <h1 class="text-center article-list-title">중고거래 인기매물</h1> -->
			<div class="cards-wrap" style="width:1024px;">
			<div class="canada-haeun1" style="width:100%;">
				<div class="canada-haeun2" style="margin-left:7px;">
					<img src="/resources/pic/img/hot_icon.gif" width="30px;" height="aute;" style="vertical-align:bottom;" alt="인기">
					지금 인기 있어요!
				</div>
				<a class="canada-haeun3" href="/All?type=RV">
					<span class="canada-haeun4" style="color:#609966;">
					모두보기
					</span>
					<span class="canada-haeun5">
						<span class="canada-haeun6">
						 	<img src="/resources/pic/img/right_arrow.png" alt="오늘쪽 화살표">
						</span>
					</span>
				</a> 
			</div>
			</div>
			<div class="cards-wrap">
				<c:forEach var="recomendPostByVeiwCount" items="${recomendPostByVeiwCount }">
				<article class="card-top ">
					<a class="card-link " data-event-label="675477198"
						href="/post/getPost/${recomendPostByVeiwCount.postId }">
						<div class="card-photo ">
							<img alt="${recomendPostByVeiwCount.fileName }"
								src="/resources/pic/postPic/${recomendPostByVeiwCount.fileName }" onerror="this.onerror=null; this.src='/resources/pic/img/cabbage_icon.png'">
						</div>
						<div class="card-desc">
							<h2 class="card-title">
								${recomendPostByVeiwCount.postTitle}
							</h2>
							<div class="card-price ">
								<fmt:formatNumber type="number" value="${recomendPostByVeiwCount.postPrice }" />원
							</div>
							<div class="card-region-name">
								${recomendPostByVeiwCount.userNickname }
							</div>
							<div class="card-counts">
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/material-outlined/100/like--v1.png" alt="like--v1"/>
									${recomendPostByVeiwCount.postWishCount }
								</span> ∙ 
								<span> 
									<img width="15" height="15" src="https://img.icons8.com/ios-filled/50/chat.png" alt="chat"/>
									${recomendPostByVeiwCount.chatRoomCount } 
							 	</span>
							 	<span>
								 	<c:if test="${recomendPostByVeiwCount.postStatus == 'RESERVE' }">
										<span style="
										    float: right;
										    margin-right: 12px;
										    border: 1px solid #000;
										    border-radius: 10px;
										    padding: 0;
										    padding-left: 10px;
										    padding-right: 10px;
										    padding-bottom: 3px;
										    padding-top: 3px;
										    line-height: -8;
										">
										예약중
										</span>
									</c:if>
								</span>
							</div>
						</div>
					</a>
				</article>
				</c:forEach>
			</div>
		</section>
	</main>

	<div id="footer-root">
		<div class="light-theme">
			<footer class="_1trxeqs0">
				<div class="_1trxeqs1 _1y9kelh2">
					<section class="_1trxeqsi">
						
						<nav aria-label="footer" class="_1trxeqs9">
							<ul class="_1trxeqsa">
								<li class="_1trxeqsq">
								<a class="undefined _1trxeqsp" target="_blank" href="/faq/faq">자주 묻는 질문</a>
								</li>
							</ul>
						</nav>
					</section>
					<section class="_1trxeqsj">
						<section class="_1trxeqsb">
							<section class="_1trxeqsc">
								<div class="_1s38h9c0">
									<span><b>대표</b> 김하은 천재만재꺼</span><span class="_1trxeqsd"><svg
											width="2" height="10" viewBox="0 0 2 10" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<rect opacity="0.5" x="0.535767" width="1.03646" height="10"
												fill="#868B94"></rect></svg></span><span><b>사업자번호</b> <!-- -->999-99-00088</span>
								</div>
								<div>
									<b>직업정보제공사업 신고번호</b>
									<!-- -->
									CHEONJAEMANJAEHAEUN
								</div>
								<address class="_1trxeqse">
									<div>
										<b>주소</b>
										<!-- -->
										하은특별시 팔로구 아날로그로 30길 28, 1004호 (배추서비스)
									</div>
									<div>
										<span><b>전화</b> <!-- -->9494-9494</span><span
											class="_1trxeqsd"><svg width="2" height="10"
												viewBox="0 0 2 10" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<rect opacity="0.5" x="0.535767" width="1.03646" height="10"
													fill="#868B94"></rect></svg></span><span><b>고객문의</b> <!-- -->cs@baechuservice.com</span>
									</div>
								</address>
							</section>
							<section class="_1trxeqsk">
								<a class="_1trxeqsg _1trxeqsp" target="_blank"
									href="mailto:contact@daangn.com">제휴 문의</a><a
									class="_1trxeqsg _1trxeqsp" target="_blank"
									href="mailto:ad@daangn.com">광고 문의</a><a
									class="_1trxeqsg _1trxeqsp" target="_blank"
									href="mailto:pr@daangn.com">PR 문의</a><a
									class="_1trxeqsg _1trxeqsp" target="_blank"
									href="mailto:ir@daangn.com">IR 문의</a>
							</section>
						</section>
						<section class="_1trxeqsl">
							<a class="_1trxeqsm _1trxeqsp" target="_blank"
								aria-label="facebook" href="https://www.facebook.com/daangn"><svg
									width="25" height="24" viewBox="0 0 25 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M22.7158 12.0458C22.7158 6.21012 18.0165 1.48242 12.2158 1.48242C6.41515 1.48242 1.71582 6.21012 1.71582 12.0458C1.71582 17.3181 5.55649 21.689 10.5732 22.4824V15.0974H7.90382V12.0458H10.5732V9.71716C10.5732 7.06928 12.1412 5.60918 14.5398 5.60918C15.6878 5.60918 16.8918 5.81575 16.8918 5.81575V8.412H15.5665C14.2645 8.412 13.8538 9.22421 13.8538 10.0599V12.0411H16.7658L16.2992 15.0927H13.8538V22.473C18.8752 21.6843 22.7158 17.3181 22.7158 12.0458Z"
										fill="#868B94"></path></svg></a><a class="_1trxeqsm _1trxeqsp"
								target="_blank" aria-label="instagram"
								href="https://www.instagram.com/daangnmarket/"><svg
									width="25" height="24" viewBox="0 0 25 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M11.7928 3.67695C14.6079 3.67695 14.9413 3.68727 16.053 3.73611C17.081 3.78129 17.6392 3.94668 18.0107 4.08567C18.5028 4.26984 18.854 4.48988 19.223 4.84513C19.5919 5.20037 19.8204 5.53861 20.0116 6.01245C20.156 6.37024 20.3277 6.9078 20.3746 7.8976C20.4253 8.96817 20.4361 9.28924 20.4361 12.0001C20.4361 14.7109 20.4253 15.0319 20.3746 16.1025C20.3277 17.0923 20.156 17.6299 20.0116 17.9877C19.8204 18.4615 19.5919 18.7997 19.223 19.155C18.854 19.5102 18.5028 19.7303 18.0107 19.9144C17.6392 20.0534 17.081 20.2188 16.053 20.264C14.9415 20.3128 14.6081 20.3232 11.7928 20.3232C8.97759 20.3232 8.64417 20.3128 7.53264 20.264C6.50472 20.2188 5.94648 20.0534 5.57498 19.9144C5.08287 19.7303 4.73162 19.5102 4.36271 19.155C3.99381 18.7997 3.76531 18.4615 3.57409 17.9877C3.42971 17.6299 3.25796 17.0923 3.21105 16.1025C3.16032 15.0319 3.14961 14.7109 3.14961 12.0001C3.14961 9.28924 3.16032 8.96817 3.21105 7.89764C3.25796 6.9078 3.42971 6.37024 3.57409 6.01245C3.76531 5.53861 3.99381 5.20037 4.36271 4.84513C4.73162 4.48988 5.08287 4.26984 5.57498 4.08567C5.94648 3.94668 6.50472 3.78129 7.5326 3.73611C8.64434 3.68727 8.97776 3.67695 11.7928 3.67695ZM11.7928 1.84766C8.92955 1.84766 8.57056 1.85934 7.44605 1.90875C6.32384 1.95808 5.55749 2.12968 4.88684 2.38066C4.19356 2.64011 3.60561 2.98726 3.0195 3.55166C2.43339 4.11606 2.0729 4.68223 1.80347 5.34984C1.54282 5.99565 1.36463 6.73362 1.3134 7.81426C1.26209 8.89708 1.25 9.24282 1.25 12.0001C1.25 14.7573 1.26209 15.103 1.3134 16.1859C1.36463 17.2665 1.54282 18.0045 1.80347 18.6503C2.0729 19.3178 2.43339 19.8841 3.0195 20.4485C3.60561 21.0129 4.19356 21.36 4.88684 21.6195C5.55749 21.8704 6.32384 22.042 7.44605 22.0914C8.57056 22.1408 8.92955 22.1524 11.7928 22.1524C14.6561 22.1524 15.0152 22.1408 16.1396 22.0914C17.2618 22.042 18.0282 21.8704 18.6988 21.6195C19.3921 21.36 19.9801 21.0129 20.5662 20.4485C21.1523 19.8841 21.5128 19.3179 21.7822 18.6503C22.0428 18.0045 22.221 17.2665 22.2723 16.1859C22.3236 15.103 22.3357 14.7573 22.3357 12.0001C22.3357 9.24282 22.3236 8.89708 22.2723 7.81426C22.221 6.73362 22.0428 5.99565 21.7822 5.34984C21.5128 4.68223 21.1523 4.11606 20.5662 3.55166C19.9801 2.98726 19.3921 2.64011 18.6988 2.38066C18.0282 2.12968 17.2618 1.95808 16.1396 1.90875C15.0152 1.85934 14.6561 1.84766 11.7928 1.84766ZM11.7928 6.78666C8.80283 6.78666 6.37892 9.12079 6.37892 12.0001C6.37892 14.8793 8.80283 17.2135 11.7928 17.2135C14.7828 17.2135 17.2068 14.8793 17.2068 12.0001C17.2068 9.12079 14.7828 6.78666 11.7928 6.78666ZM11.7928 15.3842C9.85196 15.3842 8.27853 13.869 8.27853 12.0001C8.27853 10.1311 9.85196 8.61591 11.7928 8.61591C13.7337 8.61591 15.3071 10.1311 15.3071 12.0001C15.3071 13.869 13.7337 15.3842 11.7928 15.3842ZM18.6858 6.58068C18.6858 7.25353 18.1194 7.79899 17.4206 7.79899C16.7219 7.79899 16.1555 7.25353 16.1555 6.58068C16.1555 5.90784 16.7219 5.36242 17.4206 5.36242C18.1194 5.36242 18.6858 5.90784 18.6858 6.58068Z"
										fill="#868B94"></path></svg></a><a class="_1trxeqsm _1trxeqsp"
								target="_blank" aria-label="youtube"
								href="https://www.youtube.com/channel/UC8tsBsQBuF7QybxgLmStihA"><svg
									width="25" height="24" viewBox="0 0 25 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_1492_32246)">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M21.6404 3.5339C22.6684 3.82139 23.4789 4.66332 23.7557 5.73112C24.2697 7.68193 24.2499 11.7478 24.2499 11.7478C24.2499 11.7478 24.2499 15.7932 23.7557 17.744C23.4789 18.8118 22.6684 19.6537 21.6404 19.9412C19.7623 20.4545 12.2499 20.4545 12.2499 20.4545C12.2499 20.4545 4.75739 20.4545 2.85954 19.9206C1.83154 19.6332 1.021 18.7912 0.744232 17.7234C0.25 15.7932 0.25 11.7273 0.25 11.7273C0.25 11.7273 0.25 7.68193 0.744232 5.73112C1.021 4.66332 1.85131 3.80086 2.85954 3.51337C4.73763 3 12.2499 3 12.2499 3C12.2499 3 19.7623 3 21.6404 3.5339ZM9.85784 7.99009L16.1049 11.7274L9.85784 15.4647V7.99009Z"
										fill="#868B94"></path></g>
									<defs>
									<clipPath id="clip0_1492_32246">
									<rect width="24" height="24" fill="white"
										transform="translate(0.25)"></rect></clipPath></defs></svg></a><a
								class="_1trxeqsm _1trxeqsp" target="_blank" aria-label="blog"
								href="https://blog.naver.com/daangn"><svg width="25"
									height="24" viewBox="0 0 25 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_1492_32254)">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M2.86619 3H21.6338C23.0736 3 24.2515 4.17222 24.25 5.60362V16.1668C24.25 17.5982 23.0736 18.7704 21.6338 18.7704H14.2351C14.2351 18.7704 12.6961 22.6376 12.1768 22.6376C11.6588 22.6376 10.2353 18.7704 10.2353 18.7704H2.86619C1.42788 18.7704 0.25 17.5982 0.25 16.1668V5.60362C0.25 4.17222 1.42788 3 2.86619 3ZM5.66291 13.3438C6.2844 13.3438 6.85411 13.1685 7.22552 12.7518C7.59842 12.335 7.78191 11.9404 7.78191 11.2512C7.78191 10.6179 7.54959 10.0451 7.23292 9.67987C6.91477 9.31318 6.38355 8.99509 5.87303 9.01276C5.2767 9.03191 4.77062 9.14236 4.38885 9.46633H4.37109V7.12779H2.96237V13.2436H4.37109V12.9462H4.38885C4.6922 13.1759 5.10209 13.3438 5.66291 13.3438ZM8.81329 13.2893H10.2501V9.55175C10.1332 7.12337 8.11929 7.00115 8.11929 7.00115V8.51649C8.11929 8.51649 8.81329 8.63135 8.81329 9.50462V13.2893ZM15.3612 12.8622C15.5935 12.6472 15.7681 12.4028 15.8894 12.1289C16.0093 11.8564 16.0685 11.5663 16.0714 11.2585C16.0714 10.9507 16.0108 10.6606 15.8909 10.3867C15.7696 10.1128 15.595 9.86836 15.3626 9.65336C15.1333 9.4413 14.8714 9.27784 14.5754 9.16444C14.278 9.05105 13.9658 8.99509 13.6358 8.99509C13.3117 8.99509 13.0039 9.05105 12.7109 9.16444C12.4179 9.27784 12.156 9.43983 11.9237 9.65336C11.6855 9.8772 11.5064 10.1246 11.3836 10.3956C11.2608 10.6665 11.2001 10.9552 11.2001 11.2585C11.2001 11.5619 11.2608 11.8505 11.3821 12.12C11.5049 12.391 11.684 12.6384 11.9222 12.8622C12.1531 13.0743 12.415 13.2378 12.7095 13.3511C13.0024 13.4645 13.3102 13.522 13.6343 13.522C13.9643 13.522 14.278 13.4645 14.5739 13.3511C14.8714 13.2378 15.1333 13.0743 15.3612 12.8622ZM20.8525 14.921C21.3349 14.4659 21.5391 13.8106 21.5391 12.7371V9.0378H20.1393V9.37503H20.1215C19.7812 9.06578 19.4334 8.93324 18.88 8.93324C18.2629 8.93324 17.7228 9.13794 17.3455 9.57678C16.9667 10.0142 16.7773 10.6076 16.7773 11.3528C16.7773 12.0184 16.946 12.5486 17.2863 12.9447C17.6252 13.3408 18.1268 13.5529 18.7054 13.5529C19.3298 13.5529 19.7989 13.3924 20.12 12.9506H20.1378V13.2348C20.1393 13.9741 19.3506 14.3496 18.7779 14.2922V15.4025C19.4645 15.4997 20.2798 15.4614 20.8525 14.921ZM12.9462 10.5489C13.1356 10.356 13.365 10.2603 13.6328 10.2603C13.9051 10.2603 14.1374 10.356 14.3313 10.5489C14.5251 10.7418 14.6213 10.976 14.6213 11.2499C14.6213 11.5238 14.5251 11.7579 14.3313 11.9508C14.1374 12.1423 13.9051 12.2395 13.6328 12.2395C13.365 12.2395 13.1356 12.1438 12.9462 11.9508C12.7568 11.7579 12.6606 11.5252 12.6606 11.2499C12.6606 10.976 12.7553 10.7418 12.9462 10.5489ZM4.64057 10.5577C4.82998 10.3662 5.05934 10.269 5.32717 10.269C5.59945 10.269 5.83177 10.3648 6.02561 10.5577C6.21946 10.7506 6.31564 10.9847 6.31564 11.2587C6.31564 11.534 6.21946 11.7667 6.02561 11.9596C5.83177 12.1525 5.59945 12.2497 5.32717 12.2497C5.05934 12.2497 4.83146 12.1525 4.64057 11.9596C4.44968 11.7667 4.35498 11.5326 4.35498 11.2587C4.35498 10.9847 4.44968 10.7506 4.64057 10.5577ZM19.1714 10.269C18.9036 10.269 18.6742 10.3662 18.4833 10.5577C18.2939 10.7506 18.1978 10.9847 18.1978 11.2587C18.1978 11.5326 18.2939 11.7667 18.4833 11.9596C18.6742 12.1525 18.9036 12.2497 19.1714 12.2497C19.4422 12.2497 19.676 12.1525 19.8699 11.9596C20.0637 11.7667 20.1599 11.534 20.1599 11.2587C20.1599 10.9847 20.0622 10.7506 19.8699 10.5577C19.676 10.3648 19.4437 10.269 19.1714 10.269Z"
										fill="#868B94"></path></g>
									<defs>
									<clipPath id="clip0_1492_32254">
									<rect width="24" height="24" fill="white"
										transform="translate(0.25)"></rect></clipPath></defs></svg></a>
							<div>
								<label class="_1trxeqsn" for="label-select-nation"><svg
										viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true"
										width="16" height="16">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M12 2.8002C6.91893 2.8002 2.79995 6.91918 2.79995 12.0002C2.79995 17.0812 6.91893 21.2002 12 21.2002C17.081 21.2002 21.2 17.0812 21.2 12.0002C21.2 6.91918 17.081 2.8002 12 2.8002ZM1.19995 12.0002C1.19995 6.03552 6.03528 1.2002 12 1.2002C17.9646 1.2002 22.8 6.03552 22.8 12.0002C22.8 17.9649 17.9646 22.8002 12 22.8002C6.03528 22.8002 1.19995 17.9649 1.19995 12.0002Z"
											fill="currentColor"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M11.4618 22.5921C5.2144 16.9126 5.2144 7.08767 11.4618 1.4082L12.5381 2.59211C6.98897 7.63676 6.98897 16.3636 12.5381 21.4082L11.4618 22.5921Z"
											fill="currentColor"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M12.5381 22.5921C18.7855 16.9126 18.7855 7.08767 12.5381 1.4082L11.4618 2.59211C17.0109 7.63676 17.0109 16.3636 11.4618 21.4082L12.5381 22.5921Z"
											fill="currentColor"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M1.69995 9.0002C1.69995 8.55837 2.05812 8.2002 2.49995 8.2002H21.5C21.9418 8.2002 22.2999 8.55837 22.2999 9.0002C22.2999 9.44202 21.9418 9.8002 21.5 9.8002H2.49995C2.05812 9.8002 1.69995 9.44202 1.69995 9.0002Z"
											fill="currentColor"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M1.69995 15.0002C1.69995 14.5584 2.05812 14.2002 2.49995 14.2002H21.5C21.9418 14.2002 22.2999 14.5584 22.2999 15.0002C22.2999 15.442 21.9418 15.8002 21.5 15.8002H2.49995C2.05812 15.8002 1.69995 15.442 1.69995 15.0002Z"
											fill="currentColor"></path></svg><select id="label-select-nation"
									class="_1trxeqso"><option value="kr" selected="">한국</option>
										<option value="https://uk.karrotmarket.com">영국</option>
										<option value="https://ca.karrotmarket.com">캐나다</option>
										<option value="https://us.karrotmarket.com">미국</option>
										<option value="https://jp.karrotmarket.com">일본</option></select>
								<svg viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" data-karrot-ui-icon="true"
										width="16" height="16">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M2.93427 7.43427C3.24669 7.12185 3.75322 7.12185 4.06564 7.43427L12 15.3686L19.9343 7.43427C20.2467 7.12185 20.7532 7.12185 21.0656 7.43427C21.3781 7.74669 21.3781 8.25322 21.0656 8.56564L12.5656 17.0656C12.2532 17.3781 11.7467 17.3781 11.4343 17.0656L2.93427 8.56564C2.62185 8.25322 2.62185 7.74669 2.93427 7.43427Z"
											fill="currentColor"></path></svg></label>
							</div>
						</section>
						<section class="_1trxeqsf">
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank"
									href="https://www.daangn.com/policy/terms">이용약관</a>
							</div>
							<div class="_1trxeqsg _1trxeqsh">
								<a class="_1trxeqsg _1trxeqsh _1trxeqsp" target="_blank"
									href="https://privacy.daangn.com/">개인정보처리방침</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank"
									href="https://www.daangn.com/policy/location">위치기반서비스 이용약관</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank"
									href="https://www.daangn.com/wv/faqs/3994">이용자보호 비전과 계획</a>
							</div>
							<div class="_1trxeqsg">
								<a class="_1trxeqsg _1trxeqsp" target="_blank"
									href="https://www.daangn.com/wv/faqs/9010">청소년보호정책</a>
							</div>
						</section>
					</section>
				</div>
			</footer>
		</div>
	</div>

	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>

<c:if test="${not empty userId}">	

</c:if>
</body>
</html>
