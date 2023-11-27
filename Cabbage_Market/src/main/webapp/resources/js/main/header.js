// 페이지 로딩 후 실행할 함수
document.addEventListener("DOMContentLoaded", function () {
  // 숫자가 0이면 display를 none으로 설정
  var alrimCount = document.getElementById("alrimCount");
  if (alrimCount != null && alrimCount.innerText === "0") {
    alrimCount.style.display = "none";
  }
});

function toggleDiv(type) {
  var myPageDiv = document.getElementById(type);

  if (type === "alrim") {
    var alrimCount = document.getElementById("alrimCount");

    if (!myPageDiv.style.display || myPageDiv.style.display === "none") {
      myPageDiv.style.display = "block";

      // 'alrimCount' ID를 가진 요소가 존재하는지 확인
      if (alrimCount) {
        alrimCount.innerHTML = "0";
        alrimCount.style.display = "none";
      }
    } else {
      myPageDiv.style.display = "none";
    }
  } else {
    if (!myPageDiv.style.display || myPageDiv.style.display === "none") {
      myPageDiv.style.display = "block";
    } else {
      myPageDiv.style.display = "none";
    }
  }
}
