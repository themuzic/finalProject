<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- <link href="resources/css/orgchart-webcomponents.css" rel="stylesheet"> -->


<link href="https://dabeng.github.io/OrgChart/css/style.css" rel="stylesheet"/>
<link href="https://dabeng.github.io/OrgChart/css/jquery.orgchart.css" rel="stylesheet"/>


<style>
	.contentWrap{
		float:left;
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:60px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	.rightLine, .leftLine{
		width:50%;
	}
	.orgchart{
		background:none;
	}
	.title{
		background: #3287B2 !important;
		padding-top: 4px !important;
	}
	.orgchart .node .content {
    border: 1px solid #3287B2;
	}
	#chart-container i{
		display: none !important;
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
					<div class="setting_title" style="border-bottom:0;">
						<h3 style="font-weight: bold;">조직도</h3>
					</div>
					
					
					<div id="chart-container"></div>
					
					
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
		
		$(function() {
			
			$("#menu7").addClass("active");
			
		    var datascource = {'name':'DEVELOFFICE','title':'','children':[
		        			{ 'name': '경영지원팀', 'title': '' ,'children':[ {'name':'총무팀'},{'name':'인사팀'},{'name':'회계팀'} ]},
		        			{ 'name': '영업팀', 'title': '', 'children': [ { 'name': '7', 'title': 'senior engineer' },{ 'name': '8', 'title': 'senior engineer', 'children': [
		                { 'name': '9', 'title': 'engineer' },
		                { 'name': '10', 'title': 'UE engineer' }
		              ]
		            }
		          ]
		        },
		        { 'name': '서비스팀', 'title': '' },
		        { 'name': '개발팀', 'title': '' },
		      ]
		    };
		    var oc = $('#chart-container').orgchart({
		      'data' : datascource,
		      'nodeContent': 'title',
		      'depth': 2,
		      'pan': true,
		      'zoom': true
		    });
		    oc.$chartContainer.on('touchmove', function(event) {
		      event.preventDefault();
		    });
		  });
	
		
		
		
		

		
		
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/js/jquery.orgchart.js"></script>
	<!-- <script src="https://dabeng.github.io/OrgChart/js/jquery.orgchart.js"></script> -->
	
</body>
</html>