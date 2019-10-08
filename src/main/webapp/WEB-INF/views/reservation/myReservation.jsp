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
							<h3 style="font-weight: bold;">나의 예약 목록</h3>
						</div>
					<div class="content_inbox">
						<!-- Contents -->
						<div class="setting_field" style="margin-bottom:50px;">
							<h4>예약 목록</h4>
							<div class="pdb_50">
								<table class="tableType01 rs-table">
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">분류</th>
											<th scope="col">자원명</th>
											<th scope="col">예약 시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody id="booking_list_tbody">
										<tr>    
											<td>회의실</td>
											<td>회의실</td>
											<td>2019-10-09 03:00 ~ 2019-10-09 04:00</td>
											<td>
												<button type="button" name="button" class="weakblue del_booking_layer_btn" booking_no="11203">삭제</button>
												<span class="grey_bar">|</span>
												<button type="button" name="button" class="weakblue booking_detail_view" booking_no="11203">상세보기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="">
								<h4>결제 목록</h4>
								<table class="tableType01 rs-table">
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">분류</th>
											<th scope="col">자원명</th>
											<th scope="col">예약 시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody id="booking_ready_list_tbody"><tr><td colspan="4" class="center">리스트가 존재하지 않습니다.</td></tr></tbody>
								</table>
							</div>
							<p class="pdt_20">* 대기 목록은 7일 후 자동 삭제됩니다.</p>
						</div>
					</div>
			
			<!-- 
			<script id="booking_list_template" type="text/x-jquery-tmpl">
				{{if booking.length > 0}}
					{{each booking}}
				<tr>
					<td>${category_name}</td>
					<td>${resource_name}</td>
					{{if resource_type == 'D'}}
						<td>${bookingCommon.makeDate(start_date).format('Y-m-d a')} ~ ${bookingCommon.makeDate(end_date, '', '-12 hours').format('Y-m-d a')}</td>
					{{else}}
						<td>${bookingCommon.makeDate(start_date).format('Y-m-d H:i')} ~ ${bookingCommon.makeDate(end_date).format('Y-m-d H:i')}</td>
					{{/if}}
					<td>
						{{if bookingCommon.dateDiff(new Date(), bookingCommon.makeDate(start_date)) }}
							<button type="button" name="button" class="weakblue del_booking_layer_btn" booking_no="${no}">${bookingCommon.getLangMessage('booking_html_del')}</button>
						{{else}}
							<button type="button" name="button" class="weakblue booking_return_layer_btn" booking_no="${no}">${bookingCommon.getLangMessage('booking_html_return')}</button>
						{{/if}}
						<span class="grey_bar">|</span>
						<button type="button" name="button" class="weakblue booking_detail_view" booking_no="${no}">${bookingCommon.getLangMessage('booking_html_detail_view')}</button>
					</td>
				</tr>
			{{/each}}
		{{else}}
			<tr><td colspan="4" class="center">${bookingCommon.getLangMessage('booking_html_no_list')}</td></tr>
		{{/if}}
			</script>
			<script id="booking_ready_list_template" type="text/x-jquery-tmpl">
		{{if ready.length > 0}}
			{{each ready}}
				<tr>
					<td>${category_name}</td>
					<td>${resource_name}</td>
					{{if resource_type == 'D'}}
						<td>${bookingCommon.makeDate(start_date).format('Y-m-d a')} ~ ${bookingCommon.makeDate(end_date, '', '-12 hours').format('Y-m-d a')}</td>
					{{else}}
						<td>${bookingCommon.makeDate(start_date).format('Y-m-d H:i')} ~ ${bookingCommon.makeDate(end_date).format('Y-m-d H:i')}</td>
					{{/if}}
					<td>
						<span class="point_color booking_detail_view cpointer" booking_no="${no}">${status_name}</span>
					</td>
				</tr>
			{{/each}}
		{{else}}
			<tr><td colspan="4" class="center">${bookingCommon.getLangMessage('booking_html_no_list')}</td></tr>
		{{/if}}
			</script>	
			
			 -->	
		</div>
					
		
		<!-- 상세보기 모달 시작 ----------------------------------------------------->
		
		<div id="booking_detail_layer" class="booking_layer_div layer_box hide">
			<div class="layer_box detail_layer" style="z-index: 1005;">
				<div class="layer_box mid_large popup3" style="margin-left: -256px; margin-top: -205px; display: block; z-index: 1005;">
				<div class="title_layer text_variables">예약 확인</div>
				<div class="to-add">
						<dl class="after">
							<dt><label for="">자원 이름</label></dt>
							<dd>
								회의실				</dd>
						</dl>
						<dl class="after">
							<dt><label for="">예약 시간</label></dt>
							<dd>
								2019-10-09 오전 03:00 ~ 오전 04:00				</dd>
						</dl>
						<dl class="after">
							<dt><label for="">등록자</label></dt>
							<dd>
								전재광(2019-10-08 15:33:07)
							</dd>
						</dl>
						<dl class="after">
							<dt><label for="">사용 용도</label></dt>
							<dd>
								회의				</dd>
						</dl>
						<dl class="after">
							<dt><label for="">예약 상태</label></dt>
							<dd>
								예약 완료				</dd>
						</dl>
				</div>
			
				<div class="layer_button">
					<button type="button" class="btn_variables booking_layer_close closeBtn">확인</button>
							<!--button type="button" class="btn_variables">수정</button--> 
					<button type="button" class="warning del_booking_layer_btn" booking_no="11203">삭제</button>
				</div>
				<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
			</div></div>
			
			<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
		</div>
					
		<!-- 상세보기 모달 끝 ----------------------------------------------------->
					
		<!-- 삭제 모달 시작 ----------------------------------------------------->
		
		<div id="booking_del_layer" class="booking_layer_div layer_box hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup4" style="margin-left: -175px; margin-top: -120px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 삭제</div>
					<div>
						<div>예약을 삭제하시겠습니까?</div>
					</div>

					<div class="layer_button">
						<button type="button" class="btn_variables del_booking_btn" booking_no="11203">확인</button>
						<button type="button" class="booking_layer_close closeBtn">취소</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
		</div>
		
		
		<!-- 삭제 모달 끝 ----------------------------------------------------->
					
					
					
					
					
					
					
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
	
	<script src="resources/js/main.js"></script>
 	<script src="resources/js/common_new.js"></script>
	<script src="resources/js/approval_dext.js"></script>
	<script src="resources/js/approval_table.js"></script>
	
	<!-- script 작성 -->
	<script>
		$(function(){
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_1").addClass("active");
			
			
			$(".booking_detail_view").on('click',function(){
				$("#booking_detail_layer").addClass('show');
			});
			
			$(".del_booking_layer_btn").on('click',function(){
				$("#booking_del_layer").addClass('show');
			});
			
			
		});
	
	</script>

</body>
</html>