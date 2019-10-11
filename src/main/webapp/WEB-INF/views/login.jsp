<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVELOFFICE</title>

<!-- VENDOR CSS -->
	<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="resources/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="resources/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="resources/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="resources/assets/img/favicon.png">

</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content" style="padding-left:30px;padding-right:30px;">
							<div class="header">
								<div class="logo text-center"><img src="resources/assets/img/logo.png" alt="Klorofil Logo"></div>
								<!-- <p class="lead">Let's get to work</p> -->
							</div>
							<form class="form-auth-small" action="login.do" method="post">
								<div class="form-group">
									<label for="signin-id" class="control-label sr-only">Email</label>
									<input type="text" class="form-control" name="empId" id="signin-id" value="" placeholder="ID">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" name="empPwd" id="signin-password" value="" placeholder="Password">
								</div>
								<div class="form-group clearfix">
									<label class="fancy-checkbox element-left">
										<input type="checkbox">
										<span>Remember</span>
									</label>
								</div>
								
								
								<!-- 로그인 버튼 -->
								<button type="submit" class="btn btn-primary btn-lg btn-block">LOGIN</button>
								
								
								
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot password?</a></span>
								</div>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<b class="heading" style="font-size: 2em">Let's get to work</b>
							<p>and don't fall down</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->



</body>
</html>