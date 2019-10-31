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
						<div class="clearfix">
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
										<span id="statusMsg">${loginUser.statusMsg}</span>
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
												별  <span>${loginUser.star}개</span>
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
								<h4 class="heading">Samuel's Awards</h4>
								<!-- AWARDS -->
								<div class="awards">
									<div class="row">
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<span class="lnr lnr-sun award-icon"></span>
												</div>
												<span>Most Bright Idea</span>
											</div>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<span class="lnr lnr-clock award-icon"></span>
												</div>
												<span>Most On-Time</span>
											</div>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<span class="lnr lnr-magic-wand award-icon"></span>
												</div>
												<span>Problem Solver</span>
											</div>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<span class="lnr lnr-heart award-icon"></span>
												</div>
												<span>Most Loved</span>
											</div>
										</div>
									</div>
								</div>
								<!-- END AWARDS -->
								<!-- TABBED CONTENT -->
								<div class="custom-tabs-line tabs-line-bottom left-aligned">
									<ul class="nav" role="tablist">
										<li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">Recent Activity</a></li>
										<li><a href="#tab-bottom-left2" role="tab" data-toggle="tab">Projects <span class="badge">7</span></a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab-bottom-left1">
										<ul class="list-unstyled activity-timeline">
											<li>
												<i class="fa fa-comment activity-icon"></i>
												<p>Commented on post <a href="#">Prototyping</a> <span class="timestamp">2 minutes ago</span></p>
											</li>
											<li>
												<i class="fa fa-cloud-upload activity-icon"></i>
												<p>Uploaded new file <a href="#">Proposal.docx</a> to project <a href="#">New Year Campaign</a> <span class="timestamp">7 hours ago</span></p>
											</li>
											<li>
												<i class="fa fa-plus activity-icon"></i>
												<p>Added <a href="#">Martin</a> and <a href="#">3 others colleagues</a> to project repository <span class="timestamp">Yesterday</span></p>
											</li>
											<li>
												<i class="fa fa-check activity-icon"></i>
												<p>Finished 80% of all <a href="#">assigned tasks</a> <span class="timestamp">1 day ago</span></p>
											</li>
										</ul>
										<div class="margin-top-30 text-center"><a href="#" class="btn btn-default">See all activity</a></div>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left2">
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
													<tr>
														<td><a href="#">Spot Media</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
																	<span>60% Complete</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user2.png" alt="Avatar" class="avatar img-circle"> <a href="#">Michael</a></td>
														<td><span class="label label-success">ACTIVE</span></td>
													</tr>
													<tr>
														<td><a href="#">E-Commerce Site</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%;">
																	<span>33% Complete</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle"> <a href="#">Antonius</a></td>
														<td><span class="label label-warning">PENDING</span></td>
													</tr>
													<tr>
														<td><a href="#">Project 123GO</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar" role="progressbar" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100" style="width: 68%;">
																	<span>68% Complete</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle"> <a href="#">Antonius</a></td>
														<td><span class="label label-success">ACTIVE</span></td>
													</tr>
													<tr>
														<td><a href="#">Wordpress Theme</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
																	<span>75%</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user2.png" alt="Avatar" class="avatar img-circle"> <a href="#">Michael</a></td>
														<td><span class="label label-success">ACTIVE</span></td>
													</tr>
													<tr>
														<td><a href="#">Project 123GO</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
																	<span>100%</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle" /> <a href="#">Antonius</a></td>
														<td><span class="label label-default">CLOSED</span></td>
													</tr>
													<tr>
														<td><a href="#">Redesign Landing Page</a></td>
														<td>
															<div class="progress">
																<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
																	<span>100%</span>
																</div>
															</div>
														</td>
														<td><img src="assets/img/user5.png" alt="Avatar" class="avatar img-circle" /> <a href="#">Jason</a></td>
														<td><span class="label label-default">CLOSED</span></td>
													</tr>
												</tbody>
											</table>
										</div>
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
			//$("#imgInputArea").hide();
			$("#update").on('click', function(){
				if($("#update").prop("checked")){
					$(".userAdvice").removeAttr("readonly");
					$(".profileImgArea").css("cursor", "pointer");
					$("#phoneSpan").addClass('hide');
					$("#addressSpan").addClass('hide');
					$("#phone").val($("#phoneSpan").text());
					$("#address").val($("#addressSpan").text());
					$("#phone").addClass('show');
					$("#address").addClass('show');
					
					
				}else{
					$(".profileImgArea").css("cursor", "default");
					$("#phone").removeClass('show');
					$("#address").removeClass('show');
					$("#phoneSpan").text($("#phone").val());
					$("#addressSpan").text($("#address").val());					
					$("#phoneSpan").removeClass('hide');
					$("#addressSpan").removeClass('hide');
					
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
					$(".userAdvice").attr("readonly", true);
					
				}
			});
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
			$(document).on("click", ".profileImgArea", function(e){
				if($("#update").prop("checked")){
					$("#imgUpdate").click();
				}
			});
			
			
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
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>