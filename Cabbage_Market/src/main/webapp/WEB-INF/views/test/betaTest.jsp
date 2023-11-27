<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 초기화면</title>
</head>
<body>
	<h1>채팅 테스트 인덱스페이지</h1>
	<h2>선택한 유저로 로그인 돼있다고 가정하고 선택된 게시글로 채팅 요청</h2>
	<hr />
	<form action="testRequest">
		<h2>유저 선택</h2>
		<input type="radio" name="userId" value="betaTest1" /> 종욱
		<input type="radio" name="userId" value="betaTest2" /> 성욱
		<input type="radio" name="userId" value="betaTest3" /> 지원
		<input type="radio" name="userId" value="betaTest4" /> 하은 (탈퇴)
		<input type="radio" name="userId" value="betaTest5" /> 준형
		<input type="radio" name="userId" value="betaTest6" /> 주영
		
		<hr />
		<input type="radio" name="userId" value="jsw4795" /> jsw4795
		<input type="radio" name="userId" value="test1" /> test1
		<hr />
		
		<hr />
		<h2>게시글 선택</h2>
		<input type="radio" name="postId" value="-1" /> 채팅 메인으로
		<input type="radio" name="postId" value="2" /> '종욱' 이 쓴 글
		<input type="radio" name="postId" value="3" /> '성욱' 이 쓴 글
		<input type="radio" name="postId" value="4" /> '지원' 이 쓴 글
		<input type="radio" name="postId" value="5" /> '하은' 이 쓴 글
		<input type="radio" name="postId" value="6" /> '준형' 이 쓴 글
		<input type="radio" name="postId" value="7" /> '주영' 이 쓴 글
		
		<br />
		<br />
		<input type="submit" value="시작" />
	</form>
</body>
</html>





