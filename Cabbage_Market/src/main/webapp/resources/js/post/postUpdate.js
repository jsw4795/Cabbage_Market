    var fileArr = [];
    function deleteUploaded(deleteIcon, fileId) {
    	Swal.fire({
 		   title: '',
 		   text: '이 이미지를 삭제하시겠습니까?',
 		   icon: 'question',
 		   
 		   showCancelButton: true, 		  // cancel버튼 보이기. 기본은 원래 없음
 		   confirmButtonColor: '#9DC08B', // confrim 버튼 색깔 지정
 		   cancelButtonColor: '#d33', 	  // cancel 버튼 색깔 지정
 		   confirmButtonText: '삭제', 	  // confirm 버튼 텍스트 지정
 		   cancelButtonText: '취소', 	  // cancel 버튼 텍스트 지정
 		   
 		}).then(result => {
	        if (result.isConfirmed) {
	            // 삭제 아이콘 누르면 privew에서 제외
	            deleteIcon.parentElement.parentElement.remove();
	
	            fileArr.push(fileId);
	        }
 		});
    }
    
    function submitForm() {
        var formData = new FormData(document.getElementById('updateForm'));

        // fileArr 값을 formData에 추가
        if (fileArr.length > 0) {
	        for (var i = 0; i < fileArr.length; i++) {
	            formData.append('fileIdArr[' + i + ']', fileArr[i]);
	        }
    	}

        $.ajax({
            url: "/post/updatePost",
            type: "post",
            //dataType: "json",
            data: formData,
            contentType: false, // 필수
            processData: false, // 필수
            success: function (data) {
            	console.log("성공 + data : " + JSON.stringify(data));
                
            	window.location.href = "/post/getPostList";
            },
            error: function (jqXHR, textStatus, errorThrown) {
            	Swal.fire({
         		   title: '실패',
         		   text: '계속된 실패시 관리자에게 문의해주세요.',
         		   icon: 'warning',
         		   
         		   confirmButtonColor: '#9DC08B', // confrim 버튼 색깔 지정
         		   cancelButtonColor: '#d33', 	  // cancel 버튼 색깔 지정
         		   confirmButtonText: '확인', 	  // confirm 버튼 텍스트 지정
         		   
         		});
            	
                console.log(textStatus);
                console.log(errorThrown);
                
            }
        });
    }
    
    const dataTransfer = new DataTransfer();
    const uploadFilesArray = [];
    
    function previewImages(event) {
        var input = event.target;
        var previewContainer = document.getElementById('preview-container');

        // 확장자 제한
        var allowExtension = ['jpg', 'jpeg', 'png'];

        if (input.files && input.files.length > 0) {
            for (var i = 0; i < input.files.length; i++) {
                const fileName = input.files[i].name;
                const fileExtension = fileName.split('.').pop().toLowerCase();

                // 확장자 검사
                if (allowExtension.indexOf(fileExtension) === -1) {
                	Swal.fire({
                		   title: '',
                		   text: 'jpg, jpeg, png 형식의 이미지만 업로드 가능합니다.',
                		   icon: 'warning',
                		   
                		   confirmButtonColor: '#9DC08B', // confrim 버튼 색깔 지정
                		   cancelButtonColor: '#d33', 	  // cancel 버튼 색깔 지정
                		   confirmButtonText: '확인', 	  // confirm 버튼 텍스트 지정
                		   
                	});
                    return;
                }
	            
                uploadFilesArray.push(input.files[i]);
                console.log("uploadFilesArray : " + uploadFilesArray);
                
                let uploadedFiles = input.files;
	            console.log("uploadedFiles : " + uploadedFiles);

                var reader = new FileReader();
                reader.onload = function (e) {
                    var previewItem = document.createElement('li');
                    previewItem.className = 'preview-item'; 

                    var previewImage = document.createElement('img');
                    previewImage.className = 'preview-image';
                    previewImage.src = e.target.result;

                    var deleteIcon = document.createElement('span');
                    deleteIcon.className = 'delete-icon';
                    deleteIcon.innerHTML = 'X';
                    deleteIcon.addEventListener('click', function () {
                        removeFileFromArray(this);
                        previewItem.remove();
                    });

                    previewItem.appendChild(previewImage);
                    previewItem.appendChild(deleteIcon);
                    previewContainer.appendChild(previewItem);
                    
                };
                reader.readAsDataURL(input.files[i]);
            }
        }
     	// 업로드된 파일 배열을 dataTransfer로 처리
        dataTransfer.items.clear();
        uploadFilesArray.forEach(file => { dataTransfer.items.add(file); });

        // 파일 입력 요소에 업로드된 파일 목록 할당
        $('#uploadFile')[0].files = dataTransfer.files;
    }
	
    function removeFileFromArray(obj) {
    	console.log(obj);
    	
    	let div = $(obj).closest('.preview-item');
    	console.log("div : " + div);
    	
    	let index = div.index();
    	console.log("index : " + index);
    	
	    uploadFilesArray.splice(index, 1);
	    console.log("uploadFilesArray : " + uploadFilesArray);
	    
	    dataTransfer.items.clear();
		uploadFilesArray.forEach(file => { dataTransfer.items.add(file); });
	    
	    //남은 배열을 dataTransfer로 처리(Array -> FileList)
	    $('#uploadFile')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
	    console.log("끝")
    }
        

        //공백 판독
	document.addEventListener('DOMContentLoaded', function () {
        var postTitleInput = document.getElementById('postTitle');
        var postTitleError = document.getElementById('postTitleError');
        var postContentInput = document.getElementById('postContent');
        var postContentError = document.getElementById('postContentError');

        postTitleInput.addEventListener('input', function () {
          var trimmedValue = postTitleInput.value.trim();

          if (trimmedValue === '') {
            postTitleError.style.display = 'block';
          } else {
            postTitleError.style.display = 'none';
          }
        });
        postContentInput.addEventListener('input', function () {
          var trimmedValue = postContentInput.value.trim();

          if (trimmedValue === '') {
            postContentError.style.display = 'block';
          } else {
            postContentError.style.display = 'none';
          }
        });
      });        
        
        function openFileInput() {
            document.getElementById('file-input-container').click();
        }
     