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
		width:50%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	
	.top-insertForm{
		
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
	}
	
	.insertForm h4{
		font-size:15px;
		color:#333;
		font-weight:700;
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
					
					<!-- alert로~~ -->
					
					<div class="insertForm">
					
						<div class="top-insertForm" align="center">
							<h3 style="color:#3287B2; font-size:20px; font-weight:bold; ">
								<i class="fas fa-hourglass-start"></i> 새 프로젝트
							</h3>
						
						</div>

					 	
					 	<br><br>
					 	
					 	<div class="content-insertForm">
					 		
					 		<h4 style="padding: 2px 0 15px 0;">제목</h4>
						 	<input class="form-control input-lg" placeholder="제목을 입력해주세요" type="text">
						 	
						 	<br><br>
						 	
						 	<h4 style="padding: 2px 0 15px 0;">설명 (선택사항)</h4>
						 	<textarea class="form-control" placeholder="상세내용을 입력해주세요" rows="4"></textarea>
						 	
						 	<br><br>
						 	
						 	<div class="addMember">
						 		<h4 style="padding: 2px 0 15px 0;">프로젝트 멤버</h4>
						 		<button type="button" class="btn btn-default">
									<i class="fa fa-plus-square"></i> 추가하기 
								</button>
								
								<div class="TeamMemArea" style="padding:10px 0 0 0"> 
									<a class="ui blue image label" style="margin:5px 3px 5px 3px;">
									  <img src="resources/images/veronika.jpg">
									  원영주
									  <div class="detail">개발팀</div>
									</a>
									<a class="ui teal image label" style="margin:5px 3px 5px 3px;">
									  <img src="resources/images/jenny.jpg">
									  전재광
									  <div class="detail">경영지원팀(총무)</div>
									</a>
									<a class="ui yellow image label" style="margin:5px 3px 5px 3px;">
									  <img src="resources/images/christian.jpg">
									  김상윤
									  <div class="detail">영업팀</div>
									</a>
									<a class="ui blue image label" style="margin:5px 3px 5px 3px;">
									  <img src="resources/images/veronika.jpg">
									  설용환
									  <div class="detail">서비스팀</div>
									</a>
									<a class="ui teal image label" style="margin:5px 3px 5px 3px;">
									  <img src="resources/images/jenny.jpg">
									  유현규
									  <div class="detail">경영지원팀(회계)</div>
									</a>
								</div>
						 		
						 	</div>
						 	
						 	
						 	<br><br>
						 	<div class="insertButton" align="center"> 
						 		<button type="reset" class="btn btn-danger">
									<i class="far fa-trash-alt"></i> 취소하기
								</button>
								<button type="button" class="btn btn-success">
							 		<i class="fa fa-check-circle"></i> 생성하기
							 	</button>
						 	
						 	</div>
					 	
					 	</div>
					 	
					 	
						
					 	
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
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_1").addClass("active");
			
			
			
			
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