<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   


<script>

	$(function() {
		$("#confirm").click(function() {
			modalClose();
			//컨펌 이벤트 처리
		});
		$("#modal-open").click(function() {
			$("#popup").css('display', 'flex').hide().fadeIn();
		});
		$("#close").click(function() {
			modalClose();
		});
		function modalClose() {
			$("#popup").fadeOut();
		}
	});
	
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/user/delete.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user/modal.css">
</head>

<body>
	<div class="wrap">
		<div class="find">
			<div class="imgback">
				<img class="back"
					src="/resources/pic/profilePic/arrow-left-solid.svg" id="back">
			</div>
			<div class="findinfo">
				<h2>회원탈퇴</h2>
				<h4>회원탈퇴 사유를 골라주세요.</h4>
				<ul>
					<li><a href="javascript:modalOpen()">너무 많이 이용해요</a></li>
					<li><a href="/deleteModal">사고 싶은 물품이 없어요</a></li>
					<li><a href="/deleteModal">물품이 안팔려요</a></li>
					<li><a href="/deleteModal">비매너 사용자를 만났어요</a></li>
					<li><a href="/deleteModal">억울하게 이용이 제한됐어요</a></li>
					<li><a href="/deleteModal">알림이 너무 많이 와요</a></li>
					<li><a href="/deleteModal">기타</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>
