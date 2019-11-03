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

<link rel="stylesheet" href="resources/semantic/step2.css">

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
					
					<div class="ui huge three steps">
					  <div class="step">
					    <i class="lnr lnr-inbox"></i>
					    <div class="content">
					      <div class="title">&nbsp;일감관리</div>
					    </div>
					  </div>
					  <div class="active step">
					    <i class="fab fa-product-hunt"></i>
					    <div class="content">
					      <div class="title">&nbsp;<span style="color:black">프로젝트 관리</span></div>
					    </div>
					  </div>
					  <div class="disabled step">
					    <i class="fas fa-info-circle"></i>
					    <div class="content">
					      <div class="title">&nbsp;Project</div>
					    </div>
					  </div>
					</div>
					
					<div class="top-nav" style="padding:10px 0 40px 0;">
					
						<table id="top-table">
							<tr id="content-table">
								
								<td>
									<div class="ui inverted segment">
									  <button type="button" style="background-color:#3287B2; color:white; float:right;" 
									  class="btn " id="insertProject" ><!-- onclick="location.href='insertProjectForm.do'" -->
									  	<i class="fas fa-plus-circle"></i> 새 프로젝트
									  </button>
									</div>
								</td>
							</tr>
						</table>
					
					</div>
					
					<!-- 프로젝트 추가 MODAL -->
			        <div class="" tabindex="-1" role="dialog" id="insertProjectModal" class="show" style="display:none;">
			     	 
			     	   
			            <div class="" role="document">
			                <div class="">
			                
			                    <div class="">
									<br>
									<input type="hidden" id="pNo" name="pNo" value="">
									<input type="hidden" name="empId" value="${ loginUser.empId }">
					   				<input type="hidden" name="pmId" value="${ loginUser.empId }">
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-title"><b>프로젝트</b></label>
			                                <input class="inputModal" type="text" id="edit-title"
			                                    name="pName" required="required">
			                            </div>
			                        </div>
			                        
			                        <hr>
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-desc" style="width:100px;"><b>프로젝트 내용(선택사항)</b></label><br>
			                                <textarea rows="4" cols="50" class="inputModal" name="pContent"
			                                    id="pContent" style="resize:none;"></textarea>
			                            </div>
			                        </div>
			                    </div>
			                    <hr>
			                    <div class="modalBtnContainer-modifyEvent" style="text-align:right; padding-right:10px;">
			                        <button type="button" class="btn btn-primary" id="saveEvent">저장</button>
			                        <button type="button" id="btn-default" class="btn btn-default">닫기</button>
			                    </div>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
					
					<div class="ui three cards" id="project-list">
					
						<div class="ui cards" >
							<!-- 
								1. 로그인한 유저 empid와 mlist의 empid가 같아야하고
								2. 그 empid가 포함된 프로젝트만 보이게. 
							 -->
							<input type="hidden" value="${mlist}">
							<c:forEach items="${ plist }" var="p">
							<%-- <c:if test="${ loginUser.empId ne mlist.empId }">아직 참여 중인 프로젝트가 없습니다.</c:if>
							<c:if test="${ loginUser.empId eq mlist.empId }"> --%>
								<input type="hidden" name="empId" value="${ loginUser.empId }">
								<input type="hidden" id="pNo" name="pNo" value="${ p.pNo }">
								<div class="card" style="margin:15px 15px 15px 15px;">
							    <div class="content">
							      <div class="header" id="pName" style="padding:0 0 10px 0;">${ p.pName } </div>
							      <input hidden="type" value="${ p.pContent }">
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
							        <span>
							        	<c:forEach items="${ mlist }" var="m">
							        		<c:if test="${ p.pNo eq m.pNo }">
							        			<c:forEach items="${ empList }" var="e">
										       		<c:if test="${ e.empId eq m.empId }">
										        		${ e.empName }
										        	</c:if>
									       		</c:forEach>
							        		</c:if>
							        	</c:forEach>
							        </span>
							        <br>
							        <p style="text-align:right;">${ p.pEnrollDate }</p>
							      </div>
							    </div>
							    <div class="ui bottom attached button">
							      <c:url value="projectDetail.do" var="pd">
							      <input type="hidden" name="pNo" value="${ p.pNo }">
							      		<c:param name="pNo" value="${ p.pNo }"/>
							      </c:url>
							      <a href="${ pd }">
							      <i class="fas fa-sign-in-alt"></i>
							      입장
							      </a>
							    </div>
							   </div>
							<%-- </c:if> --%>
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
		
		/* 업무 추가 모달 */
		// 모달창 생성
		$(document).on('click','#insertProject',function(){
			$('#insertProjectModal').dialog({
	   		  title: '새 프로젝트',
	  	      modal: true,
	  	      width: '600'
	  		});
			
			$("#deleteEvent").css('display','none');
			
		});
		
		// 모달창 닫기
		$(function() {
		    $("#btn-default").on('click', function() {
		        $("#insertProjectModal").dialog("close");
		    });
		});
		
		
		// 프로젝트 추가 인설트 - 저장 버튼
		$(document).on('click', '#saveEvent', function(){

			 var pNo = $("#pNo").val();
			 var pName = $("input[name=pName]").val();
			 var pContent = $("#pContent").val();
			 
			 $.ajax({
			
				url:"insertProject.do",
				type:"POST",
				data:{
					  pNo:pNo,
					  pName:pName,
					  pContent:pContent,
					  pmId:'${loginUser.empId}',
					  empId:'${loginUser.empId}'
				},
				success:function(data){
					if(data == 'success'){
					
						$("#pNo").val("");
						$("input[name=pName]").val("");
						$("#pContent").val("");
						
						$("#insertProjectModal").dialog("close");
						location.reload();
						
					}else{
						console.log(pNo);
						console.log(pName);
						console.log(pContent);
						alertify.alert("delveloffice", "확인");
						location.reload();
					}
				},
				error:function(){
					alertify.alert("develoffice", "통신실패");
				}
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