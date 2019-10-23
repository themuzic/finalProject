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

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">


<style>
body{
	font-family: 'Noto Serif KR', serif;
	margin: 0px;
	overflow: hidden;
}
.main-section small{
	font-size: 10px;
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
	width: calc(30% - 1px);
	float: left;
	border-right:1px solid #E6E6E6;
}
.headLeft-sub{
	padding: 15px;
	text-align: center;
}
.headLeft-sub input{
	width: 60%;
	border-radius: 0px;
	border:1px solid #E6E6E6;
	padding: 7px;
}
.headLeft-sub button{
	background: #009EF7;
	color: #fff;
	border:1px solid #E6E6E6;
	padding: 7px 15px;
}
.headRight-section{
	width: 70%;
	float: left;
}
.headRight-sub{
	padding: 10px 15px 0px 15px;
}

.body-section{
	clear: both;
	overflow: hidden;
	width: 100%;
}

.right-section{
	width: 100%;
	float: left;
	height: 500px;
	background-color: #F6F6F6;
	position: relative;
}
.message{
	height: calc(100% - 68px);
	font-family: sans-serif;
}
.message ul{
	padding: 0px;
	list-style: none;
	margin: 0px auto;
	width: 90%;
	overflow:hidden;
}
.message ul li{
	position: relative;
	width: 80%;
	padding: 15px 0px;
	clear: both;
}
.message ul li.msg-left{
	float: left;
}
.message ul li.msg-left img{
	position: absolute;
	width: 40px;
	bottom: 30px;
	border-radius:50%;
}
.message ul li.msg-left .msg-desc{
	margin-left: 70px;
	font-size: 12px;
	background: #E8E8E8;
	padding:10px 10px;
	border-radius: 5px 5px 5px 0px;
	position: relative;
}
.message ul li.msg-left .msg-desc:before{
	position: absolute;
	content: '';
	border:10px solid transparent;
	border-top-color: #E8E8E8;
	top: 0px;
	left: -10px;
}
.message ul li.msg-left small{
	float: right;
	color: #c1c1c1;
}

.message ul li.msg-right{
	float: right;
}
.message ul li.msg-right img{
	position: absolute;
	width: 40px;
	right: 0px;
	bottom: 30px;
	border-radius: 50%;
}
.message ul li.msg-right .msg-desc{
	margin-right: 70px;
	font-size: 12px;
	background: #cce5ff;
	color: #004085;
	padding:10px 10px;
	border-radius: 5px 5px 5px 0px;
	position: relative;
}
.message ul li.msg-right .msg-desc:before{
	position: absolute;
	content: '';
	border:10px solid transparent;
	border-top-color: #cce5ff;
	top: 0px;
	right: -10px;
}
.message ul li.msg-right small{
	float: right;
	color: #c1c1c1;
	margin-right: 70px;
}
.message ul li.msg-day{
	border-top:1px solid #EBEBEB;
	width: 100%;
	padding: 0px;
	margin: 15px 0px;
}
.message ul li.msg-day small{
	position: absolute;
	top: -10px;
	background: #F6F6F6;
	color: #c1c1c1;
	padding: 3px 10px;
	left: 50%;
	transform: translateX(-50%);
}
.right-section-bottom{
	background: #fff;
	width: 100%;
	padding: 15px;
	position: absolute;
	bottom: 0px;
	border-top:1px solid #E6E6E6;
	text-align: center;
}
.right-section-bottom input{
	border:0px;
	padding:8px 5px;
	width:calc(100% - 150px);
}
.right-section-bottom .btn-send{
	border:0px;
	padding: 8px 10px;
	float: right;
	margin-right: 30px;
	color: #009EF7;
	font-size: 18px;
	background: #fff;
	cursor: pointer;
}
.upload-btn{
  position: relative;
  overflow: hidden;
  display: inline-block;
  float: left;
}
.upload-btn .btn{
  	border:0px;
	padding: 8px 10px;
	color: #009EF7;
	font-size: 18px;
	background: #fff;
	cursor: pointer;
}
.upload-btn input[type=file] {
  font-size: 100px;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
}
	
</style>

