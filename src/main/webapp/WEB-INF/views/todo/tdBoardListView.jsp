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
					
					<div class="ui huge three steps">
					  <div class="disabled step">
					    <i class="lnr lnr-inbox"></i>
					    <div class="content">
					      <div class="title">&nbsp;일감관리</div>
					    </div>
					  </div>
					  <div class="active step">
					    <i class="fas fa-th-list"></i>
					    <div class="content">
					      <div class="title">&nbsp;<span style="color:black">TO-DO</span></div>
					    </div>
					  </div>
					  <div class="disabled step">
					    <i class="fas fa-info-circle"></i>
					    <div class="content">
					      <div class="title">&nbsp;My To-Do</div>
					    </div>
					  </div>
					</div>
					
					
					<!-- 상단 드롭다운 & 보드생성 버튼 -->
					<div class="top-nav">
						<table id="top-table">
							<tr id="content-table">
								
								<td>
									<div class="ui inverted segment" style="float:right;">
									  <button type="button" style="background-color:#3287B2; color:white;" class="btn" id="insertTdBoard" onclick="location.href='insertTodoBoardView.do'">
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
				
						<div class="ui link cards" >
						
						<c:forEach items="${ todoBoardList }" var="b">
						
							<c:if test="${ b.empId == loginUser.empId }">
							<!-- 
							<c:url value="todoList.do" var="todoList">
								<c:param name="tdBoardNo" value="${b.tdBoardNo}"/>
							</c:url>
							 -->						
							<div class="card" onclick="location.href='todoList.do?tdBoardNo=${b.tdBoardNo}'" style="height:250px; margin:15px 15px 15px 15px; padding:10px 10px 0 10px;">
							   <input type="hidden" value="${b.tdBoardNo}">
							    <div class="image" style="height:25px; background-color:${ b.tdBoardColor };">
							    </div>
							    <div class="content" style="padding:20
							    px 0 10px 10px;">
							      <div class="header">${ b.tdBoardName }</div>
							      <div class="meta" style="padding:8px 15px 10px 0; text-align:right;">
							        <a><i class="fas fa-user"></i>&nbsp;${ loginUser.empName }</a>
							      </div>
							      <div class="description" style="padding:7px 0 0 0">
							       	<span>${ b.tdBoardContent }</span>
							      </div>
							    </div>
							    <div class="extra content">
							      <span class="right floated">
							       <i class="far fa-calendar-alt"></i>&nbsp;${ b.tdBoardEnrollDate }
							      </span>
							    </div>
						  </div>
							
						
							</c:if>
						
						</c:forEach>
						
						
						  
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