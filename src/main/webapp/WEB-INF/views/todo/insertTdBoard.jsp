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


<link rel='stylesheet' href='resources/css/spectrum.css' />

<style>
	.contentWrap{
		float:left;
		width:40%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	
	.insertForm h4{
		font-size:15px;
		color:#333;
		font-weight:700;
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
					
					<!-- <div class="ui form">
					  <div class="fields">
					    <div class="field">
					      <label>Username</label>
					      <input type="text" placeholder="Username">
					    </div>
					  </div>
					  <div class="fields">
					    <div class="field">
					      <label>First name</label>
					      <input type="text" placeholder="First Name">
					    </div> -->
					    
						 <form action="insertTodoBoard.do" method="post" encType="multipart/form-data" class="insertForm">
						 
						 	<h3 align="center"><span style="font-weight:bold; color:#3287B2;"><i class="fas fa-pencil-alt"></i>&nbsp;새 Board 생성</span></h3>
						 	
						 	
						 	<div class="writer-area" style="float:right; padding:15px 0 0 0;">
						 		<span style="padding: 2px 0px 15px 0; font-weight:bold; font-size:15px;"><i class="fas fa-user-edit"></i></span>
						 		<input type="hidden" name="empId" value="${loginUser.empId }">
						 		<input type="text" readonly name="empName" value="${ loginUser.empName }" 
						 			   style="width:60px; border:solid 0px black; font-size:15px;">
						 	</div>
						 	
						 	<br><br><br>
						 
						 	<h4 style="padding: 2px 0 15px 0;">Color</h4>
						 	
						 	
						 	<div style="text-align:center;">
    							<input id="tdBoardColor" name="tdBoardColor" style="display: none;">
    							<!-- <div class="sp-replacer sp-light">
    								<div class="sp-preview">
    									<div class="sp-preview-inner" style="background-color: rgb(238, 204, 204);">
    									</div>
    								</div>
    								<div class="sp-dd">▼</div>
    							</div> -->
    						</div>
    						
    		
						 	<br>
						 	
						 	<h4 style="padding: 2px 0 15px 0;">제목</h4>
						 	<input class="form-control input-lg" name="tdBoardName" placeholder="제목을 입력해주세요" type="text">
						 	
						 	<br><br>
						 	
						 	<h4 style="padding: 2px 0 15px 0;">설명 (선택사항)</h4>
						 	<textarea class="form-control" name="tdBoardContent" placeholder="상세내용을 입력해주세요" rows="4"></textarea>
						 	
						 	<br><br>
						 	
						 	<div class="insertButton" align="center"> 
						 		<button type="reset" class="btn btn-danger" onclick="location.href='todoBoardList.do'">
									<i class="fas fa-times"></i> 취소하기
								</button>
								<button type="submit" class="btn btn-success">
							 		<i class="fa fa-check-circle"></i> 생성하기
							 	</button>
						 	
							 </div>
					 	</form>
				    
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
			
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_1").addClass("active");
			$("#menu3_1").attr('aria-expanded',true);
			$("#m3_2").addClass("active");	
			
			
			
			
			
			// color 스펙트럼 생성
			/* $("#color").spectrum({
				// allowEmpty:true,		// 색 없음 가능 여부 default : false
				// showButtons:false,	// 하단에 close, chose 버튼
				preferredFormat: "hex",	// 색 포맷 형식 지정
				color: "#f00",			// 초기 색 지정
				showPalette: true,		// 왼쪽 색 파레트 사용 여부
				palette: [
					['#000000', '#ffffff'],	// 한 줄에 두 가지 색상씩 두 줄로 표시됨
					['#00ff00', '#ff0000']	
				],
				showInitial: true,		// 왼쪽 색 파레트 초기 색
				showInput: true,		// 현재 색 보여줄지 여부
				showAlpha: false,		// 문자로 입력 가능하도록 input 추가
				maxSelectionSize: 3,	// 이전 선택한 색 최대 몇 개까지 보여줄지 갯수
				show: function(color){	// 파레트 보여줄 때 이벤트
					
				},
				change: function(color){ // 색 선택시 이벤트
					color.toHexString()
				},
				hide: function(color){	// 파레트 닫을 때 이벤트
					
				}
			}); */
			
			$("#tdBoardColor").spectrum({
				
				
				showPalette:true,
			    showPaletteOnly: true,
			    showButtons:true,
			    showSelectionPalette: true,
			    togglePaletteOnly: true,
			    /* togglePaletteMoreText: 'more',
			    togglePaletteLessText: 'less', */
			    chooseText: "choose",
			    cancelText: "cancel",
			    preferredFormat: "hex",
			    color: '#b4a7d6',
			    palette: [
			        ["#000","#444","#666","#999","#ccc","#eee","#f3f3f3","#fff"],
			        ["#f00","#f90","#ff0","#0f0","#0ff","#00f","#90f","#f0f"],
			        ["#f4cccc","#fce5cd","#fff2cc","#d9ead3","#d0e0e3","#cfe2f3","#d9d2e9","#ead1dc"],
			        ["#ea9999","#f9cb9c","#ffe599","#b6d7a8","#a2c4c9","#9fc5e8","#b4a7d6","#d5a6bd"],
			        ["#e06666","#f6b26b","#ffd966","#93c47d","#76a5af","#6fa8dc","#8e7cc3","#c27ba0"],
			        ["#c00","#e69138","#f1c232","#6aa84f","#45818e","#3d85c6","#674ea7","#a64d79"],
			        ["#900","#b45f06","#bf9000","#38761d","#134f5c","#0b5394","#351c75","#741b47"],
			        ["#600","#783f04","#7f6000","#274e13","#0c343d","#073763","#20124d","#4c1130"]
			    ],
			    change: function(color){
			    	
			    	var tdColor = color.toHexString();
			    	
			    	console.log(tdColor);
			    }
			    
			});
			
		
			
			
			
			
			
			/* $("#color").on("click", function(){
				spectrum("show");
			});
			
			// 파레트 이벤트
			$("#color").spectrum("show");	// 파레트 열기
			$("#color").spectrum("hide");	// 파레트 닫기
			$("#color").spectrum("toggle");	// 파레트 열려있으면 닫고 닫혀있으면 열기 */
			
			
		});
		
		
		

	
	
	
	</script>
	
	


	
	<script src='resources/js/spectrum.js'></script>
	<script type="text/javascript" src="resources/js/spectrum.js"></script>
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>