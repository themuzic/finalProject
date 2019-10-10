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
							<h3>회의실 <span class="show-rs-info category_detail_view" r_type="C" no="4769">i</span></h3>
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
										<input type="text" class="num datepicker hasDatepicker" id="booking_date" value="2019-10-08" style="width:110px;border:none;margin-right:5px;" readonly=""><span id="week_name_span">(화)</span>
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
																<tr><th scope="col"><span class="resource_name_span" title="회의실" style="text-align: center;">회의실</span> <span class="show-rs-info category_detail_view" r_type="R" no="5109">i</span></th></tr>
																<tr class="rs-bg"><td class=""><img src="/cocoa-test1.onhiworks.com/booking/bookingMain/imageShow/R/5109" alt=""></td></tr>
																<tr><td class="rs-divider-td"><hr class="rs-divider"></td></tr>
															</thead>
														</table>
													</td>
													<td style="border-bottom:none;">
														<table class="rs-no-left-line">
															<thead class="booking_resource_img_top">
																<tr><th scope="col" style="padding:7px 0;"></th></tr>
																<tr class="rs-bg"><td class="rs-btn right cpointer"><span class="icon in_sq deg90" style="position:static;display:inline-block;"></span></td></tr>
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
													<table class="rs-resource-tbl" no="5109">
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
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
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
	
	
	
	</script>

</body>
</html>