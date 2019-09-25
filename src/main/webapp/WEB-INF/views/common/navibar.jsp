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


<style>
	/* .collapsed{
		background:#2B333E;
		border-left-color:#2B333E;
	} */

</style>

</head>
<body>
	<%-- <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/> --%>
	
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="resources/assets/img/logo.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
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
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="resources/assets/img/user.png" class="img-circle" alt="Avatar"> <span>Samuel</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
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
							<a href="#menu1" data-toggle="collapse" class="collapsed"><i class="fa fa-clipboard"></i> <span>전자결재</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu1" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">작성하기</a></li>
									<li><a href="" class="">전체문서</a></li>
									<li><a href="" class="">진행중인문서</a></li>
									<li><a href="" class="">완료된문서</a></li>
									<li><a href="" class="">돌아온문서</a></li>
									<li><a href="" class="">참조문서</a></li>
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu2" data-toggle="collapse" class="collapsed"><i class="fa fa-envelope"></i> <span>EMAIL</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu2" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">메일쓰기</a></li>
									<li><a href="" class="">받은메일함</a></li>
									<li><a href="" class="">보낸메일함</a></li>
									<li><a href="" class="">휴지통</a></li>									
								</ul>
							</div>
						</li>
						
						<li>
							<a href="#menu3" data-toggle="collapse" class="collapsed"><i class="lnr lnr-inbox"></i> <span>일감관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu3" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">프로젝트관리</a></li>
									<li><a href="" class="">TO-DO</a></li>
									<li><a href="" class="">품앗이</a></li>								
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu5" data-toggle="collapse" class="collapsed"><i class="fa fa-calendar"></i> <span>일정관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu5" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">공통일정</a></li>
									<li><a href="" class="">팀별일정</a></li>						
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu6" data-toggle="collapse" class="collapsed"><i class="fa fa-check"></i> <span>예약</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu6" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">회의실</a></li>
									<li><a href="" class="">차량</a></li>
									<li><a href="" class="">안마의자</a></li>
									<li><a href="" class="">카페</a></li>									
								</ul>
							</div>
						</li>

						<li>
							<a href="#menu7" data-toggle="collapse" class="collapsed"><i class="fa fa-list"></i> <span>게시판</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="menu7" class="collapse ">
								<ul class="nav">
									<li><a href="" class="">공지사항</a></li>
									<li><a href="" class="">팀게시판</a></li>
									<li><a href="" class="">자유게시판</a></li>								
								</ul>
							</div>
						</li>

					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		
		
	<script>
		
	
	
	
	</script>

	

</body>
</html>