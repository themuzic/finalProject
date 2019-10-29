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


<!-- VENDOR CSS -->
<link rel="stylesheet" href="resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/vendor/linearicons/style.css">
<link rel="stylesheet" href="resources/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="resources/assets/css/main.css">
<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">


<!-- HI-WORKS -->
<link rel="stylesheet" href="resources/css/jquery.toastmessage-min.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/style_new.css">
<link rel="stylesheet" href="resources/css/style_tutorial.css">
<link rel="stylesheet" href="resources/css/style_approval.css?ver=2">
<link rel="stylesheet" href="resources/css/style.css?ver=2">



<!-- datepicker -->
<script src="resources/js/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/assets/css/jquery-ui.css?ver=1">
<script src="resources/js/datepicker-ko.js"></script>



<!-- SEMANTIC-UI -->

<link rel="stylesheet" href="resources/semantic/table.css">
<link rel="stylesheet" href="resources/semantic/step.css">
<link rel="stylesheet" href="resources/semantic/semantic_button.css">
<link rel="stylesheet" href="resources/semantic/semantic_dropdown.css">
<link rel="stylesheet" href="resources/semantic/semantic_icon.css">
<link rel="stylesheet" href="resources/semantic/checkbox.css">
<script src="resources/semantic/checkbox.js"></script>
<link rel="stylesheet" href="resources/semantic/accordion.css">
<script src="resources/semantic/accordion.js"></script>
<link rel="stylesheet" href="resources/semantic/card.css">
<link rel="stylesheet" href="resources/semantic/form.css">
<link rel="stylesheet" href="resources/semantic/input.css">
<link rel="stylesheet" href="resources/semantic/image.css">
<link rel="stylesheet" href="resources\semantic\dimmer.css">
<script src="resources\semantic\dimmer.js"></script>


<!-- summernote 에디터 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>


<!-- alertify -->
<link rel="stylesheet" href="resources/css/alertify.css">
<link rel="stylesheet" href="resources/css/alertify.rtl.css">
<script src="resources/js/alertify.js"></script>


<script src="resources/js/develoffice.js"></script>




