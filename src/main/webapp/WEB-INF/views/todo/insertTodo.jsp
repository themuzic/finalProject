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
					
					<!-- alert로~~ -->
					
					<form action="insertTodo.do" method="post" encType="multipart/form-data" class="insertForm">				
					
					
						<div class="top-insertForm" align="center">
							<h3 style="color:#3287B2; font-size:20px; font-weight:bold; ">
								<i class="fas fa-list-ul"></i> 새 TO-DO
							</h3>
						
						</div>

					 	
					 	<br><br>
					 	
					 	<div class="content-insertForm">
					 	
					 		<input type="hidden" name="empId" value="${ loginUser.empId }">
					 		<input type="hidden" name="tdBoardNo" value="${ allTodo[0].tdBoardNo }">
					 		
					 
					 		<h1><c:out value="${ todoBoardList.tdBoardNo }"/></h1>
					 		
					 		
					 						 		
					 		<h4 style="padding: 2px 0 15px 0;">제목</h4>
						 	<input class="form-control input-lg" id="todoName" name="todoName" placeholder="제목을 입력해주세요" type="text">
						 	
						 	<br><br>
						 	
						 	<h4 style="padding: 2px 0 15px 0;">설명 (선택사항)</h4>
						 	<textarea class="form-control" id="todoContent" name="todoContent" placeholder="상세내용을 입력해주세요" rows="4"></textarea>
						 	
						 	<br><br>
						 	
						 	
						 	<h5>(새 TO-DO는 자동으로 대기 상태로 생성됩니다)</h5>
						 	
						 	
						 	
						 	<br><br>
						 	<div class="insertButton" align="center"> 
						 		<button type="button" onclick="location.href='todoList.do'" class="btn btn-danger">
									<i class="far fa-trash-alt"></i> 취소하기
								</button>
								<button type="submit" class="btn btn-success">
							 		<i class="fa fa-check-circle"></i> 생성하기
							 	</button>
						 	
						 	</div>
					 	
					 	</div>
					 	
					 	
						
					 	
					 </form>
					
					
					
					
					
					
					
					
					
					
					
					
					
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