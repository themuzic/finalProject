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
	
	.dropscroll-menu {
	    position: absolute;
	    top: 100%;
	    left: 0;
	    float: left;
	    min-width: 130px;
	    padding: 12px 0;
	    margin: 6px 0 0;
	    font-size: 14px;
	    background-color: #fff;
	    border: 1px solid #999;
	    z-index: 110;
    }
    #ul{
    	margin:8px;
    	line-height:2;
    }
    .li{
    	width:140px;
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
					
					<span class="transfer menu" id="transfer">
						<c:url var="transfer" value="transfer.do">
							<c:param name="mailNum" value="${ m.mailNum }"/>
						</c:url>
						<a href="${ transfer }" style="font-size:16px">전달</a>
					</span>&nbsp; &nbsp; &nbsp;
					
					<span class="send menu" id="send">
						<a href="replyMail.do?mailFrom=${ m.mailFrom }" onclick="" style="font-size:16px;">답장</a>
					</span> &nbsp; &nbsp; &nbsp;
					
					<span class="allSend menu" id="allSend">
						<a href="allReplyMail.do?mailFrom=${ m.mailFrom }&mailCc=${ m.mailCc }" onclick="" style="font-size:16px;">전체답장</a>
					</span> &nbsp; &nbsp; &nbsp;
					
					<span class="delete menu" id="delete">
						<c:url var="delete" value="delete.do">
							<c:param name="mailNum" value="${ m.mailNum }"/>
							<c:param name="empId" value="${ loginUser.empId }"/>
						</c:url>
						<a href="${ delete }" style="font-size:16px;">삭제</a>
					</span> &nbsp; &nbsp; &nbsp;
					
<!-- 					<span class="absol_delete menu" id="absol_delete"> -->
<%-- 						<c:url var="mdelete" value="mdelete.do"> --%>
<%-- 							<c:param name="mailNum" value="${m.mailNum }"/> --%>
<%-- 							<c:param name="empId" value="${ loginUser.empId }"/> --%>
<%-- 						</c:url> --%>
<%-- 						<a href="${ mdelete }" style="font-size:16px;">완전삭제</a> --%>
<!-- 					</span> &nbsp; &nbsp; &nbsp; -->
		            <hr>
		            
					<form action="" method="post" encType="multipart/form-data">
			            <div class="view_field" id="view_field">
			                <h3>
			                    <a href="" onclick="" star="N"  class="icon impt " id="aStar" >
			                    	<span class="blind">중요 메일 표시</span>
			                    </a>
			                    
			                    <span class="important">
			                    
			                    <c:if test="${ m.mailImportant == 1 }">
			                    	<i class="fas fa-star"></i>
			                    </c:if>
			                 	<c:if test="${ m.mailImportant == 0 }">
			                 	</c:if>
			                    
			                    </span>
			                    
			                    <span class="title">
			                    	${ m.mailTitle }
			                    	<input type="hidden" value="${ m.mailNum }">
			                    	<input type="hidden" value="${ m.mailDate }">
			                    </span>
			                </h3>
			                <br>
			                <p class="date">${ m.formatDate } </p>
			                <br>
			                <div class="top_link">
			                    <a href="javascript:void(0)" id="spMemoDisplayOrigin" onclick="" class="memo"></a>
			                </div>
			                <div class="sender">
		                    		보낸 사람: <span id="from_addr" name ="mailFrom" &lt>&quot;${ loginUser.empName }&quot; &lt;${ m.mailFrom }&gt;</span>
		                    		 
			                </div>
			                <div class="address">              
			                    	받는 사람: <span name="mailTo">&lt;${ m.mailTo }&gt;</span>                
			                </div>
			                
			                <div class="mailCc">
			                	<c:if test="${ !empty m.mailCc }">
			                		참조인 : <span name="mailCc">&lt;${ m.mailCc }&gt;</span>
			                	</c:if>
			                	<c:if test="${ empty m.mailCc }">
			                	</c:if>
				                <hr>
			                </div>
	                		 
	                		<div>
		                		<c:if test="${ !empty m.renameFileName }">
		                			첨부파일:
									<a href="${ contextPath }/resources/mupload/${ m.renameFileName }" download>
										${ m.originalFileName }
									</a>				
				                <hr>
								</c:if>
							</div>
							<div>
								<c:if test="${ empty m.renameFileName }">
								</c:if>
	                		</div>
			
				            <div class="mailbody" id="mailbody" style="padding-right:30px;">
				            	<div name="mailContent">${ m.mailContent }</div>
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
			
			$(".move").click(function(){
				if($(".dropdown").addClass("show")){
					
				}else{
					$(".dropdown").removeClass("show");
				}			
			});
			
			$(".dropscroll-menu").find("li").mouseenter(function(){
			       $(this).css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).css("background","white");
			    });
			
			$('.dropdown').on({
			    mouseover: function(){
			        $(this).addClass("show");
			    },
			     mouseleave: function(){
			    	$(this).removeClass("show");
			        $(this).addClass("hide");
 			    }
			});
		});

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