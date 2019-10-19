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
										<button type="button" class="icon directleft" onclick="bookingResourceListTime.moveDate('previous');"><span class="blind">전일 이동</span></button>
										<input type="text" class="num datepicker" id="booking_date" value="오늘날짜" style="width:110px;border:none;margin-right:5px;" readonly="">
										<span id="week_name_span">(화)</span>
										<button type="button" class="icon month" onclick="$('#booking_date').focus();"><span class="blind">예약 날짜 선택</span></button>
										<button type="button" class="icon directright" onclick="bookingResourceListTime.moveDate('next');"><span class="blind">익일 이동</span></button>
										<button type="button" class="today-btn vt" onclick="bookingResourceListTime.setToday();">오늘</button>
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
															<tr><th class="rs-time-pri"><span id="rs-scroll-position"></span>오전 9시</th></tr>
															<tr><th class="rs-time-pri">오전 10시</th></tr>
															<tr><th class="rs-time-pri">오전 11시</th></tr>
															<tr><th class="rs-time-pri">오후 12시</th></tr>
															<tr><th class="rs-time-pri">오후 1시</th></tr>
															<tr><th class="rs-time-pri">오후 2시</th></tr>
															<tr><th class="rs-time-pri">오후 3시</th></tr>
															<tr><th class="rs-time-pri"><span class="recent-time"><img src="/static/ui/images/resource/icon_time.png" alt=""></span>오후 4시</th></tr>
															<tr><th class="rs-time-pri">오후 5시</th></tr>
														</tbody>
													</table>
												</td>
												<td style="border-bottom:none;">
													<table class="rs-resource-tbl" id="time-table" no="5109">
														<tbody class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="0"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="0"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="1"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="1"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="2"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="2"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="3"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="3"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="4"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="4"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="5"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="5"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="6"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="6"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="7"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="7"></td></tr>
															<tr><td class="rs-dualmarker rs_time_before ui-selectee" time="8"></td></tr>
															<tr class="rs-dualmarker-21"><td class="rs_time_after ui-selectee" time="8"></td></tr>
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
								<input type="hidden" name="categoryNo" value="4769">
								<div class="title_layer text_variables">예약하기</div>
								<div class="to-add detail-search">
									<dl class="after">
										<dt><label for="">자원 이름</label></dt>
										<dd>
											<select name="resource_no[]" id="resource_list_select" cate_no="4769" resource_type="T" class="select-box" style="width:270px"><option value="5109">회의실</option></select>
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">날짜</label></dt>
										<dd>
											<div class="fl">
												<input type="text" name="date" id="booking_date_in_layer" class="datepicker" style="width:147px;" value="2019-10-14" readonly>
												<button type="button" class="icon month" onclick="$('#booking_date_in_layer').focus();"></button>
											</div>
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">예약 시간</label></dt>
										<dd class="after">
											<div class="fl">
												<select id="start" class="select-box" style="width:125px;" defaulttime="2019-10-14 09:00:00">
													<option value="09:00:00">오전 09:00</option>
													<option value="09:30:00">오전 09:30</option>
													<option value="10:00:00">오전 10:00</option>
													<option value="10:30:00">오전 10:30</option>
													<option value="11:00:00">오전 11:00</option>
													<option value="11:30:00">오전 11:30</option>
													<option value="12:00:00">오후 12:00</option>
													<option value="12:30:00">오후 12:30</option>
													<option value="13:00:00">오후 01:00</option>
													<option value="13:30:00">오후 01:30</option>
													<option value="14:00:00">오후 02:00</option>
													<option value="14:30:00">오후 02:30</option>
													<option value="15:00:00">오후 03:00</option>
													<option value="15:30:00">오후 03:30</option>
													<option value="16:00:00">오후 04:00</option>
													<option value="16:30:00">오후 04:30</option>
													<option value="17:00:00">오후 05:00</option>
													<option value="17:30:00">오후 05:30</option>
												</select>
												 ~
												<select id="end" class="select-box" style="width:125px;" defaulttime="2019-10-14 09:30:00">
													<option value="09:30:00">오전 09:30</option>
													<option value="10:00:00">오전 10:00</option>
													<option value="10:30:00">오전 10:30</option>
													<option value="11:00:00">오전 11:00</option>
													<option value="11:30:00">오전 11:30</option>
													<option value="12:00:00">오후 12:00</option>
													<option value="12:30:00">오후 12:30</option>
													<option value="13:00:00">오후 01:00</option>
													<option value="13:30:00">오후 01:30</option>
													<option value="14:00:00">오후 02:00</option>
													<option value="14:30:00">오후 02:30</option>
													<option value="15:00:00">오후 03:00</option>
													<option value="15:30:00">오후 03:30</option>
													<option value="16:00:00">오후 04:00</option>
													<option value="16:30:00">오후 04:30</option>
													<option value="17:00:00">오후 05:00</option>
													<option value="17:30:00">오후 05:30</option>
													<option value="18:00:00">오후 06:00</option>
												</select>
											</div>
										</dd>
									</dl>
									<dl class="after">
										<dt><label for="">사용 용도</label></dt>
										<dd class="after">
											<textarea class="rs-layer-textarea" name="booking_reason"></textarea>
										</dd>
									</dl>
									<dl class="after hide" id="add_resource_dl">
										<dt><label for="">복수 자원</label></dt>
										<dd class="after">
											<ul class="multi-select" id="resource_list_layer">   </ul>
										</dd>
									</dl>
								</div>
								<div class="layer_button">
									<button type="button" class="btn_variables" onclick="bookingResourceList.addBooking();">저장</button>
									<button type="button" class="booking_layer_close closeBtn">취소</button>
								</div>
								<a href="javascript:void(0)" class="icon btn_close layer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
							</form>
						</div>
						<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 100;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
					</div>
					
					
					<!-- 예약 모달창 끝 ----------------------------------------------------->
					
					
					
					
					
					
					
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
	
		/* $('#booking_date').datepicker(); */
		/* $("#booking_date_in_layer").datepicker(); */
	
		$(function(){
			
			
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_2").addClass("active");
			
			
			$("#time-table tr").on('click',function(){
				$("#booking_time_layer").addClass('show');
			});
			
			
			
			
		});
	
	
	
	</script>
	
	<!-- Javascript -->
	<script src="resources/assets/scripts/klorofil-common.js"></script>


</body>
</html>