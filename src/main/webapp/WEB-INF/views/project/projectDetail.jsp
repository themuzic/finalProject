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
<link rel="stylesheet" href="resources/css/circular-progressbar.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="resources/assets/Semantic-UI-CSS-master/semantic.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<link rel="stylesheet" href="resources/semantic/item.css">

<script>
   jQuery(function($){
   	$("#myTable").DataTable({
   		
   		
   		responsive:true,
   		info: false,
   		 "language": {
	        "emptyTable": "글이 없습니다.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "search": "업무 검색 : ",
	        "zeroRecords": "일치하는 결과가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": "다음",
	            "previous": "이전"
	        }
	    },
	    
	    
	  		/* columns: [
            {"data": "no"},
            {"data": "title"},
            {"data": "writer"}, 
            {"data": "count"}, 
            {"data": "date"}
            ],  */
	    
	    
   	});
   	
   /*  $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
 
    	$('.dataTables_filter input').unbind().bind('keyup', function () {
        var colIndex = document.querySelector('#select').selectedIndex;
        table.column(colIndex).search(this.value).draw();
        
      	
    }); */
 
   	   
   	$(document).ready(function() {
   	    $('#myTable').DataTable();
   	} );
   	
   	

   });
</script>

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
	.top-navbar ul{
		list-style-type:none;
		/* 좌측 여백 없애기 */
		padding-left:0px;
		/* 우측 정렬 하기 */
		float:;
	}
	
	.top-navbar ul li{
		display:inline;
		/* border-left: 1px solid #3287B2; */
		/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */
		padding: 0px 10px 0px 10px;
		/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽; */
		margin: 5px 0px 5px 0px;
		color:#3287B2;
		font-size:15px;
		cursor:pointer;
	}

	.top-navbar ul li:first-child{
		/* float:left; */
		padding: 0px 200px 0px 10px;
		cursor: default;
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
					
					<!-- 상단 네비로 업무 & 타임라인 "TaskWorld" 참고!! -->
					
					<!-- 상단 바 -->
					<div class="top-navbar" align="center" style="margin:0 0 60px 0;">
						<ul>
							<li>
								<span style="color:#3287B2; font-size:18px; font-weight:bold;">
									<i class="far fa-hourglass"></i> OUR PROJECT <i class="fas fa-hourglass-half"></i>
								</span>
							</li>
							<li onclick="location.href='#'"><i class="fas fa-tasks"></i>&nbsp;업무</li>
							<li onclick="location.href='#'"><i class="fas fa-stream"></i>&nbsp;타임라인</li>
						</ul>
					</div>
					
					<input type="hidden" name="pNo" value="${ projectDetail.pNo }">
					
					<div class="pContent">
						
						<!-- 업무추가 버튼, progress-bar -->
						<div class="pContent1" >
						
							<!-- progress 바 -->
							<!-- PM만 수정가능 , 나머지는 readonly -->
							<div class="prgress-bar" style="float:right; border:1px solid #F2E9E1;">
								<p align="center" style="font-size:23px; color:#53777A; font-weight:bold; padding:10px 0 0 0;" >진행상황</p>
								<div class="progress-circle p50">
								  <span>${ projectDetail.pProgress }%</span>
								  <div class="left-half-clipper">
								    <div class="first50-bar"></div>
								    <div class="value-bar"></div>
								  </div>
								</div>
							</div>
							
							<!-- progress 수정 MODAL -->
					        <div class="" tabindex="-1" role="dialog" id="updateProgressModal" class="show" style="width:300px; display:none;">
					     	 
					     	   <input type="hidden" id="pNo" value="${ projectDetail.pNo }">
					     	   
					            <div class="" role="document">
					                <div class="">
					                
					                    <div class="">
											<br>
											
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" style="width:250px;" for="edit-title"><b>이번 프로젝트 % 완성되었나요?</b></label>
					                                <input class="inputModal" type="number" id="edit-title"
					                                    name="pProgress" required="required">
					                            </div>
					                        </div>
					                        
					                        <hr>
					                        
					                    </div>
					                    <hr>
					                    <div class="modalBtnContainer-modifyEvent" style="text-align:right; padding-right:10px;">
					                        확실하신가요? &nbsp;<button type="button" class="btn btn-primary" id="saveProgress">예</button><br><br>
					                        다시 생각해볼게요. &nbsp;<button type="button" id="backback" class="btn btn-default">닫기</button>
					                    </div>
					                </div><!-- /.modal-content -->
					            </div><!-- /.modal-dialog -->
					        </div><!-- /.modal -->
							
							
							
							<div class="btnArea" style="float:left; padding:120px 0 0 0;">
								<button type="button" class="btn btn-default" id="add-task">
									<i class="fa fa-plus-square"></i> 업무리스트 추가
								</button>
								&nbsp;
								
							<!-- 업무 추가 MODAL -->
					        <div class="" tabindex="-1" role="dialog" id="insertTaskModal" class="show" style="display:none;">
					     	 
					     	   <input type="hidden" id="pNo" value="${ projectDetail.pNo }">
					     	   
					            <div class="" role="document">
					                <div class="">
					                
					                    <div class="">
											<br>
											
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-title"><b>업무</b></label>
					                                <input class="inputModal" type="text" id="edit-title"
					                                    name="taskTitle" required="required">
					                            </div>
					                        </div>
					                        
					                        <hr>
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <label class="col-xs-4" for="edit-desc"><b>업무 내용</b></label>
					                                <textarea rows="4" cols="50" class="inputModal" name="taskContent"
					                                    id="taskContent" style="resize:none;"></textarea>
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
								
								<!-- PM만 보이게 -->
								<button type="button" class="btn btn-success">
									<i class="fas fa-user-plus"></i>&nbsp;팀원 추가
								</button>
								&nbsp;
								<button type="button" class="btn btn-danger">
									<i class="fas fa-user-times"></i>&nbsp;팀원 삭제
								</button>
							</div>
							
							
						</div>
						
						<br><br><br><br><br><br><br><br><br><br><br>
						
						<div class="pContent2">
						
						
							<table id="myTable" class="table table-bordered" style="border:none;">
					
								<colgroup>
									<col style="width:5%;">
									<col style="width:55%;">
									<col style="width:7%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:13%;">
								</colgroup>
							
						        <thead>
						            <tr>
						             	<th data-orderable="false" style="text-align:left;"><i><input type="checkbox" id="chkAll"></i></th>							      	
								  		<th data-orderable="false" id="title" style="text-align:center;">업무</th>
								  		<th data-orderable="false" id="writer" style="text-align:center;">작성자</th>
								  		<th data-orderable="false" style="text-align:center">첨부파일</th>
							  			<th style="text-align:center;">조회수</th>
								  		<th data-orderable="false" style="text-align:center;"><i class="far fa-clock"></i>&nbsp;작성일</th>
						    		</tr>
						        </thead>
						        
						        <tbody class="select_subject">
						        <c:forEach items="${ taskList }" var="t">
						        	<tr>
						        		<td>
						        			<input type="hidden" id="taskNo" name="taskNo" value="${ t.taskNo }">
						        			<input type="hidden" name="pNo" value="${ t.pNo }">
						        		</td>
						        		<td>
						        			<c:if test="${ empty loginUser }">${ t.taskTitle }</c:if>
						        			<c:if test="${ !empty loginUser }">
						        				<c:url value="taskDetail.do" var="taskDetail">
						        					<c:param name="taskNo" value="${ t.taskNo }"/>
						        				</c:url>
						        				<a href="${ taskDetail }">${ t.taskTitle }</a>
						        			</c:if>
						        		</td>
						        		<td><input type="hidden" value="${ t.taskWriter }"></td>
						        		<td>
						        			<c:if test="${ !empty t.tOriginalFileName }">
						        				<i class="far fa-file-alt"></i>
						        			</c:if>
						        		</td>
						        		<td>${ t.taskCount }</td>
						        		<td>${ t.tCreateDate }</td>
						        	
						        	</tr>
						        </c:forEach>
						        
						  
						        </tbody> 
							</table>
							
						</div>
						
						<div class="pContent3">
							
						
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
			
			/* 체크박스 전체 선택하기 */
			$("#chkAll").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $(".select_subject input").prop('checked', true);
				else  $(".select_subject input").prop('checked', false);
			});
			
			 $("#myTable").find("td").mouseenter(function(){
			       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).parent().css("background","white");
			 });
		
		});
		
		// 모달창 생성
		$(document).on('click','#add-task',function(){
			$('#insertTaskModal').dialog({
	   		  title: '업무 추가',
	  	      modal: true,
	  	      width: '600'
	  		});
			
			$("#deleteEvent").css('display','none');
			
		});
		
		// 모달창 닫기
		$(function() {
		    $("#btn-default").on('click', function() {
		        $("#insertTaskModal").dialog("close");
		    });
		});
		
		
		// 업무 추가 인설트 - 저장 버튼
		$(document).on('click', '#saveEvent', function(){

			// var taskNo = $("#taskNo").val();
			 var pNo = $("#pNo").val();
			 var taskTitle = $("input[name=taskTitle]").val();
			 var taskContent = $("#taskContent").val();
			 
			 $.ajax({
			
				url:"insertTask.do",
				type:"POST",
				data:{
					  //taskNo:taskNo,
					  pNo:pNo,
					  taskTitle:taskTitle,
					  taskContent:taskContent,
					  taskWriter:"${loginUser.empId}"
				},
				success:function(data){
					if(data == 'success'){
						$("#pNo").val("");
						$("input[name=taskTitle]").val("");
						
						$("#insertTaskModal").dialog("close");
						
					}else{
						alertify.alert("delveloffice", "업무 추가 실패");
					}
				},
				error:function(){
					alertify.alert("develoffice", "통신실패");
				}
			 });
		});
		
		
		
		
		
		/* progress bar 모달*/
		// 모달창 생성
		$(document).on('click','.prgress-bar',function(){
			$('#updateProgressModal').dialog({
	   		  title: '진행상황 수정',
	  	      modal: true,
	  	      width: '600'
	  		});
			
			$("#deleteEvent").css('display','none');
			
		});
		
		// 모달창 닫기
		$(function() {
		    $("#backback").on('click', function() {
		        $("#updateProgressModal").dialog("close");
		    });
		});
		
		
		// 진행상황 수정 - 저장 버튼
		$(document).on('click', '#saveProgress', function(){

			 var pNo = $("#pNo").val();
			 var pProgress = $("input[name=pProgress]").val();
			 
			 $.ajax({
			
				url:"updateProgress.do",
				type:"POST",
				data:{
					  pNo:pNo,
					  pProgress:pProgress,
					  empId:"${loginUser.empId}"
				},
				success:function(data){
					if(data == 'success'){
						$("#pNo").val("");
						$("input[name=pProgress]").val("");
						
						$("#updateProgressModal").dialog("close");
						
						
					}else{
						alertify.alert("delveloffice", "업무 추가 실패");
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