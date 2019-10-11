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






<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<style>
	.contentWrap{
		float:left;
		width:80%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	
	/* 에디터 CSS 시작 */
	
	.note-toolbar, .panel-heading{
		padding-top:0px !important;
		padding-bottom:5px !important;
	}
	.note-btn-group{
		padding-right: 5px !important;
	}
	.panel-heading button{
		padding:0 10px 0 10px !important;
	}
	.note-btn{
		height: 30px;
		border: 1px solid #ccc !important;
		background:white !important;
		box-shadow: none !important;
		
	}
	
	/* 에디터 CSS 끝 */
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
					
					
					
					

						
					
					<div class="file-list" id="dragZone" style="min-height: 66px;">
						<div class="top" style="padding:22px 20px 24px 20px;">
							<p class="left">
								<span class="body-color mgr_20 viewAttachedFileArea" style="margin-right:20px;">별첨</span>
								<a href="javascript:void(0);" class="addfile viewAttachedFileArea" onclick="$('#fileApprovalAttach').click();">파일 첨부</a>
								<input type="file" style="overflow: hidden; width:0px; height:0px;" name="approval_attach" id="fileApprovalAttach" multiple="">			
							</p>
							<p class="right viewAttachedFileArea hide" id="approvalAttachSize" style="display: none;"><span id="attachAttachSum"></span> / 50MB</p>
						</div>
						
						<div class="center viewAttachedFileArea show" id="approvalAttachText">
							여기로 파일을 끌어놓으세요
						</div>
							
						<div class="list hide" id="approvalAttachList" style="display: none;">
							<table id="tableApprovalRelated">
								<caption></caption>
								<colgroup>
									<col width="">
								</colgroup>
								<tbody></tbody>
							</table>
							<table id="tableApprovalAttach">
								<caption></caption>
								<colgroup>
									<col width="">
								</colgroup>
								<tbody></tbody>
							</table>
						</div>
					</div>	
					<br>	
						
					<div id="summernote" name="content"></div>
						
						
				
					
					
					
					
					
					
					
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
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
		
		$(function(){
			$("#summernote").summernote({
				tabsize: 2,
		        height: 300,
		        lang: 'ko-KR'
			});
			
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_1").addClass("active");	
			
		});
	
	
	</script>

</body>
</html>