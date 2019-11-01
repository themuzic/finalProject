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

<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- summernote 에디터 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>


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
						<input type="hidden" name="pNo" value="${ projectDetail.pNo }">
						
							<!-- progress 바 -->
							<!-- PM만 수정가능 , 나머지는 readonly -->
							<div class="prgress-bar" style="float:right; border:1px solid #F2E9E1; cursor:pointer;">
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
							
							
							
								<!-- PM만 보이게 -->
								<!-- 멤버 추가는 insertProject에서 빼고 detail에서 넣을 수 있도록 -->
								<form action="insertMem.do">
								
							 	<div class="addMember">
									<div class="TeamMemArea" style="padding:10px 0 0 0"> 
									
									
									<input type="hidden" name="pNo" value="${ projectDetail.pNo }">
						 			
						 			
										<table class="cal_table1 approve-write js-approval-line" style="border:0px solid white;">
											<colgroup>
												<col style="width:10%;">
												<col style="width:90%;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row" class="sign">
														<div onclick="addMem();" style="height: 50px; display: table-cell; width: 150px; 
														vertical-align: middle; text-align: center;position: relative; cursor:pointer;">멤버</div>
													</th>
													<td class="sign vt" id="approvalFirstLine">
														<table style="width:100%;table-layout:fixed">
															<colgroup><col><col><col><col><col><col><col></colgroup>
															<tbody id="apTbody">
															<tr id="nameRow" style="border:0px solid white;">
																<td class="name"><input type="hidden" name="empId" value=""></td>
																<td class="name"></td>
																<td class="name"></td>
																<td class="name"></td>
																<td class="name"></td>
																<td class="name"></td>
																<td class="name"></td>
															</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										
									</div>
									<button type="submit" id="btnApprovalSelect"  class="btn btn-default">
										<i class="fas fa-user-plus"></i>&nbsp;팀원 추가
									</button>
									&nbsp;
							 		
							 	</div>
							 	
								</form>
							 	
							 	<!---------- 결제선 주소록 시작 ------------------------>
						
								<div id="approval_address_layer" class="booking_layer_div layer_box hide typeD">
								
								<div class="layer_box large address line " id="div_approval_view_one" style="margin-left: -400px; margin-top: -311px; display: block;width: 770px;">
									<div class="title_layer text_variables" id="titleApprovalLineSetting">결재선 설정</div>
									
									<div class="after line-list-wrap">
										<div class="fl">
											<div class="after">
												<div class="fl" id="searchMessage" style="display: none;"><span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span></div>
												<div class="fr">
													<a class="icon order" title="정렬" id="anchorApprovalUserOrder" style="cursor:pointer;"></a>
													<ul class="dropdown-menu hide" id="orderApprovalDropdown" style="width: 70px; top: 124px; left: 314px;">
														<li><a class="js-approval-node-order sortByName">이름순</a></li>
														<li><a class="js-approval-node-order sortByJob">직급순</a></li>
													</ul>
												</div>
											</div>
											<div class="after">
												<div class="category-list" style="height: 397px;width: 205px;">
													<select id="leftList" size="19" frameborder="0" style="display:none;">
																			</select>
													<div id="treeDiv" style="white-space: nowrap;float: none;" class="treeDiv OrgTree">
														<ul>
															<li id="" class="last">
																<div class="Container">
																	<img onclick="" src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_m.gif" class="plus">
																	<strong onclick="" id="subOffice" class="selectedNode">DEVELOFFICE <span style="font-weight:normal; color:silver; font-size:8pt">(${deptSize})</span></strong>
																</div>
																<ul style="" id="subDept">
																</ul>
															</li>
														</ul>
													</div>
													<div id="leftProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
												</div>
												<div class="name-list" style="width: auto;">
													<select multiple="multiple" id="rightList" style=""></select>
								
													<div class="choice-area" style="width: 203px;font-size: 12px;padding: 5px;">
														<a class="text_variables fl mgr_20" id="selectAll" style="cursor:pointer">전체</a>
														<a class="text_variables mgr_20" id="cancelAll" style="cursor:pointer">선택안함</a>
														<span id="pagingP"></span>
													</div>
													<div id="rightProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
												</div>
											</div>
								
										</div>
										<div class="add-del-btn with-fourline">
											<div class="top" style="margin-top: 70px;">
												<a class="icon btn-add js-btn-approval-first-line"><span class="blind"></span></a>
												<a class="icon btn-del js-btn-approval-first-line"><span class="blind"></span></a>
											</div>
											
										</div>
										<div class="fr mgb20">
											<div class="dropdown hide show" style="top:60px;right:0">
												<div class="dropdown-menu multi-team hide" id="layerMultiNode" style="width:290px">
													<p class="pdb_20">선택된 결재자가 여러 조직에 속해 있을 경우, 하나의 조직을 선택하셔야 합니다.</p>
													<p class="pdb_10" id="multiNodeUser"></p>
													<div style="overflow:auto;max-height:132px;padding:0;">
														<table class="tableType01" id="tableMultiNode">
															<caption>문서 수정 이력 목록으로 시간, 관리로 구성되어 있습니다.</caption>
															<colgroup>
																<col width="15%">
																<col width="85%">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">선택</th>
																	<th scope="col">소속 부서</th>
																</tr>
															</thead>
															<tbody>
															</tbody>
														</table>
													</div>
								
													<div class="layer_button">
														<button type="button" class="btn_variables">확인</button> 
														<button type="button" onclick="$j('#layerMultiNode').hide();">취소</button>
													</div>
												</div>
											</div>
											<div class="first-line four-line after">
												<div class="fl">
													<div class="to-item after">
														<span class="title">추가 <span class="point_color bold" id="sp_selectApprovalFirstLine">0</span></span>
														<div class="updown-wrap first js-move-approval-first-line" style="width: 55px;">
															<span class="blind icon down"></span>
															<span class="blind icon up"></span>
														</div>
													</div>
													<div class="list">
														<select multiple="multiple" id="selectApprovalFirstLine" style="overflow-y: hidden !important;height: 130px;">
														</select>
													</div>
								
												</div>
												
											</div>
											
										</div>
									</div>
									<div class="layer_button">
										<button type="button" class="btn_variables confirmBtn">확인</button> <button type="button" class="closeBtn">취소</button>
									</div>
									<a class="icon btn_closelayer closeBtn" title="레이어 닫기"></a>
								</div>
								
								<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
							</div>
								
								<!---------- 결제선 주소록 끝 ------------------------>
								
								
								<!-- <button type="button" class="btn btn-danger">
									<i class="fas fa-user-times"></i>&nbsp;팀원 삭제
								</button> -->
							</div>
							
							
						</div>
						
						<br><br><br><br><br><br><br><br><br><br><br>
						
						<div class="pContent2">
						
							
							<div class="btnArea" style="float:left; padding:120px 0 0 0;">
								<button type="button" class="btn btn-default" id="add-task">
									<i class="fa fa-plus-square"></i> 업무리스트 추가
								</button>
							<br>
								
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
	function addMem(){
		$("#approval_address_layer").addClass("show");
		
		
	}
	</script>
	
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
			 
			 
			 /* 결재선 창 기능 시작 */
				
				/* 제일 왼쪽 div에 모든 부서명 출력 */
				$.each(${deptList}, function(index, dept){
					
					if(index != 0){
						
						if(index != ${deptList}.length-1){	// 마지막 인덱스가 아니면
							
							$subDeptLi = $('<li class="subDept_li" id="subDept'+index+'">');
							$subDeptDiv = $('<div class="Container">');
							$subDeptStrong = $('<strong>')
							$subDeptSpan1 = $('<span class="subDeptName">').text(dept.deptName);
							$subDeptSpan2 = $('<span style="font-weight:normal; color:silver; font-size:8pt">').text('('+dept.count+')');
							
							$subDeptStrong.append($subDeptSpan1);
							$subDeptStrong.append($subDeptSpan2);
							$subDeptDiv.append($subDeptStrong);
							$subDeptLi.append($subDeptDiv);
						} else{		// 마지막 인덱스이면
							
							$subDeptLi = $('<li class="subDept_li last" id="subDept'+index+'">');
							$subDeptDiv = $('<div class="Container">');
							$subDeptStrong = $('<strong>')
							$subDeptSpan1 = $('<span class="subDeptName">').text(dept.deptName);
							$subDeptSpan2 = $('<span style="font-weight:normal; color:silver; font-size:8pt">').text('('+dept.count+')');
							
							$subDeptStrong.append($subDeptSpan1);
							$subDeptStrong.append($subDeptSpan2);
							$subDeptDiv.append($subDeptStrong);
							$subDeptLi.append($subDeptDiv);
						}
						$("#subDept").append($subDeptLi);
					}
				});
				
				var imgFlag = 0;	// 기본 : -
				/* 조직도 펼치기 / 접기 */
				$(".plus").on('click',function(){
					
					if(imgFlag == 0){	// - 일때
						imgFlag = 1;	// + 로 바꿈
					} else if(imgFlag == 1){	// + 일때
						imgFlag = 0;	// - 로 바꿈
					}
					
					if(imgFlag == 0){	// + > - 로 변환
						$(this).attr('src','resources/images/tree_m.gif');
						$("#subDept").css('display','block');
					} else if(imgFlag == 1){	// - > + 로 변환
						$(this).attr('src','resources/images/tree_p.gif');
						$("#subDept").css('display','none');
					}
					
				});
				
				/* 부서명들 중 가장 상단의 회사명 클릭 시 */
				$("#subOffice").click(function(){
					$("#rightList").html("");
					$(".subDept_li").css('color','#676767');
					
					$.each(${empList}, function(index, emp){
						
						$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
						$("#rightList").append($op);
					});
				});
				
				/* 부서명 클릭 시 */
				$("#subDept").on('click','.subDept_li',function(){
					
					$(this).css('color','#2985db');
					$(this).siblings().css('color','#676767');
					var dept = $(this).find('.subDeptName').text();
					$("#rightList").html("");
					
					$.each(${empList}, function(index, emp){
						
						if(dept == emp.deptName){
							$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
							$("#rightList").append($op);
						}
					});
				});
				
				// 직원이름 여러개 선택 하는거
				/* 
				$("#rightList").on('mouseup','option',function(){
					console.log($("#rightList option:selected"));
				});
				 */
				
				//전체선택
				$("#selectAll").on('click',function(){
					$("#rightList option").attr('selected',true);
					$("#rightList option").css({
						'background-color':'#e8ecee',
						'color':'#676767'
					});
				});
				//전체선택취소
				$("#cancelAll").on('click',function(){
					$("#rightList option").attr('selected',false);
					$("#rightList option").css({
						'background-color':'white',
						'color':'#676767'
					})
				});
				//정렬 버튼
				$('#anchorApprovalUserOrder').on('click',function(){
					$("#orderApprovalDropdown").toggleClass('show');
				});
				//이름 or 직급 정렬
				$(".js-approval-node-order").on('click',function(){
					
					var sortArr = ${empList};
					
					if(document.getElementById('rightList').innerHTML != ""){
						
						//console.log('if문 통과1');
						
						if($(this).hasClass('sortByName')){	//이름정렬
							//console.log('if문 통과2');
							sortArr.sort(function(a, b){
								return a.empName < b.empName ? -1 : a.empName > b.empName ? 1: 0;
							});
							
						} else{	//직급정렬
							//console.log('if문 통과3');
							sortArr.sort(function(a, b){
								return a.jobCode - b.jobCode;
							});
							
						}
						//console.log(sortArr);
						
						$("#rightList").html("");
						
						var conditionArr = $(".subDept_li");
						var conditionName = "";
						
						//선택된 부서(파란색) 이름 찾기
						$.each(conditionArr, function(index, li){					
							//console.log(li.style.color);
							if(li.style.color == 'rgb(41, 133, 219)'){
								conditionName = li.childNodes[0].childNodes[0].childNodes[0].innerHTML;
							}
						});
						
						//console.log('선택된 부서명 : '+conditionName);
						
						$.each(sortArr, function(index, emp){
							if(conditionName == ""){	//파란색으로 선택된 부서명이 없으면 => 전체 직원 선택이면
								$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
								$("#rightList").append($op);
							} else {	// 파란색으로 선택된 부서명이 있으면
								if(conditionName == emp.deptName){
									$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
									$("#rightList").append($op);
								}
							}
						});
					}
					
					$("#orderApprovalDropdown").toggleClass('show');
				});

				
				/* 결제선 추가 버튼 */
				$(".btn-add").on('click',function(){
					
					var selectedArr = $("#rightList option:selected");
					var approval;
					var num;
					
					if($(this).hasClass('js-btn-approval-first-line')){
						approval = $("#selectApprovalFirstLine");
						num = $("#sp_selectApprovalFirstLine");
					} else if($(this).hasClass('js-btn-approval-second-line')){
						approval = $("#selectApprovalSecondLine");
						num = $("#sp_selectApprovalSecondLine");
					} else if($(this).hasClass('js-btn-approval-third-line')){
						approval = $("#selectApprovalThirdLine");
						num = $("#sp_selectApprovalThirdLine");
					} else if($(this).hasClass('js-btn-approval-fourth-line')){
						approval = $("#selectApprovalFourthLine");
						num = $("#sp_selectApprovalFourthLine");
					}
					
					$.each(selectedArr, function(index, value){
						
						if(approval.children('option').length > 0){	// 비어있지 않을때
							var flag = 0;
							
							$.each(approval.children('option'), function(i, op){
								
								if(value.value == op.value){
									flag = 1;
								}
							});
							
							if(flag == 0){
								var $op = $('<option value="'+value.value+'" disabled>').text(value.text+'('+value.title+')');
								approval.append($op);
							}
							
						} else{
							
							var $op = $('<option value="'+value.value+'" disabled>').text(value.text+'('+value.title+')');
							approval.append($op);
						}
						
					});
						num.text(approval.children().length);
				});
				
				/* 결제선 삭제 버튼 */
				$(".btn-del").on('click',function(){
					
					var selectedArr = $("#rightList option:selected");
					var zone;
					var approvalArr;
					var num;
					
					if($(this).hasClass('js-btn-approval-first-line')){
						approvalArr = $("#selectApprovalFirstLine option");
						zone = $("#selectApprovalFirstLine");
						num = $("#sp_selectApprovalFirstLine");
					} else if($(this).hasClass('js-btn-approval-second-line')){
						approvalArr = $("#selectApprovalSecondLine option");
						zone = $("#selectApprovalSecondLine");
						
					} else if($(this).hasClass('js-btn-approval-third-line')){
						approvalArr = $("#selectApprovalThirdLine option");
						zone = $("#selectApprovalThirdLine");
						num = $("#sp_selectApprovalThirdLine");
					} else if($(this).hasClass('js-btn-approval-fourth-line')){
						approvalArr = $("#selectApprovalFourthLine option");
						zone = $("#selectApprovalFourthLine");
					}
					
					//console.log(approvalArr);
					//console.log(zone.children());
					$.each(approvalArr, function(i, value1){
						$.each(selectedArr, function(j, value2){
							
							if(value1.value == value2.value){
								value1.remove();
							}
						});
					});
					
					num.text(zone.children().length)
				});
				
				/* 결제선 추가 창 확인 버튼 */
				$(".confirmBtn").on('click',function(){
					
					var approvalList = $("#selectApprovalFirstLine").children('option');	//결제라인
					var referList = $("#selectApprovalThirdLine").children('option');	//참조라인
					var apTbody = $("#nameRow").children();	//이름들어갈 td들
					
					/* 결제선 이름 넣기 */
					$.each(approvalList,function(i, op){
						$.each(apTbody,function(j, td){
							if(i == j){
								var str = op.text.split(' ');
								td.innerHTML = str[0];
								
								var hiddenId = $('<input type="hidden" name="empId">');
								hiddenId[0].value = op.value;
								td.append(hiddenId[0]);
							}
						});
					});
					
					
					/* 참조인 이름 넣기 */
					
					var docuType = $("#documentTypeSelect option:selected").val();
					//$("#documentTypeSelect option:selected").val()
					
					if(docuType == 'AP' || docuType == 'CF' || docuType == 'VA'){
						
						var referRow = $(".referRow");
						referRow.html('');
						
						$.each(referList,function(i, op){
							var str = op.text.split(' ');
							var referSpan = $('<span class="refer-list ml-20" empId="">');
							
							referSpan[0].setAttribute('empId',op.value);
							referSpan[0].innerHTML = str[0];
							referRow[0].append(referSpan[0]);
						});
					} else{
						
						var referRow = $(".referRow2");
						referRow.html('');
						
						$.each(referList,function(i, op){
							var str = op.text.split(' ');
							var referSpan = $('<span class="refer-list ml-20" empId="">');
							
							referSpan[0].setAttribute('empId',op.value);
							referSpan[0].innerHTML = str[0];
							referRow[0].append(referSpan[0]);
						});
					}
					
					$(".closeBtn").click();
				});
				
				/* 결재선 창 기능 끝 */
		
		});
		
		
		
		/* 업무 추가 모달 */
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

			 var taskNo = $("#taskNo").val();
			 var pNo = $("#pNo").val();
			 var taskTitle = $("input[name=taskTitle]").val();
			 var taskContent = $("#taskContent").val();
			 
			 $.ajax({
			
				url:"insertTask.do",
				type:"POST",
				data:{
					  taskNo:taskNo,
					  pNo:pNo,
					  taskTitle:taskTitle,
					  taskContent:taskContent,
					  taskWriter:'${loginUser.empId}'
				},
				success:function(data){
					if(data == 'success'){
						$("#taskNo").val("");
						$("#pNo").val("");
						$("input[name=taskTitle]").val("");
						$("#taskContent").val("");
						
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