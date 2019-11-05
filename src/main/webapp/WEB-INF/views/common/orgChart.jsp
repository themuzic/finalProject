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
	#chart-container i.symbol{
		display: none !important;
	}
	/* 
	.rightLine, .leftLine{
		width:50%;
	}
	 */
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
			
		    var datascource = {'name':'DEVELOFFICE','title':'Company','children':[{'name':'전재광','title':'대표','children':[
		    	
		    							{'name':'김상윤','title':'이사','children':[
			    								{'name':'총무팀','title':'Department','children':[{'name':'민병현','title':'팀장','children':[{'name':'서영수','title':'주임'}]}]},
								    			{'name':'인사팀','title':'Department','children':[{'name':'설용환','title':'팀장','children':[{'name':'원영주','title':'대리','children':[{'name':'임종민','title':'사원'}]}]}]},
								    			{'name':'회계팀','title':'Department','children':[{'name':'양정환','title':'팀장'}]}
		    							]},
		    							{'name':'이경준','title':'이사','children':[
			    								{'name':'개발팀','title':'Department','children':[{'name':'유현규','title':'팀장','children':[{'name':'신진혁','title':'대리','children':[{'name':'강연재','title':'주임','children':[{'name':'강정학','title':'사원'},{'name':'손권모','title':'사원'}]},{'name':'김상민','title':'주임','children':[{'name':'김은기','title':'사원'},{'name':'이승은','title':'사원'}]}]}]}]},
								    			{'name':'서비스팀','title':'Department','children':[{'name':'최영근','title':'팀장','children':[{'name':'김규식','title':'대리','children':[{'name':'구명지','title':'주임','children':[{'name':'한수진','title':'사원'}]}]}]}]},
										        {'name':'영업팀','title':'Department','children':[{'name':'한미선','title':'팀장','children':[{'name':'조용준','title':'주임','children':[{'name':'김사랑','title':'사원'}]}]}]}
		    							]}
		    						]}
		    				  
		    					]};
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