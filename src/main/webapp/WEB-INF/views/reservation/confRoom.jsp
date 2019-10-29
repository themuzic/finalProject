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

<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>



<style>
	.contentWrap{
		float:left;
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	#time-table tr:hover{
		background:#ebf9fc;
	}
	.time-div.rs-time-title.h1032.time_table_tbody_area th{
		border-right:none;
	}
	.reserv{
		background:lightblue;
		border:1px solid lightblue;
		cursor:pointer;
	}
</style>


</head>
<body onload="setToday();">
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
					
					
					<div id="contents">
						<div class="setting_title">
							<h3>회의실 </h3>
						</div>
						<div class="content_inbox" style="overflow-y:hidden;">
							<!-- Contents -->
							<div class="rs-wrap" style="margin:0;">
								<!-- 검색이 존재할 경우 -->
								<ul class="tabType1 mgb_30 hide" id="booking_search_tab_ul">
									<input type="hidden" value="" id="booking_search_name_hidden">
								</ul>
								<!-- // 검색이 존재할 경우 -->
								<input type="hidden" value="4769" id="category_no_hidden">
								<input type="hidden" value="T" id="resource_type_hidden">
								<div class="cal_head" id="cal_head_fixed_div" style="padding-right: 42px; padding-left: 20px;">
									<div id="cal_head_fixed_div_area">
										<button type="button" class="icon directleft" onclick="moveDate('prev');"><span class="blind">전일 이동</span></button>
										<input type="text" class="num datepicker" id="booking_date" value="" style="width:110px;border:none;margin-right:5px;" readonly>
										<span id="week_name_span"></span>
										<button type="button" class="icon month" onclick="$('#booking_date').focus();"><span class="blind">예약 날짜 선택</span></button>
										<button type="button" class="icon directright" onclick="moveDate('next');"><span class="blind">익일 이동</span></button>
										<button type="button" class="today-btn vt" onclick="setToday();">오늘</button>
									</div>
									<div id="tbl_head_fixed_div_area">
										<table class="rs-cal-table" id="booking_clone_tbl">
											<colgroup id="resource_list_colgroup">
												<col width="80">
												<col width="">
												<col width="80">
											</colgroup>
											<tbody>
												<tr>
													<td style="border-bottom:none;">
														<table>
															<thead class="booking_resource_img_top">
																<tr><th scope="col" style="padding:7px 0;"></th></tr>
																<tr class="rs-bg"><td class="rs-btn left cpointer"><span class="icon in_sq deg902" style="position:static;display:inline-block;"></span></td></tr>
																<tr><td class="rs-divider-td"><hr class="rs-divider"></td></tr>
															</thead>
														</table>
													</td>
													<td style="border-bottom:none;">
														<table class="rs-resource-tbl" no="5109">
															<thead class="rs-view booking_resource_img_top">
																<tr><th scope="col"><span class="resource_name_span" title="회의실" style="text-align: center;">회의실</span></th></tr>
																<tr class="rs-bg"><td class=""><img src="resources/images/confRoom.jpg" alt=""></td></tr>
																<tr><td class="rs-divider-td"><hr class="rs-divider"></td></tr>
															</thead>
														</table>
													</td>
													<td style="border-bottom:none;">
														<table class="rs-no-left-line">
															<thead class="booking_resource_img_top">
																<tr><th scope="col" style="padding:7px 0;"></th></tr>
																<tr class="rs-bg"><td class="rs-btn right cpointer"><span class="icon in_sq deg90" style="position:static;display:inline-block;transform: rotate(90deg);"></span></td></tr>
																<tr><td class="rs-divider-td"><hr class="rs-divider"></td></tr>
															</thead>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="rs-view" id="tbl_body_div" style="height: 440px;width: 95.1%;">
									<div class="dropdown hide" id="showMoreResource">
										<ul class="dropdown-menu" id="page_list_ul"></ul>
									</div>
									<table class="rs-cal-table" id="booking_main_tbl">
										<colgroup id="resource_list_colgroup">
											<col width="80">
											<col width="">
											<col width="80">
										</colgroup>
										<tbody>
											<tr id="resource_list_tr">
												<td style="border-bottom:none;">
													<table>
														<tbody class="time-div rs-time-title h1032 time_table_tbody_area">
															<tr><th class="rs-time-pri timeLabel" name="09"><span id="rs-scroll-position"></span>오전 9시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="10">오전 10시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="11">오전 11시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="12">오후 12시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="13">오후 1시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="14">오후 2시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="15">오후 3시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="16">오후 4시</th></tr>
															<tr><th class="rs-time-pri timeLabel" name="17">오후 5시</th></tr>
														</tbody>
													</table>
												</td>
												<td style="border-bottom:none;">
													<table class="rs-resource-tbl" id="time-table">
														<tbody class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
														
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="09:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="09:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="10:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="10:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="11:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="11:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="12:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="12:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="13:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="13:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="14:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="14:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="15:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="15:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="16:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="16:30"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee blank" time="17:00"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee blank" time="17:30"></td></tr>
															
														</tbody>
													</table>
												</td>
												<td style="border-bottom:none;">
													<table class="rs-no-left-line">
														<tbody class="time-div rs-no-btm-line h1032 time_table_tbody_area">
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
															<tr><th class="rs-time-pri"></th></tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- Contents End-->
						</div>
			
					</div>
					
					
					
					
					<!-- 예약 모달창 시작 --------------------------------------------->
					
					
					<div id="booking_time_layer" class="booking_layer_div layer_box hide">
						<div class="layer_box rs-booking-layer popup1 " style="margin-left: -221px; margin-top: -193.5px; display: block; z-index: 105;">
							<form id="booking_resource_frm">
								<div class="title_layer text_variables">예약하기</div>
								<div class="to-add detail-search">
									<dl class="after">
										<dt><label for="">자원 이름</label></dt>
										<dd>
											<input type="text" name="reservType" id="resource_list_select" style="width:270px" value="회의실" readonly>
											<input type="hidden" name="empId" value="${ loginUser.empId }">
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">날짜</label></dt>
										<dd>
											<div class="fl">
												<input type="text" name="reservDate" id="booking_date_in_layer" class="datepicker" style="width:147px;" value="" readonly>
												<button type="button" class="icon month" onclick="$('#booking_date_in_layer').focus();"></button>
											</div>
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">예약 시간</label></dt>
										<dd class="after">
											<div class="fl">
												<select id="start" name="startTime" class="select-box" style="width:125px;">
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
												 ~
												<select id="end" name="endTime" class="select-box" style="width:125px;">
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
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">사용 용도</label></dt>
										<dd class="after">
											<textarea class="rs-layer-textarea" name="reason"></textarea>
										</dd>
									</dl>
									
									<!-- 
									<dl class="after hide" id="add_resource_dl">
										<dt><label for="">복수 자원</label></dt>
										<dd class="after">
											<ul class="multi-select" id="resource_list_layer">   </ul>
										</dd>
									</dl>
									 -->
									
								</div>
								<div class="layer_button">
									<button type="submit" class="btn_variables saveBtn">저장</button>
									<button type="button" class="booking_layer_close closeBtn">취소</button>
								</div>
								<a href="javascript:void(0)" class="icon btn_close layer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
							</form>
						</div>
						<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 100;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
					</div>
					
					
					<!-- 예약 모달창 끝 ----------------------------------------------------->

					
					<!-- 예약 확인 모달창 시작 ----------------------------------------------------->
					
					
					<div id="booking_info_detail_layer" class="booking_layer_div layer_box hide">
						<div class="layer_box" style="z-index: 1005;">
							<div class="layer_box mid_large popup3" style="margin-left: -256px; margin-top: -205px; display: block; z-index: 1005;">
								<div class="title_layer text_variables">예약 확인</div>
								<div class="to-add">
									<dl class="after">
										<dt><label for="">자원 이름</label></dt>
										<dd>회의실</dd>
									</dl>
									<dl class="after">
										<dt><label for="">예약 시간</label></dt>
										<dd class="dd1"></dd>
									</dl>
									<dl class="after">
										<dt><label for="">등록자</label></dt>
										<dd class="dd2"></dd>
									</dl>
									<dl class="after">
										<dt><label for="">사용 용도</label></dt>
										<dd class="dd3">설계 회의</dd>
									</dl>
									<dl class="after">
										<dt><label for="">예약 상태</label></dt>
										<dd>예약 완료</dd>
									</dl>
								</div>
							
								<div class="layer_button">
									<button type="button" class="btn_variables booking_layer_close closeBtn">확인</button>
								</div>
								<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
							</div>
						</div>
						<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
					</div>
										
					
					<!-- 예약 확인 모달창 끝 ----------------------------------------------------->
					
					
					
					
					
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
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_2").addClass("active");
			
		});
		
		/* 페이지 열리면 세팅해주기 */		
		function setToday(){
			/* 오늘 날짜 세팅 */
			var today = new Date();
			var dd = today.getDate();
			var MM = today.getMonth()+1;	// 1월 = 0
			var yyyy = today.getFullYear();
			var hh = today.getHours();

			if(dd<10) {
			    dd='0'+dd
			} 

			if(MM<10) {
				MM='0'+MM
			} 

			if(hh<10) {
				hh='0'+hh
			} 
			
			today = yyyy+'-'+MM+'-'+dd;
			
			$("#booking_date").val(today);	// 날짜 세팅
			$("#booking_date_in_layer").val(today);	// 날짜 세팅
			
			
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var dotw = week[new Date(today).getDay()];
			
			$("#week_name_span").text('('+dotw+')');	// 요일 세팅
			
			/* 현재 시간 표시해주기 */
			var timeArr = $(".timeLabel");
			var $timeSpan = $('<span class="recent-time">');
			var $timeImg = $('<img src="resources/images/icon_time.png">');
			
			$timeSpan.append($timeImg);
			
			$.each(timeArr, function(index, value){
				
				if(value.getAttribute('name') == hh){
					
					var img = document.createElement("img");
					img.src = 'resources/images/icon_time.png';
					
					var span = document.createElement("span");
					span.setAttribute('class','recent-time');
					
					span.appendChild(img);
					value.appendChild(span);
				}
			});
			
			/* 예약이 있으면 표시해주기 */
			//console.log($("#time-table td"));
			
			showReserv();
		}
		
		/* 달력 열어서 날짜 바꿨을 때 */
		$("#booking_date").on('change',function(){
			
			/* 바뀐 요일 표시 */
			var bookingDay = $("#booking_date").val();
			
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var dotw = week[new Date(bookingDay).getDay()];
			
			$("#week_name_span").text('('+dotw+')');
	    	
	    	showReserv();
		});
		
		
		/* < , > 버튼 누를때 마다 하루 전, 하루 뒤 날짜 출력하기 */
		function moveDate(condition) {
			
			var oldDate = $("#booking_date").val();
			var newDate = new Date($("#booking_date").val());
			
			var dateArr = oldDate.split('-');
			
			oldDate = new Date(dateArr[0], dateArr[1]-1, dateArr[2]);
			
			if(condition == "next"){
				newDate.setDate(oldDate.getDate()+1);
				
			} else{
				newDate.setDate(oldDate.getDate()-1);
			}
			
			var year = newDate.getFullYear();
 	    	var month = newDate.getMonth()+1;
 	    	var day = newDate.getDate();
 	    	
 	    	if(month < 10){
 	    		month = "0"+month;
 	    	}
 	    	if(day < 10){
 	    		day = "0"+day;
 	    	}
 	    	
	    	var newDate = (year + "-" + month + "-" + day);
			
	    	$("#booking_date").val(newDate);
	    	$("#booking_date_in_layer").val(newDate);
	    	
	    	/* 바뀐 요일 표시 */
			var bookingDay = $("#booking_date").val();
			
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var dotw = week[new Date(bookingDay).getDay()];
			
			$("#week_name_span").text('('+dotw+')');
	    	
	    	showReserv();
		}
		
			
		/* 예약하기 - ajax */
		$("#booking_resource_frm").submit(function(event){
			//form submit 작동 취소
			event.preventDefault();
			
			var $form = $(this);
			var $close = $('.closeBtn');
			
			$.ajax({
				url:"insertReserv.do",
				type:"POST",
				data:$form.serialize(),
				success:function(data){
					
					if(data == "success"){
						alertify.alert('', '예약 성공');
						$close.click();
    				} else{
    					alertify.alert('', '예약 실패');
    				}
				},
				error:function(){
					alertify.alert('', '통신 실패 : 다시 시도해 주세요.');
				}
			});
			
		});
		
		
		/* 해당 날짜에 예약이 있으면 보여주기 */
		function showReserv() {
			var $timePanel = $("#time-table td");
			var temp = $("#booking_date").val(); 
			var startTD;
			var endTD;
			var startPoint;
			var endPoint;
			
			$.each($timePanel, function(i, td){
				if(td.classList.contains('reserv')){
					td.classList.remove('reserv');
				}
			});
			
			
			if(${reservList} != null){
				
					//console.log(${reservList});
				
				$.each(${reservList}, function(i, r){
					
					//console.log(${reservList});
					//console.log(temp);
					//console.log(r.reservDate);
					
					if(r.reservDate == temp){
						//console.log("오늘의 예약 : "+r.reservNum);
						
						$.each($timePanel, function(j, td){
							
							if(r.startTime == td.getAttribute('time')){
								startTD = td;
							}
							if(r.endTime == td.getAttribute('time')){
								endTD = td;
							}
						});
						
						startPoint = $timePanel.index(startTD);
						endPoint = $timePanel.index(endTD);
						//console.log(startTD);
						//console.log(startPoint);
						//console.log(endTD);
						//console.log(endPoint);
						
						for(var i in $timePanel){
							if(i >= startPoint && i <= endPoint-1){
								$timePanel[i].classList.add('reserv');
								$timePanel[i].classList.remove('blank');
								$timePanel[i].setAttribute('value',r.reservNum);
							}
						}
					}
				});
			}			
		}
		
		//예약창 on
		$('#time-table').on('click','.blank',function(){
			// 예약창 띄워주고
			$("#booking_time_layer").addClass('show');
			// 선택한 시간으로 초기 selected 설정
			var time = ($(this).attr('time'));
			
			$.each($('select[name=startTime] option'),function(index, value){
				if(value.value == time){
					$(value).attr('selected',true);
					$('select[name=endTime] option')[index].setAttribute('selected',true);
				}	
			});
		});
		//예약확인창 on
		$('#time-table').on('click','.reserv',function(){
			var thisTD = $(this);
			
			var $dd1 = $(".dd1");
			var $dd2 = $(".dd2");
			var $dd3 = $(".dd3");
			
			$.each(${reservList}, function(i, r){
				
				if(r.reservNum == thisTD[0].getAttribute('value')){
					
					$dd1.text(r.reservDate+' '+r.startTime+' ~ '+r.endTime);
					$dd2.text(r.empName+' '+r.jobName+' ('+r.insertDate+')');
					$dd3.text(r.reason);
				}
			});
			$("#booking_info_detail_layer").addClass('show');
		});
			
				
		
				
				
				
				
		
		
		
	
	</script>
	
	<!-- Javascript -->
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/js/classList.js"></script>

</body>
</html>