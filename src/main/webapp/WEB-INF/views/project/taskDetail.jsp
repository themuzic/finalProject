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
		width:75%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
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
					
					<br><br>
					
					<form action="updateTodo.do">
					
					<div class="detail-todo">
					
						<h2 style="color:#3287B2; font-weight:bold;">
							<i class="fas fa-envelope-open-text"></i> &nbsp;TO-DO
						</h2> 
						<br>
						
						
						<input class="form-control input-lg" name="taskTitle" value="${ taskDetail.taskTitle }" type="text" readonly>
							
						<br><br>
						
						<input type="hidden" name="empId" value="${ loginUser.empId }">
						<input type="hidden" name="taskNo" value="${ taskDetail.taskNo }">
						
						
						<h3 style="color:#3287B2; font-weight:bold;">
							<i class="fas fa-file-alt"></i> &nbsp;contents
						</h3>
						<br>
						<textarea class="form-control" name="taskContent" placeholder="textarea" rows="20" readonly>${ taskDetail.taskContent }</textarea>
						<br>
						
						
						<br><br>
						
						
					<div class="btn-area" align="center">
						
						<button type="submit" class="large ui button btn-lg" style="margin:0 0 5px 0; background-color:#5cb85c; color:white; font-size: 1.5rem;">
							<i class="fas fa-check"></i> &nbsp;수정하기
						</button>
						<button type="button" class="large ui button btn-lg" onclick="location.href='todoList.do?tdBoardNo=${todoDetail.tdBoardNo}'" style="margin:0 0 5px 0; background-color:red; color:white; font-size: 1.5rem;">
							<i class="fas fa-undo-alt"></i> &nbsp;취소
						</button>
					</div>
					
					
					</div>
					
					</form>
					
					<br><br>
					
					<!-- 댓글 등록 부분 -->
					<table align="center" width="500" border="1" cellspacing="0">
						<tr>
							<td><textarea cols="55" rows="3" id="tRContent"></textarea></td>
							<td><button id="rSubmit">등록하기</button></td>
						</tr>
					</table>
					
					
					<!-- 댓글 목록 부분 -->
					<table align="center" width="500" border="1" cellspacing="0" id="rtb">
						<thead>
							<tr>
								<td colspan="2"><b id="rCount"></b></td>	<!-- 댓글 수 -->
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					
					
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
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu3").addClass("in");
			$("#menu3").attr('aria-expanded',true);
			$("#menu3_2").addClass("active");
			$("#menu3_2").attr('aria-expanded',true);
			$("#m3_1").addClass("active");
		
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 10000);
			
		});
		
		// 댓글 등록 ajax
		$("#rSubmit").on("click", function(){
			
			var tRContent = $("#tRContent").val();
			var taskNo = ${taskDetail.taskNo};
			
			$.ajax({
				url:"rinsert.do",
				data:{tRContent:tRContent, taskNo:taskNo},
				type:"post",
				success:function(data){
					if(data == "success"){
						getReplyList();	// 댓글 등록 성공
						$("#tRContent").val("");
						
					}else{
						alert("댓글 작성 실패!!!");
					}
				},
				error:function(){
					console.log("서버와의 통신 실패!!!");
				}
			});
			
		});
		
		function getReplyList(){
			
			var taskNo = ${taskDetail.taskNo}
			
			$.ajax({
				url:"rlist.do",
				data:{taskNo:taskNo},
				dataType:"json",
				success:function(data){
					
					//console.log(data);
					$("#rCount").text("댓글(" + data.length + ")");
					
					var $tableBody = $("#rtb tbody");	// <tbody> </tbody>
					$tableBody.html("");
						
					if(data.length > 0){	// 존재하는 댓글 있음
						
						$.each(data, function(index, value){
							var $tr = $("<tr>");
							var $tRwriter = $("<td width='100'>").text(value.tRwriter);
							var $tRContent = $("<td>").text(value.tRContent);
							var $createDate = $("<td width='100'>").text(value.createDate);
							
							$tr.append($tRwriter);
							$tr.append($tRContent);
							$tr.append($createDate);
							
							$tableBody.append($tr);
						});
						
					} else {	// 존재하는 댓글 없음
						
						var $tr = $("<tr>");
						var $tRContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($tRContent);	//	<tr> <td>~~</td> </tr>
						
						$tableBody.append($tr);
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
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