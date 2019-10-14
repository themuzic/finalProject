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
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	.description{
		font-size:12px;
	}
	.test{
		border: 1px solid lightgray;
	}
	.cafe_div{
		width:33.3%;
		height: 300px;
		padding: 30px 60px 30px 60px;
	}
	.menu, .menu_price{
		font-size: 20px;
	}
	#m_table td{
		height: 40px;
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
					
					
					<div class="ui ordered steps" style="width:100%;margin-bottom:30px;">
					<!-- step class -->
					<!-- completed : 완료된 스텝 -->
					<!-- active : 현재 스텝 -->
					<!-- disabled : 아직 도달하지 않은 스텝 -->
					
					  <div class="active step">
					    <div class="content">
					      <div class="title">Menu</div>
					      <div class="description">메뉴를 선택하세요.</div>
					    </div>
					  </div>
					  <div class="disabled step">
					    <div class="content">
					      <div class="title">Quantity</div>
					      <div class="description">수량을 선택하세요.</div>
					    </div>
					  </div>
					  <div class="disabled step">
					    <div class="content">
					      <div class="title">Confirm Order</div>
					      <div class="description">주문을 확인하세요.</div>
					    </div>
					  </div>
					  
					  
					</div>
					
					<!----------------------------------------------------->
					
					<div class="" id="cafe_table_wrap">
						<div id="m_div" class="cafe_div test fl">
							<table id="m_table" class="cafe_table test">
								<tr>
									<td><span class="menu fl">Americano</span> <span class="menu_price fr">1000</span></td>
								</tr>								
								<tr>
									<td><span class="menu fl">Caffè Latte</span> <span class="menu_price fr">1500</span></td>
								</tr>
								<tr>
									<td><span class="menu fl">Vanilla Latte</span> <span class="menu_price fr">1500</span></td>
								</tr>
								<tr>
									<td><span class="menu fl">Hazelnut Latte</span> <span class="menu_price fr">1500</span></td>
								</tr>
								<tr>
									<td><span class="menu fl">Caffè Mocca</span> <span class="menu_price fr">1500</span></td>
								</tr>
								<tr>
									<td><span class="menu fl">Caffè Macchiato</span> <span class="menu_price fr">1500</span></td>
								</tr>
							</table>
						</div>
						
						<div id="q_div" class="cafe_div test fl">
							<table id="q_table" class="cafe_table test"></table>
						</div>
						
						<div id="o_div" class="cafe_div test fl">
							<table id="o_table" class="cafe_table test"></table>
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
		$(function(){
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_5").addClass("active");
			
			
			
			
		});
		
		
		var toggle = false;
		var handle = null;
		
		window.onload = function(){
			startInterval();
		}
		
		function startInterval() {
			setInterval(function(){
				toggleBG();
			}, 600);
		}
		
		function toggleBG() {
			if(toggle){
				$(".active.step").css('background','white');
			} else{
				$(".active.step").css('background','#F3F4F5');
			}
			toggle = !toggle;
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