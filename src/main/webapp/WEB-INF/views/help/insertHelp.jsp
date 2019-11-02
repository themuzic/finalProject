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
		width:75%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
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
					<div class="setting_title">
						<h3 style="font-weight: bold;">일감 등록</h3>
					</div>
					
					<form class="ui form">
						<div class="insert-wrap">
					  		<label class="titleLabel">제목</label>
							<div class="ui input">
								<input type="text" size="50" style="font-size:16px;">
							</div>
							<br>
							<label class="titleLabel">내용</label>
							<div class="ui input">
								<textarea rows="10" cols="60" style="resize:none;font-size:16px;"></textarea>
							</div>
							<div class="layer_button">
								<button type="button" class="btn_variables" id="saveBtn">등록</button>
								<button type="button" class="closeBtn">취소</button>
							</div>
						</div>
					</form>
					
					
					
					
					
					
					
					
					
					
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
			
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_3").addClass("active");	
			
			$('.ui.dimmer').dimmer({on:'click'});
			
			
		});
	
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/semantic/form.js"></script>
	
</body>
</html>