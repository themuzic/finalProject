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

<!-- 부트스트랩 cdn -->
<link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- sockjs 라이브러리 -->
<script type="text/javascript" src="resources/chat/js/sockjs-0.3.4.js"></script>

<!-- 아이콘 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- 제이쿼리 이벤트 라이브러리 cdn -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- 커스텀 스크롤바 라이브러리 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">

<!-- 시멘틱 애니메이션 -->
<link href="resources/chat/css/transition.min.css" rel="stylesheet">
<script src="resources/chat/js/transition.min.js"></script>


<!-- alertify -->
<link rel="stylesheet" href="resources/css/alertify.css">
<link rel="stylesheet" href="resources/css/alertify.rtl.css">
<script src="resources/js/alertify.js"></script>

<style>
body{
	font-family: 'Malgun Gothic';
	margin: 0px;
	overflow: hidden;
}

.main-section small{
	font-size: 10px;
}
.main-section h3, .main-section h5{
	margin: 0px;
}
.main-section h4{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
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
.headRight-section{
	width: calc(30% - 1px);
	float: right;
	border-right:1px solid #E6E6E6;
}
.headRight-sub{
	padding: 15px;
	text-align: center;
}
.headRight-sub input{
	width: 60%;
	border-radius: 0px;
	border:1px solid #E6E6E6;
	padding: 7px;
}
.headRight-sub button{
	background: #009EF7;
	color: #fff;
	border:1px solid #E6E6E6;
	padding: 7px 15px;
}
.headLeft-section{
	width: 70%;
	float: left;
}
.headLeft-sub{
	padding: 5px 0px 5px 15px;
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
	top:10px;
	border-radius:40%;
}
.message ul li.msg-left .msg-desc{
	margin-left: 70px;
	font-size: 12px;
	background: #E8E8E8;
	padding:10px 10px;
	border-radius: 5px 5px 5px 0px;
	position: relative;
	word-break: break-word;
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
	top:10px;
	border-radius: 40%;
}
.message ul li.msg-right .msg-desc{
	margin-right: 70px;
	font-size: 12px;
	background: #cce5ff;
	color: #004085;
	padding:10px 10px;
	border-radius: 5px 5px 5px 0px;
	position: relative;
	word-break: break-word;
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
.msg-day .msg-desc{
	text-align:center;
	width:100%;font-size:12px;
	background: #E8E8E8;
	padding:10px 10px;
	position: relative;
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

/* 여기는 초대 css */

.modal-body ul{
	padding: 0px;
	margin: 0px;
	list-style: none;
}
#invite-list li{
	padding: 10px 0px;
	cursor: pointer;
}
#invite-list li:hover{
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

.chatList .desc{
	width: calc(100% - 60px);
	float: left;
	position: relative;
}
.chatList .desc h5{
	margin-top: 6px;
	line-height: 5px;
	margin-bottom: 5px;
}
.chatList .desc .time{
	position: absolute;
	right: 15px;
	color: #c1c1c1;
}
.chatList-left-section{
	float:left;
	width:85%;
}
.chatList-left-section small{
	font-size: 10px;
}
.chatList-right-section{
	float:right;
	width:15%;
}
.addList{
	cursor:default;
	font-size:13px;
	text-align:center;
	background:#3edec7;
	color:white;
	border-radius:20px;
	display:inline-block;
	margin-top:5px;
	margin-left:5px;
}
.addList img{
	padding:5px;
	width:30px;
	border-radius:40%;
}
.deleteList{
	margin-left:5px;
	padding-right:5px;
	cursor:pointer;
}
.checked{
	background:#ffdf6d;
	color:white;
}
.non-checked{
	margin-top:6px;
	border-radius:50%;
	width:25px;
	height:25px;
	text-align:center;
	border:1px solid #c8c8c8;
	
}
.non-checked > .fa-check{
	display:none;
}
.checked > .fa-check{
	display: inline-block;
}
.ajs-close{
      float: right;
      display:none !important;
}
.ajs-primary.ajs-buttons{
	text-align:right !important;
}
.ajs-button{
	background-color: transparent;
}
.ajs-ok{
   color:#2985db;
   border-color: transparent;
}
.ajs-cancel{
   color:red;
   border-color: transparent;
}
.fa-bell{
	color:gold;
}
.fa-bell-slash{
	color:gray;
}
#chatRename{
	width: 80%;
    margin-top: 8px;
    margin-bottom: 7px;
    line-height: 1.1;
    font-size: 18px;
}
</style>

<script type="text/javascript">

    $(document).ready(function() {
		$(document).on('click', '.profileButton', function(){
			var profilePath = $(this).children().attr('src');
			$("#modal-profile").attr('src', profilePath);
		});
			
    	$("#exit").on('click', function(){
    		alertify.confirm('DEVELOFFICE', '채팅방을 나가면 대화내용이 모두 삭제됩니다. 계속하시겠습니까?', function(){exitChat();}, function(){})
    	})
    	
        $("#sendBtn").on("click", function() {	// 전송 버튼을 누를때

            sendMessage();	// 메소드 실행

        });
        $("#message").keydown(function (key) {	// 메세지 input태그에 키가 눌렸을때
            if (key.keyCode == 13) { // 엔터키면
                sendMessage();	// 메소드 실행
            }
        });
		$("#chatRename").keyup(function(key){
			if(key.keyCode == 13){
				renameFunction();
			}
		});
        $("#rename").on('click', function(){
        	if($("#chatRename").hasClass('show')){				// 이름 변경 끝
        		renameFunction();
        	}else{												// 이름 변경 시작
        		$("#chatRename").addClass('show');
        		$("#chatRename").val($("#chatName").html());
        		$("#chatName").addClass('hide');
        		$("#chatRename").focus();
        	}
        });
        
		$('#alarm').on('click', function(){
			var alarmClass = $(this).find("i").prop("class").split(" ")[3];
			var fa = $(this).find("i");
			if(alarmClass == 'fa-bell-slash'){
				$.ajax({
					url:"updateAlarm.do",
					type:"POST",
					data:{chatId:'${c.chatId}',empId:'${loginUser.empId}',alarm:'Y'},
					success:function(data){
						if(data == 'success'){
							fa.removeClass("fa-bell-slash").addClass("fa-bell");
						}
					},
					error:function(){
						console.log('통신실패');
					}
				});
			}else{
				$.ajax({
					url:"updateAlarm.do",
					type:"POST",
					data:{chatId:'${c.chatId}',empId:'${loginUser.empId}',alarm:'N'},
					success:function(data){
						if(data == 'success'){
							fa.removeClass("fa-bell").addClass("fa-bell-slash");
						}
					},
					error:function(){
						console.log('통신실패');
					}
				});
			}
			
			$('.alarm')
			  .transition('jiggle')
			;
		});
        
        $(document).on('click', '.chatListForm', function(){	// 초대하기 모달에서 프로필이 눌렸을 때
        	var empId = $(this).find('.chatList').attr("id");	// 눌린 사람의 empId 받아옴
        	var empName = $(this).find('h5').html();			// 눌린 사람의 이름 받아옴
        	var profile = $(this).find('img').attr("src");		// 눌린 사람의 프로필 경로 받아옴
        	html = "";											// 넣을 값 초기화 해주고
        	if($(this).find(".non-checked").hasClass('checked')){	// 초대목록에 그 사람의 리스트가 이미 올라가있으면(체크박스의 체크가 되었을 떄)
        		$(this).find(".non-checked").removeClass('checked');// 체크박스 체크 해제
        		$('#add_' + empId).parent().remove();				// 초대 목록에서 그 사람 삭제
        	}else{													// 그게 아니면(초대목록에 없으면)
        		$(this).find(".non-checked").addClass('checked')	// 체크박스 체크
				html += "<li>" +									// 초대 목록에 넣을 값 입력
						"<div class='addList' id='add_" +
						empId +
						"'>" +
						"<img src='" +
						profile +
						"'>" +
						"<span class='empName'>" +
						empName + 
						"</span>" +
						"<span class='deleteList' data-id='" + 
						empId +
						"' aria-hidden='true'>&times;</span>" +
						"</div>" +
						"</li>";
        	}
        	
        	$("#add-list").append(html);							// 초대 목록에 입력
			inviteYN();
        });
        
        $(document).on('click', '.deleteList', function(){			// 초대목록에서 x키(지우기)가 눌렸을 때
        	var empId = $(this).data('id');							// 그 사람에 empId 받아옴
        	$("#check_" + empId).removeClass("checked");			// 프로필 목록에서 체크박스 체크 해제
        	$(this).parent().parent().remove();						// 초대목록에서 그 사람을 삭제
        	inviteYN();
        });
        
        $("#invite-submit").on('click', function(){
        	var empName = $('.empName');
        	var empId = $('.checked');
        	var chatType = ${c.chatType};
        	var empIdHtml = '';
        	var empLength = empName.length;
        	var inviteHtml = "<b>${loginUser.empName} ${loginUser.jobName}</b>님이 ";
        	$.each(empId, function(index, value){
        		if(index != (empLength-1)){
        			empIdHtml += $(value).attr('id').split('_')[1] + '_';
        		}else{
        			empIdHtml += $(value).attr('id').split('_')[1];
        		}
        	});
        	
			$.each(empName, function(index, value){
				if(index != (empLength-1)){
					inviteHtml += "<b>" + value.innerText + "</b>님, ";
					
				}else{
					inviteHtml += "<b>" + value.innerText + "</b>님을 초대하였습니다.";
				}
        	});
			
			sock.send("system:chatId:${c.chatId}:" + empIdHtml + ":" + inviteHtml + ":" + chatType);

			$(this).attr("data-dismiss", "modal");
        });
        
        $("#messageArea").scrollTop(9999999);

    });
    
    function renameFunction(){
    	var chatName = $("#chatRename").val();
		if(chatName == $("#chatName").html()){
			$("#chatRename").removeClass('show');
    		$("#chatRename").val('');
    		$("#chatName").removeClass('hide');
		}else if(chatName == ''){
			$.ajax({
				url:'chatRenameReturn.do',
				type:'POST',
				data:{chatId:'${c.chatId}',empId:'${loginUser.empId}'},
				success:function(data){
					if(data == 'fail'){
    					alertify.alert('DEVELOFFICE', '채팅방 이름 변경에 실패하셨습니다.');
    				}else{
		        		$("#chatRename").removeClass('show');
		        		$("#chatName").html(data);
		        		$("#chatName").removeClass('hide');
		        		sock.send("이름 변경:${loginUser.empId}");
    				}
				},
				error:function(){
				}
			});
		}else{
    		$.ajax({
    			url:'chatRename.do',
    			type:'POST',
    			data:{chatId:'${c.chatId}',chatName:chatName,empId:'${loginUser.empId}'},
    			success:function(data){
    				if(data == 'success'){
		        		$("#chatRename").removeClass('show');
		        		$("#chatRename").val('');
		        		$("#chatName").html(chatName);
		        		$("#chatName").removeClass('hide');
		        		sock.send("이름 변경:${loginUser.empId}");
    				}else{
    					alertify.alert('DEVELOFFICE', '채팅방 이름 변경에 실패하셨습니다.');
    				}
    			},
    			error:function(){
    				
    			}
    		});
		}
    }
    
    function exitChat(){
    	var chatType = ${c.chatType};
    	var exitHtml = '';
    	if(chatType==1){
    		exitHtml = '채팅방 퇴장:1:${loginUser.empId}:${c.chatId}';
    	}else{
    		var content = "<b>${loginUser.empName} ${loginUser.jobName}</b>님이 나갔습니다.";
    		exitHtml = '채팅방 퇴장:2:${loginUser.empId}:${c.chatId}:' + content;
    	}
    	sock.send(exitHtml);
    	self.close();
    }
    
    function inviteYN(){
	    if($("#add-list").html() == ""){
			$("#invite-submit").prop('disabled', true);
		}else{
			$("#invite-submit").prop('disabled', false);
		}
    	
    }

	// jQuery Scroll Plugin 적용
	function fn_scroll_plugin() {
		$(".modal-body-left").mCustomScrollbar({
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
    	sock.send("chatId:${c.chatId}");
    	
    }
	
    function invite(){
    	var chatId = ${c.chatId};
    	$.ajax({
    		url:"inviteList.do",
			type:"POST",
			data:{chatId:chatId},
			dataType:"json",
			success:function(data){
				var html = "";					// 넣을 값 초기화
		    	//$("#invite-list").html(html);
				$.each(data, function(index, value){	// 초대 가능한 목록에 들어갈 사람들 데이터 목록 반복문 돌림
			    	html += "<li class='chatListForm'>" +	// chatListForm에 들어갈 데이터 입력
						    "<div class='chatList' id='" +
						    value.empId +
						    "'>" +
						    "<div class='img'>" + 
						    "<img src='resources/upload/profile/" + 
						    value.profilePath + 
						    "'>" +
						    "</div>" + 
						    "<div class='desc'>" + 
				   		    "<div class='chatList-left-section'>" +
						    "<h5>" + 
						    value.empName + " " +  value.jobName +
						    "</h5>" + 
						    "<small>" + 
						    value.deptName +
						    "</small>" +
						    "</div>" + 
				   		    "<div class='chatList-right-section'>" +
				   		    "<div id='check_" + 
				   		    value.empId +
				   		    "' class='non-checked'>" +
				   		    "<i class='fa fa-check'></i>" +
				   		    "</div>" + 
				   		    "</div>" +
						    "</div>" + 
						    "</div>" +
						    "</li>";
				});
				$("#invite-list").html(html);	// 초대 가능 목록 리스트에 값 입력
				//$("#invite-list").append(html);
				$("#add-list").html("");		// 초대목록 값 비워줌
				
				
			},
			error:function(){
				console.log("연결 실패");
			}
    	});
		
    	fn_scroll_plugin();		// 스크롤 생성 함수 실행
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
    	var str = evt.data;
        var data = str.split(":");
        var date = formatAMPM(new Date());
        var profilePath = "${loginUser.profilePath}";
		var html = '';
        if(data[0] == "나"){
        	html = "<li class='msg-right'>" +
			   "<div class='msg-right-sub'>" +
			   "<a href='#profileModal' class='profileButton' data-target='#profileModal' data-toggle='modal'><img src='resources/upload/profile/" +
			   profilePath + 
			   "'></a>" +
			   "<div class='msg-desc'>" +
			   str.substring(str.indexOf(":")+1,str.length) +
			   "</div>" +
			   "<small>" +
			   date +
			   "</small>" +
			   "</div>" +
			   "</li>";
        }else if(data[0] == "system"){
        	html = "<li class='msg-day'>" +
        		   "<div class='msg-desc'>" +
        		   data[1] +
        		   "</div>" + 
        		   "</li>";
        }else if(data[0] == "chatId"){
        	messenger = window.open("chatting.do?chatId=" + data[1] + "&chatName=" + data[3] + "&chatType=" + 2, data[1] + "chatting", "width=400px,height=400px", "false");
        }else{
        	html = "<li class='msg-left'>" +
			   "<div class='msg-left-sub'>" +
			   "<a href='#profileModal' class='profileButton' data-target='#profileModal' data-toggle='modal'><img src='resources/upload/profile/" +
			   data[1] +
			   "'></a>" +
			   "<div style='margin-left:70px; font-size:12px'>" +
			   data[0] +
			   "</div>" +
			   "<div class='msg-desc'>" +
			   str.substring(str.indexOf(":", str.indexOf(":")+1)+1,str.length) +
			   "</div>" +
			   "<small>" +
			   date +
			   "</small>" +
			   "</div>" +
			   "</li>";
        }
        $("#msg-area").append(html);
        $("#messageArea").scrollTop(9999999);

    }


    function onClose(evt) {
        $("#msg-area").append("연결 끊김");

    }

</script>

</head>
<body>

	<!---------------------- 초대 모달 -------------------------->               
    <!-- Modal -->
	<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    	<div class="modal-dialog" role="document">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
     					<span aria-hidden="true">&times;</span>
					</button>
    				<h5 class="modal-title" id="exampleModalLabel" style="color:#3287B2; font-size:16px;">초대하기</h5>
				</div>
				<div class="modal-body" style="height:400px; width:100%; padding:0px; padding-top:15px;">
					<div class="modal-body-left" data-mcs-theme="minimal-dark" style="width:70%; height:100%; float:left; overflow:hidden;">
						<ul id="invite-list">
						</ul>
					</div>
					<div class="modal-body-right" style="width:30%; float:right;">
						<ul id="add-list">
						</ul>
					</div>
	         	</div>
         		<div class="modal-footer">
         			<button type="button" class="btn" id="invite-submit" style="background:#ffdf6d;color:black;" disabled>확인</button>
           			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         		</div>
       		</div>
	   	</div>
    </div>
    
    <!-- 초대 모달 끝 -->
    
    <!-- 프로필 모달 -->
    <div class="modal fade"  id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    	<div class="modal-dialog" style="width:60%;" role="document">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
     					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<img id="modal-profile" style="width:100%; height:100%;">
	         	</div>

       		</div>
	   	</div>
    </div>
    <!-- 프로필 모달 끝 -->
	<div class="main-section">
		<div class="head-section">
			<div class="headLeft-section">
				<div class="headLeft-sub">
					<div style="float:right; padding-top:10px; margin-left: 10px; cursor:pointer;">
						<c:if test="${c.chatType == 2 }">
							<c:if test="${c.alarm eq 'Y' }">
							<a id="alarm"><i class="alarm ui fa fa-bell"></i></a>
							</c:if>
							<c:if test="${c.alarm eq 'N' }">
							<a id="alarm"><i class="alarm ui fa fa-bell-slash"></i></a>
							</c:if>
						</c:if>
					</div>
					<div style="float:right; padding-top:10px; cursor:pointer;">
						<c:if test="${c.chatType == 2 }">
							<a id="rename"><i class="fa fa-edit"></i></a>
						</c:if>
					</div>
					<h4 id="chatName">${c.chatName }</h4>
					<input type="text" id="chatRename" class="hide">
				</div>
			</div>
			<div class="headRight-section">
				<div class="headRight-sub">
					<a href="#myModal" onclick="invite();" style="float:left;" data-target="#myModal" data-toggle="modal"><i class="fa fa-plus"></i>초대</a>
					<a style="cursor:pointer;" id="exit" style="float:right;"><i class="fa fa-sign-out"></i>나가기</a>
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
							<c:if test="${msg.empId == loginUser.empId  && msg.msgType == 1}">
								<li class="msg-right">
									<div class="msg-left-sub">
										<a href="#profileModal" class="profileButton" data-target="#profileModal" data-toggle="modal"><img src="resources/upload/profile/${msg.profilePath}"></a>
										<div class="msg-desc">
											${msg.content}
										</div>
										<small>${msg.createDate}</small>
									</div>
								</li>
							</c:if>
							<c:if test="${msg.empId ne loginUser.empId && msg.msgType == 1}">
								<li class="msg-left">
									<div class="msg-left-sub">
										<a href="#profileModal" class="profileButton" data-target="#profileModal" data-toggle="modal"><img src="resources/upload/profile/${msg.profilePath}"></a>
										<div style="margin-left:70px; font-size:12px">
											${msg.empName} ${msg.jobName }
										</div>
										<div class="msg-desc">${msg.content}</div>
										<small>${msg.createDate}</small>
									</div>
								</li>
							</c:if>
							<c:if test="${msg.msgType == 2}">
								<li class='msg-day'>
									<div class="msg-desc">
										${msg.content}
									</div>
								</li>
							</c:if>
						</c:forEach>
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