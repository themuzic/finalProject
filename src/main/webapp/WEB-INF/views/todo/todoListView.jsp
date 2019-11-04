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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="resources/assets/Semantic-UI-CSS-master/semantic.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script>
   jQuery(function($){
   	$("#myTable").DataTable({
   		
   		
   		responsive:true,
   		info: false,
   		 "language": {
	        "emptyTable": "입력된 TO-DO가 없습니다.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "search": "검색 : ",
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
	
	table.table-bordered.dataTable tbody td{
		border:none;
		font-size:15px;
	}	
	
	.allContentWrap {
		width: 60%;
		display:inline; 
		float:left;
	}
	
	.statusContentWrap{
		width: 40%;
		display:inline; 
		float:left;
	}
	.ui-dialog{
		min-height: 325px;
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
					
					
					<div class="allContentWrap" style="padding:0 30px 0 10px">
					
								
						<button type="button" class="large ui button" onclick="location.href='allTodoView.do'" style="margin:0 0 10px 0; background-color:#337ab7; color:white; font-size: 1.2rem;">
						  	<i class="fas fa-globe"></i> &nbsp;전체보기
						</button>
							
						<table id="yourTable" class="table table-bordered" style="border:none;">
						
							<colgroup>
								<col style="width:5%;">
								<col style="width:65%;">
								<col style="width:12%;">
								<col style="width:18%;">
							</colgroup>
						
							<thead>
								<tr>
									<th data-orderable="false" style="text-align:center; font-weight:bold;"><i><input type="checkbox" id="chkAll"></i></th>
									<th data-orderable="false" style="text-align:center; font-weight:bold;">My TO-DO</th>
									<th data-orderable="false" style="text-align:center; font-weight:bold;">상태</th>
									<th data-orderable="false" style="text-align:center; font-weight:bold;r">등록날짜</th>
								</tr>
							</thead>
						
							<tbody class="select_subject">
							
								<c:forEach items="${ todoAList }" var="a">
								
									<c:if test="${ a.empId == loginUser.empId }">
									
										<tr>
											<td align="center">
												<input type="hidden" value="${ a.todoNo }">
												<input type="checkbox" name="check" class="check chkBox" value="${ a.todoNo }" />
											</td>
											<td align="left">
												<c:if test="${ empty loginUser }">
													로그인 해주세요.
												</c:if>
												<c:if test="${ !empty loginUser }">
													<c:url value="todoDetail.do" var="td">
														<c:param name="todoNo" value="${ a.todoNo }"/>
													</c:url>
													<a href="${ td }">${ a.todoName }</a>
												</c:if>
											</td>
											<td align="center">
												<c:if test="${ a.todoStatus eq 'ongoing' }">진행중</c:if>
												<c:if test="${ a.todoStatus eq 'waiting' }">대기</c:if>
												<c:if test="${ a.todoStatus eq 'completion' }">완료</c:if>
											</td>
											<td align="center">${ a.todoEnrollDate }</td>
										</tr>
									
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						
						<div class="btnArea" align="center">
							<button type="button" id="insertTodo" class="btn btn-default" style="font-size: 1.2rem;"><!-- onclick="location.href='insertTodoView.do'"  -->
								<i class="fa fa-plus-square"></i> 추가하기 
							</button>
							<button type="button" id="deleteTodo"  onclick="deleteTodo();" class="btn btn-danger" style="font-size: 1.2rem;">
								<i class="far fa-trash-alt"></i> 삭제하기
							</button>
						</div>
						
					</div>
					
					<!-- 프로젝트 추가 MODAL -->
			        <div class="" tabindex="-1" role="dialog" id="insertTodoModal" class="show" style="display:none;overflow: hidden;">
			     	 
			     	   <%-- <input type="hidden" id="tdBoardNo" value="${ allTodo.tdBoardNo }"> --%>
					   <input type="hidden" name="empId" value="${ loginUser.empId }">
			            
			            <div class="" role="document">
			                <div class="">
			                
			                    <div class="">
									<br>
									
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-title"><b>My TO-DO</b></label>
			                                <input class="inputModal" type="text" id="edit-title"
			                                    name="todoName" required="required">
			                            </div>
			                        </div>
			                        
			                        <hr>
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-desc" style="width:150px;"><b>내용(선택사항)</b></label><br>
			                                <textarea rows="4" cols="50" class="inputModal" name="todoContent"
			                                    id="todoContent" style="resize:none;"></textarea>
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
						
					
					<div class="statusContentWrap" style="padding:0 10px 0 30px">
	
						<div class="ongoingTD">
						
							<button class="large ui button btn-lg" onclick="location.href='ongoingTodoView.do'" style="margin:0 0 10px 0; background-color:#5bc0de; color:white; font-size: 1.2rem;">
								<i class="fas fa-tasks"></i> &nbsp;진행중
							</button>
							
							<table id="yourTable2" class="table table-bordered" style="border:none;">
								<colgroup>
									<col style="width:6%;">
									<col style="width:69%;">
									<col style="width:25%;">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align:center; font-weight:bold;"><i class="fas fa-tasks"></i></th>
										<th style="text-align:center; font-weight:bold;">제목</th>
										<th style="text-align:center; font-weight:bold;">등록날짜</th>
									</tr>
								</thead>
								
								<tbody class="select_subject">
								
								<!-- 컨트롤러 selectTodoList에 어레이리스트 3개 더 추가
									 mv.addObject("todoList", todoList).addObject("진행중리스트", )
									 .addObject("대기 리스트", ).addObject("완료리스트", ).setViewName("todo/todoListView"); -->
								
									<c:forEach items="${ todoOList }" var="o">
										<c:if test="${ o.empId == loginUser.empId }">
											<tr>
												<td style="text-align:center;"><i class="fas fa-tasks"></i></td>
												<td>
													<c:if test="${ !empty loginUser }">
														<c:url value="todoDetail.do" var="todoDetail">
															<c:param name="todoNo" value="${ o.todoNo }"/>
														</c:url>
														<a href="${ todoDetail }">${ o.todoName }</a>
													</c:if>
												</td>
												<td>${ o.todoEnrollDate }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							
						</div>
						
						<div class="waitingTD">
							<button class="large ui button btn-lg" onclick="location.href='waitingTodoView.do'" style="margin:0 0 10px 0; background-color:#5cb85c; color:white; font-size: 1.2rem;">
							  	<i class="fas fa-spinner"></i> &nbsp;대기
							</button>
							<table id="yourTable3" class="table table-bordered" style="border:none;">
							
								<colgroup>
									<col style="width:6%;">
									<col style="width:69%;">
									<col style="width:25%;">
								</colgroup>
								
								<thead>
									<tr>
										<th style="text-align:center; font-weight:bold;"><i class="fas fa-spinner"></i></th>
										<th style="text-align:center; font-weight:bold;">제목</th>
										<th style="text-align:center; font-weight:bold;">등록날짜</th>
									</tr>
								</thead>
								<tbody class="select_subject">
									<c:forEach items="${ todoWList }" var="w">
								
										<c:if test="${ w.empId == loginUser.empId }">
											<tr>
												<td style="text-align:center;"><i class="fas fa-spinner"></i></td>
												<td>
													<c:if test="${ !empty loginUser }">
														<c:url value="todoDetail.do" var="todoDetail">
															<c:param name="todoNo" value="${ w.todoNo }"/>
														</c:url>
														<a href="${ todoDetail }">${ w.todoName }</a>
													</c:if>
												</td>
												<td>${ w.todoEnrollDate }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<div class="completionTD">
							<button class="large ui button btn-lg" onclick="location.href='completionTodoView.do'" style="margin:0 0 10px 0; background-color:#f0ad4e; color:white; font-size: 1.2rem;">
							 	<i class="fas fa-check"></i> &nbsp;완료
							</button>
							<table id="yourTable4" class="table table-bordered" style="border:none;">
								<colgroup>
									<col style="width:6%;">
									<col style="width:69%;">
									<col style="width:25%;">
								</colgroup>
								
								<thead>
									<tr>
										<th style="text-align:center; font-weight:bold;"><i class="fas fa-check"></i></th>
										<th style="text-align:center; font-weight:bold;">제목</th>
										<th style="text-align:center; font-weight:bold;">등록날짜</th>
									</tr>
								</thead>
								<tbody class="select_subject">
									<c:forEach items="${ todoCList }" var="c">
								
									<c:if test="${ c.empId == loginUser.empId }">
										<tr>
											<td style="text-align:center;"><i class="fas fa-check"></i></td>
											<td>
												<c:if test="${ !empty loginUser }">
													<c:url value="todoDetail.do" var="todoDetail">
														<c:param name="todoNo" value="${ c.todoNo }"/>
													</c:url>
													<a href="${ todoDetail }">${ c.todoName }</a>
												</c:if>
											</td>
											<td>${ c.todoEnrollDate }</td>
										</tr>
									</c:if>
									</c:forEach>
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
			
			/* 사이드바 해당 메뉴 활성화 유지 */
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_2").addClass("active");	
			
		
		
		/* 체크박스 전체 선택하기 */
		$("#chkAll").click(function(){
			var chk = $(this).is(":checked");
			if(chk) $(".select_subject input").prop('checked', true);
			else  $(".select_subject input").prop('checked', false);

		});
		
		/* 테이블 행 호버 시 색 변화, 행 선택 시 링크 이동 */
		 $("#yourTable").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		 	}).click(function(){
		 		var aa = $(this).parent()
		 		aa.location.href="todoDetail.do";
		 	});
		 $("#yourTable2").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		 	}).click(function(){
		 		location.href("todoDetail.do");
		 	});
		 $("#yourTable3").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		 	}).click(function(){
		 		location.href("todoDetail.do");
		 	});
		 $("#yourTable4").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		 	}).click(function(){
		 		location.href("todoDetail.do");
		 	});
		 
		});
		
		
		
		
		// 체크박스 선택 삭제
		function deleteTodo(){
			
			var dd = $("input:checkbox[name=check]:checked");

			$.each(dd, function(i, ck){
				
				var tr = ck.parentNode.parentNode;
				
				$.ajax({
					url: "deleteTodo.do",
					type: "POST",
					data: {todoNo: ck.value,
						   empId:"${loginUser.empId}"
					},
					success: function(data){
						if(data == "success"){
							//tr.remove();
							 location.reload();
						}else{
							alert("삭제실패");
						}
					},
					error: function(request,status,error){
				        alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        console.log("에러에러")
				       
					}

				});
			});
		};
		
		
		/* 업무 추가 모달 */
		// 모달창 생성
		$(document).on('click','#insertTodo',function(){
			$('#insertTodoModal').dialog({
	   		  title: '새 TO-DO',
	  	      modal: true,
	  	      width: '600'
	  		});
			
			$("#deleteEvent").css('display','none');
			
		});
		
		// 모달창 닫기
		$(function() {
		    $("#btn-default").on('click', function() {
		        $("#insertTodoModal").dialog("close");
		    });
		});
		
		
		// 프로젝트 추가 인설트 - 저장 버튼
		$(document).on('click', '#saveEvent', function(){

			 var todoNo = $("#todoNo").val();
			 var tdBoardNo = $("#tdBoardNo").val();
			 var todoName = $("input[name=todoName]").val();
			 var todoContent = $("#todoContent").val();
			 
			 $.ajax({
			
				url:"insertTodo.do",
				type:"POST",
				data:{
					  todoNo:todoNo,
					  tdBoardNo:tdBoardNo,
					  todoName:todoName,
					  todoContent:todoContent,
					  empId:'${loginUser.empId}'
				},
				success:function(data){
					if(data == 'success'){
					
						$("#todoNo").val("");
						$("#tdBoardNo").val("");
						$("input[name=todoName]").val("");
						$("#todoContent").val("");
						
						$("#insertProjectModal").dialog("close");
						location.reload();
						
					}else{
						console.log(todoNo);
						console.log(tdBoardNo);
						console.log(todoName);
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