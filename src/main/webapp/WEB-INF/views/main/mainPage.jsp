<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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
				<!-- 근태관련 -->
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
					<!-- END OVERVIEW -->
				
				
				
				
				
				
					
					
							<!-- RECENT PURCHASES -->
							<div class="panel" style="position:absolute;min-width:500px;">
								<input type="hidden" class="widgetType" name="widgetType" value="2">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">
								<div class="panel-heading">
									<h3 class="panel-title">Recent Purchases</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr style="text-align:center;">
												<th>문서번호</th>
												<th>제목</th>
												<th>Amount</th>
												<th>Date &amp; Time</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="#">763648</a></td>
												<td>Steve</td>
												<td>$122</td>
												<td>Oct 21, 2016</td>
												<td><span class="label label-success">COMPLETED</span></td>
											</tr>
											<tr>
												<td><a href="#">763649</a></td>
												<td>Amber</td>
												<td>$62</td>
												<td>Oct 21, 2016</td>
												<td><span class="label label-warning">PENDING</span></td>
											</tr>
											<tr>
												<td><a href="#">763650</a></td>
												<td>Michael</td>
												<td>$34</td>
												<td>Oct 18, 2016</td>
												<td><span class="label label-danger">FAILED</span></td>
											</tr>
											<tr>
												<td><a href="#">763651</a></td>
												<td>Roger</td>
												<td>$186</td>
												<td>Oct 17, 2016</td>
												<td><span class="label label-success">SUCCESS</span></td>
											</tr>
											<tr>
												<td><a href="#">763652</a></td>
												<td>Smith</td>
												<td>$362</td>
												<td>Oct 16, 2016</td>
												<td><span class="label label-success">SUCCESS</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<!-- <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div> -->
										<div class="col-md-6 text-right fr"><a href="#" class="btn btn-primary">전체 문서 보기</a></div>
									</div>
								</div>
							</div>
							<!-- END RECENT PURCHASES -->
							
							
							
							
							<!-- TODO LIST -->
							<div class="panel" style="position:absolute;min-width:500px;">	
								<input type="hidden" class="widgetType" name="widgetType" value="3">
								<input type="hidden" class="left" name="left" value="">
								<input type="hidden" class="top" name="top" value="">
								<input type="hidden" class="fold" name="fold" value="N">
								<input type="hidden" class="status" name="status" value="Y">							
								<div class="panel-heading">
									<h3 class="panel-title">To-Do List</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled todo-list">
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">Restart Server</span>
												<span class="short-description">Dynamically integrate client-centric technologies without cooperative resources.</span>
												<span class="date">Oct 9, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">Retest Upload Scenario</span>
												<span class="short-description">Compellingly implement clicks-and-mortar relationships without highly efficient metrics.</span>
												<span class="date">Oct 23, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<strong>Functional Spec Meeting</strong>
												<span class="short-description">Monotonectally formulate client-focused core competencies after parallel web-readiness.</span>
												<span class="date">Oct 11, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- END TODO LIST -->
						
					
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
	
	var endLeft;
	var endTop;
    
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
		
		//console.log(panels);
		//console.log(${widgetList});
		
		$.each(${widgetList}, function(i, widget){
			
			$.each(panels, function(j, panel){
				//console.log(panel);
				
				if(widget.widgetType == panel.value){
					
					panel.parentNode.style.left = widget.left+'px';
					panel.parentNode.style.top = widget.top+'px';
					panel.nextSibling.nextSibling.setAttribute('value',widget.left);
					panel.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value',widget.top);
					
					if(widget.fold == "Y"){
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.style.display = 'none';
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[1].classList.add('click');
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[1].click();
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value','Y');
						//console.log('folding 완료');
					}
					
					if(widget.status == "N"){
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.childNodes[3].childNodes[3].click();
						panel.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.setAttribute('value','N');
						//console.log('hide 완료');
						
					}
				}
			});
		});
	}
	
	function foldClick() {
		
	}
	
	function statusClick() {
		
	}
	
	
	/* ----------------------------------------------- */
	$(function() {
		
		
		
		
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
				alertify.alert('DEVELOFFICE', 'AJAX통신 실패');
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
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>

	<script src="resources/js/jquery-ui.js"></script>
	<script src="resources/js/classList.js"></script>
	
</body>
</html>