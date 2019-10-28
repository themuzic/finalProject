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
.main-header{
	width:100%;
	height:30%;
	float:left;
}
.header-right{
	width: 70%;
	float: right;
	text-align: center;
}
.header-left{
	width: 15%;
	float: left;
	overflow: hidden;
	border-radius: 50%;
}
.header-left img{
	width: 100%;
	height: 100%;
}
.main-section{
	width: 100%;
	height: 70%;
}
td{
	border: 0px !important;
}
.userTr{
	padding-left:30px;
	width:50%;
}
.userTr input{
	width:60%;
}
#update{
	margin:0px;
	margin-left:-20px;
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
							<div class="main-header">
								<div class="ui toggle checkbox">
								  <input type="checkbox" name="update" id="update" style="opacity: 0;">
								  <label>정보 수정</label>
								</div>
								<div class="header-right">
									<div>
										<h3>${loginUser.empName } ${loginUser.jobName }</h3>
										<small>${loginUser.deptName }</small>
									</div>
									<br>
									<div>입사일 : ${loginUser.enrollDate }</div>
									<div>근무 일 수 : <span id="workDay"></span></div>
									<div>남은 연차일 수 : ${loginUser.vacation }</div>
									<div>별 개수 : ${loginUser.star }</div>
								</div>
								<div class="header-left">
								<div id="imgInputArea"><input type="file" id="imgUpdate" name="profile" onchange='loadImg(this)'></div>
									<div id="profileImgArea">
										<img id="profileImg" class="imgUpdate" src="resources/upload/profile/${loginUser.profilePath}">
									</div>
								</div>
								<br clear="both">
								<div>상태메세지 : <input type="text" id="statusMsg" name="statusMsg" class="userAdvice" placeholder="내용을 입력해주세요" value="${loginUser.statusMsg }" readonly></div>
							</div>
							<br clear=both>
							<br clear=both>
							<br clear=both>
							<div class="main-section"">
								<table>
									<tr>
										<td>ID</td>
										<td class="userTr"><input type="text" value="${loginUser.empId }" placeholder="내용을 입력해주세요." readonly></td>
									</tr>
									<tr>
										<td>EMAIL</td>
										<td class="userTr"><input type="text" value="${loginUser.email }" placeholder="내용을 입력해주세요." readonly></td>
									</tr>
									<tr>
										<td>MOBILE</td>
										<td class="userTr"><input class="userAdvice" id="phone" name="phone" type="text" value="${loginUser.phone }" placeholder="내용을 입력해주세요." readonly></td>
									</tr>
									<tr>
										<td width="10%">ADDRESS</td>
										<td class="userTr"><input class="userAdvice" id="address" name="address" type="text" value="${loginUser.address }" placeholder="내용을 입력해주세요." readonly></td>
									</tr>
								</table> 
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
			$("#update").on('click', function(){
				if($("#update").prop("checked")){
					console.log('체크됨');
					$(".userAdvice").removeAttr("readonly");
				}else{
					console.log('체크해제됨');
					$(".userAdvice").attr("readonly", true);
				}
			});
			var today = new Date();
			var dateArray = ('${loginUser.enrollDate}').split('-');
			var enrollDate = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);

			var workDay = Math.floor((today.getTime() - enrollDate.getTime())/1000/60/60/24);
			console.log(workDay);
			$("#workDay").html(workDay);
			
			
			$(function(){
				$("#imgInputArea").hide();
				$(document).on("click", "#profileImgArea", function(e){
					console.log(e.target.className + "너는 누구야?");
					$("#"+e.target.className).click();
				});
			});
			
			
		});
			function loadImg(value){
				// value => input태그
				// num => 조건문으로 작업
				// file이 존재하는지
				 if(value.files && value.files[0]){
					
					// 파일을 읽어들일 FileReader객체 생성
					var reader = new FileReader();
					
					// 파일 읽기가 다 완료되었을 때 실행되는 메소드
					reader.onload = function(e){
						$("#profileImg").attr("src", e.target.result);// data:URL
						}
					
				
					// 파일 읽어주는 메소드
					reader.readAsDataURL(value.files[0]);
				}else{
					$("#profileImg").attr("src", "resources/upload/profile/${loginUser.profilePath}");// data:URL
					
				}
			}
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>