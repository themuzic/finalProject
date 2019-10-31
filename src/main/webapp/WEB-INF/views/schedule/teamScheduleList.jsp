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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


<!-- 풀캘린더 -->
<script src="resources/calendar/jquery.min.js"></script>

<script>
	var j = jQuery.noConflict();
</script>

<link rel="stylesheet" href="resources/calendar/main.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.min.css">
<script src="resources/calendar/moment.min.js"></script>  
<script src="resources/calendar/fullcalendar.min.js"></script>
<script src="resources/calendar/ko.js"></script>


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
	#calendar {
		max-width: 900px;
		margin: 0 auto;
		font-size: 0.8em;
	}
	.panel .panel-heading {
	    position: relative;
	}
	select.filter {
	    width: 500px !important;
	}
	.ui-widget.ui-widget-content {
		min-height:500px;
	}
	.ui-dialog-content ui-widget-content {
	    overflow: hidden;
	}
	#eventModal{
		overflow: hidden;
	}
	#ui-datepicker-div{
		min-height:100px;
	}
	.fc-popover fc-more-popover{
		height:250px;
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
			
			
				<!-- 풀캘린더 불러오기 -->	
				<div class="wrap">
					<div id="calendar"></div>
				</div>
			
			
				<!-- 일정 추가 MODAL -->
		        <div class="" tabindex="-1" role="dialog" id="eventModal" class="show" style="display:none;">
		     	   <input type="hidden" id="sNo" value="">
		            <div class="" role="document">
		                <div class="">
		                
		                    <div class="">
								<br>
								
		                        <div class="row">
		                            <div class="col-xs-12" style="margin-bottom:10px;">
		                                <label class="col-xs-4" for="edit-allDay"><b>하루종일</b></label>
		                                <input class='allDayNewEvent' id="allDay" name="allDay" type="checkbox">
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-title"><b>일정명</b></label>
		                                <input class="inputModal" type="text" id="edit-title"
		                                    name="stitle" required>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="startDate"><b>시작 날짜</b></label>
		                                <input class="inputModal datepicker datedate" type="text" name="startDate" id="startDate" required>
		                            </div>
		                        </div>
		                        
		                        <div class="after" style="padding-bottom:10px;">
									<label for="" style="margin-left:14px;"><b>시작 시간</b></label>
										<select id="start" class="select-box" name="startTime"
											style="width:367px; margin-left:110px;" required>
											<option>시간을 선택하세요</option>
											<option value="09:00">오전 09:00</option>
											<option value="09:30">오전 09:30</option>
											<option value="10:00">오전 10:00</option>
											<option value="10:30">오전 10:30</option>
											<option value="11:00">오전 11:00</option>
											<option value="11:30">오전 11:30</option>
											<option value="12:00">오후 12:00</option>
											<option value="12:30">오후 12:30</option>
											<option value="13:00">오후 01:00</option>
											<option value="13:30">오후 01:30</option>
											<option value="14:00">오후 02:00</option>
											<option value="14:30">오후 02:30</option>
											<option value="15:00">오후 03:00</option>
											<option value="15:30">오후 03:30</option>
											<option value="16:00">오후 04:00</option>
											<option value="16:30">오후 04:30</option>
											<option value="17:00">오후 05:00</option>
											<option value="17:30">오후 05:30</option>
										</select>
									</div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="endDate"><b>끝 날짜</b></label>
		                                <input class="inputModal datepicker datedate" type="text" name="endDate" id="endDate" required>
		                            </div>
		                        </div>
		                        
		                        <div class="after" style="padding-bottom:10px;">
									<label for="" style="margin-left:14px;"><b>끝 시간</b></label>
										<select id="end" class="select-box" name="endTime"
											style="width:367px; margin-left:124px;" required>
											<option>시간을 선택하세요</option>
											<option value="09:30">오전 09:30</option>
											<option value="10:00">오전 10:00</option>
											<option value="10:30">오전 10:30</option>
											<option value="11:00">오전 11:00</option>
											<option value="11:30">오전 11:30</option>
											<option value="12:00">오후 12:00</option>
											<option value="12:30">오후 12:30</option>
											<option value="13:00">오후 01:00</option>
											<option value="13:30">오후 01:30</option>
											<option value="14:00">오후 02:00</option>
											<option value="14:30">오후 02:30</option>
											<option value="15:00">오후 03:00</option>
											<option value="15:30">오후 03:30</option>
											<option value="16:00">오후 04:00</option>
											<option value="16:30">오후 04:30</option>
											<option value="17:00">오후 05:00</option>
											<option value="17:30">오후 05:30</option>
											<option value="18:00">오후 06:00</option>
										</select>
									</div>
		                        
		                        <script>

		                        	$(function(){
		                        		$('.datepicker').datepicker({
		                        	        lang:'ko',
		                        	        dateformat:'yy-mm-dd',
		                        	    });
		                        	});

		                        </script>
		                        
		                        <div class="row show" id="typeS">
		                            <div class="col-xs-12 hideType">
		                                <label class="col-xs-4" for="edit-type"><b>구분</b></label>
		                                <select class="inputModal" name="stype" id="edit-type" style="width:367px;" required>
		                                	<option>일정 종류를 선택하세요</option>
		                                    <option value="휴가">휴가</option>
		                                    <option value="회의">회의</option>
		                                    <option value="외근">외근</option>
		                                    <option value="출장">출장</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row show" id="colorS">
		                            <div class="col-xs-12 hideType">
		                                <label class="col-xs-4" for="edit-color"><b>색상</b></label>
		                                <select class="inputModal" name="backColor" id="edit-color" style="width:367px;" required>
		                                	<option>색상을 선택하세요</option>
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-desc"><b>설명</b></label>
		                                <textarea rows="4" cols="50" class="inputModal" name="scontent"
		                                    id="edit-desc" style="resize:none;"></textarea>
		                            </div>
		                        </div>
		                    </div>
		                    <hr>
		                    <div class="modalBtnContainer-modifyEvent" style="text-align:right; padding-right:10px;">
		                        <button type="button" class="btn btn-primary" id="saveEvent">저장</button>
		                        <button type="button" class="btn btn-primary" id="updateEvent" style="display:none;">수정</button>
		                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
		                        <button type="button" id="btn-default" class="btn btn-default">닫기</button>
		                    </div>
		                </div><!-- /.modal-content -->
		            </div><!-- /.modal-dialog -->
		        </div><!-- /.modal -->
				<hr>	
		       
		       <div align="left">
					<b style="color: #505363">팀 일정</b>
					<input type="radio" name="splan" id="team" class="splan" value="T" style="margin-bottom:7px;" checked>&nbsp;
					<b style="color: #505363">전체 일정</b>
					<input type="radio" name="splan" id="company" class="splan" value="C" style="margin-bottom:7px;">
				</div>			
						
				<table class="ui selectable celled table">
				<colgroup>
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:40%;">
					<col style="width:15%;">
					<col style="width:20%;">
				</colgroup>
					<thead>
						<tr id="sss">
							<th style="color: #676767;">번호</th>
							<th style="color: #676767;">작성자</th>
							<th style="color: #676767;">제목</th>
							<th class="aa" style="color: #676767;">작성일</th>
						</tr>
					</thead>
					<tbody class="select_subject" id="select_list">
					<c:forEach items="${ list }" var="s">
						<tr>
							<td class="sNo">${ s.sno }</td>
							<td class="sName">${ s.empName }</td>
							<td class="sTitle">${ s.stitle }</td>
							<td class="sType">${ s.stype }</td>
							<td class="sDate aa">${ s.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div id="pagingArea" align="center">
			<!-- 이전 -->
				<c:if test="${ pi.currentPage eq 1 }">
					이전&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="teamScheduleList.do" var="befor">
						<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
					</c:url>
					<a href="${ before }">이전</a>
				</c:if>
					
			<!-- 번호들 -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						 <font color="#3287B2" size="3">${ p }</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="teamScheduleList.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ page }">${ p }</a>
					</c:if>
				</c:forEach>
				
				<!-- 다음 -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					&nbsp;다음
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="teamScheduleList.do" var="next">
						<c:param name="currentPage" value="${ pi.currentPage +1 }"/>
					</c:url>
					<a href="${ next }">다음</a>					
				</c:if>
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
	<!-- END WRAPPER -->
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
	$(function(){

	/* 사이드바의 해당 메뉴 활성화 유지하기 */
	$("#menu4").addClass("in");
	$("#menu4").attr('aria-expanded',true);
	$("#menu4_1").addClass("active");
	$("#menu4_1").attr('aria-expanded',true);
	$("#m4_2").addClass("active");	
	
	});
		 
	</script>
	
	<script>
	
	
	j(function(){
		
		calendarStart();
		refresh('T');
		addCalendarList('T');
	});
	
	
	function calendarStart(){
		
		j("#calendar").html("");
			 
			 var date = new Date();
			 var d = date.getDate();
			 var m = date.getMonth();
			 var y = date.getFullYear();
			 
			 j('#calendar').fullCalendar({
			  
			   header: {
				   left: "month,basicWeek,basicDay",
				   center: "title",
				   right: "today prev,next"
			   },
			   
			   defaultView: 'month',		// 처음 화면에 보여질 영역(월, 주, 일)
			   locale: 'ko',				// 언어
			   navLinks: true,				// 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능을 사용하는지에 대한 여부
			   allDaySlot: false,			// 캘린더 상단에 "하루 종일"슬롯이 표시되는지 여부
			   contentHeight: 450,
			   theme: true, 				// css 사용할 수 있게
			   allDay: true,
			   
			   titleFormat: {
				   month: "YYYY년 MMMM",
				   week: "YYYY년 MMM DD일 (ddd) ",
				   day: "YYYY년 MMM DD일 dddd"
// 				   day: "YYYY-MM-DD"
			   },
			  	
			    editable: false,		// 일정 움직일 수 있게
				eventLimit: true, 		// 하루 기본일정 3개, 그 이상시, more로 처리
				
				events: [],

			// 일정 움직일 때 업데이트
			eventDrop: function(info) {
				
				 var sno = info.id;
				 var startDate = info.start.format("YYYY-MM-DD").split("T")[0];
				 var endDate = info.end.format("YYYY-MM-DD").split("T")[0];
				 
				 var splan = $("input[name=splan]:checked").val();
				 
// 				 console.log(sno  + "//" + startDate + "//" + endDate);
				 $.ajax({
					
					url :"movingSchedule.do",
					type:"post",
					data:{
						sno:sno,
						startDate:startDate,
						endDate:endDate
					},
					success:function(data){
						
						if(data == 'success'){
							refresh(splan);
							
						}else{
							alertify.alert("develoffice", "에러!!!!!!");
						}
					},
					error:function(){
						alertify.alert("develoffice","통신실패");
					}

				 });
			},
			
		    // substr = 인덱스~몇번째
		    eventMouseover: function(calEvent, jsEvent) {
		        var tooltip = '<div class="tooltipevent" style="width:280px;height:250px;background:#e9e9e9;position:absolute;z-index:10001; padding-right:23px; padding-left:23px; padding-top:15px;">' 
		        			  +	"<b>등록자</b>: &nbsp;" + calEvent.schd_idx + '<br>'
		        			  + "<b>시작시간</b>: &nbsp;" + calEvent.start.format().split('T')[0] + " " + calEvent.start.format().split('T')[1].substr(0,5) + '<br>'
		        			  + "<b>종료시간</b>: &nbsp;" + calEvent.end.format().split('T')[0] + " " + calEvent.end.format().split('T')[1].substr(0,5) + '<br>'
		        			  + "<br>"
		        			  + "<b>일정</b>: &nbsp;" + calEvent.title + '<br>'
		        			  + "<b>내용</b>: &nbsp;" + calEvent.description + '<br>'
		        			  + '</div>';

		        var $tooltip = $(tooltip).appendTo('body');
		        
		        $(this).mouseover(function(e) {
		            $(this).css('z-index', 10000);
		            $tooltip.fadeIn('500');
		            $tooltip.fadeTo('10', 1.9);
		            
		        }).mousemove(function(e) {
		            $tooltip.css('top', e.pageY + 10);
		            $tooltip.css('left', e.pageX + 20);
		        });
		    },

		    eventMouseout: function(calEvent, jsEvent) {
		        $(this).css('z-index', 8);
		        $('.tooltipevent').remove();
		    },	   
			
			// 일정 클릭 모달창 생성
			eventRender: function (event, element) {

				var deptCode = '${loginUser.deptCode}';
				var splan = $("input[name=splan]:checked").val();
				
		        if((deptCode == 2 || deptCode == 3 || deptCode ==4) || (splan == 'T')){
			        
		        	element.attr('href', 'javascript:void(0);');
			        element.click(function() {
			        		console.log("실행");
			        	
				        	$('#eventModal').dialog({
				         		  title: '일정 수정 및 삭제',
				        	      modal: true,
				        	      width: '600'
				        	});
				        	
							var startDate = $("input[name=startDate]");
							var startTime = $("select[name=startTime]");
							var endDate = $("input[name=endDate]");
							var endTime = $("select[name=endTime]");
							var stitle = $("input[name=stitle]");
							var scontent = $("#edit-desc");
							var stype = $("select[name=stype]");
							var backColor = $("select[name=backColor]");
				        	
							// 내 아이디가 아니면 수정하는 것들 disabled 처리
// 							console.log(event.className);
				        	if(event.className != ${loginUser.empId}){
				        		
				        		startDate.attr("disabled", true);
				        		endDate.attr("disabled", true);
				        		startTime.prop("disabled", true);
				        		endTime.prop("disabled", true);
				        		stitle.attr("disabled", true);
				        		scontent.attr("disabled", true);
				        		stype.prop("disabled", true);
				        		backColor.prop("disabled", true);
				        		$("#allDay").attr("disabled", true);
				        		
				        	}else{
				        		console.log("찍히나");
				        		startDate.attr("disabled", false);
				        		endDate.attr("disabled", false);
				        		startTime.prop("disabled", false);
				        		endTime.prop("disabled", false);
				        		stitle.attr("disabled", false);
				        		scontent.attr("disabled", false);
				        		stype.prop("disabled", false);
				        		backColor.prop("disabled", false);
				        		$("#allDay").attr("disabled", false);
				        	}
							
							$("#edit-title").val(event.title);
							$("#startDate").val(event.start.format().split("T")[0]);
							$("#endDate").val(event.end.format().split("T")[0]);
							$("#edit-color").val(event.color);
							$("#edit-desc").val(event.description);
							$("#start").val(event.agenda);
							
							$("#end").val(event.end.format().split('T')[0] + " " + event.end.format().split('T')[1].substr(0,5));
							
							
// 							$("#edit-type").val(event.stype);
							// 시간이랑 타입은,,,
							
							
							
							
				        	
				        	/* 저장 버튼 보이지 않게 */
				        	$("#saveEvent").css('display','none');
				        	
// 				        	console.log(event.className);

				        	if(${loginUser.empId} == event.className){
				        		
				        		$("#updateEvent").css('display','inline-block');
					        	$("#deleteEvent").css('display','inline-block');
					        	
				        	}else{
				        		$("#updateEvent").css('display','none');
					        	$("#deleteEvent").css('display','none');
				        	}
				        	
				        	$("#sNo").val(event.id); 
				        	
				        	// 라디오 버튼에 따른 모달창 종류
				        	var splan = $("input[name=splan]:checked").val();
							 
							if(splan == 'C'){
								$(".hideType").css('display','none');
							}else{
								$(".hideType").css('display','block');
							}
						
			        	});
					}			
			    },      
			});
		};
	
	
		// 일정 추가 모달창 생성
		$(document).on('click','.fc-day',function(){
			
			var deptCode = '${loginUser.deptCode}';
			var splan = $("input[name=splan]:checked").val();
			
	        if((deptCode == 2 || deptCode == 3 || deptCode == 4) || (splan == 'T')){
			
				$('#eventModal').dialog({
		   		  title: '새로운 일정',
		  	      modal: true,
		  	      width: '600'
		  		});
				
				var startDate = $("input[name=startDate]");
				var startTime = $("select[name=startTime]");
				var endDate = $("input[name=endDate]");
				var endTime = $("select[name=endTime]");
				var stitle = $("input[name=stitle]");
				var scontent = $("#edit-desc");
				var stype = $("select[name=stype]");
				var backColor = $("select[name=backColor]");
        		
        		// 일정 추가 모달창 초기화
        		$("#edit-title").val('');
				$("#startDate").val('');
				$("#endDate").val('');
				$("#edit-color").find('option:eq(0)').prop('selected', true);
				$("#edit-desc").val('');
				$("#start").find('option:eq(0)').prop('selected', true);
				$("#end").find('option:eq(0)').prop('selected', true);
				
				// 그냥 일정 등록하는 모달에서는 disabled 풀어
        		startDate.attr("disabled", false);
        		endDate.attr("disabled", false);
        		startTime.prop("disabled", false);
        		endTime.prop("disabled", false);
        		stitle.attr("disabled", false);
        		scontent.attr("disabled", false);
        		stype.prop("disabled", false);
        		backColor.prop("disabled", false);
        		$("#allDay").attr("disabled", false);

				// 버튼 이벤트
				$("#deleteEvent").css('display','none');
				$("#saveEvent").css('display','inline-block');
				$("#updateEvent").css('display','none');
				
				// 라디오 버튼에 따른 모달창 종류
				var splan = $("input[name=splan]:checked").val();
				 
				if(splan == 'C'){
					$(".hideType").css('display','none');
				}else{
					$(".hideType").css('display','block');
				}
			}
		});
		
		// 모달창 닫기
		$(function() {
		    $("#btn-default").on('click', function() {
		        $("#eventModal").dialog("close");
		    });
		});
		
		// 일정 추가 인설트
		$(document).on('click', '#saveEvent', function(){
	
			 var sno = $("#sNo").val();
			 var startDate = $("input[name=startDate]").val();
			 var startTime = $("select[name=startTime] option:selected").val();
			 var endDate = $("input[name=endDate]").val();
			 var endTime = $("select[name=endTime] option:selected").val();
			 var stitle = $("input[name=stitle]").val();
			 var scontent = $("#edit-desc").val();
			 var stype = $("select[name=stype] option:selected").val();
			 var backColor = $("select[name=backColor] option:selected").val();
			 var splan = $("input[name=splan]:checked").val();
			 var allDay;
			 if($("#allDay").prop('checked')){
				allDay ='Y'; 
			 }else{
				 allDay ='N';
			 }
			 
			 $.ajax({
			
				url:"insertSchedule.do",
				type:"POST",
				data:{
					  startDate:startDate,
					  startTime:startTime,
					  endDate:endDate,
					  endTime:endTime,
					  stitle:stitle,
					  scontent:scontent,
					  stype:stype,
					  backColor:backColor,
					  empId:'${loginUser.empId}',
					  splan:splan,
					  allDay:allDay
				},
				success:function(data){
					if(data == 'success'){
						
						$("input[name=startDate]").val('');
						$("select[name=startTime]").children().first().prop('selected', true);
						$("input[name=endDate]").val('');
						$("select[name=endTime]").find('option:eq(0)').prop('selected', true);
						$("input[name=stitle]").val("");
						$("#edit-desc").val("");
						$("select[name=stype]").find('option:eq(0)').prop('selected', true);
						$("select[name=backColor]").find('option:eq(0)').prop('selected', true);
						$("#allDay").prop('checked', false);
						
						$("#eventModal").dialog("close");
						
						j("#calendar").fullCalendar('removeEvents');
						refresh(splan);
						addCalendarList(splan);
						
					}else{
						alertify.alert("delveloffice", "실패");
					}
				},
				error:function(){
					alertify.alert("develoffice", "모두 입력해주세요");
				}
			 });
		});
		
		// 게시판 새로고침
		function refresh(splan){
			$.ajax({
				
				url: "sRefresh.do",
				type: "post",
				data: {
					deptCode: '${loginUser.deptCode}',
					splan:splan,
					currentPage:1
				},
				dataType:"json",
				success:function(data){
					var html = "";
					
						$("#select_list").html("");
						
						$.each(data, function(index, s){
							
							if(splan == 'T'){
								
								html +=
									'<tr>' + 
										'<td class="sNo">' + s.sno + '</td>' +
										'<td class="sName">' + s.empName + '</td>' +
										'<td class="sTitle">' + s.stitle  + '</td>' +
										'<td class="sType">' + s.stype + '</td>' +
										'<td class="sDate aa">' + s.createDate + '</td>' + 
									'</tr>';
							}else{
								
								html +=
									'<tr>' + 
										'<td class="sNo">' + s.sno + '</td>' +
										'<td class="sName">' + s.empName + '</td>' +
										'<td class="sTitle">' + s.stitle  + '</td>' +
										'<td class="sDate aa">' + s.createDate + '</td>' + 
									'</tr>';
								}
							});
						
								if(splan == 'T'){
									
									if( $('#sss').children().length == 4){
									
										$('#sss').children().last().prev().after('<th style="color: #676767;" id="sType">일정종류</th>');
									}
								}else{
									$('#sType').remove();
								}
	 						
							$("#select_list").html(html);
					},
					error:function(){
						alertify.alert("통신실패");
					},
				});
			};
	
			// 라디오버튼 클릭시 value에 맞게 변환
			$(document).on('change','input[name=splan]',function(){
				j("#calendar").fullCalendar('removeEvents'); // 달력 새로고침
				refresh($(this).val());
				addCalendarList($(this).val());
			});
			
			// 달력에 add하기
			function addCalendarList(splan){
				
				  $.ajax({
					url : "addCalendar.do",
					type : "post",
					data: {
						deptCode: '${loginUser.deptCode}',
						splan:splan
					},
					dataType : "json",
					success : function(data) {
						
						if(data != null){
							
							$.each(data, function(index, value){
								
								var calEvent = {};
								
								calEvent.id = value.sno;
								calEvent.title = value.stitle;
								calEvent.schd_idx = value.empName;
								calEvent.description = value.scontent;
								calEvent.start = value.startDate + 'T' + value.startTime;
								calEvent.end = value.endDate + 'T' + value.endTime;
								calEvent.color = value.backColor;
								calEvent.className = value.empId;
								
								calEvent.agenda = value.startTime;
								
								// 내 일정 아니면 못움직이게
								if(value.deptCode == 2 || 3 || 4){
									
									if(value.empId == '${loginUser.empId}'){
										calEvent.editable = true;
									}
								}
									
								j('#calendar').fullCalendar('renderEvent', calEvent, true); // 개중요, 얘가 넘겨줌
							});
							
						}
					},
					error : function() {
						alertify.alert("통신실패");
					},
				});
			
			 };
			 
			 // 삭제
			 $(document).on('click', '#deleteEvent', function(){
				
				 var sno =$("#sNo").val();
				 var splan = $("input[name=splan]:checked").val();
				 
				 $.ajax({
					 
					 url: "deleteSchedule.do",
					 type: "post",
					 data: {
						 sno:sno,
						 empId:'${loginUser.empId}'
						 
					 },
					 success:function(data){
						 if(data == 'success'){
							 
							 $("#eventModal").dialog("close");
							 j("#calendar").fullCalendar('removeEvents',sno);
							 refresh(splan);
							 
						 }else{
							 alertify.alert("develoffice", "에러에러에러에러");
						 }
					 },
					 error:function(){
						 alertify.alert("develoffice","통신실패");
					 }
				 });
			 });
			 
			 // 수정
			 $(document).on('click',"#updateEvent", function(){
				
				 var sno = $("#sNo").val();
				 var startDate = $("input[name=startDate]").val();
				 var startTime = $("select[name=startTime] option:selected").val();
				 var endDate = $("input[name=endDate]").val();
				 var endTime = $("select[name=endTime] option:selected").val();
				 var stitle = $("input[name=stitle]").val();
				 var scontent = $("#edit-desc").val();
				 var stype = $("select[name=stype] option:selected").val();
				 var backColor = $("select[name=backColor] option:selected").val();
				
				 $.ajax({
					
					 url:"updateSchedule.do",
					 type:"post",
					 data:{
						 sno:sno,
						 stitle:stitle,
						 startDate:startDate,
						 startTime:startTime,
						 endDate:endDate,
						 endTime:endTime,
						 stype:stype,
						 backColor:backColor,
						 scontent:scontent,
						 empId:'${loginUser.empId}'
					 },
					 success:function(data){
						 if(data == 'success'){
							 $("#eventModal").dialog("close");
							 refresh(splan);
							 addCalendarList($(this).val());
						 }else{
							 alertify.alert("develoffice","모두 입력해주세요");
						 }
					 },
					 error:function(){
						 alertify.alert("develoffice","통신실패");
					 }
				 });
			 });
			 
			 // 달력에서 이전 날짜로 못가게
			 $(".datedate").change(function(){
	             
		          var strDate1 = $("#startDate").val();
		          var strDate2 = $("#endDate").val();
		          var arr1 = strDate1.split('-');
		          var arr2 = strDate2.split('-');
		          
	// 	          console.log(arr1);
	// 	          console.log(arr2); 
		          
		          var dat1 = new Date(arr1[0], arr1[1]-1, arr1[2]);
		          var dat2 = new Date(arr2[0], arr2[1]-1, arr2[2]);
		       
	// 	          console.log(dat2);    
		          
		           // 날짜 차이 알아 내기
		           var diff = dat2.getTime() - dat1.getTime();
		           var result = Math.floor(diff/1000/60/60/24);
		           
		           
		           if(diff <= 0){
		              
		              dat2.setDate(dat1.getDate()+1);
		              
		              var year = dat2.getFullYear();
		              var month = dat2.getMonth()+1;
		              var day = dat2.getDate();
		                            
		              var month1 = month;
		              var day1 = day;
		              
		                 if(month1 < 10){
		                    month1 = "0"+month1;
		                 }
		                 if(day1 < 10){
		                    day1 = "0"+day1;
		                 }
		                 
		              var dat2_2 = (year + "-" + month1 + "-" + day1);
		              $("#endDate").val(dat2_2); // 하루 밀린 날짜 출력(string)
		              
		       		};
			 });
			 
			 
			 
			 
			 
		 
		 
		 
		 
		 
		 
		 
		 

	</script>
	
</body>
</html>