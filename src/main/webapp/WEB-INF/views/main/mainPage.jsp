<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources\semantic\semantic.css">

<style>
	#myWorkInfo th, #myWorkInfo td{
		background : none;
		border:none;
		padding-top:7px;
		padding-bottom:7px;
	}
	#startWork, #endWork{
		width:60px;
		height: 30px;
		font-size: 12px;
	}
	#documentTable th{
		text-align: center;
		padding-left: 8px;
	}
	#docuWidgetTbody td, .tBody td{
		background:white;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	#docuWidgetTbody tr:hover td{
		background:#dbecff;
	}
	.todo-list > li p{
		padding: 0px 0 0px 35px !important;
	}
	.panel-body li{
		padding:10px 0;
	}
</style>

</head>
<body onload='loadWidgets(); calcWorkTime(${workList});'>
<fmt:formatDate var="now" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>
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
				
				<!--  -->
				<!-- 근태정보 위젯 -->
					<div class="panel" id="profileWidget" style="position:absolute;min-width:500px;">
						<input type="hidden" class="widgetType" name="widgetType" value="1">
						<input type="hidden" class="left" name="left" value="">
						<input type="hidden" class="top" name="top" value="">
						<input type="hidden" class="fold" name="fold" value="N">
						<input type="hidden" class="status" name="status" value="Y">
						
						<div class="panel-heading">
							<h3 class="panel-title profile-title"></h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
								<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
							</div>
						</div>
						<div class="panel-body">
							<div class="fl" style="width:50%;">
								<table id="myWorkInfo">
									<tr>
										<th>이 달의 목표 근무시간</th>
										<td><span class="fr">시간</span><span id="goalTime" class="fr"></span></td>
									</tr>
									<tr>
										<th>이 달의 누적 근무시간</th>
										<td><span class="fr">시간</span><span id="workingTime" class="fr">0</span></td>
									</tr>
									<tr>
										<th>이 달의 남은 근무일 수</th>
										<td><span class="fr">일</span><span id="remainDays" class="fr"></span></td>
									</tr>
									<tr>
										<td colspan="2" align="center" style="padding-top: 10px;">
											<div>
												<c:if test="${loginUser.workStatus eq 'N'}">
													<button class="ui negative basic button" id="startWork" onclick="startWork();">출근</button>
													<button class="ui positive basic button" id="endWork" onclick="endWork();" disabled>퇴근</button>
												</c:if>
												<c:if test="${loginUser.workStatus eq 'Y'}">													
													<button class="ui negative basic button" id="startWork" onclick="startWork();" disabled>출근</button>
													<button class="ui positive basic button" id="endWork" onclick="endWork();">퇴근</button>
												</c:if>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<!-- easy pie chart -->
							<div id="system-load" class="easy-pie-chart fl" data-percent="70" style="margin-left:50px;">
								<span class="percent">70</span>
							</div>
						</div>
					</div>
					<!------------------------------------------------------------------------------>
				
				
				
				
				
				
					
					
							<!-- 전자결재 위젯 -->
							<div class="panel" style="position:absolute;min-width:610px;">
								<input type="hidden" class="widgetType" name="widgetType" value="2">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">
								<div class="panel-heading">
									<h3 class="panel-title">전자결재 > 최근 문서</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped" id="documentTable">
										<thead>
											<tr style="text-align:center;">
												<th style="width:170px;">문서번호</th>
												<th style="width:212px;">제목</th>
												<th style="width:74px;">기안자</th>
												<th style="width:52px;">구분</th>
												<th style="width:90px;">상태</th>
											</tr>
										</thead>
										<tbody id="docuWidgetTbody">
											<c:if test="${docuList eq '[]'}">
												<tr>
													<td colspan="5" style="border-bottom:0;text-align:center;">관련된 문서가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${docuList ne '[]'}">
												<c:forEach var="d" items="${docuList}">
													<tr class="docuTR">
													<c:if test="${d.docuType eq 'AP'}">
									            		<c:if test="${d.docuNum lt '10' }">
									            			<td style="text-align:center;padding-left:8px;">지결-${d.docuCode}-000${d.docuNum}</td>
									            		</c:if>
									            		<c:if test="${d.docuNum ge '10' }">
									            			<td style="text-align:center;padding-left:8px;">지결-${d.docuCode}-00${d.docuNum}</td>
									            		</c:if>
									            	</c:if>
									            	<c:if test="${d.docuType eq 'CN'}">
									            		<c:if test="${d.docuNum lt '10' }">
									            			<td style="text-align:center;padding-left:8px;">회람-${d.docuCode}-000${d.docuNum}</td>
									            		</c:if>
									            		<c:if test="${d.docuNum ge '10' }">
									            			<td style="text-align:center;padding-left:8px;">회람-${d.docuCode}-00${d.docuNum}</td>
									            		</c:if>
									            	</c:if>
									            	<c:if test="${d.docuType eq 'CF'}">
									            		<c:if test="${d.docuNum lt '10' }">
									            			<td style="text-align:center;padding-left:8px;">품의-${d.docuCode}-000${d.docuNum}</td>
									            		</c:if>
									            		<c:if test="${d.docuNum ge '10' }">
									            			<td style="text-align:center;padding-left:8px;">품의-${d.docuCode}-00${d.docuNum}</td>
									            		</c:if>
									            	</c:if>
									            	<c:if test="${d.docuType eq 'VA'}">
									            		<c:if test="${d.docuNum lt '10' }">
									            			<td style="text-align:center;padding-left:8px;">휴가-${d.docuCode}-000${d.docuNum}</td>
									            		</c:if>
									            		<c:if test="${d.docuNum ge '10' }">
									            			<td style="text-align:center;padding-left:8px;">휴가-${d.docuCode}-00${d.docuNum}</td>
									            		</c:if>
									            	</c:if>
									            	<c:if test="${d.docuType eq 'RT'}">
									            		<c:if test="${d.docuNum lt '10' }">
									            			<td style="text-align:center;padding-left:8px;">퇴사-${d.docuCode}-000${d.docuNum}</td>
									            		</c:if>
									            		<c:if test="${d.docuNum ge '10' }">
									            			<td style="text-align:center;padding-left:8px;">퇴사-${d.docuCode}-00${d.docuNum}</td>
									            		</c:if>
									            	</c:if>
									            	<c:url value="documentDetailView.do" var="documentDetailView">
														<c:param name="docuNum" value="${d.docuNum}"/>
													</c:url>
													<td><a href="${documentDetailView}">${d.title}</a></td>
													<td style="text-align:center;">${d.empName}</td>
													<td style="text-align:center;">${d.dv}</td>
													<c:choose>
									            		<c:when test="${d.status eq '결재 대기' }">
											            	<td style="color:red;text-align:center;padding-left:8px;">${d.status}</td>	
									            		</c:when>
									            		<c:otherwise>
									            			<td style="text-align:center;padding-left:8px;">${d.status}</td>
									            		</c:otherwise>
									            	</c:choose>
												</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6 text-right fr">
											<c:url value="documentTable.do" var="documentTable">
												<c:param name="condition" value="전체"/>
											</c:url>
											<a href="${documentTable}" class="btn btn-primary">더보기</a>
										</div>
									</div>
								</div>
							</div>
							<!------------------------------------------------------------------------------>
							
							
							
							
							<!-- TODO 위젯 -->
							<div class="panel" style="position:absolute;min-width:560px;">	
								<input type="hidden" class="widgetType" name="widgetType" value="3">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">							
								<div class="panel-heading">
									<h3 class="panel-title">TO-DO List</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								
								<div class="panel-body" style="padding-left:25px;padding-right:25px;padding-bottom:20px;padding-top:0;">
									<div class="ui top attached tabular menu">
									  <a class="item active todoTab" data-tab="first" name="first">진행중</a>
									  <a class="item todoTab" data-tab="second" name="second">대기</a>
									</div>
									
									<div class="ui bottom attached tab segment active tabContent" data-tab="first" name="first">
										<div class="panel-body">
											<ul class="list-unstyled todo-list">
											
												<c:if test="${todoGoingList eq []}">
													<li>
														<label class="control-inline fancy-checkbox">
														</label>
														<p style="text-align: center">
															<span style="font-size: 14px;">진행중인 TODO가 없습니다.</span>
														</p>
													</li>
												</c:if>
												<c:if test="${todoGoingList ne []}">
												<c:forEach var="todo" items="${todoGoingList}">
													<li>
														<label class="control-inline fancy-checkbox">
															<input type="checkbox" class="todoCheck" value=""><span></span>
															<input type="hidden" name="todoNo" value="${todo.todoNo}">
														</label>
														<p>
															<span class="title">${todo.todoName}</span>
															<span class="short-description">${todo.todoContent}</span>
															<span class="date">${todo.todoEnrollDate}</span>
														</p>
														<div class="controls hide">
															<a href="javascript:void(0);" class="btn btn-primary todoBtn">완료하기</a>
														</div>
													</li>
												</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
									
									<div class="ui bottom attached tab segment tabContent" data-tab="second" name="second" style="margin-bottom:10px;">
										<div class="panel-body">
											<ul class="list-unstyled todo-list">
												<c:if test="${todoWaitList eq []}">
													<li>
														<label class="control-inline fancy-checkbox">
														</label>
														<p style="text-align: center">
															<span style="font-size: 14px;">대기중인 TODO가 없습니다.</span>
														</p>
													</li>
												</c:if>
												<c:if test="${todoWaitList ne []}">
												<c:forEach var="todo" items="${todoWaitList}">
													<li>
														<label class="control-inline fancy-checkbox">
															<input type="checkbox" class="todoCheck" value=""><span></span>
															<input type="hidden" name="todoNo" value="${todo.todoNo}">
														</label>
														<p>
															<span class="title">${todo.todoName}</span>
															<span class="short-description">${todo.todoContent}</span>
															<span class="date">${todo.todoEnrollDate}</span>
														</p>
														<div class="controls hide">
															<a href="javascript:void(0);" class="btn btn-primary todoBtn">진행하기</a>
														</div>
													</li>
												</c:forEach>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- END TODO LIST -->
							
							
							<!-- 받은 메일 위젯 -->
							<div class="panel" style="position:absolute;min-width:610px;">
								<input type="hidden" class="widgetType" name="widgetType" value="4">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">
								<div class="panel-heading">
									<h3 class="panel-title">받은 메일함</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped" id="documentTable">
										<thead>
											<tr style="text-align:center;">
												<th style="width:200px;">보낸 사람</th>
												<th style="width:230px;">제목</th>
												<th style="width:170px;">받은 날짜</th>
											</tr>
										</thead>
										<tbody id="docuWidgetTbody">
											<c:if test="${mailList eq '[]'}">
												<tr>
													<td colspan="3" style="border-bottom:0;text-align:center;">받은 메일이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${mailList ne '[]'}">
												<c:forEach var="m" items="${mailList}">
													<tr class="docuTR">
										            	<td>${m.mailFrom}</td>
									            	<c:url value="receiveDetail.do" var="receiveDetail">
														<c:param name="empId" value="${m.empId}"/>
														<c:param name="mailNum" value="${m.mailNum}"/>
													</c:url>
														<td><a href="${receiveDetail}">${m.mailTitle}</a></td>
														<td style="text-align:center;padding-left:8px;">${m.mailDate}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6 text-right fr"><a href="receiveMail.do" class="btn btn-primary">더보기</a></div>
									</div>
								</div>
							</div>
							<!------------------------------------------------------------------------------>
							
							
							<!-- 게시판 위젯 -->
							<div class="panel" style="position:absolute;min-width:610px;">
								<input type="hidden" class="widgetType" name="widgetType" value="5">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">
								<div class="panel-heading">
									<h3 class="panel-title">게시판</h3>
									<dvi style="position:absolute;right:145px;top:50%;">
										<c:if test="${loginUser.empId eq '10001'}">
											<input type="radio" name="boardType" value="N" id="board1" checked style="opacity: 0;">
										</c:if>
										<c:if test="${loginUser.empId ne '10001'}">
											<input type="radio" name="boardType" value="N" id="board1" checked style="opacity: 0;">
											<label for="board1" class="helpLabel" id="label1">공지사항</label>
											<input type="radio" name="boardType" value="T" id="board2" style="opacity: 0;">
											<label for="board2" class="helpLabel" id="label2">팀 게시판</label>
											<input type="radio" name="boardType" value="F" id="board3" style="opacity: 0;">
											<label for="board3" class="helpLabel" id="label3">자유 게시판</label>
										</c:if>
										
									</dvi>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped" id="#boardTable">
										<thead>
											<tr style="">
												<th style="width:170px;text-align:center;padding:8px;">작성일</th>
												<th style="width:300px;text-align:center;padding:8px;">제목</th>
												<th style="width:100px;text-align:center;padding:8px;">작성자</th>
											</tr>
										</thead>
										<tbody id="boardTbody" class="tBody" style="width:100%;">
										
										
										
											<c:if test="${mailList eq '[]'}">
												<tr>
													<td colspan="3" style="border-bottom:0;text-align:center;">공지 사항이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${mailList ne '[]'}">
												<c:forEach var="m" items="${mailList}">
													<tr class="docuTR">
										            	<td>${m.mailFrom}</td>
									            	<c:url value="receiveDetail.do" var="receiveDetail">
														<c:param name="empId" value="${m.empId}"/>
														<c:param name="mailNum" value="${m.mailNum}"/>
													</c:url>
														<td><a href="${receiveDetail}">${m.mailTitle}</a></td>
														<td style="text-align:center;padding-left:8px;">${m.mailDate}</td>
													</tr>
												</c:forEach>
											</c:if>
											
											
											
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6"></div>
										<div class="col-md-6 text-right fr"><a href="#" class="btn btn-primary" id="goBoardList">더보기</a></div>
									</div>
								</div>
							</div>
							<!------------------------------------------------------------------------------>
						
					
					<!--  -->
					
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<div class="clearfix"></div>
		

	<!--  -->
	</div>
	<!-- END WRAPPER -->
	
	
	
	<script>
	$(function(){
		$('#label1').click();
	});
	
	var endLeft;
	var endTop;
	
	$(document).on('click',"#label1",function(){
		$("#label1").addClass('helphelp');
		$("#label2").removeClass('helphelp');
		$("#label3").removeClass('helphelp');
	});
	$(document).on('click',"#label2",function(){
		$("#label2").addClass('helphelp');
		$("#label1").removeClass('helphelp');
		$("#label3").removeClass('helphelp');
	});
	$(document).on('click',"#label3",function(){
		$("#label3").addClass('helphelp');
		$("#label1").removeClass('helphelp');
		$("#label2").removeClass('helphelp');
	});
    
	/* 위젯 움직일때 */
    $(".panel").draggable({
    	cursor:"move",
		stack:".panel",
		opacity:0.8,

        start: function(event, ui) {

            var Startpos = $(this).position();
            console.log("START: \nLeft: "+ Startpos.left + "\nTop: " + Startpos.top);
        },

        stop: function(event, ui) {

            var Stoppos = $(this).position();
            
            endLeft = Stoppos.left;
            endTop = Stoppos.top;
            
            $(this).children('.left').val(endLeft);
            $(this).children('.top').val(endTop);
            
            console.log("STOP: \nLeft: "+ endLeft + "\nTop: " + endTop);
            
            saveWidget($(this).children('.left'));            
        }
    });
	
    
    /* 접는 버튼 눌렀을때 */
    $(document).on('click','.btn-toggle-collapse',function(){
    	
    	if($(this).parents('.panel').children('.fold').val()=='N'){
    		$(this).parents('.panel').children('.fold').val('Y');
    	} else {
    		$(this).parents('.panel').children('.fold').val('N');
    	}
    	saveWidget($(this));
    });
    
    /* 위젯 끄는 버튼 눌렀을때 */
    $(document).on('click','.btn-remove',function(){
    	
    	if($(this).parents('.panel').children('.status').val()=='N'){
    		$(this).parents('.panel').show();
    		$(this).parents('.panel').children('.status').val('Y');
    	} else {
    		$(this).parents('.panel').hide();
    		$(this).parents('.panel').children('.status').val('N');
    	}
    	console.log($(this).parents('.panel').children('.status').val());
    	
    	saveWidget($(this));
    });
    
	
	function saveWidget(e) {
		
		$.ajax({
			url:"saveWidget.do",
			type:"post",
			data:{widgetType:e.parents('.panel').children('.widgetType').val(),
				  empId:'${loginUser.empId}',
				  left:e.parents('.panel').children('.left').val(),
				  top:e.parents('.panel').children('.top').val(),
				  fold:e.parents('.panel').children('.fold').val(),
				  status:e.parents('.panel').children('.status').val()
				 },
			success:function(data){
				if(data == "success"){
					console.log('저장성공');
				}else{
					console.log('저장실패');
				}
			},
			error:function(){
				console.log('통신실패');
			}
		});
	}
	
	
	function loadWidgets() {
		var panels = $('.panel').children('.widgetType');
		
		$.each(${widgetList}, function(i, widget){
			
			$.each(panels, function(j, panel){
				//console.log(panel);
				
				if(widget.widgetType == panel.value){
					
					panel.parentNode.style.left = widget.left+'px';
					panel.parentNode.style.top = widget.top+'px';
					panel.nextSibling.nextSibling.setAttribute('value',widget.left);
					panel.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value',widget.top);
					
					if(widget.fold == "Y"){
						$(panel).siblings('.panel-body').css('display','none');
						$(panel).parents('.panel').find('.btn-toggle-collapse').click();
						$(panel).siblings('.fold').val('Y');
						
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.style.display = 'none';
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[1].classList.add('click');
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[1].click();
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value','Y');
					}
					
					if(widget.status == "N"){
						$(panel).parents('.panel').find('.btn-remove').click();
						$(panel).siblings('status').val('N');
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[3].click();
						//panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value','N');
					}
				}
			});
		});
	}
	
	function foldClick() {
		
	}
	
	function statusClick() {
		
	}
	
	/* ----TODO위젯----------------------------------- */
	
	/* 탭 전환 */
	$(document).on('click','.todoTab',function(){
		$(this).addClass('active');
		$(this).siblings('a').removeClass('active');
		var tabName = $(this).attr('name');
		
		$.each($('.tabContent'),function(index, tab){
			if(tabName == $(tab).attr('name')){
				$(tab).addClass('active');
			}else{
				$(tab).removeClass('active');
			}
		});
	});
	/* 체크박스 누르면 */
	$(document).on('change',".todoCheck",function(){
		
		if($(this).prop('checked')){
			$(this).parents('li').find('.controls').addClass('show');
		} else{
			$(this).parents('li').find('.controls').removeClass('show');
		}
	});
	/* 체크박스 누르면 나오는 버튼 누르면 */
	
	$(document).on('click','.todoBtn',function(){
		var btnName = $(this).text();
		var btnName2;
		var tab;
		if(btnName == '진행하기'){
			btnName2 = 'ongoing';
			tab = $(this).parents('.tabContent').prev().prev().find('.active');
		}else{
			btnName2 = 'completion';
			tab = $(this).parents('.tabContent').prev().find('.active');
		}
		var li = $(this).parents('li');
		var todoNo = $(this).parents('li').find('input[name=todoNo]').val();
		
		$.ajax({
			url:"updateTodoWidget.do",
			type:"POST",
			data:{todoNo:todoNo,
				  empId:'${loginUser.empId}',
				  todoStatus:btnName2
			},
			success:function(data){
				console.log('업데이트 성공');
				if(data == 'success'){
					//li.remove();
					tab.click();
				}else{
					alertify.alert('DEVELOFFICE', 'TODO '+btnName+' 실패')
				}
			},
			error:function(){
				alertify.alert('DEVELOFFICE', 'AJAX통신 실패');
			}
		});
	});
	
	
	$(document).on('click','.todoTab',function(){
		var todoStatus;
		var str="";
		
		if($(this).text() == '진행중'){
			todoStatus = 'ongoing';
		}else{
			todoStatus = 'waiting';
		}
		
		$(".todo-list").html("");
		
		$.ajax({
			url:"callTodoList.do",
			type:"POST",
			data:{empId:'${loginUser.empId}',
				todoStatus:todoStatus
			},
			success:function(data){
				
				if(data.length > 0){
					$.each(data, function(index, data){
						str +='<li><label class="control-inline fancy-checkbox">'+
							    '<input type="checkbox" class="todoCheck" value=""><span></span>'+
								'<input type="hidden" name="todoNo" value="'+data.todoNo+'"></label>'+				
								'<p><span class="title">'+data.todoName+'</span>'+
								'<span class="short-description">'+data.todoContent+'</span>'+
								'<span class="date">'+data.todoEnrollDate+'</span></p>'+
								'<div class="controls hide">';
							if(todoStatus == 'ongoing'){
								str += '<a href="javascript:void(0);" class="btn btn-primary todoBtn">완료하기</a>';
							}else{
								str += '<a href="javascript:void(0);" class="btn btn-primary todoBtn">진행하기</a>';
							}
						str += '</div></li>';
					});
				}else{
					str += '<li><label class="control-inline fancy-checkbox"></label><p style="text-align: center">';
					
					if(todoStatus == 'ongoing'){
						str += '<span style="font-size: 14px;">진행중인 TODO가 없습니다.</span>';
					}else{
						str += '<span style="font-size: 14px;">대기중인 TODO가 없습니다.</span>';
					}
					
					str += '</p></li>';
				}
				
				$(".todo-list").html(str);
				
			},
			error:function(){
				alertify.alert('DEVELOFFICE', 'AJAX통신 실패');
			}
		});
	});
	
	
	/* 게시판 위젯 */
	
	$(document).on('change','input[name=boardType]',function(){
		refreshBoard();
	});
	
	function refreshBoard() {
		
		var condition = $('input[name=boardType]:checked').val();
		
		if(condition == 'N'){
			$("#goBoardList").attr('href','listNotice.do');
		}else if(condition == 'T'){
			$("#goBoardList").attr('href','listTeamBoard.do');
		}else{
			$("#goBoardList").attr('href','listFree.do');
		}
		
		$("#boardTbody").html("");
		
		$.ajax({
			url:"refreshBoardWidget.do",
			type:"POST",
			data:{empId:'${loginUser.empId}',
				  deptCode:'${loginUser.deptCode}',
				  condition:condition
			},
			success:function(data){
				
				if(data ==""){	// 빈 배열이면
					
					var tr = $('<tr>');
					var td = $('<td colspan="3" style="border-bottom:0;text-align:center;">').text('게시글이 없습니다.');
					tr.append(td);
					$("#boardTbody").append(tr);
					
				}else{	// 데이터가 있으면
					
					for(var i = 0; i < 5; i++){
						
						var tr = $('<tr>');
						
						if(condition == 'N'){	//공지사항
							
							var td1 = $('<td style="text-align:center;padding-left:8px;">').text(data[i].noCreateDate);	//작성일
							var td2 = $('<td>');	//제목
							var title = $('<a href="noticeDetail.do?noId='+data[i].noId+'">').text(data[i].noTitle);
							var td3 = $('<td style="text-align:center;padding-left:8px;">').text(data[i].empName);	//작성자
							td2.append(title);
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							
						} else if(condition == 'T'){ // 팀
							
							var td1 = $('<td style="text-align:center;padding-left:8px;">').text(data[i].tbCreateDate);	//작성일
							var td2 = $('<td>');	//제목
							var title = $('<a href="teamBoardDetail.do?tbId='+data[i].tbId+'">').text(data[i].tbTitle);
							var td3 = $('<td style="text-align:center;padding-left:8px;">').text(data[i].empName);	//작성자
							td2.append(title);
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							
						}else{ // 자게
							
							var td1 = $('<td style="text-align:center;padding-left:8px;">').text(data[i].frCreateDate);	//작성일
							var td2 = $('<td>');	//제목
							var title = $('<a href="freeDetail.do?frId='+data[i].frId+'">').text(data[i].frTitle);
							var td3 = $('<td style="text-align:center;padding-left:8px;">').text("익명");	//작성자
							td2.append(title);
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							
						}
						console.log(tr)
						$("#boardTbody").append(tr);
						
						
					}
				}
			},
			error:function(){
				alertify.alert('DEVELOFFICE','게시판 위젯 정보 AJAX통신 실패');
			}
		});
	}
	
	
	
	
	
	
	/* ----------------------------------------------- */
	$(function() {
		
		refreshBoard();
		//console.log('${mailList}' == '[]');
		
		
		/*-------------------------------------------------------*/
		
		// real-time pie chart
		/*
		sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 10,
			lineCap: "square",
			animate: 800
		});
		*/
		/* 
		var updateInterval = 3000; // in milliseconds
		
		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		*/
	});
	
	function startWork() {	//출근시간 insert
		console.log("출근버튼누름");
		$.ajax({
			url:"startWork.do",
			type:"POST",
			data:{empId:'${loginUser.empId}'},
			success:function(data){
				
				if(data == 'success'){
					console.log("출근 시간 입력 성공");
					$("#startWork").attr('disabled',true);
					$("#endWork").attr('disabled',false);
					
				}else{
					alertify.alert('DEVELOFFICE', '출근 시간 입력 실패');
				}
			},
			error:function(){
				alertify.alert('DEVELOFFICE', '안돼(수당줄 돈 없어) 돌아가');
			}
		});
	}

	function endWork() {	// 퇴근시간 insert 하고 계산
		$.ajax({
			url:"endWork.do",
			type:"POST",
			data:{empId:'${loginUser.empId}'},
			success:function(workList){
				
				if(workList != null){
					$("#startWork").attr('disabled',false);
					$("#endWork").attr('disabled',true);
					calcWorkTime(workList);
					
				}else{
					alertify.alert('DEVELOFFICE', '퇴근 시간 입력 실패');
				}
			},
			error:function(){
				alertify.alert('DEVELOFFICE', 'AJAX통신 실패');
			}
		});
	}
	
	function calcWorkTime(workList) {
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var day = today.getDate();
		
		console.log(today);
		
		if(day < 10){
			day = '0'+day;
		}
		
		console.log("오늘 : "+year+""+month+""+day);
		
		var lastDay = ( new Date( year,month, 0) ).getDate();	// 마지막날 구하기
		
		console.log("이 달의 마지막날 : "+lastDay);
		
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		
		var flag = 0;
		for(var i = 1; i <= lastDay; i++){
			var weekday = week[new Date(year,month-1,i).getDay()];
			
			if(weekday != '토' && weekday != '일'){
				flag += 1;
			}		
		}
		console.log("이번 달 평일 수 : "+flag+"일");		// 이번달 평일 수
		console.log("이번 달 근무 할당 시간 : "+flag*8+"시간");	// 한달 근무 할당량
		
		var flag2 = 0;
		for(var i = day; i <= lastDay; i++){
			var weekday = week[new Date().getDay()];
			
			if(weekday != '토' && weekday != '일'){
				flag2 += 1;
			}		
		}
		console.log("이번 달 남은 근무일 수 : "+flag2);	// 이번달 남은 근무일 수
		$("#remainDays").text(flag2);
		var thismonthWorkTime = flag*8;	// 이번달 총 근무 할당 시간
		$("#goalTime").text(thismonthWorkTime);
		
		// 위젯 제목에 오늘 날짜 요일 표기
		$(".profile-title").text(year+"년 "+month+"월 "+day+"일 "+week[new Date(year,month-1,day).getDay()]+"요일");
		
		
		// real-time pie chart
		sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * (1.1 - percent / 100)) + ", " + Math.round(200 * percent / 100) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 15,
			lineCap: "square",
			animate: 800
		});
		
		var goalTime = thismonthWorkTime*60;	// 이번달 할당 근무시간(number)
		var workedTime = 0;							// 이번달 누적 근무시간
		
		$.each(workList,function(index, work){
			
			if(work.checkOut != null){
				
				var start = new Date(work.checkIn);
				var end = new Date(work.checkOut);
				var diff = Math.floor((end.getTime() - start.getTime()) / 60000);	// 하루 동안 근무한 시간
				goalTime -= diff;
				workedTime += diff;
			}
		});
		
		console.log('이번달 남은 근무 시간 : '+goalTime+'분');
		console.log('이번달 근무 한 시간 : '+workedTime+'분');
		console.log('이번달 남은 근무 시간 : '+goalTime/60+'시간');
		console.log('이번달 근무 한 시간 : '+workedTime/60+'시간');
		
		if(workedTime == 0){
			$("#goalTime").text(thismonthWorkTime);
			$("#workingTime").text(0);
			sysLoad.find('.percent').text(0);
			sysLoad.data('easyPieChart').update(0);
		}
		
		var percent1 = (workedTime/60)/(goalTime/60)*100;	//백분율 구한거
		var percent2 = 0;		// 소수점 처리
		
		if(percent1 < 1){
			percent1 = percent1+"";
			var pointIndex = percent1.indexOf('.');
			percent2 = percent1.substring(0,pointIndex+3);
		}else{
			percent1 = percent1+"";
			var pointIndex = percent1.indexOf('.');
			percent2 = percent1.substring(0,pointIndex);
		}
		
		console.log('근무시간 달성률 : '+percent2+'%');
		//$("#goalTime").text(thismonthWorkTime-Math.floor(workedTime/60));
		$("#workingTime").text(Math.floor(workedTime/60));
		sysLoad.find('.percent').text(percent2);
		sysLoad.data('easyPieChart').update(percent2);
	}
	
	</script>

	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>

	<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/classList.js"></script>
	
</body>
</html>