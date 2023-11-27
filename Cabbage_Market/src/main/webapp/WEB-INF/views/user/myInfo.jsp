<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/user/test.css" />
<script>

$(document).ready(function() {
    purchaseList();
	$('.sc-gVyKpa').click(function() {
	    $('.sc-gVyKpa').removeClass('kHfkPy').addClass('gmerZt');
	    $(this).removeClass('gmerZt').addClass('kHfkPy');
	    $('.sc-gVyKpa.gmerZt2').removeClass('gmerZt2').addClass('kHfkPy');
	});
	

	
});

$(document).on('click', '#wishKeywordbtn', function (e) { console.log("clickevent"); 
		$('#modal').addClass('show'); });
		
$(document).on('click', '#close_btn', function (e) {
		console.log("click event"); 
		$('#modal').removeClass('show'); 
});



	function purchaseList() {
		  $.ajax({
		    type: 'POST',
		    url: '/user/purchaseList',
		    dataType: 'json',
		    success: function(response) {
		    	 	let productContainer = $('.product-container');
	                productContainer.empty(); // 기존 상품 삭제
	                // 서버에서 받은 데이터로 상품 목록 생성
	                response.forEach(function (product) {  
	                    const productDiv = `
	                        <div class="sc-bIqbHp deAjQN">
	                            <a class="sc-dREXXX hsBvIx" href="/products/\${product.postId}?ref=%EC%B0%9C">
	                                <div class="sc-iIHSe liqURL">
	                                    <div class="sc-fEUNkw HyCgM"></div>
	                                </div>
	                                <div class="sc-kcbnda cgazhg">
	                                    <img src= "/resources/pic/profilePic/\${product.fileName}" alt="상품 이미지" />
	                                    <div class="sc-cJOK bosAdb"></div>
	                                </div>
	                                <div class="sc-dHmInP boOsEk">
	                                    <div class="sc-hcmgZB izvjFP">
	                                        <div class="sc-ejGVNB hjxvQC">\${product.postTitle}</div>
	                                        <div class="sc-iiUIRa jBkujo">
	                                            <div class="postPrice">\${product.postPrice}</div>
	                                        </div>
	                                        <div class="sc-eLdqWK cEmwLf">\${product.postRegdate}</div>
	                                    </div>
	                                    <div class="sc-hgRTRy eYqEDw">\${product.postStatus}</div>
	                                </div>
	                            </a>
	                        </div>`;

	                    productContainer.append(productDiv); // 상품을 컨테이너에 추가
	                });
	            },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		}
	
	function salesList() {
		  $.ajax({
		    type: 'POST',
		    url: 'salesList',
		    dataType: 'json',
		    success: function(response) {
		    	 	let productContainer = $('.product-container');
	                productContainer.empty(); // 기존 상품 삭제
	                   
	                // 서버에서 받은 데이터로 상품 목록 생성
	                response.forEach(function (product) {
	                    const productDiv = `
	                        <div class="sc-bIqbHp deAjQN">
	                            <a class="sc-dREXXX hsBvIx" href="/products/\${product.postId}?ref=게시물상세보기">
	                                <div class="sc-iIHSe liqURL">
	                                    <div class="sc-fEUNkw HyCgM"></div>
	                                </div>
	                                <div class="sc-kcbnda cgazhg">
	                                    <img src= "/resources/pic/profilePic/\${product.fileName}" alt="상품 이미지" />
	                                    <div class="sc-cJOK bosAdb"></div>
	                                </div>
	                                <div class="sc-dHmInP boOsEk">
	                                    <div class="sc-hcmgZB izvjFP">
	                                        <div class="sc-ejGVNB hjxvQC">\${product.postTitle}</div>
	                                        <div class="sc-iiUIRa jBkujo">
	                                            <div class="postPrice">\${product.postPrice}</div>
	                                        </div>
	                                        <div class="sc-eLdqWK cEmwLf">\${product.postRegdate}</div>
	                                    </div>
	                                    <div class="sc-hgRTRy eYqEDw">\${product.postStatus}</div>
	                                </div>
	                            </a>
	                        </div>`;

	                    productContainer.append(productDiv); // 상품을 컨테이너에 추가
	                });
	            },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		}
	
	function wishList() {
		  $.ajax({
		    type: 'POST',
		    url: 'wishList',
		    dataType: 'json',
		    success: function(response) {
		    	 	let productContainer = $('.product-container');
	                productContainer.empty(); // 기존 상품 삭제
	                // 서버에서 받은 데이터로 상품 목록 생성
	                response.forEach(function (product) {
	                	console.log(product);
						
	                    const productDiv = `
	                        <div class="sc-bIqbHp deAjQN">
	                            <a class="sc-dREXXX hsBvIx" href="/products/\${product.postId}?ref=%EC%B0%9C">
	                                <div class="sc-iIHSe liqURL">
	                                    <div class="sc-fEUNkw HyCgM"></div>
	                                </div>
	                                <div class="sc-kcbnda cgazhg">
	                                    <img src= "/resources/pic/profilePic/\${product.fileName}" alt="상품 이미지" />
	                                    <div class="sc-cJOK bosAdb"></div>
	                                </div>
	                                <div class="sc-dHmInP boOsEk">
	                                    <div class="sc-hcmgZB izvjFP">
	                                        <div class="sc-ejGVNB hjxvQC">\${product.postTitle}</div>
	                                        <div class="sc-iiUIRa jBkujo">
	                                            <div class="postPrice">\${product.postPrice}</div>
	                                        </div>
	                                        <div class="sc-eLdqWK cEmwLf">\${product.postRegdate}</div>
	                                    </div>
	                                    <div class="sc-hgRTRy eYqEDw">\${product.postStatus}</div>
	                                </div>
	                            </a>
	                        </div>`;

	                    productContainer.append(productDiv); // 상품을 컨테이너에 추가
	                });
	            },
		    error: function(xhr, status, error) {

		      console.error(error);
		    }
		  });
		}
	
	function openFileUploader() {
	    document.getElementById("uploadFileInput").click();
	}

	function uploadSelectedFile(event) {
	    const file = event.target.files[0];
	    if (!file.type.match('image.*')) {
	        alert("이미지 파일을 선택해주세요.");
	        return;
	    }
	    
	    const formData = new FormData();
	    formData.append('uploadFile', file);

	    $.ajax({
	        type: 'POST',
	        url: 'profileUpload',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response) {
	            // 성공 시 동작
	        	alert("프로필사진이 변경되었습니다.");
	        	location.reload();
	        },
	        error: function(xhr, status, error) {
	            // 에러 시 동작
	            console.error("파일 업로드 에러:", error);
	        }
	    });
	}
	
	$(document).ready(function() {
	    $('#editUserInfoBtn').click(function() {
	        window.location.href = '/user/infoUpdate'; // 해당 URL로 이동
	    });
	    
	    $('#deleteUser').click(function() {
	        window.location.href = '/user/deleteUser'; // 해당 URL로 이동
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
									src="/resources/pic/profilePic/${user.userProfile}"  
									width="100" height="100" alt="프로필 이미지" class="sc-cooIXK bORTpS"/>
								<div class="sc-fcdeBU wCwuR">${user.userNickname}</div>
								<div class="sc-iBEsjs dQLwrX">${user.userOndo}°C</div>
								<c:if test="${nowUserId == user.userId }">
									<div class="sc-RcBXQ dsTcaJ">
										<a class="sc-bEjcJn jHSADa" href="javascript:void(0);"
											onclick="openFileUploader()">프로필 변경</a>
											
											<input type="file" id="uploadFileInput" name="uploadFile"
												accept="image/*" style="display: none;"
												onchange="uploadSelectedFile(event)" />
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="sc-hgHYgh kDkgVT">
					<div class="sc-eInJlc hkaFNj">
						<div class="sc-likbZx ixFzSN">
							${user.userNickname}
							<c:if test="${nowUserId == user.userId }">
								<button class="sc-kasBVs blcYdX" id="editUserInfoBtn">회원정보 수정</button>
								<button class="sc-kasBVs blcYdX" id="deleteUser">회원 탈퇴</button>
							</c:if>
						</div>
					</div>
					<div class="sc-gtfDJT bheHtc">
						<div class="sc-fOICqy inwZpQ">
							${user.userNickname }의 마켓 시작
							<div class="sc-hzDEsm cskGhu">${user.userRegdate}</div>
						</div>
					</div>
					<div class="sc-hRmvpr eMCCXV">ㅇㅇㅇ</div>
					<c:if test="${nowUserId == user.userId }">
						<div class="sc-ecaExY iPyIZi"><button class="sc-jKmXuR thnxK" id="wishKeywordbtn">관심 키워드 설정</button></div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="sc-OxbzP fUqZYe">
			<div class="sc-cFlXAS hJvCHs">
				<div class="sc-gpHHfC dvLjiM">
					<c:if test="${nowUserId == user.userId }">
						<a class="sc-gVyKpa kHfkPy" href="javascript:purchaseList()">구매내역
							<span class="sc-cpmKsF gyLEXJ">db카운트</span>
						</a>
					</c:if>
					<a class="sc-gVyKpa gmerZt"  href="javascript:salesList()">판매내역
						<span class="sc-cpmKsF gyLEXJ">db카운트</span>
					</a>
					
					<c:if test="${nowUserId == user.userId }">
						<a class="sc-gVyKpa gmerZt2"  href="javascript:wishList()">관심
							<span class="sc-cpmKsF gyLEXJ">db카운트</span>
						</a>
					</c:if>
				</div>
			</div>
			<div class="sc-hcnlBt jfMCiR">
				<div class="sc-hkbPbT wqlOc">
					<div class="sc-kQsIoO gvsXqb">
					</div>
					<div class="sc-jxGEyO drYqMd">
						<div class="sc-dEfkYy ckyNBp">
						
						<c:if test="${nowUserId == user.userId }">
							<div class="sc-cqPOvA gxRxBk">
								<div class="sc-fEUNkw HyCgM"></div>
								<button class="sc-eEieub gEiEYU">선택삭제</button>
							</div>
						</c:if>
						
						</div>
						<div class="sc-drlKqa hupeiQ">
							<div class="product-container">
								<div class="sc-bIqbHp deAjQN">
									<!-- 여기에 반복 -->
									<a class="sc-dREXXX hsBvIx">
										<div class="sc-iIHSe liqURL">
											<div class="sc-fEUNkw HyCgM"></div>
										</div>
										<div class="sc-kcbnda cgazhg">
											<div class="sc-cJOK bosAdb"></div>
										</div>
										<div class="sc-dHmInP boOsEk">
											<div class="sc-hcmgZB izvjFP">
												<div class="sc-ejGVNB hjxvQC"></div>
												<div class="sc-iiUIRa jBkujo">
													<div id="postPrice"></div>
												</div>
												<div class="sc-eLdqWK cEmwLf"></div>
											</div>
											<div class="sc-hgRTRy eYqEDw"></div>
										</div>
									</a>
								</div>
								<!-- 여기에 반복  끝-->
							</div>

						</div>
					</div>
					<div class="sc-fjhmcy flxQHS"></div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- 모달 -->
<div class="modal" id="modal">
	<div class="modal_body">
		<div class="m_head">
			<div class="modal_title">나의 관심 키워드</div>
			<div class="close_btn" id="close_btn">X</div>
		</div>
		<div class="m_body">
			<input type="text" class="input_box" id="name_box" placeholder=" 관심 키워드를 입력해주세요"/>
		</div>
		<div class="m_footer">
			<div class="modal_btn cancle" id="close_btn">닫기</div>
			<div class="modal_btn save" id="save_btn">확인</div>
		</div>
	</div>
</div>
<!-- 모달 -->
</html>