<style>
	.documentWrap{
		float:left;
		width:75%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	.docuTable{
		margin-bottom: 50px;
	    /* table-layout: fixed; */
	    /* border-left: 1px solid #ececec; */
	    /* border-right: 1px solid #ececec; */
	    width: 100%;
    	border: 1px solid #cdcdcd;
    	display: table;
	    border-collapse: collapse;
	    border-spacing: 2px;
	}
	table{
		border-collapse: collapse;
		display: table;
		width: 100%;
		border-spacing: 0px;
	}
	.docuTable th{
		text-align: center;
		padding: 12px 0;
	}
	.docuTable td{
		padding: 8px 0 8px 10px;
	}
	.docuTable tr:last-child > th{
		border-bottom: 1px solid #cdcdcd;
	}
	.docuTable tr:last-child > td{
		border-bottom: 1px solid #cdcdcd;
	}
	.docuTable tr td:last-child{
		border-right: 1px solid #cdcdcd;
	}
	.write-select{
		width: calc(52% - 20px);
		height: 30px;
	    padding-left: 10px;
	    border: 1px solid #cfcfcf;
	}
	th{
		padding: 12px 0;
	    border-bottom: 1px solid #ececec;
	    border-right: 1px solid #ececec;
	    background: #f9f9f9;
	    color: #333;
	    font-weight: 400;
	}
	/*
	td{
	    border-bottom: 1px solid #ececec;
	    border-right: 1px solid #ececec;
	}
	*/
			
	.tooltip-box{
		position: absolute;
	    float: left;
	    top: 20px;
	    left: -50px;
	    width: 382px;
	    padding: 12px;
	    margin: 6px 0 0;
	    font-size: 12px;
	    background-color: #fcfcfc;
	    border: 1px solid #cfcfcf;
	    z-index: 1500;
	    text-align: left;
	}
	.documentWrap h4{
		font-size:14px;
    	color: #333;
    	font-weight: 700;
	}
	.toolTip{
		position: relative;
	}
	#btnApprovalSelect{
		vertical-align: top!important;
		color: #779ec0;
		border: 0 none;
    	background-color: transparent;
	}
	.team.name{
		background: #f9f9f9;
	}
	.name{
		height: 40px;
	}
	.stamp{
		height: 80px;
    	empty-cells: show;
	}
	.addPlus{
		display: inline-block;
	    position: absolute;
	    top: 13px;
	    right: 5px;
	    z-index: 0;
	    width: 19px;
	    height: 19px;
	    background-position: -1px -1px;
	    cursor: pointer;
	}
	.cal_table1{
		border-top: 1px solid #cdcdcd;
	    border-left: 1px solid #cdcdcd;
	    border-right: 1px solid #cdcdcd;
	    table-layout: fixed;
	    width:100%;
	}
	.cal_table1 tr td:last-child{
		border-right:0;
	}
	.cal_table1 .confer table:first-child tr:last-of-type td{
		border-bottom: 0;
	}
	.cal_table1.refer td{
		vertical-align: middle;
    	border-bottom: 1px solid #cdcdcd;
	}
	.cal_table1.refer th{
		vertical-align: middle;
    	border-bottom: 1px solid #cdcdcd;
	}
	.cal_table1 tr:last-child > td{
		border-bottom:0;
	}
	.write_input {
	    position: relative;
	    margin-bottom: 8px;
	}
	.tableType02 tr:last-child > td {
		border-bottom: 1px solid #cdcdcd;
	}
	.tableType01{
		table-layout: fixed;
		width: 100%;
	    border-top: 1px solid #cdcdcd;
	    border-bottom: 1px solid #cdcdcd;
	}
	.black{
		color: #444;
		font-weight: 400;
	}
	.file-list{
		width: 100%;
    	border: 2px dashed #e4e4e4;
	}
	.file-list .top{
		position: absolute;
	}
	.file-list .center {
	    padding: 22px 0 24px;
	    text-align: center;
	    overflow: hidden;
	    color: #a9a9a9;
	}
	.down {
	    display: inline-block;
	    width: 7px;
	    height: 4px;
	    vertical-align: middle;
	    margin-left: 4px;
	    background: url("https://approval.office.hiworks.com/static/images/insa/spr_insa_icon.png") -50px 0 no-repeat;
	}	
	.layer_box.large.address, .layer_box.large.print {
	    width: 800px;
	    padding: 25px 30px 32px;
	}
	.layer_box.large {
	    width: 640px;
	    padding: 25px 30px 32px;
	}
	.layer_box {
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    z-index: 1500;
	    border: 1px solid #8d8d8d;
	    background: #fff;
	}
	.layer_box .title_layer {
	    padding-bottom: 21px;
	    font-size: 16px;
	}
	.layer_box .text_variables {
	    color: #2985db;
	}	
	.layer_box.address.line .line-list-wrap > .fl {
	    width: 415px;
	    padding-top: 10px;
	}	
	.fl {
	    float: left!important;
	}
	.fr {
	    float: right!important;
	}
	.dropdown-menu {
	    position: absolute;
	    top: 100%;
	    left: 0;
	    float: left;
	    min-width: 130px;
	    padding: 12px 0;
	    margin: 6px 0 0;
	    font-size: 14px;
	    background-color: #fff;
	    border: 1px solid #999;
	    z-index: 110;
	}
	
	.hide {
	    display: none;
	}
	dl, li, menu, ol, ul {
	    list-style: none;
	}
	.layer_box.address.line .line-list-wrap .add-del-btn {
	    float: left;
	    width: 40px;
	    text-align: center;
	    padding: 0;
	}
	.layer_box.address.line .line-list-wrap > .fr.mgb20 {
	    float: left !important;
	}
	.dropbtn-wrap .layer_button, .layer_box .layer_button {
	    margin-top: 29px;
	    line-height: 19px;
	    text-align: center;
	}
	button, input, select, textarea {
	    vertical-align: middle;
	}
	.layer_box .select-box, .layer_box input.text-box {
	    border: 1px solid #a5acb2;
	    padding-left: 5px;
	}
	.layer_box input[type=text] {
	    height: 21px;
	}
	.layer_box select {
	    height: 23px;
	}
	.dropdown-menu {
	    position: absolute;
	    top: 100%;
	    left: 0;
	    float: left;
	    min-width: 130px;
	    padding: 12px 0;
	    margin: 6px 0 0;
	    font-size: 14px;
	    background-color: #fff;
	    border: 1px solid #999;
	    z-index: 110;
	}
	.after:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	.layer_box.address.line .line-list-wrap > .fr .four-line .approval-direction {
	    height: 78px;
	    padding-top: 12px;
	    background-position: -96px -363px;
	}
	.layer_box.address.line .line-list-wrap > .fr .three-line .approval-direction {
	    height: 56px;
	    padding-top: 2px;
	    background-position: -96px -380px;
	}
	#messenger:hover{
		cursor:pointer;
	}
	.closeBtn{
		cursor:pointer;
	}
	.ajs-close{
		float: right;
		display:none !important;
	}
	.ajs-primary.ajs-buttons{
		text-align:right !important;
	}
	.ajs-ok{
		color:#2985db;
	}
	.ajs-cancel{
		color:red;
	}
