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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
					
					<div class="ui huge three steps" style="margin:0 0 30px 0;">
					  <div class="disabled step">
					    <i class="lnr lnr-inbox"></i>
					    <div class="content">
					      <div class="title">&nbsp;일감관리</div>
					    </div>
					  </div>
					  <div class="disabled step">
					    <i class="fas fa-th-list"></i>
					    <div class="content">
					      <div class="title">&nbsp;TO-DO</div>
					    </div>
					  </div>
					  <div class="active step">
					    <i class="fas fa-info-circle"></i>
					    <div class="content">
					      <div class="title"><span style="color:black">&nbsp;My To-Do</span></div>
					    </div>
					  </div>
					</div>
					
					<form action="updateTodo.do">
					
					<div class="detail-todo">
					
						<h4 style="color:#3287B2; font-weight:bold;">
							<i class="fas fa-envelope-open-text"></i> &nbsp;My TO-DO
						</h4> 
						<br>
						
						
						<input class="form-control input-lg" name="todoName" value="${ todoDetail.todoName }" type="text">
							
						<br><br>
						
						<input type="hidden" name="empId" value="${ loginUser.empId }">
						<input type="hidden" name="todoNo" value="${ todoDetail.todoNo }">
						<input type="hidden" name="tdBoardNo" value="${ todoDetail.tdBoardNo }">
						
						
						<h4 style="color:#3287B2; font-weight:bold;">
							<i class="fas fa-file-alt"></i> &nbsp;내용
						</h4>
						<br>
						<textarea class="form-control" name="todoContent" placeholder="textarea" rows="20">${ todoDetail.todoContent }</textarea>
						<br>
						<h5 style="color:#3287B2; font-weight:bold; padding:0 0 5px 0;">
							<i class="fas fa-envelope-open-text"></i> &nbsp;상태 선택
						</h5> 
						
						<div class="boardTitle-dropdown" style="width:20%;">
							<select class="form-control input-sm" name="todoStatus">
								<option value="ongoing">진행 중</option>
								<option value="waiting">대기</option>
								<option value="completion">완료</option>
							</select>
						</div>
						
						<br><br>
						
						
					<div class="btn-area" align="center">
						<!-- <button type="button" class="large ui button btn-lg" onclick="location.href=''" style="margin:0 0 5px 0; background-color:#5cb85c; color:white; font-size: 1.5rem;">
						  	<i class="fas fa-spinner"></i> &nbsp;대기
						</button>
						<button type="button" class="large ui button btn-lg" onclick="location.href='changeOngoing.do'" style="margin:0 0 5px 0; background-color:#5bc0de; color:white; font-size: 1.5rem;">
							<i class="fas fa-tasks"></i> &nbsp;진행중
						</button>
						<button type="button" class="large ui button btn-lg" onclick="location.href='#'" style="margin:0 0 5px 0; background-color:#f0ad4e; color:white; font-size: 1.5rem;">
						 	<i class="fas fa-check"></i> &nbsp;완료
						</button> -->
						<button type="submit" class="large ui button btn-lg" style="margin:0 0 5px 0; background-color:#5cb85c; color:white; font-size: 1.5rem;">
							<i class="fas fa-check"></i> &nbsp;수정하기
						</button>
						<button type="button" class="large ui button btn-lg" onclick="location.href='todoList.do?tdBoardNo=${todoDetail.tdBoardNo}'" style="margin:0 0 5px 0; background-color:red; color:white; font-size: 1.5rem;">
							<i class="fas fa-undo-alt"></i> &nbsp;취소
						</button>
					</div>
					
					
					</div>
					
					</form>
					
					<br><br>
					
					
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
			$("#m3_2").addClass("active");
		
			
			
			
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