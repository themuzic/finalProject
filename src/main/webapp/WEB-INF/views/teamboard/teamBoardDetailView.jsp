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
	#free_header{
		width:100%;
		height:40px;
		background-color:#3287B2;
		color:white;
		font-size:20px;
		padding:7px 20px;
	}
	 #outer{
		width:100%;
		height:100%;
		margin-left:auto;
		margin-right:auto;
	}
	.bd {
    padding: 0;
    max-width: 2000px;
    margin: 0 auto;
    font-weight: normal;
    overflow-x: hidden;
    font-size: 12px;
    letter-spacing: -0.03em;
    background: transparent;
    line-height: 1.5;
	}
	#D_ ._hd .btm_area {
    padding: 10px 16px 25px 16px;
    background: #fff;
	}
	.bd .clear {
    display: block;
    position: relative;
	}
	#D_ ._hd .btm_area > span {
    padding: 0;
    font-size: 12px;
    color: #777;
	}
	.divider{
	display:inline;
	}
	.free_content{
	line-height:210%;
	}
	#C_ {
    padding: 0;
    background: transparent;
	}
	#C_ ._hd {
    width: 100%;
    height: 44px;
    line-height: 44px;
    background: #fafafa;
    border: 1px solid #e5e5e5;
    padding: 0 16px;
    font-size: 13px;
	}
	.test1{
    margin-left:auto;
    margin-right:auto;
    margin-top:50px;

	}
	.test2{
    width: 170px;
    display: inline-block
	}
	.test2 i{
    color:white;
	}
	.test2 a{
    display: block;
    color:white;
    font-size: 14px;
    font-weight: 300;
    background-color: #3287B2;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border-radius: 50px;
    text-decoration: none;
	}
	#comment_start {
    width: 150px;
    cursor: pointer;
    border-radius: 3px;
    margin-bottom: 5px;
    margin-top: 0;
    height: 35px;
    padding-top: 7px;
	}
	#comment_start, #comment_start:after, .article_link, .article_link_internal, .lounge_submenu_li, .menu_item:hover, .rc_category_unselected, .xp_title_top_button {
    transition: all .2s ease-in-out;
	}
	.theme_box2, .btn, .btn_input, .rc_category_unselected:hover, .list_comment_em:hover {
    background-color: #2b8a44;
    color: white;
    border-color: #2b8a44;
	}
	.reply{
		color:#3287B2 !important;
	}
	.ui.comments {
    	max-width: 100% !important;
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
				<div id="outer">
					<div id="free_header">팀게시판 상세 보기</div>
					<hr>
						<div id="bd" class="bd" data-content-width="" data-pjax="off">
							<div id="D_" class="clear">
								<div class="_wrapper">
									<div class="_hd clear">
										<div class="_section" style="/* color:#3287B2 */">
											<h2>
												<span>${tb.tbTitle}</span>
												<input type="hidden" name="reftbId" value="${tb.tbId}">
											</h2>
										</div>
										<div class="btm_area clear">
											</span><b>${tb.empName}</b>ㆍ</sapn>
											<div class="divider"></div>
											<span>조회 수&nbsp;<b>${tb.tbCount}</b>ㆍ</span>
											<div class="divider"></div>
											<span>댓글<b id="uberCount"></b>ㆍ</span>
											<div class="divider"></div>
											<span class="fa fa-clock-o"></span> <span>${tb.tbCreateDate}</span>
											<div class="divider"></div>
												<c:if test="${!empty tb.originalFileName }">
													<span> ㆍ 첨부파일:
														<a href="${contextPath}/resources/tbupload/${tb.renameFileName}" download=${tb.originalFileName}>${tb.originalFileName }</a>           
													</span>
												</c:if>
										</div>
										<div class="free_content" style="margin-bottom:100px;font-size:16px;">${tb.tbContent}</div>
									</div>
								</div>
		    				</div>
		    				
		    			  
							<div class="test1" style="text-align: center;">
			                    <div class="test2">
			                        <a href="listTeamBoard.do"><i class="fas fa-bars "></i><span> 목록보기</span></a>
			                    </div>
				         			<c:if test="${loginUser.empId eq tb.tbWriter }">
				         				 <div class="test2">
					                    <c:url var="update" value="teamBoardUpdateView.do">
					                    	<c:param name="tbId" value="${tb.tbId}"/>
					                    </c:url>
					                    <a href="${update}"><i class="far fa-edit"></i><span> 수정하기</span></a>
				                    </div>
				                    
				                    <div class="test2">
					                    <c:url var="delete" value="teamBoardDelete.do">
					                    	<c:param name="tbId" value="${tb.tbId}"></c:param>
					                    </c:url>
				                        <a href="${delete}"><i class="far fa-trash-alt"></i><span> 삭제하기</span></a>  
				                    </div>
			         			</c:if>
			           		</div>
		    			</div>
		    			</div>
	    				<br>
						<hr>
						<!-- 리플 -->
						
						<div id="comment_start" class="theme_box2 eng relative center box_shadow_3" data-hasqtip="33" aria-describedby="qtip-33" style="text-align:center;">
							<span id="comment_start_num">${tbr.tbrCount }</span>
							<span id="comment_start_title">Comments</span>
						</div>
						
					 	<div class="ui minimal comments" id="entire_comment" style="font-size: 13px;"></div> 
						
							<form class="ui reply form" id="replyForm">
								<div class="field">
									<textarea id="replyContent" style="resize:none;font-size:16px;height:30px;"></textarea>
								</div>
								<div id="frSubmit" class="ui blue submit icon button fr" style="font-size:1.3rem; background-color:#3287B2;">
									댓글 등록
								</div>
							</form>

						<!-- 리플끝 -->
										
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
		
		$(function() {
				
			$("#menu6_1").removeClass("collapsed");
			$("#menu6").addClass("in");
			$("#menu6").attr('aria-expanded',true);
			$("#menu6_1").addClass("active");
			$("#menu6_1").attr('aria-expanded',true);
			$("#m6_2").addClass("active");	
			
			$(".add-sendlist").click(function(){
				$("#divBCC").css("display", "block");
			})
				
			
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
			$(document).on("click","#frSubmit", function(){
				
				var tbrContent = $("#replyContent").val();
				var reftbId = ${tb.tbId};
				
				//var contentBox = $("#replyContent");
				
				/* console.log('댓글내용 : '+frrContent);
				console.log('참조글번호 : '+reffrId); */
				
				$.ajax({
					url:"teamBoardRinsert.do",
					data:{tbrContent:tbrContent, reftbId:reftbId},
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
					
					var tbId= ${tb.tbId};
					console.log(tbId);
					$.ajax({
						url:"teamBoardRlist.do",
						data:{tbId:tbId},
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
									var $aAuthor = $("<a class='author'>").text(value.empName);
									var $divMetadate = $("<div class='metadata'>");
									var $spanDate = $("<span class='date'>").text(value.tbrCreateDate);
									var $divText = $("<div class='text' style='margin-top:7px;'>").text(value.tbrContent);
									var $divActions = $("<div id='" + tbrWriter + "' class='actions fr'>");
									var $aReply1 = $("<a onclick='writeReply(this)' id='fix' class='reply'>").text("수정");
									var $aReply2 = $("<a id='del' class='reply replyDelete'>").text("삭제");
									var $hiddenId2 = $("<input id='hdel' type='hidden' name='tbrId'>").val(value.tbrId);
									
									var $formReply = $("<form id='formRep' class='ui reply form' style='display:none;'>");
									var $divField = $("<div class='field'>");
									var $textArea = $("<textarea class='frrContent' style='resize: none;font-size: 16px;'>");
									var $divFrsubmit = $("<div class='ui blue submit icon button replyUpdate' style='font-size:1.3rem; background-color:#3287B2;'>").text("수정");
									var $hiddenId = $('<input type="hidden" name="tbrId">').val(value.tbrId);
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
					if($(e).parent().attr('id') == '${loginUser.empId}'){
						
						$(e).parents('.comment').next('form').css('display','block');
						$(e).parents('.actions').prev('.text').css('display','none');
						$(e).parents('.comment').next('form').find('.frrContent').val($(e).parents('.actions').prev('.text').text());
					}else{
						alertify.alert('Develoffice', '본인만 수정할 수 있습니다.');
					}
				}


				
				$(document).on('click','.replyUpdate',function(){
					
					var nContent = $(this).prev().find('.frrContent').val();
					var id = $(this).next().val();
					
					console.log('수정한 내용 : '+nContent);
					console.log('원래 댓글 id : '+id);
					
					//console.log(id);
					var frId = $('input[name=reftbId]').val();
					$.ajax({
						url:"teamBoardRupdate.do",
						type:"POST",
						data:{tbrContent:nContent,
							tbrId:id,
							reftbId:frId
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
					
					if($(this).parent().attr('id') == '${loginUser.empId}'){
						
						var id = $(this).children().val();
						
						//console.log(id);
						var frId = $('input[name=reftbId]').val();
						
						//console.log($(this).parents('.comment'));
						var dddd = $(this).parents('.comment');
						var ddddform = $(this).parents('.comment').next("form");
						
						$.ajax({
							url:"teamBoardRdelete.do",
							type:"POST",
							data:{
								tbrId:id,
								reftbId:frId
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
					}else{
						alertify.alert('Develoffice', '본인만 삭제할 수 있습니다.');
					}
					
					
				});
				
				/* ------------------------------------------------------- */
				
	</script>
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
</body>
</html>