<script type="text/javascript">

    $(document).ready(function() {

        $("#sendBtn").on("click", function() {	// 전송 버튼을 누를때

            sendMessage();	// 메소드 실행

        });
        $("#message").keydown(function (key) {	// 메세지 input태그에 키가 눌렸을때
            if (key.keyCode == 13) { // 엔터키면
                sendMessage();	// 메소드 실행
            }
        });
		
        $("#messageArea").scrollTop(9999999);

    });

    var sock;

    //웸소켓을 지정한 url로 연결한다.

    sock = new SockJS("<c:url value="/echo"/>");
	sock.onopen = onopen;
    function onopen(){
    	console.log("오픈");
    	sock.send("chatId:${c.chatId}");
    	
    }
    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달됐을 때 자동으로 실행되는 function
	
    sock.onmessage = onMessage;


    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;


    /* sock.onopen = function(){

        sock.send($("#message").val());

    }; */

    function sendMessage() {

		if($("#message").val() == ""){	// 메세지 내용이 없으면 실행되는 부분
			
		}else{							// 메세지 내용이 있으면
        	/*소켓으로 보내겠다.  */
	        sock.send("chatId:${c.chatId}:" + $("#message").val());	// 메세지를 소켓에 보내고
	        $("#message").val("");			// 메세지 내용을 비운다.
			
		}
        

    }

	function formatAMPM(date) {
		var hours = date.getHours();
		var minutes = date.getMinutes();
		
		var ampm = hours >= 12 ? '오후' : '오전';
		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? '0'+minutes : minutes;
		var strTime = ampm + " " + hours + ':' + minutes;
		return strTime;
	}
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt) {

        var data = (evt.data).split(":");
        var date = formatAMPM(new Date());
        var profilePath = "${loginUser.profilePath}";
		var html = '';
        if(data[0] == "나"){
        	html = "<li class='msg-right'>" +
			   "<div class='msg-right-sub'>" +
			   "<img src='resources/images/" +
			   profilePath + 
			   "'>" +
			   "<div class='msg-desc'>" +
			   data[1] +
			   "</div>" +
			   "<small>" +
			   date +
			   "</small>" +
			   "</div>" +
			   "</li>";
        }else if(data[0] == "상대방"){
        	html = "<li class='msg-left'>" +
			   "<div class='msg-left-sub'>" +
			   "<img src='resources/images/" +
			   data[2] +
			   "'>" +
			   "<div class='msg-desc'>" +
			   data[1] +
			   "</div>" +
			   "<small>" +
			   date +
			   "</small>" +
			   "</div>" +
			   "</li>";
        }

        $("#msg-area").append(html);
        $("#messageArea").scrollTop(9999999);
		console.log($(document).height());
        //sock.close();

    }


    function onClose(evt) {
        $("#msg-area").append("연결 끊김");

    }

</script>

</head>
<body>

	<div class="main-section">
		<div class="head-section">
			<div class="headRight-section">
				<div class="headRight-sub">
					<h3>${c.chatName }</h3>
					<small>2019-10-14</small>
				</div>
			</div>
		</div>
		<div class="body-section">
			<div class="right-section">
				<div id="messageArea" class="message" data-mcs-theme="minimal-dark" style="overflow:auto;">
					<ul id="msg-area">
						<c:forEach items="${msgList}" var="msg">
							<c:if test="${date eq null}">
								<li class="msg-day"><small>${msg.createDate}</small></li>
							</c:if>
							<c:if test="${date < msg.createDate }">
								<li class="msg-day"><small>${msg.createDate}</small></li>
								<li class="msg-day"><small>수요일</small></li>
							</c:if>
							<c:set var="date" value="${msg.createDate}"/>
							<c:if test="${msg.empId == loginUser.empId }">
								<li class="msg-right">
									<div class="msg-left-sub">
										<img src="resources/images/${msg.profilePath}">
										<div class="msg-desc">
											${msg.content}
										</div>
										<small>${msg.createDate}</small>
									</div>
								</li>
							</c:if>
							<c:if test="${msg.empId ne loginUser.empId }">
								<li class="msg-left">
									<div class="msg-left-sub">
										<img src="resources/images/${msg.profilePath}">
										<div class="msg-desc">
											${msg.content}
										</div>
										<small>${msg.createDate}</small>
									</div>
								</li>
							</c:if>
						</c:forEach>
						<!-- <li class="msg-left">
							<div class="msg-left-sub">
								<img src="resources/image/sitelogo.png">
								<div class="msg-desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</div>
								<small>05:25 am</small>
							</div>
						</li>
						<li class="msg-right">
							<div class="msg-left-sub">
								<img src="resources/image/sitelogo.png">
								<div class="msg-desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</div>
							</div>
							<br>
							<div class="msg-left-sub">
								<div class="msg-desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</div>
								<small>05:25 am</small>
							</div>
						</li>
						
						<li class="msg-day"><small>수요일</small></li> -->
						
					</ul>
				</div>
				<div class="right-section-bottom">

						<div class="upload-btn">
						  	<button class="btn" type="button"><i class="fa fa-photo"></i></button>
						  	<input type="file" name="myfile" />
						</div>
						<input type="text" id="message" placeholder="type here...">
						<button id="sendBtn" class="btn-send" type="button"><i class="fa fa-send"></i></button>

				</div>
			</div>
		</div>
	</div>

</body>
</html>