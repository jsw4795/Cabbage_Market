<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/post/directPayPage.css">
<link rel="icon" href="/resources/pic/cabbage2.png" type="image/x-icon">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 900,
    timerProgressBar: true,
})

	function kakaoPay(){
		var name = "${post.postCatName}";
		var amount = "${finalPrice}";	//받아온 값으로 고치기 (finalPrice)
		var buyer_name = "${userNickname}";
		var chatRoomId = "${chatRoomId}";
		var countByRoom = "${countByRoom}";
		var finalPrice = "${finalPrice}";
		
		// 		/chatMessage/successPay		POST 값 2개(chatRoomId, countByRoom)
		console.log("name : " + name);
		console.log("amount : " + amount);
		console.log("buyer_name : " + buyer_name);
		console.log("chatRoomId : " + chatRoomId);
		console.log("countByRoom : " + countByRoom);
		
		var IMP = window.IMP;
	    IMP.init("imp50346576");	//가맹점 식별 코드
		IMP.request_pay({
	    	pg :"kakaopay",
	    	pay_method : "card",
	    	merchant_uid : "merchant_" + new Date().getTime(),
	    	name : name,
	    	amount : amount,
	    	/* buyer 정보 추가 (선택사항) */
	    	buyer_name : buyer_name
	    },function(data){	//결제 성공 시
	    	if(data.success){
	    		var info = "결제 완료";
	    		var msg = "상품 카테고리 : " + data.name;
	    		msg += "\n결제 가격 : " + data.paid_amount;
	    		msg += "\n구매자 이름 : " + data.buyer_name;
	    		msg += "\nchatRoomId : " + chatRoomId;
	    		
	    		alert("결제 완료");
	    		
	    		$.ajax({
	    			type : "POST",
	    			url : "/chatMessage/successPay",
	    			data : {"chatRoomId" : chatRoomId, "countByRoom" : countByRoom},
	    			success: function() {
	    				window.close();
	    			}
	    		});
	    		
	    	}else{
	    		var info = "결제 실패";
	    		var msg = rsp.error_msg;
	    	}
	    	Swal.fire({
	       		   title: info,
	       		   text: msg,
	       		   icon: 'info',
	       		   
	       		   confirmButtonColor: '#9DC08B', // confrim 버튼 색깔 지정
	       		   cancelButtonColor: '#d33', 	  // cancel 버튼 색깔 지정
	       		   confirmButtonText: '확인', 	  // confirm 버튼 텍스트 지정
	       	});
	    });
	}
	
	function tossPay(){
		var chatRoomId = "${chatRoomId}";
		var countByRoom = "${countByRoom}";
		var finalPrice = "${finalPrice}";
		
		var IMP = window.IMP;
	    IMP.init("imp50346576");	//가맹점 식별 코드
		IMP.request_pay({
	    	pg :"tosspay",
	    	pay_method : "card",
	    	merchant_uid : "merchant_" + new Date().getTime(),
	    	name : "${post.postCatName}",
	    	amount : "${finalPrice}"
	    	/* buyer 정보 추가 (선택사항) */
	    },function(resp){	//결제 성공 시
	    	if(resp.success){
				alert("결제 완료");
	    		
				$.ajax({
	    			type : "POST",
	    			url : "/chatMessage/successPay",
	    			data : {"chatRoomId" : chatRoomId, "countByRoom" : countByRoom},
	    			success: function() {
	    				window.close();
	    			}
	    		});
	    	}else{
	    		alert("결제 실패");
	    	}
	    });
	}
	
	function kgPay(){
		var chatRoomId = "${chatRoomId}";
		var countByRoom = "${countByRoom}";
		var finalPrice = "${finalPrice}";
		
		var IMP = window.IMP;
	    IMP.init("imp50346576");	//가맹점 식별 코드
		IMP.request_pay({
	    	pg :"html5_inicis",
	    	pay_method : "card",
	    	merchant_uid : "merchant_" + new Date().getTime(),
	    	name : "${post.postCatName}",
	    	amount : "${finalPrice}"
	    	/* buyer 정보 추가 (선택사항) */
	    },function(resp){	//결제 성공 시
	    	if(resp.success){
					alert("결제 완료");
	    		
		    		$.ajax({
		    			type : "POST",
		    			url : "/chatMessage/successPay",
		    			data : {"chatRoomId" : chatRoomId, "countByRoom" : countByRoom},
		    			success: function() {
		    				window.close();
		    			}
		    		});
		    		
	    	}else{
	    		alert("결제 실패");
	    	}
	    });
	}
</script>
<title>결제 페이지</title>
</head>
<body>
<h4>판매자 : ${sellerNickname }</h4>
<h4>상품 게시글 제목 : ${post.postTitle }</h4>
<c:set var="formattedPrice" value="${post.postPrice}" />

<h4>원래 가격 : <fmt:formatNumber value="${post.postPrice}" type="currency" />원</h4> 
<h4>결제 가격 : <fmt:formatNumber value="${finalPrice}" type="currency" />원</h4> 

<h4>결제 방법 선택</h4> 
<hr>

<button onclick="kakaoPay()">카카오페이</button>
<button onclick="tossPay()">토스페이</button>
<button onclick="kgPay()">KG이니시스(카드결제)</button>
	
</body>
</html>