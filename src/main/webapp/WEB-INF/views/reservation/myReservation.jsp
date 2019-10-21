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
											
												<c:if test="${ empty reservList }">
													<tr>
														<td colspan="4" class="center">예약 내역이 존재하지 않습니다.</td>
													</tr>
												</c:if>
												
												<c:if test="${ !empty reservList }">
													<c:forEach items="${ reservList }" var="r">
														<c:if test="${r.delStatus eq 'N'}">
															<tr reservnum="${r.reservNum}">
																<td>${r.reservType}</td>
																<td>${r.reservType}</td>
																<td>${r.reservDate} ${r.startTime} ~ ${r.endTime}</td>
																<td>
																	<button type="button" name="button" class="weakblue del_booking_layer_btn" reservnum="${r.reservNum}">삭제</button>
																	<span class="grey_bar">|</span>
																	<button type="button" name="button" class="weakblue booking_detail_view" reservnum="${r.reservNum}">상세보기</button>
																</td>
															</tr>
														</c:if>
														<c:if test="${r.delStatus eq 'Y'}">
															<tr reservnum="${r.reservNum}">
																<td style="color:lightgray">${r.reservType}</td>
																<td style="color:lightgray">${r.reservType}</td>
																<td style="color:lightgray">${r.reservDate} ${r.startTime} ~ ${r.endTime}</td>
																<td>
																	<button type="button" name="button" class="weakblue booking_detail_view" reservnum="${r.reservNum}">상세보기</button>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>
											
												
											
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
												<th scope="col">결제 일시</th>
												<th scope="col">구입 상품</th>
												<th scope="col">총 수량</th>
												<th scope="col">결제 가격</th>
											</tr>
										</thead>
										<tbody id="booking_ready_list_tbody">
										
											<c:if test="${ empty payList }">
												<tr>
													<td colspan="4" class="center">결제 내역이 존재하지 않습니다.</td>
												</tr>
											</c:if>
											
											<c:if test="${ !empty payList }">
												<c:forEach items="${ payList }" var="pay">
													<tr>
														<td>${ pay.payDate }</td>
														<td>${ pay.product }</td>
														<td>${ pay.quantity }</td>
														<td>${ pay.price }</td>
													</tr>
												</c:forEach>
											</c:if>
											
											
										</tbody>
									</table>
								</div>
								<p class="pdt_20">* 문의 사항은 카페로 문의 바랍니다.</p>
							</div>
						</div>
					</div>
					
		
		<!-- 예약 상세보기 모달 시작 ----------------------------------------------------->
		
		<div id="booking_detail_layer" class="booking_layer_div layer_box hide">
			<div class="layer_box detail_layer" style="z-index: 1005;">
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
							<dd class="dd3"></dd>
						</dl>
						<dl class="after">
							<dt><label for="">예약 상태</label></dt>
							<dd class="dd4"></dd>
						</dl>
				</div>
			
				<div class="layer_button">
					<button type="button" class="btn_variables booking_layer_close closeBtn">확인</button>
							<!--button type="button" class="btn_variables">수정</button--> 
					<button type="button" class="warning del_booking_layer_btn" reservnum="">삭제</button>
				</div>
				<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
			</div></div>
			
			<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
		</div>
					
		<!-- 예약 상세보기 모달 끝 ----------------------------------------------------->
					
		<!-- 예약 삭제 모달 시작 ----------------------------------------------------->
		
		<div id="booking_del_layer" class="booking_layer_div layer_box hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup4" style="margin-left: -175px; margin-top: -120px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 삭제</div>
					<div>
						<div>예약을 삭제하시겠습니까?</div>
					</div>

					<div class="layer_button">
						<button type="button" class="btn_variables del_booking_btn" id="delBtn" >확인</button>
						<button type="button" class="booking_layer_close closeBtn">취소</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
		</div>
		
		
		<!-- 예약 삭제 모달 끝 ----------------------------------------------------->
					
					
					
					
					
					
					
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
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<script src="resources/js/main.js"></script>
 	<script src="resources/js/common_new.js"></script>
	
	<!-- script 작성 -->
	<script>
		$(function(){
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_1").addClass("active");
			
		});
		
		/* 예약 상세 보기 창 on */
		$(".booking_detail_view").on('click',function(){
			
			var thisTD = $(this);
			
			var $dd1 = $(".dd1");
			var $dd2 = $(".dd2");
			var $dd3 = $(".dd3");
			var $dd4 = $(".dd4");
			var $del = $("#booking_detail_layer").find(".del_booking_layer_btn");
			
			$.each(${rList}, function(i, r){
				
				if(r.reservNum == thisTD[0].getAttribute('reservnum')){
					
					$dd1.text(r.reservDate+' '+r.startTime+' ~ '+r.endTime);
					$dd2.text(r.empName+' '+r.jobName+' ('+r.insertDate+')');
					$dd3.text(r.reason);
					$del.attr('reservnum',r.reservNum);
					
					if(r.delStatus == 'N'){
						$dd4.css('color','#676767');
						$dd4.text('예약 완료');
						
						if($del.hasClass('hide')){
							$del.removeClass('hide');
						}
						
					} else{
						$dd4.text('예약 삭제 완료');
						$dd4.css('color','red');
						$del.addClass('hide');
					}
				}
			});
			
			$("#booking_detail_layer").addClass('show');
		});
		
		/* 예약 삭제 창 on */
		$(".del_booking_layer_btn").on('click',function(){
			
			$("#delBtn").attr('reservnum',$(this).attr('reservnum'));
			
			$("#booking_del_layer").addClass('show');
		});
		
		/* 삭제 버튼 */
		$("#delBtn").on('click',function(){
			
			var $close = $("#booking_del_layer .closeBtn");
			var rNum = $(this).attr('reservnum');
			var $tr = $("#booking_list_tbody tr");
			
			$.ajax({
				url:"deleteReserv.do",
				type:"POST",
				data:{reservNum:rNum,
					  empId:${loginUser.empId}					
				},
				success:function(data){
					
					if(data == "success"){
						
						$.each($tr, function(index, tr){
							if(tr.getAttribute('reservnum') == rNum){
								tr.childNodes[1].style.color = 'lightgray';
								tr.childNodes[3].style.color = 'lightgray';
								tr.childNodes[5].style.color = 'lightgray';
								tr.childNodes[7].childNodes[1].classList.add('hide');
								tr.childNodes[7].childNodes[3].classList.add('hide');
							}
						});
						$close.click();
						
    				} else{
    					alertify.alert('', '예약 내역 삭제 실패');
    				}
				},
				error:function(){
					alertify.alert('', '통신 실패 : 다시 시도해 주세요.');
				}
			});
			
			
			
		});
		
		
		
		
		
		
		
	
	</script>

</body>
</html>