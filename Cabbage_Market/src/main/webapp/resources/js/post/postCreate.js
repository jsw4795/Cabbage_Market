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
                    alert('jpg, jpeg, png 형식의 이미지만 업로드 가능합니다.');
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
	    //fileArray.forEach(file => { dataTransfer.items.add(file); });
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
        