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
<!-- <script src="resources/calendar/addEvent.js"></script>   -->
<!-- <script src="resources/calendar/editEvent.js"></script>   -->
<!-- <script src="resources/calendar/etcSetting.js"></script>   -->
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
			<div id="calender"></div>
			<hr>
			
			<div id="searchArea" align="right">
				<form action="search.do">
					<select id="searchCondition" name="condition" style="height:32px; border:1px solid lightgray" >
					    <option>------</option>
					    <option value="writer">작성자</option>
					    <option value="type">유형</option>
					    <option value="title">제목</option>
					    <option value="content">내용</option>
					</select>
					<div class="ui input">
						<input type="search" name="search" value="${ search }" placeholder="Search..." style="height:32px;">
						<i class="circular search link"></i>
					</div>	         
					<button type="submit" onclick="return validate();" style="color:#3287B2">검색하기</button>
				</form>
	       </div>
	       
	       <script>
		       function validate(){
		           if($("option:selected").val() == "------"){
// 		              alert("검색 조건을 체크해주세요");
		              alertify.alert("", "검색 조건을 체크해주세요");
		           return false;
		           }
		        }
	       </script>
	       
	       <div align="left">
				팀 일정
				<input type="radio" name="radio" value="team" style="margin-bottom:7px;">&nbsp;
				전체 일정
				<input type="radio" name="radio" value="all" style="margin-bottom:7px;">
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
					<tr>
						<th><input type="checkbox" id="chkAll" class="chkBox" name="chkAll" value="스케줄번호"></th>
						<th>작성자</th>
						<th>제목</th>
						<th>유형</th>
						<th class="aa">작성일</th>
					</tr>
				</thead>
				<tbody class="select_subject">
					<tr>
						<td>
							<input type="checkbox" id="check" name="check" class="check chkBox" value="스케줄번호">
							<input type="hidden" value="스케줄넘버">
						</td>
						<td class="sName">이름</td>
						<td class="sTitle">제목</td>
						<td class="sType">휴가
<%-- 							<a href="${ mdetail }" style="color:gray;">${ m.mailTitle }</a> --%>
						</td>
						
						<td class="sDate aa">2019-10-28</td>
					</tr>
			</tbody>
		</table>

		<div id="pagingArea" align="center">
 			<!-- [이전] -->
			<c:if test="${ pi.currentPage == 1 }">
				이전&nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:if test="${ !empty m }">
					<c:url var="mlistBack" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
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
	               <c:if test="${ !empty m }"> <!-- 검색결과 있으면 -->
	                  <c:url var="mlistPage" value="search2.do">
	                     <c:param name="currentPage" value="${ p }"/>
	                     <c:param name="condition" value="${ condition }"/>
	                     <c:param name="search" value="${ search }"/>
	                     <c:param name="mailFrom" value="${ m.mailFrom }"/>
						 <c:param name="mailTo" value="${ m.mailTo }"/>
	                  </c:url>
	               </c:if>
	               <c:if test="${ empty m }"> <!-- 검색 결과 없으면 -->
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
				<c:if test="${ !empty m }">
					<c:url var="mlistNext" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
					<c:url var="mlistNext" value="receiveMail.do">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
				</c:if>
				<a href="${ mlistNext }">다음</a>
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
	</div>
	<!-- END WRAPPER -->
	
	
	
	
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
	
// 	j(document).ready(function() {
// 		setCalendar();
// 	});

// 	function setCalendar(){

// 		var calendarEl = document.getElementById('calendar');

// 		var calendar = new FullCalendar.Calendar(calendarEl, {
// 			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
// 			header: {
// 				left: 'prev,next today',
// 				center: 'title',
// 				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
// 			},
// 			defaultView: 'timeGridWeek',
// 			locale: 'ko',
// 			navLinks: true, // can click day/week names to navigate views
// 			editable: true,
// 			allDaySlot: false,
// 			eventLimit: true, // allow "more" link when too many events
// 			minTime: '10:00:00',
// 			maxTime: '24:00:00',
// 			contentHeight: 'auto',
// 			eventSources: [{
// 				events: function(info, successCallback, failureCallback) {
// 					j.getJSON( "selectEventList.json", function( data ) {						
// 						successCallback(data);
// 					});
// 				}
// 			}]
// 		});
				
// 		calendar.render();

// 	}
	

	j(function(){
		calendarEvent();
	});
	
	function calendarEvent(eventData){
	 
		j("#calender").html("");
			 
			 var date = new Date();
			 var d = date.getDate();
			 var m = date.getMonth();
			 var y = date.getFullYear();
			 
			 
			 var calendar = j('#calender').fullCalendar({
			  
			   header: {
				   left: "month,basicWeek,basicDay",
				   center: "title",
				   right: "today prev,next"
			   },
			   
			   defaultView: 'month',	// 처음 화면에 보여질 영역(월, 주, 일)
			   locale: 'ko',			// 언어
			   navLinks: true,			// 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능을 사용하는지에 대한 여부
			   editable: true,			// 실행된 달력에서 일정(event)을 표시한 바(bar)를 마우스로 이동할 수 있게 하는 것
			   allDaySlot: false,		// 캘린더 상단에 "하루 종일"슬롯이 표시되는지 여부
			   eventLimit: true,		// 하루 기본일정 3개, 그 이상시, more로
			   minTime: '09:00:00',
			   maxTime: '24:00:00',
			   contentHeight: 'auto',
			   
			   titleFormat: {
				   month: "YYYY년 MMMM",
				   week: "YYYY년 MMM DD일 (ddd) ",
				   day: "YYYY년 MMM DD일 dddd"
			   },
			  
			  events : eventData,
			 /* 배열의 원소는 Json으로 지정한다.
			   하나의 일정을 Json으로 지정하는 것이고
			   이것은 일정명(작업명-title), 시작일자(start), 종료일자(end),
			   데이터 식별(id)로 구성되어 있다.
			   
			   데이터 식별(id) 속성은 생략해도 되지만 향후 구현에서 일정을 클릭하면
			   상세한 작업 정보를 팝업으로 제공하기 위해서 사용할 것이다. */

			   timeFormat : "HH:mm",
			 });
		};
		
</script>








	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
</body>
</html>