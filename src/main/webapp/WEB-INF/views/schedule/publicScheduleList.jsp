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

	#calendar {
		max-width: 900px;
		margin: 0 auto;
		font-size: 0.8em;
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
					
					
					
					
					<div id="calender"></div>
					
					
					
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
	$("#m4_1").addClass("active");	
	
	});
		 
	</script>
	
	<script>
	
	j(function(){
		fullCalendar();
	});
	
	function fullCalendar(){
	 
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
			   defaultDate: '2019-10-27',   // 기본설정 날짜
			   defaultView: 'month',		// 처음 화면에 보여질 영역(월, 주, 일)
			   locale: 'ko',				// 언어
			   navLinks: true,				// 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능을 사용하는지에 대한 여부
			   editable: true,				// 실행된 달력에서 일정(event)을 표시한 바(bar)를 마우스로 이동할 수 있게 하는 것
			   allDaySlot: false,			// 캘린더 상단에 "하루 종일"슬롯이 표시되는지 여부
			   eventLimit: true,			// 하루 기본일정 3개, 그 이상시, more로 처리
			   minTime: '09:00:00',
			   maxTime: '24:00:00',
			   contentHeight: 450,
			   theme: true, 				// css 사용할 수 있게
			   
			   titleFormat: {
				   month: "YYYY년 MMMM",
				   week: "YYYY년 MMM DD일 (ddd) ",
				   day: "YYYY년 MMM DD일 dddd"
			   },
			   
			   selectable: true,
			   selectHelper: true,
			   select: function(start, end) {
			   		var title = prompt("뭐추가할라고,,,");
					var eventData;
					if (title) {
						eventData = {
							title: title,
							start: start,
							end: end
						};
						console.log(start);
						j('#calendar').fullCalendar('renderEvent', eventData, true); 
					}
					j('#calendar').fullCalendar('unselect');
			   },
			   
			   events: [
				{
					title: '회사 쉬는날',
					start: '2019-10-28'
				},
				{
					title: '휴가',
					start: '2019-10-29',
					end: '2019-11-01'
				},
				{
					id: 999,
					title: '미팅 시간',
					start: '2019-11-04T16:00'
				},
				{
					title: '1팀 회의',
					start: '2019-11-11',
					end: '2019-11-14'
				},
				{
					title: '차량 대여',
					start: '2019-11-13T09:30:00',
					end: '2019-11-13T11:30:00'
				},
				{
					title: '점심시간',
					start: '2019-10-29T12:00:00'
				},
				{
					title: '1팀 회의',
					start: '2019-10-30T14:30:00'
				},
				{
					title: '클라이언트 연락',
					start: '2019-10-31T17:30:00'
				},
				{
					title: '학원 끝나는 날',
					start: '2019-11-05T07:00:00',
					color : '#FF0000',
		            textColor : '#FFFF00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2019-10-28'
				}
			]
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