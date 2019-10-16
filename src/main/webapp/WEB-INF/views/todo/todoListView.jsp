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
	 	display:inline;
		float:left;
		width:95%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	
	.allContentWrap, .statusContentWrap{
		width: 50%;
		display:inline; 
		float:left;
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
					
					<!-- <div class="ui animated fade button" tabindex="0">
					  <div class="visible content">Sign-up for a Pro account</div>
					  <div class="hidden content">
					    $12.99 a month
					  </div>
					</div> -->
					
					<div class="allContentWrap" style="padding:0 30px 0 10px">
						<table class="table table-hover">
						
							<button class="large ui button" onclick="location.href='allTodo.do'" style="margin:0 0 5px 0; background-color:#337ab7; color:white; font-size: 1.5rem;">
							  	<i class="fas fa-globe"></i> &nbsp;전체보기
							</button>
							
							<thead>
								<tr>
									<th width="5%"></th>
									<th width="5%">#</th>
									<th width="48%">제목</th>
									<th width="18%">상태</th>
									<th width="24%">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>Steve</td>
									<td>진행중</td>
									<td>@steve</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>2</td>
									<td>Simon</td>
									<td>대기</td>
									<td>@simon</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>3</td>
									<td>Jane</td>
									<td>완료</td>
									<td>@jane</td>
								</tr>
							</tbody>
						</table>
						
						<div class="btnArea" align="center">
							<button type="button" class="btn btn-default">
								<i class="fa fa-plus-square"></i> 추가하기 
							</button>
							<button type="reset" class="btn btn-danger">
								<i class="far fa-trash-alt"></i> 삭제하기
							</button>
						</div>
						
						
					</div>
					
					<div class="statusContentWrap" style="padding:0 10px 0 30px">
	
						<div class="ongoingTD">
							<button class="large ui button btn-lg" onclick="location.href='ongoingTodo.do'" style="margin:0 0 5px 0; background-color:#5bc0de; color:white; font-size: 1.5rem;">
								<i class="fas fa-tasks"></i> &nbsp;진행중
							</button>
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="7%">#</th>
										<th width="50%">제목</th>
										<th width="20%">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Steve</td>
										<td>@steve</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Simon</td>
										<td>@simon</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Jane</td>
										<td>@jane</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="waitingTD">
							<button class="large ui button btn-lg" onclick="location.href='waitingTodo.do'" style="margin:0 0 5px 0; background-color:#5cb85c; color:white; font-size: 1.5rem;">
							  	<i class="fas fa-spinner"></i> &nbsp;대기
							</button>
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="7%">#</th>
										<th width="50%">제목</th>
										<th width="20%">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Steve</td>
										<td>@steve</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Simon</td>
										<td>@simon</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Jane</td>
										<td>@jane</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="completionTD">
							<button class="large ui button btn-lg" onclick="location.href='completionTodo.do'" style="margin:0 0 5px 0; background-color:#f0ad4e; color:white; font-size: 1.5rem;">
							 	<i class="fas fa-check"></i> &nbsp;완료
							</button>
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="7%">#</th>
										<th width="50%">제목</th>
										<th width="20%">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Steve</td>
										<td>@steve</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Simon</td>
										<td>@simon</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Jane</td>
										<td>@jane</td>
									</tr>
								</tbody>
							</table>
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
			
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_2").addClass("active");	
			
			
		});
	
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>