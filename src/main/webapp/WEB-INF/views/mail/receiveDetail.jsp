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
					
					
					<span class="send menu" id="send">
						<a href="" onclick="" style="font-size:16px;">답장</a>
					</span> &nbsp; &nbsp; &nbsp;
					<span class="allSend menu" id="allSend">
						<a href="" onclick="" style="font-size:16px;">전체답장</a>
					</span> &nbsp; &nbsp; &nbsp;
					<span class="delete menu" id="delete">
						<a href="" onclick="" style="font-size:16px;">삭제</a>
					</span> &nbsp; &nbsp; &nbsp;
					<span class="absol_delete menu" id="absol_delete">
						<a href="" onclick="" style="font-size:16px;">완전삭제</a>
					</span> &nbsp; &nbsp; &nbsp;
					
					
					
					<span class="move menu" id="move">
		                <a href="javascript:void(0)" id='m_view_move_mbox' >이동
		                	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
		                </a>
		                <div class="dropdown hide" id="m_view_move_mbox_detail" style="margin-left:330px;">
		                    <div class="dropscroll-menu" style="width:150px;">
		                        <ul style="min-width:220px; border-color:#2985db;" id="ul">
						            <li class="li">
		                                <a href="javascript:void(0)" id="move_b0" onclick="MailView.moveTo('53307','b0')" style="color:gray;">받은 편지함</a>
		                            </li>
						            <li class="li">
		                                <a href="javascript:void(0)" id="move_b1" onclick="MailView.moveTo('53307','b1')" style="color:gray;">보낸 편지함</a>
		                            </li>
						            <li class="li">
		                                <a href="javascript:void(0)" id="move_b2" onclick="MailView.moveTo('53307','b2')" style="color:gray;">보낼 편지함</a>
		                            </li>
						            <li class="li">
		                                <a href="javascript:void(0)" id="move_b3" onclick="MailView.moveTo('53307','b3')" style="color:gray;">임시 보관함</a>
		                            </li>
						            <li class="li">
		                                <a href="javascript:void(0)" id="move_b5" onclick="MailView.moveTo('53307','b5')" style="color:gray;">휴지통</a>
		                            </li>
								</ul>
		                     </div>  
						</div>
		            </span>
		            <hr>
		            
					<form>
			            <div class="view_field" id="view_field">
			                <h3>
			                    <a href="" onclick="" star="N"  class="icon impt " id="aStar" >
			                    	<span class="blind">중요 메일 표시</span>
			                    </a>
			                    <span class="title">메일입니다</span>
			                </h3>
			                <br>
			                <p class="date">2019-09-23 21:06:13 - 보낸 시간 </p>
			                <br>
			                <div class="top_link">
			                    <a href="javascript:void(0)" id="spMemoDisplayOrigin" onclick="" class="memo"></a>
			                </div>
			                <div class="sender">
		                    		보낸 사람: <span id="from_addr" name ="이름" &lt> &lt;아이디&gt;</span> 
			                </div>
			                <div class="addressee">              
			                    	받는 사람: &quot;이름&quot; &lt;아이디&gt;                
			                </div>
			                <hr>
			
				            <div class="mailbody" id="mailbody" style="padding-right:30px;">
				            	<!-- src : 불러올 주소 이름(불러올 메일) -->
				                <iframe src="receiveMail.jsp" height="300px" style="width:100%" scrolling="no" frameborder=0 id="ifMailContent" name="ifMailContent">
				                </iframe>                                
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
				$(".dropdown").addClass("show");				
			});
			
			$(".dropscroll-menu").find("li").mouseenter(function(){
			       $(this).css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).css("background","white");
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