<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 제이쿼리 cdn -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- sockjs 라이브러리 -->
<script type="text/javascript" src="resources/chat/js/sockjs-0.3.4.js"></script>

<!-- 제이쿼리 이벤트 라이브러리 cdn -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- 커스텀 스크롤바 라이브러리 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">

<!-- 시맨틱 사이드바 -->
<link href="resources/chat/css/sidebar.min.css" rel="stylesheet">
<script src="resources/chat/js/sidebar.min.js"></script>

<!-- 폰트 관련 링크 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">



<style>
body{
	font-family: 'Malgun Gothic';
	margin: 0px;
	overflow: hidden;
}
.main-section small{
	font-size: 12px;
}
.main-section h3, .main-section h5{
	margin: 0px;
}
.main-section{
	width: 100%;
	background-color: #fff;
	margin: auto;
}
.head-section{
	border-bottom:1px solid #E6E6E6;
	clear: both;
	overflow: hidden;
	width: 100%;
}
.headLeft-section{
	width: 100%;
	float: left;
	border-right:1px solid #E6E6E6;
}
.headLeft-sub{
	padding: 15px;
}
.headLeft-sub input{
	width: 80%;
	border:1px solid #E6E6E6;
	padding: 7px;
	background:#E6E6E6;
}

.searchArea{
	display:inline-block;
	width:60%;
	border-radius: 20px;
	padding-left: 7px;
	background:#E6E6E6;
}
.searchArea i{
	color:#cdcdcd;
	font-size: 14px;
}
.body-section{
	clear: both;
	overflow: hidden;
	width: 100%;
}

.left-section{
	width: 98%;
	float: left;
	height: 500px;
	border-right:1px solid #E6E6E6;
	background-color: #FFF;
	z-index: 1;
	position: relative;
}

.left-section ul{
	padding: 0px;
	margin: 0px;
	list-style: none;
}
.left-section ul li{
	padding: 15px 0px;
	cursor: pointer;
}
.left-section ul li:hover{
	background: #e1e1e1;
	position: relative;
	
}

.left-section .chatList{
	overflow: hidden;
}
.left-section .chatList .img{
	width: 60px;
	float: left;
	text-align: center;
	position: relative;
}
.left-section .chatList .img img{
	width: 25px;
	border-radius: 40%;
}

.left-section .chatList .desc{
	width: calc(100% - 60px);
	float: left;
	position: relative;
}
.left-section .chatList .desc h5{
	margin-top: 6px;
	line-height: 5px;
}
.left-section .chatList .desc .time{
	position: absolute;
	right: 15px;
	color: #c1c1c1;
}
.item:hover{
	color:black;
	cursor:pointer;
}

	
</style>

