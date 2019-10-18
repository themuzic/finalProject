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

<style>
	.contentWrap{
		float:left;
		width:50%;
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
	
	#imgArea:hover{
		cursor:pointer;
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
						 
						 	<h4 style="padding: 2px 0 15px 0;">Color</h4>
						 	<div id="imgArea" style="width:259px; height:100px; border:solid 1px lightgray;">
								<img id="tdBoardImg" >
							</div>
						 	
						 	<!-- <img class="ui medium rounded image" src="resources/images/square-image.png" style="padding: 2px 0 15px 0;"> -->
						 	
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
					
					<div id="fileArea">
						<input type="file" multiple name="uploadImg" id="uploadImg" onchange="loadImg(this, 1);">
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
			
			
			/* Image 영역 클릭할 때 파일 첨부 창이 뜨도록 */
			$("#fileArea").hide();
			
			$("#imgArea").click(function(){
				$("#uploadImg").click();
			});
			
			
		});
		
		
		
		// 파일 첨부했을 때 미리보기 공간에 미리보기 가능하게 하는 함수
			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader
			function loadImg(value, num){
				// value => input태그
				// num => 조건문으로 작업
				// file이 존재하는지 
				if(value.files && value.files[0]){
					// 파일을 읽어들일 FileReader객체 생성
					var reader = new FileReader();
					// 파일 읽기가 다 완료되었을 때 실행되는 메소드
					reader.onload = function(e){
						switch(num){
						case 1: $("#tdBoardImg").attr("src", e.target.result); break; // data:URL
						}
					}
					// 파일 읽어주는 메소드
					reader.readAsDataURL(value.files[0]);
					
					
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