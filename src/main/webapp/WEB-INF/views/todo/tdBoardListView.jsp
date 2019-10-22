<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources/css/semantic_dropdown.css">
<link rel="stylesheet" href="resources/css/semantic_icon.css">
<link rel="stylesheet" href="resources/css/semantic_button.css">


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
	
	.ui.link.cards{
		margin-left:15px;
		margin-right:15px;
	}
	
	.top-nav{
		margin-top:5px;
		margin-bottom:5px;
	}
	#content-table{
		margin-top:5px;
		margin-bottom:5px;
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
					
					
					<!-- 상단 드롭다운 & 보드생성 버튼 -->
					<div class="top-nav">
						<table id="top-table">
							<tr id="content-table">
								<td>
									<select class="form-control input-lg" style="width:40%;">
										<option value="cheese">2019년 10월</option>
										<option value="tomatoes">2019년 9월</option>
										<option value="mozarella">2019년 8월</option>
										<option value="mushrooms">Mushrooms</option>
										<option value="pepperoni">Pepperoni</option>
										<option value="onions">Onions</option>
									</select>
								</td>
								<td>
									<div class="ui inverted segment">
									  <button type="button" style="background-color:#3287B2; color:white;" class="btn btn-lg" id="insertTdBoard" onclick="location.href='insertTodoBoardView.do'">
									  	<i class="fas fa-plus-circle"></i> Board
									  </button>
									</div>
								</td>
							</tr>
						</table>
					
					</div>
					
					
					<br><br>
					
					
					<!-- 보드 리스트 -->
					<div class="ui three cards">
				
						<div class="ui link cards">
						
						<c:forEach items="${ list }" var="b">
						
							<div class="card" onclick="location.href='todoList.do'" style="height:200px; /* border:solid 10px; */">
							   
							    <div class="image" style="height:20px; background-color:${ b.tdBoardColor };">
							      <%-- <input type="color" value="${ b.tdBoardColor }"> --%>
							    </div>
							    <div class="content" style="padding:10px 0 10px 10px;">
							      <div class="header">${ b.tdBoardName }</div>
							      <div class="meta" style="padding:10px 0 10px 0;">
							        <a>${ b.empId }</a>
							      </div>
							      <div class="description" style="padding:10px 0 0 0">
							       	<span>${ b.tdBoardContent }</span>
							      </div>
							    </div>
							    <div class="extra content">
							      <span class="right floated">
							        ${ b.tdBoardEnrollDate }
							      </span>
							    </div>
							   
						    
						  </div>
							
						
						
						
						</c:forEach>
						
						
						
						  <%-- <div class="card" onclick="location.href='todoList.do'" style="height:200px; /* border:solid 10px; */">
							   
							    <div class="image" style="height:20px;">
							      <input type="color" value="${ b.tdBoardColor }">
							    </div>
							    <div class="content">
							      <div class="header">2019년 10월</div>
							      <div class="meta">
							        <a>원영주</a>
							      </div>
							      <div class="description">
							        2019년 10월 서비스팀 업무 관리
							      </div>
							    </div>
							    <div class="extra content">
							      <span class="right floated">
							        Joined in 2013
							      </span>
							    </div>
						  </div> --%>
						  
						  
						  
						  
						  
						  
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
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
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

</body>
</html>