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
	.top-nav{
		margin-top:5px;
		margin-bottom:25px;
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
					
					<div class="top-nav">
						<table id="top-table">
							<tr id="content-table">
								<!-- <td>
									<select class="form-control input-lg" style="width:40%;">
										<option value="cheese">Final Project</option>
										<option value="tomatoes">Semi Project</option>
										<option value="mozarella">Mini Project</option>
										<option value="mushrooms">Mushrooms</option>
										<option value="pepperoni">Pepperoni</option>
										<option value="onions">Onions</option>
									</select>
								</td> -->
								<td>
									<div class="ui inverted segment">
									  <button type="button" style="background-color:#3287B2; color:white; float:right;" 
									  class="btn btn-lg" id="insertTdBoard" onclick="location.href='insertProjectForm.do'">
									  	<i class="fas fa-plus-circle"></i> 새 프로젝트
									  </button>
									</div>
								</td>
							</tr>
						</table>
					
					</div>
					
					<div class="ui three cards" id="project-list">
					
						<div class="ui cards">
						
							<c:forEach items="${ plist }" var="p">
							<c:if test="${ !empty loginUser.empId }">
								<input type="hidden" name="empId" value="${ loginUser.empId }">
								<div class="card">
							    <div class="content">
							      <div class="header" style="padding:0 0 10px 0;">${ p.pName }</div>
							      <div class="meta" style="float:right; padding:0 0 10px 0;">
							        <i class="fas fa-user-cog"></i>
							        <span>
							       		<c:forEach items="${ empList }" var="e">
							       		<c:if test="${ e.empId eq p.pmId }">
							        		${ e.empName }
							        	</c:if>
							       		</c:forEach>
							        </span>
							      </div>
							      <div class="description">
							        <i class="fas fa-users"></i>
							        <span>...프로젝트 구성원들...</span>
							        <br>
							        <p style="text-align:right;">${ p.pEnrollDate }</p>
							      </div>
							    </div>
							    <div class="ui bottom attached button" onclick="location.href='projectDetail.do'">
							      <i class="fas fa-sign-in-alt"></i>
							      입장
							    </div>
							   </div>
							</c:if>
							</c:forEach>
						  	
						  
						  
						  <!-- <div class="card">
						    <div class="content">
						      <div class="header" style="padding:0 0 10px 0;">Semi Project</div>
						      <div class="meta" style="float:right; padding:0 0 10px 0;">
						        <i class="fas fa-user-cog"></i>
						        <span>원영주</span>
						      </div>
						      <div class="description">
						        <i class="fas fa-users"></i>
						        <span>Elliot Fu is a film-maker from New York.</span>
						      </div>
						    </div>
						    <div class="ui bottom attached button" onclick="location.href='projectDetail.do'">
						      <i class="fas fa-sign-in-alt"></i>
						      입장
						    </div>
						  </div> -->
						  
						  
						  
						  
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