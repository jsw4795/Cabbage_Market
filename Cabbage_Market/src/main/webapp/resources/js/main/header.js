// 페이지 로딩 후 실행할 함수
document.addEventListener("DOMContentLoaded", function () {
  // 숫자가 0이면 display를 none으로 설정
  var alrimCount = document.getElementById("alrimCount");
  if (alrimCount != null && alrimCount.innerText === "0") {
    alrimCount.style.display = "none";
  }
});

//알림 갯수 컨트롤
function toggleDiv(type) {
  var myPageDiv = document.getElementById(type);

  if (type === "alrim") {
    var alrimCount = document.getElementById("alrimCount");

    if (!myPageDiv.style.display || myPageDiv.style.display === "none") {
      var myDiv = document.getElementById("my");
      myDiv.style.display = "none";
      myPageDiv.style.display = "block";

      // 'alrimCount' ID를 가진 요소가 존재하는지 확인
      if (alrimCount) {
        alrimCount.innerHTML = "0";
        alrimCount.style.display = "none";
      }
      $.ajax({
        type: "get",
        url: "/updateNoti",
        success: function (data) {
          console.log("header에서 읽음으로 변경");
        },
      });
    } else {
      myPageDiv.style.display = "none";
    }
  } else {
    if (!myPageDiv.style.display || myPageDiv.style.display === "none") {
      var alrimDiv = document.getElementById("alrim");
      alrimDiv.style.display = "none";
      myPageDiv.style.display = "block";
    } else {
      myPageDiv.style.display = "none";
    }
  }
}
