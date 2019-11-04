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
	.select_td{
		font-size: 17px;
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
					
					<table class="ui selectable celled table">
						<colgroup>
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:15%;">
							<col style="width:30%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr id="headCol">
								<th style="color: #676767;">이름</th>
								<th style="color: #676767;">직급</th>
								<th style="color: #676767;">부서</th>
								<th style="color: #676767;">퇴사예정일</th>
								<th style="color: #676767;">퇴사 승인</th>
							</tr>
						</thead>
						<tbody class="select_subject" id="select_list">
							<c:forEach items="${ retireList }" var="emp">
								<tr>
									<td class="select_td empName">${ emp.empName }</td>
									<td class="select_td job_name">${ emp.jobName }</td>
									<td class="select_td dept_name">${ emp.deptName }</td>
									<td class="select_td retire_date">${ emp.retireDate }</td>
									<td id="${emp.empId }"><button style="font-size:13px;" id="retire_button" class="ui active button">퇴사</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
			
			$("#retire_button").on('click', function(){
				var button = $(this);
				button.removeClass("active");
				button.addClass("loading");
				var empId = $(this).parent().prop("id");
				console.log(empId);
				setTimeout(function() {
					$.ajax({
						url:"deleteEmp.do",
						type:"POST",
						data:{empId:empId},
						success:function(data){
							if(data == "success"){
								button.addClass("active");
								button.removeClass("loading");
								button.html('퇴사 처리됨').attr("disabled", true);
							}else{
								alertify.alert("Develoffice", "퇴사 실패!!");
							}
						},
						error:function(){
							
						}
					});
				}, 3000);
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