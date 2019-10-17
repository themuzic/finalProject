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




</head>
<body onload="loadWidgets();">
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
					<div class="panel" style="position:absolute;min-width:500px;">
						<input type="hidden" class="widgetType" name="widgetType" value="1">
						<input type="hidden" class="left" name="left" value="">
						<input type="hidden" class="top" name="top" value="">
						<input type="hidden" class="fold" name="fold" value="N">
						<input type="hidden" class="status" name="status" value="Y">
						
						<div class="panel-heading">
							<h3 class="panel-title">My Tasks</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
								<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
							</div>
						</div>
						<div class="panel-body">
							<ul class="list-unstyled task-list">
								<li>
									<p>이달의 근무율 <span class="label-percent">23%</span></p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100" style="width:23%">
											<span class="sr-only">23% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<p>Load &amp; Stress Test <span class="label-percent">80%</span></p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
								</li>
								<li style="text-align: center;">
									<div>
										<button class="ui negative basic button" id="statrWork">출근</button>
										<button class="ui positive basic button" id="endWork">퇴근</button>
									</div>
								</li>
								<li>
									<p>Server Check <span class="label-percent">45%</span></p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
											<span class="sr-only">45% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<p>Mobile App Development <span class="label-percent">10%</span></p>
									<div class="progress progress-xs">
										<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
											<span class="sr-only">10% Complete</span>
										</div>
									</div>
								</li>
							</ul>
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
											<tr>
												<th>Order No.</th>
												<th>Name</th>
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
										<div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
										<div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All Purchases</a></div>
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
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	
	
	
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
    	
    	console.log($(this).parents('.panel').children('.fold').val());
    	
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
		
	/*
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);
		
		});
		*/
		
		/*
		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

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
	
	
	</script>
	
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/classList.js"></script>
</body>
</html>