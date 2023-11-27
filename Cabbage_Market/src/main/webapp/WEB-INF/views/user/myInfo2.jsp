<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/user/test.css" />
<script>

	
	function purchaseList() {
		  $.ajax({
		    type: 'POST',
		    url: 'purchaseList',
		    dataType: 'json',
		    success: function(response) {
      
		    	 let title = response[0].postTitle; 
		    	 $('.sc-ejGVNB.hjxvQC').html(title);
		    	 
		    	 let price = response[0].postPrice; 
		    	 $('#postPrice').html(price);

		         
		    },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		}
	
	$('#sales').on('click', function() {	  
		  $.ajax({
		    type: 'POST',
		    url: 'salesList',
		    dataType: 'json',
		    success: function(response) {
		      let dispTag = "<ul>";
		      
		      // 서버로부터 받은 응답 데이터를 반복하여 표시
		      for (let i = 0; i < response.length; i++) {
		        dispTag += "<li>";
		        dispTag += response[i].postId + ", ";
		        dispTag += response[i].postTitle + ", ";
		        dispTag += response[i].postPrice + ", ";
		        dispTag += response[i].fileName;
		        dispTag += "</li>";
		      }
		      dispTag += "</ul>";


		      $("#listDisp").html(dispTag);
		    },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		});
	
	$('#wish').on('click', function() {
		  $.ajax({
		    type: 'POST',
		    url: 'wishList',
		    dataType: 'json',
		    success: function(response) {
		      let dispTag = "<ul>";
		      
		      // 서버로부터 받은 응답 데이터를 반복하여 표시
		      for (let i = 0; i < response.length; i++) {
		        dispTag += "<li>";
		        dispTag += response[i].postId + ", ";
		        dispTag += response[i].postTitle + ", ";
		        dispTag += response[i].postPrice + ", ";
		        dispTag += response[i].fileName;
		        dispTag += "</li>";
		      }
		      dispTag += "</ul>";


		      $("#listDisp").html(dispTag);
		    },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		});

</script>
</head>
<body>
	<div class="sc-kqlzXE bvAAFa">
		<div class="sc-jRhVzh kyOmSl">
			<div class="sc-jXQZqI jiarQh">
				<div class="sc-iGPElx ermrpj">
					<div class="sc-hzNEM dNTrAm">
						<div size="310" class="sc-chbbiW ipXCvk">
							<div class="sc-gmeYpB leXbQf">
								<div class="sc-kZmsYB iIspdD"></div>
							</div>
							<div class="sc-kxynE eRUQZt">
								<img
									src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxjaXJjbGUgZmlsbD0iI0ZBRkFGQSIgY3g9IjUwIiBjeT0iNTAiIHI9IjUwIi8+CiAgICAgICAgPHBhdGggZD0iTTM2LjIxNiA0MS42ODNjLjI0OC0xLjkzMS40OTgtMy44NjIuNzUtNS43OTRoNi43OWwtLjI4MyA1LjUzN2MwIC4wMTcuMDA3LjAzNC4wMDcuMDUxLS4wMDIuMDEtLjAwMi4wMi0uMDAyLjAzLS4wOTggMS44NzYtMS44OTcgMy4zOTItNC4wMzUgMy4zOTItMS4wNjYgMC0yLjAxOC0uMzktMi42MTUtMS4wNzItLjUxLS41ODUtLjcyMi0xLjMyNS0uNjEyLTIuMTQ0em04Ljg4OCA0LjA3OGMxLjIyNCAxLjI4OSAzLjAwOSAyLjAyOCA0Ljg5IDIuMDI4IDEuODkgMCAzLjY3NC0uNzQgNC45LTIuMDMzLjEwNy0uMTEyLjIwNy0uMjI4LjMwNC0uMzQ1IDEuMjggMS40NDcgMy4yMTcgMi4zNzggNS4zNSAyLjM3OC4xMTIgMCAuMjE2LS4wMjcuMzI4LS4wMzJWNjMuNkgzOS4xMTVWNDcuNzU3Yy4xMTIuMDA1LjIxNS4wMzIuMzI4LjAzMiAyLjEzMyAwIDQuMDcxLS45MzEgNS4zNTEtMi4zOC4wOTkuMTIxLjIuMjM4LjMxLjM1MnptMS41NDUtOS44NzJoNi42OThsLjI4MiA1LjYxOWMwIC4wMTUtLjAwNy4wMjctLjAwNy4wNGwuMDA0LjA4NmEyLjkzOSAyLjkzOSAwIDAgMS0uODI2IDIuMTMyYy0xLjM2NyAxLjQ0LTQuMjMzIDEuNDQxLTUuNjA0LjAwM2EyLjk1IDIuOTUgMCAwIDEtLjgzLTIuMTQybC4wMDQtLjA3OGMwLS4wMTYtLjAwOC0uMDMtLjAwOC0uMDQ4bC4yODctNS42MTJ6bTE2LjM3NiAwYy4yNTIgMS45MzMuNTAyIDMuODY1Ljc1MyA1LjgwNC4xMDkuODEtLjEwNCAxLjU0Ny0uNjE0IDIuMTMyLS41OTYuNjgzLTEuNTUgMS4wNzQtMi42MTYgMS4wNzQtMi4xMzcgMC0zLjkzMi0xLjUxNC00LjAzNC0zLjM4OGEuMzU5LjM1OSAwIDAgMC0uMDAzLS4wNDRjMC0uMDE1LjAwNi0uMDI3LjAwNi0uMDRsLS4yNzgtNS41MzhoNi43ODZ6TTM2LjIyNiA0Ni45NDZ2MTguMDk4YzAgLjc5OC42NDYgMS40NDUgMS40NDQgMS40NDVoMjQuNjVjLjc5OSAwIDEuNDQ1LS42NDcgMS40NDUtMS40NDVWNDYuOTQ2Yy41OS0uMzI4IDEuMTM3LS43MTkgMS41NzUtMS4yMiAxLjA2MS0xLjIxNCAxLjUyMi0yLjc4NSAxLjMwMS00LjQxLS4zLTIuMzU1LS42MDctNC43MDctLjkxOC03LjA2YTEuNDQzIDEuNDQzIDAgMCAwLTEuNDMxLTEuMjU3SDM1LjY5OWMtLjcyNCAwLTEuMzM4LjUzOC0xLjQzMSAxLjI1Ny0uMzExIDIuMzU0LS42MTcgNC43MDctLjkxNiA3LjA1LS4yMjEgMS42MzcuMjQgMy4yMDggMS4zIDQuNDIxLjQzOS41MDIuOTg0Ljg5MyAxLjU3NCAxLjIyeiIgZmlsbD0iI0NDQyIvPgogICAgPC9nPgo8L3N2Zz4K"
									width="100" height="100" alt="프로필 이미지" class="sc-cooIXK bORTpS" />
								<div class="sc-fcdeBU wCwuR">닉네임</div>
								<div class="sc-iBEsjs dQLwrX">온도 넣을곳</div>
								<div class="sc-RcBXQ dsTcaJ">
									<a class="sc-bEjcJn jHSADa" href="/products/manage">프로필 변경</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sc-hgHYgh kDkgVT">
					<div class="sc-eInJlc hkaFNj">
						<div class="sc-likbZx ixFzSN">
							닉네임
							<button class="sc-kasBVs blcYdX">회원정보 수정</button>
						</div>
					</div>
					<div class="sc-gtfDJT bheHtc">
						<div class="sc-fOICqy inwZpQ">
							계정생성일
							<div class="sc-hzDEsm cskGhu">2023-11-23</div>
						</div>
					</div>
					<div class="sc-jeCdPy klBxMk"></div>
				</div>
			</div>
		</div>
		<div class="sc-OxbzP fUqZYe">
			<div class="sc-cFlXAS hJvCHs">
				<div class="sc-gpHHfC dvLjiM">
					<a class="sc-gVyKpa kHfkPy" href="javascript:purchaseList()">구매내역
						<span class="sc-cpmKsF gyLEXJ">0</span>
					</a><a class="sc-gVyKpa gmerZt" href="/shop/82368992/reviews">판매내역
						<span class="sc-cpmKsF gyLEXJ">0</span>
					</a><a class="sc-gVyKpa gmerZt" href="/shop/82368992/favorites">관심
						<span class="sc-cpmKsF gyLEXJ">1</span>
					</a>
				</div>
			</div>
			<div class="sc-hcnlBt jfMCiR">
				<div class="sc-hkbPbT wqlOc">
					<div class="sc-kQsIoO gvsXqb">
						<div>
							찜<span class="sc-gacfCG fyWmUi">0</span>
						</div>
					</div>
					<div class="sc-jxGEyO drYqMd">
						<div class="sc-dEfkYy ckyNBp">
							<div class="sc-cqPOvA gxRxBk">
								<div class="sc-fEUNkw HyCgM"></div>
								<button class="sc-eEieub gEiEYU">선택삭제</button>
							</div>
						</div>
						<div class="sc-drlKqa hupeiQ">
							<div class="sc-bIqbHp deAjQN">
								<a class="sc-dREXXX hsBvIx"
									href="/products/243283448?ref=%EC%B0%9C">
									<div class="sc-iIHSe liqURL">
										<div class="sc-fEUNkw HyCgM"></div>
									</div>
									<div class="sc-kcbnda cgazhg">
										<img
											src="https://media.bunjang.co.kr/product/243283448_1_1700578620_w268.jpg"
											alt="상품 이미지" />
										<div class="sc-cJOK bosAdb"></div>
									</div>
									<div class="sc-dHmInP boOsEk">
										<div class="sc-hcmgZB izvjFP">
											<div class="sc-ejGVNB hjxvQC">포켓몬카드 코라이돈sar brg10</div>
											<div class="sc-iiUIRa jBkujo">
												<div id="postPrice">147,000</div>
											</div>
											<div class="sc-eLdqWK cEmwLf">2일 전</div>
										</div>
										<div class="sc-hgRTRy eYqEDw">위치없음</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="sc-fjhmcy flxQHS"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>