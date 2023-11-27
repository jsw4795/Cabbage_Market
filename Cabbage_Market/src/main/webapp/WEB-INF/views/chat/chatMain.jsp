<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/base.css" />
<link rel="stylesheet" href="/resources/css/chat.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/chat.js"></script>

</head>
<body id="body" class="light-theme" style="overflow: auto;">
	<div id="root" data-user_id="jsw4795">
		<div class="css-1mnz5cs">
			<header class="css-19lthbi">
				<div class="container">
					<!--TODO : main화면 URL 추가해야함 -->
					<a href="#"><img src="/resources/pic/Cabbage_Logo.png"
						alt="배추 로고" class="css-1nmpalf"></a>
					<button class="common-bg-hover  css-1ca43ff">
						<img class="menu-profile-img"
							src="https://dnvefa72aowie.cloudfront.net/origin/profile/profile_default.png"
							alt="jsw">
						<div class="nickname-area">
							jsw<span class="menu-icon"><svg width="12" height="7"
									viewBox="0 0 12 7" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path d="M1 1L6 6L11 1" stroke="currentColor"
										stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path></svg></span>
						</div>
						<!-- 오른쪽 상단 프로필 클릭시 나오는 메뉴창 -->
						<div class="menu-container">
							<div class="last-menu">
								<div tabindex="0" class="common-bg-hover menu-item logout-menu">로그아웃</div>
							</div>
						</div>
					</button>
				</div>
			</header>
			<main class="body">
				<div class="css-143d18r">
					<div></div>
					<div class="css-1plme8k">
						<nav class="sidebar">
							<a class="anchor" href="/chat"><img
								class="selected profile-image"
								src="https://dnvefa72aowie.cloudfront.net/origin/profile/profile_default.png"
								alt="jsw">
								<div class="unread-count"></div></a>
						</nav>
						<nav class="css-dcpzrh">
							<div class="css-fycla4">
								<div class="nickname-area">jsw</div>
							</div>

							<!-- 채팅방 리스트 -->
							<ul tabindex="0" role="list" aria-label="내 채널 리스트"
								class="css-8lfz6g">

								<li class="css-v2yhcd"><a class="css-y6c1l4"
									href="/chat/room/2"><div
											class="profile-wrapper">
											<img class="profile-image"
												src="https://dnvefa72aowie.cloudfront.net/origin/profile/202101/05EF63771E37CDA5D45FE0C397D530A483E82D1E241DE1F18EA699B9FFFDC469.jpg?q=82&amp;s=80x80&amp;t=crop&amp;f=webp"
												alt="profile">
										</div>
										<div class="css-qv4ssb">
											<div class="preview-title-wrap">
												<span class="preview-nickname">율갱</span>
												<div class="sub-text">
													<span>서초4동</span><span> · </span><span>3달 전</span>
												</div>
											</div>
											<div class="preview-description">
												<span class="description-text">네 좋은 하루 보내세요</span>
											</div>
										</div></a></li>
								<li class="css-v2yhcd"><a class="   css-y6c1l4"
									href="/chat/room/1">
									<div class="profile-wrapper">
											<img class="profile-image"
												src="https://dnvefa72aowie.cloudfront.net/origin/profile/202309/699ea03ddc496bf998c89a825f97a38674befc5f4f7e77df7c8eb5ce325086a2.jpg?q=82&amp;s=80x80&amp;t=crop&amp;f=webp"
												alt="profile">
										</div>
										<div class="css-qv4ssb">
											<div class="preview-title-wrap">
												<span class="preview-nickname">홈케어</span>
												<div class="sub-text">
													<span>평내동</span><span> · </span><span>4달 전</span>
												</div>
											</div>
											<div class="preview-description">
												<span class="description-text">네 알겠습니다</span>
											</div>
										</div> <img
										src="https://dnvefa72aowie.cloudfront.net/origin/article/202307/f080d9ef97ec9e2ed7ce5f8a13c128f52f433105ed26ed200528db01f016159f.jpg?q=95&amp;s=300x300&amp;t=inside&amp;f=webp"
										class="preview-image" alt="와인냉장고 판매"></a></li>
								<li class="css-v2yhcd"><a class="   css-y6c1l4"
									href="/chat/room/3"><div
											class="profile-wrapper">
											<img class="profile-image"
												src="https://dnvefa72aowie.cloudfront.net/origin/profile/202308/43f72a3b28c5edfcada46d491294300e6d4db7d5d69da6c250c62110c758de2e.jpg?q=82&amp;s=80x80&amp;t=crop&amp;f=webp"
												alt="profile">
										</div>
										<div class="css-qv4ssb">
											<div class="preview-title-wrap">
												<span class="preview-nickname">구루미와당근해요</span>
												<div class="sub-text">
													<span>사당동</span><span> · </span><span>6달 전</span>
												</div>
											</div>
											<div class="preview-description">
												<span class="description-text">네~</span>
											</div>
										</div> <img
										src="https://dnvefa72aowie.cloudfront.net/origin/article/202305/91f5e15bc60d8dd568cacd8d55915936096ad077bd784abd332d45a34b2c41c5.jpg?q=95&amp;s=300x300&amp;t=inside&amp;f=webp"
										class="preview-image" alt="와인냉장고"></a></li>
							</ul>

						</nav>
					</div>
					
					<!-- 채팅방 섹션 -->
					<section class="css-am8mw7">
						<div class="empty-box">
							<svg width="96" height="81" viewBox="0 0 96 81" fill="none"
								xmlns="http://www.w3.org/2000/svg">
			<path
									d="M33.0004 0C15.0185 0 0 13.0729 0 29.6567C0 40.358 6.27606 49.642 15.5279 54.8364L13.8397 64.5305C13.7353 65.1299 13.928 65.7446 14.3535 66.1751L14.3573 66.179L14.3724 66.1939C14.3853 66.2066 14.4061 66.2267 14.4326 66.2506C14.4869 66.2995 14.568 66.3668 14.6744 66.435C14.9082 66.5849 15.1569 66.6709 15.3962 66.7073C15.7666 66.7637 16.0661 66.6901 16.1358 66.673L16.1413 66.6716C16.3174 66.6287 16.5003 66.558 16.6232 66.51C16.9302 66.3901 17.5014 66.1524 18.5787 65.6955C20.7218 64.7866 24.9636 62.9696 33.3799 59.3641C51.1931 59.1817 66.0008 46.1763 66.0008 29.7093C66.0008 13.1297 50.987 0 33.0004 0Z"
									fill="#DCDEE3"></path>
			<path
									d="M72.2312 29.4385C72.2312 48.2002 56.7085 62.679 37.8858 64.8408C44.0168 70.067 52.3818 73.2792 61.479 73.3633C70.2216 76.9749 74.6257 78.7941 76.8498 79.7036C77.9674 80.1606 78.5583 80.3977 78.8749 80.517C79.0036 80.5654 79.1863 80.6333 79.3599 80.6741L79.3652 80.6754C79.4339 80.6917 79.7238 80.7604 80.0821 80.7078C80.313 80.6739 80.5564 80.5935 80.7883 80.4501C80.8943 80.3846 80.9756 80.3195 81.0307 80.2717C81.0459 80.2585 81.0593 80.2464 81.0704 80.2362C81.0789 80.2284 81.0861 80.2217 81.0918 80.2163L81.1071 80.2017L81.111 80.1978C81.5557 79.764 81.7577 79.1325 81.6467 78.5179L79.9012 68.8524C89.4699 63.674 96 54.3943 96 43.6557C96 29.1206 84.0984 17.353 68.7254 14.6059C70.9682 19.0808 72.2312 24.0881 72.2312 29.4385Z"
									fill="#DCDEE3"></path></svg>
							<div class="empty-description">채팅할 상대를 선택해주세요.</div>
						</div>
					</section>
				</div>
				<div class="css-1oteowz"></div>
			</main>
			<div></div>
		</div>
	</div>
</body>
</html>