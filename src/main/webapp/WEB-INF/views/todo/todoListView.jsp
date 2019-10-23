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
					
					<c:if test="${ empty sessionScope.loginUser }">
						<h1>로그인 해주세요.</h1>
					</c:if>
					
					<c:if test="${ !empty sessionScope.loginUser }">
					
						
					
					<div class="allContentWrap" style="padding:0 30px 0 10px">
					
						<form action="deleteTodo.do" method="post">
						
							<table class="table table-hover">
						
							<button class="large ui button" onclick="location.href='allTodo.do'" style="margin:0 0 5px 0; background-color:#337ab7; color:white; font-size: 1.5rem;">
							  	<i class="fas fa-globe"></i> &nbsp;전체보기
							</button>
							
							<thead>
								<tr>
									<th width="5%"><input type="checkbox" id="chkAll" class="chkBox" name="chkAll" onclick=""></th>
									<th width="5%">#</th>
									<th width="48%">제목</th>
									<th width="18%">상태</th>
									<th width="24%">등록날짜</th>
								</tr>
							</thead>
							
							<tbody>
							
								<c:forEach items="${ todoList }" var="t">
								
									<c:if test="${ t.empId == loginUser.empId }">
									
										<tr>
											<td align="center"><input type="checkbox"></td>
											<td align="center">${ t.todoNo }</td>
											<td align="left">
												<c:if test="${ empty loginUser }">
													로그인 해주세요.
												</c:if>
												<c:if test="${ !empty loginUser }">
													<c:url value="todoDetail.do" var="todoDetail">
														<c:param name="todoNo" value="${ t.todoNo }"/>
													</c:url>
													<a href="${ todoDetail }">${ t.todoName }</a>
												</c:if>
											</td>
											<td align="center">
												<c:if test="${ t.todoStatus eq 'ongoing' }">진행중</c:if>
												<c:if test="${ t.todoStatus eq 'waiting' }">대기</c:if>
												<c:if test="${ t.todoStatus eq 'completion' }">완료</c:if>
											</td>
											<td align="center">${ t.todoEnrollDate }</td>
										</tr>
									
									</c:if>
								</c:forEach>
							
								<!-- <tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td>Steve</td>
									<td>진행중</td>
									<td>@steve</td>
								</tr>
								 -->
								
								
							</tbody>
						</table>
						
						<div class="btnArea" align="center">
							<button type="button" class="btn btn-default">
								<i class="fa fa-plus-square"></i> 추가하기 
							</button>
							<button type="submit" class="btn btn-danger">
								<i class="far fa-trash-alt"></i> 삭제하기
							</button>
						</div>
						
						</form>
						
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
							
							<%-- <div id="pagingArea" align="center">
					 			<!-- [이전] -->
								<c:if test="${ pi.currentPage == 1 }">
									이전&nbsp;
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:if test="${ !empty sc }">
										<c:url var="mlistBack" value="search.do">
											<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
											<c:param name="condition" value="${ condition }"/>
											<c:param name="search" value="${ search }"/>
										</c:url>
									</c:if>
									<c:if test="${ empty sc }">
										<c:url var="mlistBack" value="receiveMail.do">
											<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
										</c:url>
									</c:if>
									<a href="${ mlistBack }">이전</a>
								 </c:if>
					         
						         <!-- [번호들] -->
						         <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="#3287B2" size="3">${ p }</font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:if test="${ !empty sc }"> <!-- 검색결과 있으면 -->
						                  <c:url var="mlistPage" value="search.do">
						                     <c:param name="currentPage" value="${ p }"/>
						                     <c:param name="condition" value="${ condition }"/>
						                     <c:param name="search" value="${ search }"/>
						                     <c:param name="type" value="receive"/>
						                  </c:url>
						               </c:if>
						               <c:if test="${ empty sc }"> <!-- 검색 결과 없으면 -->
							               <c:url var="mlistPage" value="receiveMail.do">
							                  <c:param name="currentPage" value="${ p }"/>
							               </c:url>                  
						               </c:if>
						               <a href="${ mlistPage }">${ p }</a>
						            </c:if>
						         </c:forEach>
					         
					        	<!-- [다음] -->
								<c:if test="${ pi.currentPage == pi.maxPage }">
									&nbsp;다음
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:if test="${ !empty sc }">
										<c:url var="mlistNext" value="search.do">
											<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
											<c:param name="condition" value="${ condition }"/>
											<c:param name="search" value="${ search }"/>
										</c:url>
									</c:if>
									<c:if test="${ empty sc }">
										<c:url var="mlistNext" value="receiveMail.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
										</c:url>
									</c:if>
									<a href="${ mlistNext }">다음</a>
								</c:if>
							</div> --%>
							 
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
					
					
					
					
					
					
					
					
					
					
					
					
					</c:if>
					
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