<script type="text/javascript">

    $(document).ready(function() {
		
		fn_scroll_plugin();
		
    	$(".searchArea").on("focus", "#search", function(){
	    	$(".searchArea").css("border","1px solid #cdcdcd");
	    	$(".searchArea i").css("color","#b4b4b4");
	    	$("#search").css("outline", "0px");
	    	$("#search").attr("placeholder", "");
    	});
    	
    	$(".searchArea").on("blur", "#search", function(){
	    	$(".searchArea").css("border","1px solid #e4e4e4");
	    	$(".searchArea i").css("color","#cdcdcd");
	    	$("#search").attr("placeholder", "채팅방 이름,참여자 검색");
    	});
    	
        $("#sendBtn").on("click", function() {	// 전송 버튼을 누를때

            sendMessage();	// 메소드 실행

        });
        $("#message").keydown(function (key) {	// 메세지 input태그에 키가 눌렸을때
            if (key.keyCode == 13) { // 엔터키면
                sendMessage();	// 메소드 실행
            }
        });
        
        
        $("#menu").on("click", function(){		// 메뉴 아이콘 클릭했을때
        	$('.ui.labeled.icon.sidebar').sidebar('toggle');	// 사이드바 토글 이벤트
        });
		
        var i = 0;

        $(document).on("dblclick", ".chatList", function(){	// 채팅방 더블클릭 했을때
        	console.log($(this).children().first().val());
        	var chatId = $(this).children().first().val();	// 더블클릭한 채팅방의 chatId
        	var chatName = $("#" +chatId);
        	/* var chatName = encodeURI(chatName); */
        	console.log(chatName.html());
        	messenger = window.open("chatting.do?chatId=" + chatId + "&chatName=" + chatName.html(), chatId + "chatting", "width=500,height=545", "false");
        });
    });


	// jQuery Scroll Plugin 적용
	function fn_scroll_plugin() {
		$(".left-section").mCustomScrollbar({
			theme : "minimal-dark", // 테마 적용
			mouseWheelPixels : 300, // 마우스휠 속도
			scrollInertia : 400 // 부드러운 스크롤 효과 적용
		});
	}

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");
	sock.onopen = onopen;
    function onopen(){
    	console.log("오픈");
    	sock.send("채팅방 연결");
    	
    }


    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

    sock.onmessage = onMessage;

    
    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;




 

    function sendMessage() {
	
		
        

    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;
		console.log(data);
        if(data == "채팅방 갱신"){
        	console.log("채팅방을 갱신하세요");
        	refresh();
        }

    }

	function refresh(){
		$.ajax({
			url:"refresh.do",
			type:"POST",
			data:{empId:"${loginUser.empId}"},
			dataType:"json",
			success:function(data){
				console.log(data);
				var html = ""
				var empId =	${loginUser.empId}
				$.each(data, function(indel, c){
				
				console.log("refresh실행");
					html += "<li>" +
						    "<div class='chatList'>" +
						    "<input type='hidden' name='chatId' value=" + 
						    c.chatId + 
						    " >" +
						    "<div class='img'>";
					if(c.chatType == 1 || c.count <= 2){
						$.each(c.profileList, function(index, profile){
							if(profile.chatId == c.chatId && profile.empId != empId){
								html += "<img src='resources/images/" +
										profile.profilePath + 
										"'>";
							}
						});
					}
					if(c.chatType == 2 && c.count >= 2){
						$.each(c.profileList, function(index, profile){
							if(index < 4){
								if(profile.chatId == c.chatId){
									html += "<img style='width:20px;' src='resources/images/" +
											profile.profilePath + 
											"'>";
								}
							}
						});
					}
					
					html += "</div>" +
							"<div class='desc'>" +
							"<small class='time'>" +
							c.modifyDate +
							"</small>" +
							"<h5 id=" + c.chatId + ">" + c.chatName + "</h5>" +
							"<small>" + c.lastMsg + "</small>";
					if(c.unRead > 0){
						html += "<div style='width:5%; text-align:center; float:right; border-radius:50%; background-color:red; color:white;'>" +
								c.unRead +
								"</div>";
						
					}
							
					html += "</div>" +
							"</div>" +
							"</li>";
				});
				$("#allList").html(html);
			},
			error:function(){
				
			}
		});
	}
	
    function onClose(evt) {
        $("#data").append("연결 끊김");

    }

</script>

</head>
<body>
	<div class="ui left demo vertical inverted very thin sidebar labeled icon menu" style="background:#e1e1e1; text-align:center; color:rgb(166, 166, 166);">
		<br>
		<div class="item" onclick="location.href='chat.do';">
	    	<i class="fa fa-2x fa-user"></i>
	    	<br>친구
	    </div>
	    <br>
	    <div class="item" style="color:black;">
	  		<i class="fa fa-2x fa-comment"></i>
	  		<br>채팅
	  	</div>
	  	<br>
	  	<div class="item">
	    	<i class="fa fa-2x fa-ellipsis-h"></i>
	    	<br>더보기
	  	</div>
	</div>
	<div class="pusher">
		<div class="main-section">
			<div class="head-section">
				<div class="headLeft-section">
					<div class="headLeft-sub">
						<div style="box-sizing:border-box;padding-bottom:5px;">
							<i class="fa fa-align-justify" id="menu"></i>
							<div class="searchArea">
								<i class="fa fa-search"></i>
								<input type="text" id="search" name="search" placeholder="채팅방 이름,참여자 검색">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="body-section">
				<div class="left-section" data-mcs-theme="minimal-dark">
					<ul id="allList">
						<c:forEach items="${chatList }" var="c">
						<li>
							<div class="chatList">
								<input type="hidden" name="chatId" value="${c.chatId }" >
								<div class="img">
									<c:if test="${c.chatType == 1 || c.count <= 2}">
										<c:forEach items="${c.profileList }" var="profile">
											<c:if test="${profile.chatId == c.chatId && profile.empId ne loginUser.empId }">
												<img src="resources/images/${profile.profilePath }">
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${c.chatType == 2 && c.count >= 2 }">
										<c:forEach items="${c.profileList }" var="profile" varStatus="status">
											<c:if test="${status.index < 4}">
												<c:if test="${profile.chatId == c.chatId}">
													<img style="width:20px;" src="resources/images/${profile.profilePath }">
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
								
								<div class="desc">
									<small class="time">${c.modifyDate }</small>
									<h5 id="${c.chatId}">${c.chatName }</h5>
									<small>${c.lastMsg }</small>
									<c:if test="${c.unRead > 0}">
										<div style="width:5%; text-align:center; float:right; border-radius:50%; background-color:red; color:white;">${c.unRead }</div>
									</c:if>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>