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
body *{
	-webkit-user-select: none;
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
#menu{
}
.body-section{
	clear: both;
	overflow: hidden;
	width: 100%;
}


.left-section{
	width: 98%;
	float: left;
	height: 450px;
	border-right:1px solid #E6E6E6;
	background-color: #FFF;
	z-index: 1;
	position: relative;
	overflow:auto;
}

ul{
	padding: 0px;
	margin: 0px;
	list-style: none;
}
ul li{
	padding: 15px 0px;
	cursor: pointer;
}
ul li:hover{
	background: #e1e1e1;
	position: relative;
}


.chatList{
	overflow: hidden;
}
.chatList .img{
	width: 60px;
	float: left;
	text-align: center;
	position: relative;
}
.chatList .img img{
	width: 30px;
	border-radius: 40%;
}
/* .chatList .img i{
	position: absolute;
	font-size: 10px;
	color: #52E2A7;
	border:1px solid #fff;
	border-radius: 50%;
	left: 10px;
} */

.chatList .desc{
	width: calc(100% - 60px);
	float: left;
	position: relative;
}
.chatList .desc h5{
	margin-top: 6px;
	line-height: 5px;
}
.chatList .desc .time{
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
		
        $("#sendBtn").on("click", function() {	// 전송 버튼을 누를때

            sendMessage();	// 메소드 실행

        });
        
        $("#search").on('keyup', function(){
        	var search = $(this).val();
        	console.log(search);
        	var empList = ${test};
        	var html = '';
        	if(search == ""){
        		$.each(empList, function(index, emp){
        			html += '<li>' +
        					'<div class="chatList">' +
        					'<input type="hidden" name="empId" value="' + emp.empId + '">' +
        					'<div class="img">' +
        					'<img src="resources/upload/profile/' + emp.profilePath + '">' +
        					'</div>' +
        					'<div class="desc">' +
        					'<h5>' + emp.empName + ' ' +  emp.jobName + '</h5>' +
        					'<small>' + (emp.statusMsg == null ? '' : emp.statusMsg) + '</small>' +
        					'</div>' +
        					'</div>' +
        					'</li>';
        		});
        		$("#empList").html(html);
        	}else{
	        	$.ajax({
	        		url:'empListSearch.do',
	        		type:'POST',
	        		data:{search:search,empId:'${loginUser.empId}'},
	        		dataType:'json',
	        		success:function(data){
	        			console.log(data);
	        			$.each(data, function(index, emp){
	        				console.log(emp);
	            			html += '<li>' +
	            					'<div class="chatList">' +
	            					'<input type="hidden" name="empId" value="' + emp.empId + '">' +
	            					'<div class="img">' +
	            					'<img src="resources/upload/profile/' + emp.profilePath + '">' +
	            					'</div>' +
	            					'<div class="desc">' +
	            					'<h5>' + emp.empName + ' ' +  emp.jobName + '</h5>' +
	            					'<small>' + (emp.statusMsg == null ? '' : emp.statusMsg) + '</small>' +
	            					'</div>' +
	            					'</div>' +
	            					'</li>';
	            		
	            		});
	        			$("#empList").html(html);
	        		},
	        		error:function(){
	        			console.log('통신에러 삐- 삐-');
	        		}
	        	});
        	}
        });
        $("#message").keydown(function (key) {	// 메세지 input태그에 키가 눌렸을때
            if (key.keyCode == 13) { // 엔터키면
                sendMessage();	// 메소드 실행
            }
        });
    	
    	fn_scroll_plugin();		// 스크롤 생성 함수 실행
		
    	$(".searchArea").on("focus", "#search", function(){
	    	$(".searchArea").css("border","1px solid #cdcdcd");
	    	$(".searchArea i").css("color","#b4b4b4");
	    	$("#search").css("outline", "0px");
	    	$("#search").attr("placeholder", "");
    	});
    	
    	$(".searchArea").on("blur", "#search", function(){
	    	$(".searchArea").css("border","1px solid #e4e4e4");
	    	$(".searchArea i").css("color","#cdcdcd");
	    	$("#search").attr("placeholder", "이름검색");
    	});
		

        
        $("#menu").on("click", function(){
        	$('.ui.labeled.icon.sidebar').sidebar('toggle');
        });

        $(document).on("dblclick", ".chatList", function(){	// 사원 목록에서 사원 더블클릭 했을때
        	console.log($(this).children().first().val());
        	var empId = ${loginUser.empId};
        	var otherId = $(this).children().first().val();	// 더블클릭한 상대의 사번
        	$.ajax({
        		url:"chatStatus.do",
    			type:"POST",
    			data:{empId:empId,otherId:otherId},
    			dataType:"json",
    			success:function(data){
    				console.log(data.chatId);
    				messenger = window.open("chatting.do?chatId=" + data.chatId + "&chatName=" + data.chatName + "&chatType=1", data.chatId + "chatting", "width=400px,height=400px", "false");
    			},
    			error:function(){
    				
    			}
        	});
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



    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

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
	        sock.send($("#message").val());	// 메세지를 소켓에 보내고
	        $("#message").val("");			// 메세지 내용을 비운다.
			
		}
        

    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;
		
        $("#data").append(data + "<br/>");
        document.body.scrollIntoView(false);	// 스크롤을 제일 아래로
        //sock.close();

    }


    function onClose(evt) {
		
        $("#data").append("연결 끊김");

    }
</script>

</head>
<body>
	<div class="ui left demo vertical inverted very thin sidebar labeled icon menu" style="background:#e1e1e1; text-align:center; color:rgb(166, 166, 166);">
		<br>
		<div class="item" style="color:black;">
	    	<i class="fa fa-2x fa-user"></i>
	    	<br>친구
	    </div>
	    <br>
	    <div class="item" onclick="location.href='chatList.do';">
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
								<input type="text" id="search" name="search" placeholder="이름검색">
							</div>
						</div>
						<ul>
							<li>
								<div class="chatList">
									<div class="img">
										<img src="resources/upload/profile/${loginUser.profilePath}">
									</div>
									<div class="desc">
										<h5>${loginUser.empName } ${loginUser.jobName }</h5>
										<small>${loginUser.statusMsg }</small>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
	
			</div>
			<div class="body-section">
				<div class="left-section" data-mcs-theme="minimal-dark">
					<ul id="empList">
						<c:forEach items="${ empList }" var="emp">
							<li>
								<div class="chatList">
									<input type="hidden" name="empId" value="${emp.empId }">
									<div class="img">
										<img src="resources/upload/profile/${emp.profilePath}">
									</div>
									<div class="desc">
										<h5>${ emp.empName } ${emp.jobName }</h5>
										<small>${emp.statusMsg }</small>
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