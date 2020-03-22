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
	.contentWrap{
		float:left;
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:40px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	.test{
		border:1px solid black;
	}
	.titleLabel{
		font-size: 15px;
		margin-right:20px;
	}
	.insert-wrap{
		padding:20px;
	}
	.input{
		margin-bottom:20px;
	}
	.layer_button{
		text-align: center;
	}
	#saveBtn{
		background: #fff;
	    padding: 5px 27px 6px;
	    border: 1px solid #c8c8c8;
	    color: #2c86dc;
	}
	.helpDiv{
		height: 450px;
	}
	.helpTitle{
	
	}
	.helpTable th{
		text-align:center;
		background: white;
		border:1px solid #cdcdcd;
	}
	.helpTable{
		display: block;
		border-collapse:collapse;
		overflow:auto;
	}
	.help-wrap{
		padding: 0 20px;
	}
	#helpTbody{
		display: block;
	    overflow-y: auto;
    	overflow-x: hidden;
	    height: 400px;
	}
	#bringTbody{
		display: block;
	    overflow-y: auto;
    	overflow-x: hidden;
	    height: 400px;
	}
	#helpTbody td, #bringTbody td{
		border:1px solid #ececec;
		font-size: 13px;
		height:35px;
	}
	#helpTbody td:first-child, #helpTbody td:last-child{
		text-align: center;
	}
	#bringTbody td:first-child, #bringTbody td:last-child{
		text-align: center;
	}
	.title{
		padding-left:3px;
		margin-bottom:7px;
		font-size: 16px;
		color:#3287B2;
		font-weight: bold;
	}
	#helpTbody tr:hover td{
		background:#dbecff;
		cursor:pointer;
	}
	#bringTbody tr:hover td{
		background:#dbecff;
		cursor:pointer;
	}
	.layer_box.middle{
		padding: 25px 40px 30px !important;
	}
	.form{
		margin-bottom:20px;
	}
	.layer_button {
		margin-top:15px !important;
	}
	body{
		overflow: hidden;
	}
	.contentDiv{
		border-left:1px solid #ececec;
		border-right:1px solid #ececec;
		border-bottom:1px solid #ececec;
		padding:5px 10px 10px 10px;
		width:557px;
	}
	
	
</style>