</style>

</head>
<body>
	<%-- <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/> --%>
	
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<c:url value="mainPage.do" var="mainPage">
					<c:param name="empId" value="${loginUser.empId}"/>
				</c:url>
				<a href="${mainPage}"><img src="resources/assets/img/logo.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				
				<script>
					var message;
					
					function messenger(){
						
						if(openStatus()){
							message.focus();
						}else{
							message = window.open("chat.do","messenger", "width=500,height=561", "false");
						}
					}
					function openStatus(){
						if(message == null || message.closed){
							return false;
						}else{
							return true;
						}
					}
				</script>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a id="messenger" onclick="messenger();"><i class="lnr lnr-envelope"></i>메신저 입니다 하하하하</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger">5</span>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li>
						<!-- 
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						 -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="resources/upload/profile/${loginUser.profilePath}" class="img-circle" alt="Avatar"> <span>${loginUser.empName}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="myProfile.do"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<!-- <li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li> -->
								<li><a href="orgChart.do"><i class="lnr lnr-cog"></i> <span>조직도</span></a></li>
								<li><a href="logout.do"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li>
							<a href="#menu1" data-toggle="collapse" class="collapsed" id="menu1_1"><i class="fa fa-clipboard"></i> <span>전자결재</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu1" class="collapse ">
								<ul class="nav">
									<li><a href="insertDocumentForm.do" class="" id="m1_1">작성하기</a></li>
									<li>
										<c:url value="documentTable.do" var="documentTable">
											<c:param name="condition" value="전체"/>
										</c:url>
										<a href="${documentTable}" class="" id="m1_2">전체문서</a>
									</li>
									<li>
										<c:url value="documentTable.do" var="documentTable">
											<c:param name="condition" value="진행중"/>
										</c:url>
										<a href="${documentTable}" class="" id="m1_3">진행중인문서</a>
									</li>
									<li>
										<c:url value="documentTable.do" var="documentTable">
											<c:param name="condition" value="완료"/>
										</c:url>
										<a href="${documentTable}" class="" id="m1_4">완료된문서</a>
									</li>
									<li>
										<c:url value="documentTable.do" var="documentTable">
											<c:param name="condition" value="참조"/>
										</c:url>
										<a href="${documentTable}" class="" id="m1_5">참조문서</a>
									</li>
									<li>
										<c:url value="documentTable.do" var="documentTable">
											<c:param name="condition" value="내가"/>
										</c:url>
										<a href="${documentTable}" class="" id="m1_6">내가 작성한 문서</a>
									</li>
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu2" data-toggle="collapse" class="collapsed" id="menu2_1"><i class="fa fa-envelope"></i> <span>EMAIL</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu2" class="collapse ">
								<ul class="nav">
									<li><a href="insertMail.do" class="" id="m2_1">메일쓰기</a></li>
									<li><a href="receiveMail.do" class="" id="m2_2">받은메일함</a></li>
									<li><a href="sendMail.do" class="" id="m2_3">보낸메일함</a></li>
									<li><a href="importantMail.do" class="" id="2_5">중요메일함</a>
									<li><a href="deleteMail.do" class="" id="m2_4">휴지통</a></li>									
								</ul>
							</div>
						</li>
						
						<li>
							<a href="#menu3" data-toggle="collapse" class="collapsed" id="menu3_1"><i class="lnr lnr-inbox"></i> <span>일감관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu3" class="collapse ">
								<ul class="nav">
									<li><a href="projectList.do" class="" id="m3_1">프로젝트관리</a></li>
									<li><a href="todoBoardList.do" class="" id="m3_2">TO-DO</a></li>
									<li><a href="help.do" class="" id="m3_3">품앗이</a></li>								
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu4" data-toggle="collapse" class="collapsed" id="menu4_1"><i class="fa fa-calendar"></i> <span>일정관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu4" class="collapse ">
								<ul class="nav">
									<li><a href="publicScheduleList.do" class="" id="m4_1">공통일정</a></li>
									<li><a href="teamScheduleList.do" class="" id="m4_2">팀별일정</a></li>						
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu5" data-toggle="collapse" class="collapsed" id="menu5_1"><i class="fa fa-check"></i> <span>예약</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu5" class="collapse ">
								<ul class="nav">
									<li>
										<c:url value="myReservListView.do" var="myReservListView">
											<c:param name="empId" value="${loginUser.empId}"/>
										</c:url>
										<a href="${myReservListView}" class="" id="m5_1">내 예약 보기</a>
									</li>
									<li>
										<c:url value="conferenceRoom.do" var="conferenceRoom">
											<c:param name="empId" value="${loginUser.empId}"/>
											<c:param name="reservType" value="회의실"/>
										</c:url>
										<a href="${conferenceRoom}" class="" id="m5_2">회의실</a>
									</li>
									<li>
										<c:url value="car.do" var="car">
											<c:param name="empId" value="${loginUser.empId}"/>
											<c:param name="reservType" value="차량"/>
										</c:url>
										<a href="${car}" class="" id="m5_3">차량</a>
									</li>
									<li>
										<c:url value="massage.do" var="massage">
											<c:param name="empId" value="${loginUser.empId}"/>
											<c:param name="reservType" value="안마의자"/>
										</c:url>
										<a href="${massage}" class="" id="m5_4">안마의자</a>
									</li>
									<li><a href="cafe.do" class="" id="m5_5">카페</a></li>									
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu6" data-toggle="collapse" class="collapsed" id="menu6_1"><i class="fa fa-list"></i> <span>게시판</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu6" class="collapse ">
								<ul class="nav">
									<li><a href="listNotice.do" class="" id="m6_1">공지사항</a></li>
									<li><a href="listTeamBoard.do" class="" id="m6_2">팀게시판</a></li>
									<li><a href="listFree.do" class="" id="m6_3">자유게시판</a></li>								
								</ul>
							</div>
						</li>

					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		
		
	<script>
		$(function(){
			
			$(".closeBtn").click(function(){
				$('.layer_box').removeClass("show");
			});
			
			$(".datepicker").removeClass('hasDatepicker').datepicker();
			
		});
		
	
	
	</script>

	

</body>
</html>