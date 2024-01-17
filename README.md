# Cabbage Market

당근 마켓을 모티브로 만든 중고거래 사이트입니다.

원하는 게시글의 판매자와의 채팅으로 의견을 조율하고 중고 거래를 중계해주는 역할을 합니다.

<br />

# 📃 프로젝트 정보

### 1. 제작기간

- 2023.11.14 - 11.30

### 2. 참여 인원

- 6명 / ITWILL(국비지원 학원) 학원생

### 3. 역할 분담

- 정성욱 :  채팅, 팀원들 코드 통합

<br />

# 📚 사용 기술

### 1. Back-end

 - Java 8
 - Spring (Legacy Project)
 - JSP / JSTL
 - Oracle / MyBatis

### 2. Front-end

 - HTML
 - CSS
 - JavaScript / jQuery / Ajax

<br />

# 📊 ERD

<details>
<summary>ERD</summary>
<div markdown="1" style="padding-left: 15px;">
<img src="https://github.com/jsw4795/Music_Station/assets/33516979/c94ec47d-1709-49c8-a07f-6d62ce3578a6" width="1000px"/> 
</div>
</details>

# 🔑 핵심기능

### 1. 채팅

> - 게시글별로 채팅방이 생성되며 판매자와 구매자가 채팅을 통해 대화를 할 수 있습니다.
>
> - 메세지, 사진, 이모티콘을 전송 가능합니다.
>
> <details>
> <summary>시연 GIF</summary>
> <div markdown="1" style="padding-left: 15px;">
> <img src="https://github.com/jsw4795/Music_Station/assets/33516979/73b6fd5c-02f3-445c-966e-c2ed57fdbff7" width="1000px"/> 
> </div>
> </details>
<br />
<br />

> - 전송 후 5분 이내의 자신의 메세지를 삭제할 수 있습니다.
>
> <details>
> <summary>시연 GIF</summary>
> <div markdown="1" style="padding-left: 15px;">
> <img src="https://github.com/jsw4795/Music_Station/assets/33516979/d66b1e91-f898-4e4e-98cf-8eb2c10a2a40" width="1000px"/> 
> </div>
> </details>
<br />
<br />

> - 채팅 내에서 판매자는 최종 가격을 결정하여 결제 요청을 보내고, 구매자는 상대방이 보낸 링크를 통해 결제합니다.
>
> <details>
> <summary>시연 GIF</summary>
> <div markdown="1" style="padding-left: 15px;">
> <img src="https://github.com/jsw4795/Music_Station/assets/33516979/1f029e48-a17c-42d3-a2bb-034a32e92a23" width="1000px"/> 
> </div>
> </details>
<br />
<br />

> - 채팅방을 나가면 본인의 계정에서만 내용이 사라지고, 상대방에게는 남아있습니다.
>
> <details>
> <summary>시연 GIF</summary>
> <div markdown="1" style="padding-left: 15px;">
> <img src="https://github.com/jsw4795/Music_Station/assets/33516979/fe5c8db3-ee45-481c-afba-79d928fb391e" width="1000px"/> 
> </div>
> </details>
<br />


<br />

# 🚨 문제 상황
## 새로 업로도된 리소스(사진) 인식 지연
> 서버에 새로 업로드된 파일을 인식할때 까지 약 8초의 시간이 소요됨
- 리소스 디렉토리가 프로젝트 내부에 위치한 것이 문제라는 것 인식
- 리소스 디렉토리를 프로젝트 외부로 빼고, server.xml에 Context태그를 추가하여 /resource/pic에 대한 요청을 해당 디렉토리에서 찾도록 설정
- **결과 : 새로 업로드된 사진들이 실시간으로 반영됨**
<br />

## 채팅 구현 방식 설정
> 채팅을 소켓으로 구현하던 중 소켓 방식은 비효율적일것 같다는 생각이 듦
- SSE (Server-Sent-Event) 방식을 사용하여 구현하는 것으로 변경
- 클라이언트가 메세지를 보낼때는 AJAX 사용
- **결과 : 핸드쉐이킹 횟수를 줄여 효율적인 채팅 개발**

