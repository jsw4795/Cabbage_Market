// 알림 함수
const sse = new EventSource("/connect");
//커넥트 = 구독하고 있는 sseemitter 객체

sse.addEventListener('sse', e => {  
    const receivedData = e.data;
    console.log("이것은 서버에서 보내준 변경된 데이터다.",receivedData);  
    
 	if (receivedData != null) {
 	    	const dataObject = JSON.parse(receivedData);
 	
            const wishUserId = dataObject.id;
            const wishKeyword = dataObject.message;

            console.log("id: " + wishUserId + ", Wish message: " + wishKeyword);

            const someElement = document.getElementById('someElement');
            if (someElement) {
                let currentNumber = parseInt(someElement.innerText.trim(), 10) || 0;
                currentNumber++;
                someElement.innerHTML = `<span class="alrim" id="alrimCount">${currentNumber}</span>`;
            }

            const alrimList = document.getElementById('alrimList');
            const newLi = document.createElement('li');
            newLi.className = 'none-haeun-li';
            newLi.innerHTML = `<a class="none-haeun-a" href="${wishUserId}">${wishKeyword}</a>`;

            alrimList.appendChild(newLi);

            if (alrimList.childElementCount > 10) {
                alrimList.removeChild(alrimList.firstChild);
            }
    }
	
});


//스크롤 설정 함수
    var alrimDiv = document.getElementById('alrim');
    var body = document.body;

    alrimDiv.addEventListener('mouseenter', function () {
        body.classList.add('alrim-open');
    });

    alrimDiv.addEventListener('mouseleave', function () {
        body.classList.remove('alrim-open');
    });
    
    
    