<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 아이콘 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- 시멘틱 애니메이션 -->
<link href="resources/chat/css/transition.min.css" rel="stylesheet">
<script src="resources/chat/js/transition.min.js"></script>

<title>Insert title here</title>
<style>
.fa-bell{
	color:gold;
}
.fa-bell-slash{
	color:gray;
}
</style>
</head>
<body>
	<div>
		<div style="float:right; width:15%; text-align:right">
		<c:if test="${c.chatType == 2 }">
			<a id="alarm"><i class="alarm ui fa fa-bell"></i></a>
			<a id="exit"><i class="fa fa-times"></i></a>
		</c:if>
		<c:if test="${c.chatType == 1 }">
			<a id="exit"><i class="fa fa-times"></i></a>
		</c:if>
		</div>
		<div style="float:left; width:85%;">
			<div style="float:left; width:15%; height:100%;" >
				<img style="width:100%; height:100%;  border-radius:40%;" src="resources/upload/profile/${c.chatStatus}">
			</div>
			<div style="float:right; width:80%; height:100%;">
				<div style="font-size:14px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width:100%"><b>${c.chatName }</b></div>
				<div style="font-size:14px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width:100%;">${c.lastMsg }</div>
			</div>
		</div>
	
	</div>
	
	<script>
		$(function(){
			setTimeout(function() {
				self.close();
			}, 3000);
			$('#alarm').on('click', function(){
				console.log($(this).find("i").prop("class").split(" ")[3]);
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
			$("#exit").on('click', function(){
				self.close();
			});
		});
	</script>
</body>
</html>