</head>
<body>
<fmt:formatDate var="now" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss"/>
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
					<div class="setting_title">
						<h3 style="font-weight: bold;">품앗이</h3>
					</div>
					<br>
					
					<table>
						<colgroup>
							<col style="width:47%;">
							<col>
							<col style="width:47%;">
						</colgroup>
						<tr>
							<td>
								<div class="help-wrap">
									<div class="helpTitle">
										<label class="title fl">도와주세요</label>
										<div id="radioDiv" class="fl" style="margin-left:20px">
											<input type="radio" name="condition" id="radio1" value="all" onclick="refresh();" checked>
											<label for="radio1" class="helpLabel" id="label1">전체 목록</label>
											<input type="radio" name="condition" id="radio2" value="my" onclick="refresh();" style="margin-left:7px;">
											<label for="radio2" class="helpLabel" id="label2">내 목록</label>
										</div>
										<i class="fas fa-plus fr" id="addHelp" style="padding-top:6px;margin-right:20px;cursor:pointer;" title="일감 추가"></i>
									</div>
									<div class="helpDiv">
										<table class="helpTable">
											<%-- <colgroup>
												<col style="width:150px;">
												<col>
												<col style="width:128px;">
											</colgroup> --%>
											<thead>
												<tr>
													<th style="border-right:1px solid #ececec;width: 150px;">등록일</th>
													<th style="border-right:1px solid #ececec;width: 278px;">제목</th>
													<th id="th" style="width: 128px;">등록자</th>
												</tr>
											</thead>
											<tbody id="helpTbody"></tbody>
										</table>
									</div>
								</div>
							</td>
							
							<td></td>
							
							<td>
								<div class="help-wrap">
									<div class="helpTitle">
										<label class="title fl">내가 가져온 일감</label>
										<div id="myStarDiv" class="fl" style="margin-left:20px">
										나의 별 갯수 : <span id="myStar">${loginUser.star}</span>
										</div>
									</div>
									<div class="helpDiv">
										<table class="helpTable">
											<%-- <colgroup>
												<col style="width:150px;">
												<col>
												<col style="width:128px;">
											</colgroup> --%>
											<thead>
												<tr>
													<th style="border-right:1px solid #ececec;width: 150px;">가져온 일자</th>
													<th style="border-right:1px solid #ececec;width: 278px;">제목</th>
													<th style="width: 128px;">등록자</th>
												</tr>
											</thead>
											<tbody id="bringTbody"></tbody>
										</table>
									</div>
								</div>
							</td>
						</tr>
					</table>
					
					
					
						
						
						
						<!-- 일감 등록 모달 시작 ----------------------------------------------------->
		
						<div id="addHelpLayer" class="booking_layer_div layer_box hide">
							<div class="layer_box" style="z-index: 1005;">
								<div class="layer_box middle popup4" style="margin-left:-300px;margin-top:-250px; display:block;z-index:1005; width:600px;">
									<div class="">
										<label style="font-weight:bold;font-size:16px;height:40px;padding:10px 20px 10px 5px;">일감 등록</label>
									</div>
									<br>
							  		<!-- <label class="titleLabel">제목</label> -->
									<div class="ui input">
										<input type="text" class="addHelpInput" id="addHelpTitle" size="56" style="font-size:16px;height:40px;padding:15px 16px;" placeholder="제목">
									</div>
									<!-- <label class="titleLabel">내용</label> -->
									<!-- <div style="width:60%;"> -->
										<div class="ui form">
											<div class="field">
												<textarea id="addHelpContent" class="addHelpInput" rows="5" style="resize:none;font-size:16px;" placeholder="내용"></textarea>
											</div>
										</div>
									<!-- </div> -->
									<div class="ui input">
										<input type="text" id="addHelpReason" class="addHelpInput" size="56" style="font-size:16px;height:40px;padding:15px 16px;" placeholder="사유">
									</div>
									<div class="layer_button">
										<button type="button" class="btn_variables" id="saveBtn">등록</button>
										<button type="button" class="closeBtn">취소</button>
									</div>
									<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close closeBtn" title="레이어 닫기"><span class="blind">닫기</span></a>
								</div>
							</div>
							<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
						</div>
						
						
						<!-- 일감 등록 모달 끝 ----------------------------------------------------->
						
						
						<!-- 일감 가져오기 확인 모달 시작 ----------------------------------------------------->
						<div id="bring_check_layer" class="booking_layer_div layer_box hide">
							<div class="layer_box" style="z-index: 1005;">
								<div class="layer_box middle popup4" style="margin-left: -175px; margin-top: -120px; display: block; z-index: 1005;">
									<div class="title_layer text_variables">품앗이</div>
									<div>
										<div style="text-align:center;">일감을 가져오시겠습니까?</div>
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
						<!-- 일감 가져오기 확인 모달 끝 ----------------------------------------------------->
						
						<!-- 예약 확인 모달창 시작 ----------------------------------------------------->
					
						<div id="detail_check_layer" class="booking_layer_div layer_box hide">
							<div class="layer_box" style="z-index: 1005;">
								<div class="layer_box mid_large popup3" style="margin-left: -256px; margin-top: -205px; display: block; z-index: 1005;">
									<div class="title_layer text_variables">일감 확인</div>
									<div class="to-add">
										<dl class="after">
											<dt><label for="">일감 제목</label></dt>
											<dd id="hh1">회의실</dd>
										</dl>
										<dl class="after">
											<dt><label for="">등록일</label></dt>
											<dd id="hh2"></dd>
										</dl>
										<dl class="after">
											<dt><label for="">등록자</label></dt>
											<dd id="hh3"></dd><input type="hidden" name="hhEmpId" value="" id="hh6">
										</dl>
										<dl class="after">
											<dt><label for="">일감 내용</label></dt>
											<dd id="hh4">설계 회의</dd>
										</dl>
										<dl class="after">
											<dt><label for="">사유</label></dt>
											<dd id="hh5">예약 완료</dd>
										</dl>
									</div>
								
									<div class="layer_button">
										<input type="hidden" name="workId" id="hh7" value="">
										<button type="button" class="btn_variables booking_layer_close bringBtn" id="btn">가져오기</button>										
										<button type="button" class="booking_layer_close closeBtn">닫기</button>
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
			refresh();
			callBringList();
			$('#label1').click();
			
			$("#menu3_1").removeClass("collapsed");
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_3").addClass("active");	
			
			$('#helpTbody').slimScroll({
		        height: '351px',
		        railVisible: true,
		        railColor: '#222',
		        railOpacity: 0.3,
		        wheelStep: 10,
		        allowPageScroll: false,
		        disableFadeOut: false
		    });
			
			$('#bringTbody').slimScroll({
		        height: '351px',
		        railVisible: true,
		        railColor: '#222',
		        railOpacity: 0.3,
		        wheelStep: 10,
		        allowPageScroll: false,
		        disableFadeOut: false
		    });
		});
		
		/*  전체/내가 등록한 일감 라디오 버튼 */
		$(document).on('click',"#label1",function(){
			$("#label1").addClass('helphelp');
			$("#label2").removeClass('helphelp');
		});
		$(document).on('click',"#label2",function(){
			$("#label2").addClass('helphelp');
			$("#label1").removeClass('helphelp');
		});
		
		
		/* 일감 등록창 여는 버튼 눌렀을 때 */
		$("#addHelp").on('click',function(){
			$("#addHelpTitle").val("");
			$("#addHelpContent").val("");
			$("#addHelpReason").val("");
			$("#addHelpLayer").addClass('show');
		});
		
		/* 일감 등록 모달에서 등록 버튼 눌렀을 때 */
		$("#saveBtn").on('click',function(){
			
			var title = $("#addHelpTitle").val();
			var content = $("#addHelpContent").val();
			var reason = $("#addHelpReason").val();
			$("#addHelpTitle").val("");
			$("#addHelpContent").val("");
			$("#addHelpReason").val("");
			
			$.ajax({
				url:"insertHelp.do",
				type:"POST",
				data:{empId:'${loginUser.empId}',
					workTitle:title,
					workContent:content,
					reason:reason
				},
				success:function(data){
					if(data == 'success') refresh();
					else alertify.alert('','일감 등록 실패');
				},
				error:function(){
					alertify.alert('','AJAX통신 실패');
				}
			});
			$("#addHelpLayer").removeClass('show');
		});
		
		function refresh(){
			var condition = $('input[name=condition]:checked').val();
			
			if(condition == 'all') $("#th").text('등록자');
			else $("#th").text('진행 상태');
			
			$("#helpTbody").html("");
			
			$.ajax({
				url:"selectHelp.do",
				type:"POST",
				data:{empId:'${loginUser.empId}',
					condition:condition
				},
				success:function(data){
					if(data != ""){
						$.each(data, function(index, help){
							
							var helpPK = $("<input type='hidden' name='workId'>").val(help.workId);
							var helpTitle = $("<input type='hidden' name='workTitle'>").val(help.workTitle);
							var helpEmpId = $("<input type='hidden' name='empId'>").val(help.empId);
							var helpEmpName = $("<input type='hidden' name='empName'>").val(help.empName);
							var helpContent = $("<input type='hidden' name='workContent'>").val(help.workContent);
							var helpReason = $("<input type='hidden' name='reason'>").val(help.reason);
							var helpDate = $("<input type='hidden' name='registDate'>").val(help.registDate);
							
							var tr = $('<tr>');
							var td1 = $('<td style="text-align:center;width:150px;">').text(help.registDate);
							var td2 = $('<td style="padding:0 10px;width:278px;">').text(help.workTitle);
							var td3;
							
							if(condition == 'all'){
								$("#th").text('등록자');
								td3 = $('<td style="width:128px;">').text(help.empName);
							}else{
								$("#th").text('진행 상태');
								td3 = $('<td style="width:128px;">').text((help.helperId == "")? '대기중' : '진행중');
							}
							
							tr.append(helpPK);
							tr.append(helpTitle);
							tr.append(helpEmpId);
							tr.append(helpEmpName);
							tr.append(helpContent);
							tr.append(helpReason);
							tr.append(helpDate);
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							
							$("#helpTbody").append(tr);
						});
					}else{
						var tr = $('<tr>');
						var td = $('<td colspan="3" style="width:556px;height:50px;text-align:center;font-size:16px;font-weight:bold;">').text("등록된 일감이 없습니다.");
						tr.append(td);
						$("#helpTbody").append(tr);
					}
				},
				error:function(){
					console.log('AJAX통신 실패');
				}
			});
		}
		
		/* 등록된 일감을 눌렀을 때 */
		$("#helpTbody").on('click','tr',function(){
			$("#hh1").text($(this).find('input[name=workTitle]').val());	//제목
			$("#hh2").text($(this).find('input[name=registDate]').val());	//등록일
			$("#hh3").text($(this).find('input[name=empName]').val());		//등록자
			$("#hh4").text($(this).find('input[name=workContent]').val());	//일감내용
			$("#hh5").text($(this).find('input[name=reason]').val());		//사유
			$("#hh6").val($(this).find('input[name=empId]').val());			//사번
			$("#hh7").val($(this).find('input[name=workId]').val());		//일감번호
			
			if('${loginUser.empId}' == $(this).find('input[name=empId]').val()){
				$("#btn").removeClass('btn_variables');
				$("#btn").removeClass('bringBtn');
				$("#btn").addClass('warning');
				$("#btn").addClass('delBtn');
				$("#btn").text('삭제');
			} else {
				if($("#btn").text() != '가져오기'){
					$("#btn").removeClass('warning');
					$("#btn").removeClass('delBtn');
					$("#btn").addClass('btn_variables');
					$("#btn").addClass('bringBtn');
					$("#btn").text('가져오기');
				}
			}
			if($(this).text() != '등록된 일감이 없습니다.'){
				$("#detail_check_layer").addClass('show');
			}
		});
		/* 일감 삭제 눌렀을 때 */
		$(document).on('click','.delBtn',function(){
			
			var workId=$(this).prev().val();
			
			$.ajax({
				url:"deleteHelp.do",
				type:"POST",
				data:{empId:'${loginUser.empId}',
					workId:workId
				},
				success:function(data){
					if(data == 'success'){
						refresh();
					}else{
						alertify.alert('','일감 삭제 실패');
					}
				},
				error:function(){
					alertify.alert('','AJAX통신 실패');
				}
			});
			$(this).next().click();
		});
		
		/* 일감 가져오기 눌렀을 때 */
		$(document).on('click','.bringBtn',function(){
			var workId = $("#hh7").val();
			
			$.ajax({
				url:"updateHelp.do",
				type:"POST",
				data:{helperId:'${loginUser.empId}',
					workId:workId
				},
				success:function(data){
					if(data == 'success'){
						callBringList();
						refresh();
					}else{
						alertify.alert('','일감 가져오기 실패');
					}
				},
				error:function(){
					alertify.alert('','AJAX통신 실패');
				}
			});
			$(this).next().click();
		});
		
		/* 가져온 일감 완료 눌렀을 때 */
		$(document).on('click','.comBtn',function(){
			var workId = $(this).next().val();
			
			$.ajax({
				url:"completeHelp.do",
				type:"POST",
				data:{helperId:'${loginUser.empId}',
					workId:workId
				},
				success:function(data){
					if(data == 'success'){
						callBringList();
						var star=$("#myStar").text();
						$("#myStar").text(Number(star)+1);
						alertify.alert('','별 1개가 적립되었습니다.');
					}else{
						alertify.alert('','일감 완료 실패');
					}
				},
				error:function(){
					alertify.alert('','AJAX통신 실패');
				}
			});
			$(this).next().click();
		});
		
		/* 내가 가져온 일감 뿌려주기 */
		function callBringList(){
			
			$("#bringTbody").html("");
			
			$.ajax({
				url:"selectBringHelp.do",
				type:"POST",
				data:{helperId:'${loginUser.empId}'
				},
				success:function(data){
					if(data != ""){
						
						$.each(data,function(index, help){
							var helpPK = $("<input type='hidden' name='workId'>").val(help.workId);
							var helpTitle = $("<input type='hidden' name='workTitle'>").val(help.workTitle);
							var helpEmpId = $("<input type='hidden' name='empId'>").val(help.empId);
							var helpEmpName = $("<input type='hidden' name='empName'>").val(help.empName);
							var helpContent = $("<input type='hidden' name='workContent'>").val(help.workContent);
							var helpReason = $("<input type='hidden' name='reason'>").val(help.reason);
							var helpDate = $("<input type='hidden' name='registDate'>").val(help.registDate);
							var bringDate = $("<input type='hidden' name='bringDate'>").val(help.bringDate);
							
							var tr = $('<tr>');
							var td1 = $('<td style="text-align:center;width:150px;">').text(help.bringDate);
							var td2 = $('<td style="padding:0 10px;width:278px;">').text(help.workTitle);
							var td3 = $('<td style="width:128px;">').text(help.empName);
							
							tr.append(helpTitle);
							tr.append(helpEmpId);
							tr.append(helpEmpName);
							tr.append(helpContent);
							tr.append(helpReason);
							tr.append(helpDate);
							tr.append(bringDate);
							tr.append(td1);
							tr.append(td2);
							tr.append(td3);
							
							var div = $('<div class="contentDiv" style="display:none;padding-left: 50px;">').text(help.workContent);
							var div2 = $('<div class="btnDiv" style="text-align:right">');
							var btn = $('<button class="comBtn ui primary button" style="font-size:10px;">').text("완료");
							div2.append(btn);
							div2.append(helpPK);
							div.append(div2);
							
							$("#bringTbody").append(tr);
							$("#bringTbody").append(div);
						});
					}else{
						var tr = $('<tr>');
						var td = $('<td colspan="3" style="width:556px;height:50px;text-align:center;font-size:16px;font-weight:bold;">').text("가져온 일감이 없습니다.");
						
						tr.append(td);
						$("#bringTbody").append(tr);
					}
				},
				error:function(){
					alertify.alert('','AJAX통신 실패');
				}
			});
		}
		
		/* 가져온 일감을 누르면 */
		$("#bringTbody").on('click','tr',function(){
			
			if($(this).hasClass('open')){
				$(this).removeClass('open');
				$(this).next('div').slideUp();
			}else{
				$("#bringTbody tr").removeClass('open');
				$(this).addClass('open');
				$('.contentDiv').slideUp();
				$(this).next('div').slideDown();
			}
		});
		
		/* 현재 시간 출력해주는 메소드 */
		function getTimeStamp() {
			  var d = new Date();
			  var s =
			    leadingZeros(d.getFullYear(), 4) + '-' +
			    leadingZeros(d.getMonth() + 1, 2) + '-' +
			    leadingZeros(d.getDate(), 2) + ' ' +

			    leadingZeros(d.getHours(), 2) + ':' +
			    leadingZeros(d.getMinutes(), 2) + ':' +
			    leadingZeros(d.getSeconds(), 2);

			  return s;
		}

		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
		
		
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/semantic/form.js"></script>
	
</body>
</html>