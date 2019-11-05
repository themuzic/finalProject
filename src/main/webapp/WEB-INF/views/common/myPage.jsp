<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
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
	padding-bottom:30px;
	padding-left:50px;
	padding-right:50px;
	font-size:14px;
}
.main-header{
	width:100%;
	height:30%;
	float:left;
}
.header-right{
    width: 300px;
    float: right;
    margin-left: 40px;
}
.header-right tr{
	height: 30px;
}
.header-right td{
	font-size:16px;
}
.header-left{
	width: 197px;
	float: left;
	overflow: hidden;
	border-radius: 50%;
}
.header-left img{
	width: 100%;
	height: 100%;
}
.main-section{
	width: 100%;
	height: 70%;
}
td{
	border: 0px !important;
}
.userTr{
	padding-left:30px;
	width:50%;
}
.userTr input{
	width:60%;
}
#update{
	margin:0px;
	margin-left:-20px;
}
#statusMsg{
	margin-top:15px;
}
input[type=text]{
	height:30px;
}
.main-section input[type=text]{
	width:400px;
}
.profile-info ul > li {
    margin-bottom: 10px !important;

}
#widgetSettingTable td{
	padding: 7px 0;
	color:lightgray;
}
.widgetCheck{
	opacity: 0;
}
#widgetSettingTable tr>td:last-child {
	text-align: right;
	padding: 0;
}
#pTable td{
	padding: 0 8px 14px 8px;
}
#pTable tr>td:last-child{
	text-align: right;
}
.pBtn{
	
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
					
					
					<div class="panel panel-profile">
						<div class="clearfix" style="height: 740px;">
							<!-- LEFT COLUMN -->
							<div class="profile-left">
								<!-- PROFILE HEADER -->
								<div class="profile-header">
									<div class="overlay"></div>
									<div class="profile-main">
										<div id="imgInputArea" class="hide">
											<input type="file" id="imgUpdate" name="profile" onchange='loadImg(this)'>
										</div>
										<img src="resources/upload/profile/${loginUser.profilePath}" id="profileImg" class="img-circle profileImgArea" style="width:150px;">
										<h3 class="name">${loginUser.empName} ${loginUser.jobName}</h3>
										<span id="statusMsgSpan">${loginUser.statusMsg}</span>
										<span><div class="ui input"><input type="text" id="statusMsg" class="hide" style="height:20px;background:#F8F8F8;text-align:right;margin:0;"></div></span>
									</div>
									<div class="profile-stat">
										<div class="row">
											<div class="col-md-4 stat-item">
												입사일 <span>${loginUser.enrollDate}</span>
											</div>
											<div class="col-md-4 stat-item">
												남은 연차 일수 <span>${loginUser.vacation}일</span>
											</div>
											<div class="col-md-4 stat-item">
												별  <span id="star">${loginUser.star}개</span>
											</div>
										</div>
									</div>
								</div>
								<!-- END PROFILE HEADER -->
								<!-- PROFILE DETAIL -->
								<div class="profile-detail">
									<div class="profile-info">
										<h3 class="heading" style="margin-bottom:16px;">Profile</h3>
										<ul class="list-unstyled list-justify profile-ul">
											<li>ID <span id="id">${loginUser.empId}</span></li>
											<li>BIRTHDAY <span id="birth">${loginUser.birth}</span></li>
											<li>DEPARTMENT <span id="deptName">${loginUser.deptName}</span></li>
											<li>EMAIL <span id="email">${loginUser.email}</span></li>
											<li>MOBILE <span id="phoneSpan">${loginUser.phone}</span>
												<span><div class="ui input"><input type="text" id="phone" class="hide" style="height:20px;background:#F8F8F8;text-align:right;"></div></span>
											</li>
											<li>ADDRESS <span id="addressSpan">${loginUser.address}</span>
												<span><div class="ui input"><input type="text" id="address" class="hide" style="height:20px;background:#F8F8F8;text-align:right;"></div></span>
											</li>
										</ul>
									</div>
									<!-- 
									<div class="profile-info">
										<h4 class="heading">About</h4>
										<p>Interactively fashion excellent information after distinctive outsourcing.</p>
									</div>
									-->
									<div class="text-center" style="margin-top:60px">
										<div class="ui toggle checkbox">
										  <input type="checkbox" name="public" id="update" style="opacity: 0;">
										  <label style="font-size: 17px;padding-top:0;">Edit Profile</label>
										</div>
									</div>
								</div>
								<!-- END PROFILE DETAIL -->
							</div>
							<!-- END LEFT COLUMN -->
							<!-- RIGHT COLUMN -->
							<div class="profile-right">
								<h4 class="heading" style="padding-bottom:19px;">위젯 설정</h4>
								<!-- AWARDS -->
								<div class="awards" style="margin-bottom:10px;">
									<div class="row fl" style="padding:0 30px;width: 60%;">
										
										<table id="widgetSettingTable" style="">
										
											<tr>
												<td>근태 정보</td>
												<td>
													<div class="column">
													    <div class="ui test toggle checkbox">
													      <input type="checkbox" name="1" class="widgetCheck" checked="">
													      <label></label>
													    </div>
												  	</div>
												</td>
											</tr>
											<tr>
												<td>전자 결재</td>
												<td>
													<div class="column">
													    <div class="ui test toggle checkbox">
													      <input type="checkbox" name="2" class="widgetCheck" checked="">
													      <label></label>
													    </div>
												  	</div>
												</td>
											</tr>
											<tr>
												<td>TO-DO</td>
												<td>
													<div class="column">
													    <div class="ui test toggle checkbox">
													      <input type="checkbox" name="3" class="widgetCheck" checked="">
													      <label></label>
													    </div>
												  	</div>
												</td>
											</tr>
											<tr>
												<td>받은 메일함</td>
												<td>
													<div class="column">
													    <div class="ui test toggle checkbox">
													      <input type="checkbox" name="4" class="widgetCheck" checked="">
													      <label></label>
													    </div>
												  	</div>
												</td>
											</tr>
											<tr>
												<td>게시판</td>
												<td>
													<div class="column">
													    <div class="ui test toggle checkbox">
													      <input type="checkbox" name="5" class="widgetCheck" checked="">
													      <label></label>
													    </div>
												  	</div>
												</td>
											</tr>
										</table>
										
										<div id="widgetBtnDiv" style="text-align:right;font-size:13px;margin-top:10px;">
											<div class="ui positive check button" id="allCheck" style="font-size:13px;">전체 선택</div>
											<div class="ui negative uncheck button" id="allUnCheck" style="font-size:13px;">전체 해제</div>
										</div>
										
									</div>
									
									<!-- 상품권 div -->
									<div class="row fl" style="width: 370px;padding: 5px 20px;height: 240px;">
									
									<table id="pTable">
										<tbody style="border-left: 1px solid #eaeaea;">
											<tr>
												<td rowspan="6"></td>
												<td>상품권 20만원(별20개)</td>
												<td><button class="ui primary button pBtn" name="20">지급신청</button></td>
											</tr>
											<tr>
												<td>상품권 50만원(별45개)</td>
												<td><button class="ui primary button pBtn" name="45">지급신청</button></td>
											</tr>
											<tr><td></td><td></td></tr>
											<tr><td></td><td></td></tr>
											<tr><td></td><td></td></tr>
											<tr style="height: 110px;"><td></td><td></td></tr>
										</tbody>
									</table>
									
									</div>
									
									
									
								</div>
								<!-- END AWARDS -->
								<br style="clear:both;">
								<!-- TABBED CONTENT -->
								<div class="custom-tabs-line tabs-line-bottom left-aligned" style="margin-top: 20px;">
									<ul class="nav" role="tablist">
										<li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">참여 프로젝트 <span class="badge">${ countProject }</span></a></li>
										<li><a href="#tab-bottom-left2" role="tab" data-toggle="tab">자기개발 지원</a></li>
									</ul>
								</div>
								<div class="tab-content">
									
									<div class="tab-pane fade in active" id="tab-bottom-left1">
										<div class="table-responsive">
											<table class="table project-table">
												<thead>
													<tr>
														<th>Title</th>
														<th>Progress</th>
														<th>Leader</th>
														<th>Status</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${ projectList }" var="p">
													<input type="hidden" name="empId" value="${ loginUser.empId }">
													<input type="hidden" name="pNo" value="${ p.pNo }">
													<tr>
														<td>
															<c:url var="projectDetail" value="projectDetail.do">
																<c:param name="pNo" value="${ p.pNo }"/>
															</c:url>
															<a href="${ projectDetail }">${ p.pName }</a>
														</td>
														<td>
															<div class="progress">
																<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
																	<span>${ p.pProgress }</span>
																</div>
															</div>
														</td>
														<td><i class="fas fa-thumbs-up"></i>&nbsp;
															<a href="#">
																<c:forEach items="${ empList }" var="e">
																<c:if test="${ e.empId eq p.pmId }">${ e.empName }</c:if>
																</c:forEach>
															</a>
														</td>
														<td>
															<span class="label label-success">
																<c:if test="${ p.pProgress eq 100 }">완료</c:if>
																<c:if test="${ p.pProgress ne 100 }">진행중</c:if>
															</span>
														</td>
													</tr>
												</c:forEach>
													
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="tab-pane fade" id="tab-bottom-left2">
										<ul class="list-unstyled activity-timeline">
											<li>
												<i class="fas fa-chalkboard-teacher activity-icon"></i>
												<p>각종 동영상 강의는 <a href="http://192.168.30.186:8247/class247/" target="_blank">CLASS247</a></p>
											</li>
											<li>
												<i class="fas fa-plane-departure activity-icon"></i>
												<p>여유로운 제주에서의 휴식은 <a href="http://iclasskh.iptime.org:9090/jejuTest/" target="_blank">제주에 어서 와보람</a></p>
											</li>
											<li>
												<i class="fas fa-heart activity-icon"></i>
												<p>사내든 어디서든 연애할 땐 <a href="http://iclasskh.iptime.org:9090/saitgil" target="_blank">사잇길</a></p>
											</li>
										</ul>
									</div>
									
								</div>
								<!-- END TABBED CONTENT -->
							</div>
							<!-- END RIGHT COLUMN -->
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
	
	
	
	
	<!-- script 작성 -->
	<script>
		$(function(){
			
			var today = new Date();
			var dateArray = ('${loginUser.enrollDate}').split('-');
			var enrollDate = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);

			var workDay = Math.floor((today.getTime() - enrollDate.getTime())/1000/60/60/24);
			console.log(workDay);
			$("#workDay").html(workDay);
			
			/*
			$(document).on("click", ".profileImgArea", function(e){
				if($("#update").prop("checked")){
					$("#"+e.target.className).click();
				}
			});
			*/
			
			/* 페이지 들어오면 위젯 정보 on/off 상태 확인해서 세팅 */			
			$.each(${widgetList}, function(i, w){
				
				$.each($('.widgetCheck'),function(j, check){
					
					if(w.widgetType == check.name){
						if(w.status == 'Y'){
							$(check).attr('checked',true);
							$(check).parents('td').prev().css({'color':'#3287B2','font-weight':'bold'});
						}else{
							$(check).attr('checked',false);
							$(check).parents('td').prev().css({'color':'lightgray','font-weight':'normal'});
						}
					}
				});
			});
			
			
			
			
			
		});
		
		
		$("#update").on('click', function(){
			if($("#update").prop("checked")){
				$(".profileImgArea").css("cursor", "pointer");
				$("#phoneSpan").addClass('hide');
				$("#addressSpan").addClass('hide');
				$("#statusMsgSpan").addClass('hide');
				$("#phone").val($("#phoneSpan").text());
				$("#address").val($("#addressSpan").text());
				$("#statusMsg").val($("#statusMsgSpan").text());
				$("#phone").addClass('show');
				$("#address").addClass('show');
				$("#statusMsg").addClass('show');
				
				
			}else{
				$(".profileImgArea").css("cursor", "default");
				$("#phone").removeClass('show');
				$("#address").removeClass('show');
				$("#statusMsg").removeClass('show');
				$("#phoneSpan").text($("#phone").val());
				$("#addressSpan").text($("#address").val());					
				$("#statusMsgSpan").text($("#statusMsg").val());					
				$("#phoneSpan").removeClass('hide');
				$("#addressSpan").removeClass('hide');
				$("#statusMsgSpan").removeClass('hide');
				
				var formData = new FormData();
				var statusMsg = $("#statusMsg").val();
				var phone = $("#phone").val();
				var address = $("#address").val();
				formData.append('statusMsg', statusMsg);
				formData.append('phone', phone);
				formData.append('address', address);
				if($("input[name=profile]").length > 0){
					formData.append('profile',$("input[name=profile]")[0].files[0]);
				}
				$.ajax({
					url:"myPageUpdate.do",
					type:"POST",
					processData:false,
					contentType:false,
					data:formData,
					success:function(data){
						console.log("ajax실행 후 세션 : ${loginUser}");
						if(data == 'fail'){
							alertify.alert('develolffice', '수정 실패');
						}else{
							$(".img-circle").attr("src", "resources/upload/profile/" + data);
							alertify.alert('develolffice', '수정 되었습니다.');
						}
					},
					error:function(){
						
					}
				});
			}
		});
		
		$(document).on("click", ".profileImgArea", function(e){
			if($("#update").prop("checked")){
				$("#imgUpdate").click();
			}
		});
		
		function loadImg(value){
			// value => input태그
			// num => 조건문으로 작업
			// file이 존재하는지
			 if(value.files && value.files[0]){
				
				// 파일을 읽어들일 FileReader객체 생성
				var reader = new FileReader();
				
				// 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e){
					$("#profileImg").attr("src", e.target.result);// data:URL
					}
			
				// 파일 읽어주는 메소드
				reader.readAsDataURL(value.files[0]);
			}else{
				$("#profileImg").attr("src", "resources/upload/profile/${loginUser.profilePath}");// data:URL
				
			}
		}
		
		/* 위젯 설정 버튼들 */
		$(document).on('change','input.widgetCheck',function(){
			updateWidget(this);
			/*
			if($(this).prop('checked')){
				$(this).parents('td').prev().css({'color':'#3287B2','font-weight':'bold'});
			}else{
				$(this).parents('td').prev().css({'color':'lightgray','font-weight':'normal'});
			}
			*/
		});
		
		/* 전체 선택 */
		$('.test.checkbox').checkbox('attach events', '.check.button', 'check');
		/* 전체 해제 */
		$('.test.checkbox').checkbox('attach events', '.uncheck.button', 'uncheck');
		
		
		function updateWidget(checkbox){
			
			var widgetType = checkbox.name;
			var status;
			if(checkbox.checked){
				status = 'Y';
			}else{
				status = 'N';
			}
			
			$.ajax({
				url:"updateWidget.do",
				type:"POST",
				data:{
					empId:'${loginUser.empId}',
					widgetType:widgetType,
					status:status
				},
				success:function(data){
					if(data == 'success'){
						
						if(status == 'Y'){
							$(checkbox).parents('td').prev().css({'color':'#3287B2','font-weight':'bold'});
						}else{
							$(checkbox).parents('td').prev().css({'color':'lightgray','font-weight':'normal'});
						}
						
					}else{
						console.log('위젯 설정 실패');
					}
				},
				error:function(){
					alertify.alert('DEVELOFFICE','위젯 ON/OFF설정 AJAX통신 실패');
				}
			});
		}
		
		$('.pBtn').on('click',function(){
			
			var minus = $(this).attr('name');
			
			if(${loginUser.star}-minus < 0){
				alertify.alert('DEVELOFFICE','별이 부족합니다.');
				return;
			}
			
			$.ajax({
				url:"minusStar.do",
				type:"POST",
				data:{empId:'${loginUser.empId}',
					  star:minus},
				success:function(data){
					
					if(data == 'success'){
						$('#star').text( ${loginUser.star}-minus+'개' );
						alertify.alert('DEVELOFFICE','상품권 지급 신청 완료 : 총무과에서 수령하세요.');
					}else{
						alertify.alert('DEVELOFFICE','상품권 지급 실패');
					}
					
					
				},
				error:function(){
					alertify.alert('DEVELOFFICE','상품권 지급 AJAX통신 실패');
				}
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