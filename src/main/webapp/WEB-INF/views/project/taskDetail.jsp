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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


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
					
					<!-- 리플 -->
						
					<div id="comment_start" class="theme_box2 eng relative center box_shadow_3" data-hasqtip="33" aria-describedby="qtip-33" style="text-align:center;">
						<span id="comment_start_num">${frr.frrCount }</span>
						<span id="comment_start_title">Comments</span>
					</div>
					
				 	<div class="ui minimal comments" id="entire_comment" style="font-size: 13px;"></div> 
					
						<form class="ui reply form" id="replyForm">
							<div class="field">
								<textarea id="replyContent" style="resize:none;font-size:16px;height:30px;"></textarea>
							</div>
							<div id="rSubmit" class="ui blue submit icon button fr" style="font-size:1.3rem; background-color:#3287B2;">
								댓글 등록
							</div>
						</form>

					<!-- 리플끝 -->
					
					
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
			
		});
		
		/*------------------------- 댓글 div 토글 ---------------------------  */	
		$(document).ready(function(){
			$("#comment_start").click(function(){
				$("#entire_comment").toggle();
				$("#replyForm").toggle();
			});
		});
		
		/*------------------------- 댓글 토글 끝 ---------------------------  */	
		
		
		/*------------------------- 댓글 ajax 시작 ---------------------------  */	
		/* 댓글 등록 ajax */
			$(document).on("click","#rSubmit", function(){
				
				var tRcontent = $("#replyContent").val();
				var taskNo = ${taskDetail.taskNo};
				
				//var contentBox = $("#replyContent");
				
				console.log('댓글내용 : '+ tRcontent);
				console.log('참조글번호 : '+ taskNo);
				
				$.ajax({
					url:"rinsert.do",
					data:{tRcontent:tRcontent, taskNo:taskNo},
					type:"post",
					success:function(data){
						if(data == "success"){
							console.log('댓글 insert 성공');
							$("#replyContent").val("");
							getReplyList();
							
						}else{
							alert("댓글작성실패!");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
			});
		
		$(function(){
			getReplyList();
			
		});
		
		/* 댓글list ajax */
		 function getReplyList(){
					
			var taskNo= ${taskDetail.taskNo};
			console.log(taskNo);
			$.ajax({
				url:"rlist.do",
				data:{taskNo:taskNo},
				dataType:"json",
				success:function(data){
					console.log(data);
						$("#uberCount").text(data.length); 
						
						$("#comment_start_num").text(data.length);
						
					 	var $divEntire = $("#entire_comment");
						$divEntire.html("");
						
					if(data.length>0){
						
						$.each(data, function(index, value){
							var $divComment = $("<div class='comment'>");
							var $divContent = $("<div class='content'>");
							var $aAuthor = $("<a class='author'>").text(value.tRwriter);
							var $divMetadate = $("<div class='metadata'>");
							var $spanDate = $("<span class='date'>").text(value.createDate);
							var $divText = $("<div class='text' style='margin-top:7px;'>").text(value.tRContent);
							var $divActions = $("<div class='actions fr'>");
							var $aReply1 = $("<a onclick='writeReply(this)' id='fix' class='reply'>").text("수정");
							var $aReply2 = $("<a id='del' class='reply replyDelete'>").text("삭제");
							var $hiddenId2 = $("<input id='hdel' type='hidden' name='taskNo'>").val(value.taskNo);
							
							var $formReply = $("<form id='formRep' class='ui reply form' style='display:none;'>");
							var $divField = $("<div class='field'>");
							var $textArea = $("<textarea class='tRContent' style='resize: none;'>");
							var $divFrsubmit = $("<div class='ui blue submit icon button replyUpdate' style='font-size:1.3rem; background-color:#3287B2;'>").text("수정");
							var $hiddenId = $('<input type="hidden" name="taskNo">').val(value.taskNo);
							$divMetadate.append($spanDate);
							$divActions.append($aReply1);
							$divActions.append($aReply2);
							$aReply2.append($hiddenId2);
							
							$divContent.append($aAuthor);
							$divContent.append($divMetadate);
							$divContent.append($divText);
							$divContent.append($divActions);
							
							$divField.append($textArea);
							
							$formReply.append($divField);
							$formReply.append($divFrsubmit);
							$formReply.append($hiddenId);
							
							$divComment.append($divContent);
					
							
							$divEntire.append($divComment);
							$divEntire.append($formReply);
						});
						
					
						
					}else{
						var $noReply = $("<div id='noReply'>");
						var $hNo = $("<h3>").text("글에 등록된 댓글이 없습니다.");
						
						$noReply.append($hNo);
						$divEntire.append($noReply);
					}
					
				},   /* function(data) 끝 */
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		} 
		
		/*------------------------- 댓글 ajax 끝 ---------------------------  */	

		
		/* 댓글 수정 버튼 누르면 */
		function writeReply(e){
			console.log($(e));
			$(e).parents('.comment').next('form').css('display','block');
			$(e).parents('.actions').prev('.text').css('display','none');
			$(e).parents('.comment').next('form').find('.tRContent').val($(e).parents('.actions').prev('.text').text());
		}
		
		$(document).on('click','.replyUpdate',function(){
			
			var nContent = $(this).prev().find('.tRContent').val();
			var id = $(this).next().val();
			
			console.log('수정한 내용 : '+nContent);
			console.log('원래 댓글 id : '+id);
			
			//console.log(id);
			var tRId = $('input[name=tRId]').val();
			$.ajax({
				url:"freeRupdate.do",
				type:"POST",
				data:{frrContent:nContent,
					frrId:id,
					reffrId:frId
				},
				success:function(data){
					if(data == "success"){
						$(".frrContent").val("");
						getReplyList(); 
					}else{
						alert("댓글작성실패!");
					}
				},
				error:function(){
					console.log("통신 실패입니다.");						
					}
			});
		});
		
			$(document).on('click','.replyDelete',function(){
			
			var id = $(this).children().val();
			
			//console.log(id);
			var frId = $('input[name=reffrId]').val();
			
			//console.log($(this).parents('.comment'));
			var dddd = $(this).parents('.comment');
			var ddddform = $(this).parents('.comment').next("form");
			
			$.ajax({
				url:"freeRdelete.do",
				type:"POST",
				data:{
					frrId:id,
					reffrId:frId
				},
				success:function(data){
					if(data == "success"){
						console.log("wwwwwww");
						console.log(dddd);
						$(dddd).css("display","none");
						$(ddddform).css("display","none");
						$("#comment_start_num").text($("#comment_start_num").text()-1);
						//getReplyList(); 
					}else{
						alert("댓글삭제실패!");
					}
				},
				error:function(){
					console.log("통신 실패입니다.");						
					}
			});
			
			
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