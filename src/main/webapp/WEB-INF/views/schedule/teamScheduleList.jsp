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
<script src="resources/calendar/main.js"></script>  
<!-- <script src="resources/calendar/addEvent.js"></script>   -->
<!-- <script src="resources/calendar/editEvent.js"></script>   -->
<!-- <script src="resources/calendar/etcSetting.js"></script>   -->
<script src="resources/calendar/moment.min.js"></script>  
<script src="resources/calendar/fullcalendar.min.js"></script>


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
	$("#m4_2").addClass("active");	
	
	});
		 
	</script>
	
	<script type="text/javascript">

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

			   center: "title",
			   left: "month,basicWeek,basicDay",
			   right: "today prev,next"
			   },
			   
			   editable: true,
			   titleFormat: {
			   month: "YYYY년 MMMM",
			   week: "YYYY년 MMM DD일 (ddd) ",
			   day: "YYYY년 MMM DD일 dddd"
			   },
			   
			   allDayDefault: false,
			   defaultView: "month",
			   editable: false,
			   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
			   dayNamesShort: ["일","월","화","수","목","금","토"],
			   buttonText: {
			   today : "오늘",
			   month : "월별",
			   week : "주별",
			   day : "일별",
			   },
			   events : eventData,
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