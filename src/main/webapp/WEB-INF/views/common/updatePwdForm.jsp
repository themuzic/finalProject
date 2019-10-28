<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	.contentWrap{
		float:left;
		width:75%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
</style>


</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
	<!--  -->
	<jsp:include page="../common/navibar.jsp"/>
	<!--  -->
	
	<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="contentWrap">
					
					<!-- 이 아래부터 내용 작성 -->
					
					<div id="updatePwdArea" style="text-align:center;">
						<label>비밀번호 확인</label>
						<div class="ui input">
							<input type="password" style="width:300px; margin-left:30px;" name="password" id="pwdArea" placeholder="비밀번호를 입력해주세요">
						</div>
						<br>
						<br>
						<button class="ui button" id="pwdConfirm" style="font-size:small;" type="button">확인</button>

					</div>
					
					<!-- 이 위까지 내용작성 -->
					
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<div class="clearfix"></div>
		

	<!--  -->
	</div>
	<!-- END WRAPPER -->
	
	
	
	
	<!-- script 작성 -->
	<script>
		$(function(){
			$("#pwdConfirm").on('click', function(){
				var empPwd = $("#pwdArea").val();
				$.ajax({
					url:"pwdConfirm.do",
					type:"POST",
					data:{empPwd:empPwd},
					success:function(data){
						var html = "";
						if(data == 'success'){
							
						html += '<label>새 비밀번호</label>' +
								'<div class="ui input"> ' +
								'<input type="password" id="pwd1" style="width:300px; margin-left:30px;" class="pwdArea" placeholder="비밀번호를 입력해주세요">' +
								'</div>' +
								'<br>' +
								'<br>' +
								'<label>새 비밀번호 확인</label>' +
								'<div class="ui input"> ' +
								'<input type="password" class="pwdArea" id="pwd2" style="width:300px;" placeholder="비밀번호를 다시 입력해주세요.">' +
								'</div>' +
								'<br>' +
								'<br>' +
								'<button class="ui button" id="pwdButton" style="font-size:small;" type="button">확인</button>';
						$("#updatePwdArea").html(html);
						}else{
							alertify.alert('develolffice', '비밀번호가 틀렸습니다. 다시 입력해주세요.');
						}
					},
					error:function(){
						
					}
				});
			});
			
			$(document).on('click', '#pwdButton', function(){
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				if(pwd1 != pwd2){
					alertify.alert('develolffice', '비밀번호가 같지 않습니다. 다시 확인해주세요.');
				}else{
					$.ajax({
						url:"updatePwd.do",
						type:"POST",
						data:{empPwd:pwd1},
						success:function(data){
							if(data == 'success'){
								location.href = 'mainPage.do?empId=${loginUser.empId}';
							}else{
								alertify.alert('develolffice', '비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
							}
						},
						error:function(){
							
						}
					});
				}
			});
			
			
			
			
			
		});
	
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>