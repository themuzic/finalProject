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
					
					
					
					
					<div id="calendar"></div>
					
					
					
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
	
	j(document).ready(function() {
		
		j('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2019-10-28',
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					j('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				j('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2019-10-28'
				},
				{
					title: 'Long Event',
					start: '2016-05-07',
					end: '2016-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-05-11',
					end: '2016-05-13'
				},
				{
					title: 'Meeting',
					start: '2016-05-12T10:30:00',
					end: '2016-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2016-05-28'
				}
			]
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