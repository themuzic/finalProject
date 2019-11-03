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
	.aa{
		padding-bottom:4px;
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
					
		            <div class="col-sm-6 col-md-offset-3">
		            		<div align="center">
		            			<h2 style="margin-left:60px; color:gray">Develoffice 사원추가</h1>
		            		</div>
		            		<br><br>
	                        <label for="inputName" class="aa"><b>성명</b></label><br>
		                    <div class="ui input" style="width:430px; padding-bottom:7px;">
		                        <input type="text" class="ui input form-control" id="inputName" name="empName"placeholder="이름을 입력해 주세요" required>
		                    </div>
		                    
	                        <label for="inputMobile" class="aa"><b>휴대폰 번호</b></label><br>
		                    <div class="ui input" style="width:430px; padding-bottom:7px;">
		                        <input type="tel" class="form-control" id="inputPhone" name="phone" placeholder="휴대폰번호를 입력해 주세요" required>
		                    </div>
		                    
		                    <label for="inputbirthDay" class="aa"><b>생년월일</b></label>
		                    <div class="ui input" style="width:430px; padding-bottom:5px;">
		                        <input type="text" class="form-control" id="inputBirthDay" name="birth"placeholder="(-) 포함하여 8자리로 입력해 주세요 (ex: YYYY-MM-DD)" required>
		                    </div>
		                    
		                    <div>
		                   		<label for="inputGender" class="aa"><b>성별</b></label><br>
		                    	<label for="genderM">남성</label>
		                        <input type="radio" class="" id="genderM" name="gender" value="M" style="margin-bottom:5px;">
		                        <label for="genderF">여성</label>
		                        <input type="radio" class="" id="genderF" name="gender" value="F" style="margin-bottom:5px;">
		                    </div>
		                    <div class="field" style="padding-top:4px;">
		                        <label for="" class="aa"><b>부서</b></label>
		                        <select class="ui fluid dropdown required" id="deptCode" name="deptCode" 
		                        	style="width:430px; border-radius: 0.28571429rem; color:#555;" required="required">
		                        	<option>부서를 선택하세요</option>
									<option value="2">경영지원팀(총무)</option>
									<option value="3">경영지원팀(인사)</option>
									<option value="4">경영지원팀(회계)</option>
									<option value="5">개발팀</option>
									<option value="6">서비스팀</option>
									<option value="7">영업팀</option>
		                        </select>
		                    </div>
		                    <div class="field" style="padding-top:4px;">
		                        <label for="" class="aa"><b>직급</b></label>
		                        <select class="ui fluid dropdown required" id="jobCode" name="jobCode" 
		                        	style="width:430px; border-radius: 0.28571429rem; color:#555;" required="required">
		                        	<option>직급을 선택하세요</option>
									<option value="2">이사</option>
									<option value="3">팀장</option>
									<option value="4">대리</option>
									<option value="5">주임</option>
									<option value="6">사원</option>
		                        </select>
		                    </div>
		                    
		                    <div class="form-group text-center" style="padding-top:20px; padding-left:70px;">
		                        <button type="submit" id="join-submit" class="ui primary basic button big" 
		                        	style="height:40px;">
		                        	 사원추가<i class="fa fa-check spaceLeft"></i>
		                        </button>
		                        <button type="button" id="reset" class="ui negative basic button big" style="height:40px;">
		                           	 가입취소<i class="fa fa-times spaceLeft"></i>
		                        </button>
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
		$(document).on('click', '#join-submit', function(){
			
			  var empName = $("#inputName").val();
		      var phone = $("#inputPhone").val();
		      var birth = $("#inputBirthDay").val();
		      var gender = $("input[name=gender]:checked").val();
		      var deptCode = $("#deptCode option:selected").val();
		      var jobCode = $("#jobCode option:selected").val();
			  
		      console.log(empName);
		      console.log(phone);
		      console.log(birth);
		      console.log(gender);
		      console.log(deptCode);
		      console.log(jobCode);
			  $.ajax({
		            url:'insertInsa.do',
		            type:'POST',
		            data:{empName:empName,phone:phone,birth:birth,gender:gender,deptCode:deptCode,jobCode:jobCode},
		            success:function(data){
		            	if(data == 'fail'){
		            		alertify.alert("develoffice","fail");
		            	}else{
		            		alertify.alert("develoffice",empName + "님의 사번은 " + data +" 입니다.", function(){
		            			location.href = "mainPage.do";
		            		});
		            	}
		            },
		            error:function(){
		            	alertify.alert("develoffice","ajax 통신오류");
		            }
		        });        
		        
		    });
		
		$(document).on('click', "#reset", function(){
			
			location.href = "mainPage.do?empId=${loginUser.empId}";
		});

	
	
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>