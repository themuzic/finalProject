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
		width:100%;
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
		/* color:black; */
		margin-left:auto;
		margin-right:auto;
       /*  box-shadow: 0 0 5px rgba(0,0,0,0.2); */
       /*  background: #fff;  */
        
	}
	
	.bd {
    /* font-family: sans-serif !important; */
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
    width: 530px;
    margin-left:auto;
    margin-right:auto;
    margin-top:50px;

	}

	.test2{
    width: 170px;
    display: inline-block
	}

	.test2 i{
    /* color:rgb(247, 208, 71); */
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
					<div id="free_header">자유게시판 상세 보기</div>
					<hr>
						<div id="bd" class="bd" data-content-width="" data-pjax="off">
							<div id="D_" class="clear">
								<div class="_wrapper">
									<div class="_hd clear">
										<div class="_section" style="/* color:#3287B2 */">
											<h2>
												<span>${f.frTitle}</span>
											</h2>
										</div>
										<div class="btm_area clear">
											</span>${f.frWriter}ㆍ</sapn>
											<div class="divider"></div>
											<span>조회 수<b>${f.frCount}</b>ㆍ</span>
											<div class="divider"></div>
											<span>댓글<b>2</b>ㆍ</span>
											<div class="divider"></div>
											<span class="fa fa-clock-o"></span> <span>${f.frCreateDate}</span>
										</div>
										<div class="free_content">
											<span>${f.frContent}
											</span>
										</div>
									</div>
								</div>
		    				</div>
		    				
		    				
		    			  
							<div class="test1" >
			                    <div class="test2">
			                        <a href="listFree.do"><i class="fas fa-bars "></i><span> 목록보기</span></a>
			                    </div>
			         
			                    <div class="test2">
			                        <a href="freeUpdate.do"><i class="far fa-edit"></i><span> 수정하기</span></a>
			                    </div>
			                    
			                    <div class="test2">
			                        <a href="" style="color:white; cursor:pointer;" ><i class="far fa-trash-alt"></i><span> 삭제하기</span></a>  
			                    </div>
			           		</div>
						
		    				
		    			</div>
		    		
		
		    			</div>
	    				
	    				
	    				<br>

						<!-- 리플 -->
						<div class="ui minimal comments" style="font-size: 12px;">
							<h3 class="ui dividing header">Comments</h3>
							<div class="comment">

								<div class="content">
									<a class="author">Matt</a>
									<div class="metadata">
										<span class="date">2019-09-01</span>
									</div>
									<div class="text">How artistic!</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
							</div>
							<div class="comment">

								<div class="content">
									<a class="author">Elliot Fu</a>
									<div class="metadata">
										<span class="date">2019-09-01</span>
									</div>
									<div class="text">
										<p>This has been very useful for my research. Thanks as
											well!</p>
									</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
								<div class="comments">
									<div class="comment">

										<div class="content">
											<a class="author">Jenny Hess</a>
											<div class="metadata">
												<span class="date">2019-09-01</span>
											</div>
											<div class="text">Elliot you are always so right :)</div>
											<div class="actions">
												<a class="reply">Reply</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="comment">

								<div class="content">
									<a class="author">Joe Henderson</a>
									<div class="metadata">
										<span class="date">2019-09-01</span>
									</div>
									<div class="text">Dude, this is awesome. Thanks so much</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
							</div>

							<form class="ui reply form">
								<div class="field">
									<textarea style="resize: none;"></textarea>
								</div>
								<div class="ui blue labeled submit icon button">
									<i class="edit icon"></i>Add Reply
								</div>
							</form>

						</div>

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