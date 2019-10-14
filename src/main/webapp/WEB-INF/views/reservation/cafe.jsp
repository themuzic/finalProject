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

<link rel="stylesheet" href="resources/semantic/semantic.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/segment.min.css"> -->


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
	.description{
		font-size:12px !important;
	}
	.ui.accordion.menu .item .title{
		font-size:18px !important;
	}
	.test{
		border: 1px solid lightgray;
	}
	.cafe_div{
		width:33.3%;
		height: 320px;
		padding: 30px 70px 30px 60px;
	}
	.menu, .menu_price{
		font-size: 16px;
	}
	#m_table td{
		height: 40px;
	}
	.ui.checkbox{
		box-sizing: border-box;
		width:100%;
	}
	.ui.checkbox input[type="checkbox"]{
		/* right: 30px; */
	    width: 20px;
	    height: 20px;
	    margin-top:3px;
	}
	.ui.checkbox label{
		font-size: 1.5rem !important;
		cursor:pointer !important;
	}
	span{
		font-size: 1.5rem !important;
	}
	#cafe_table_wrap td{
		border:0;
	}
	.icon{
		background:none !important;
	}
	.item{
		padding: 10px 25px 10px 25px !important;
	}
	.ui.checkbox{
		padding-right:27px;
	}
	.ui.checkbox label{
		float:left;
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
					
					  <div class="active step" id="step1">
					    <div class="content">
					      <div class="title">Menu</div>
					      <div class="description">메뉴를 선택하세요.</div>
					    </div>
					  </div>
					  <div class="disabled step" id="step2">
					    <div class="content">
					      <div class="title">Quantity</div>
					      <div class="description">수량을 선택하세요.</div>
					    </div>
					  </div>
					  <div class="disabled step" id="step3">
					    <div class="content">
					      <div class="title">Confirm Order</div>
					      <div class="description">주문을 확인하세요.</div>
					    </div>
					  </div>
					  
					  
					</div>
					
					<!----------------------------------------------------->
					
					<div class="ui vertical accordion menu" style="width:100%;">
					
					
					  <div class="item">
					    <a class="active title">
					      <i class="dropdown icon" id="tab1"></i>
					      Menu
					    </a>
					    <div class="active content">
					    	<div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu1">
					              <label>Americano</label><span class="fr">1000원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu2">
					              <label for="menu2">Cafe Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu3">
					              <label for="menu3">Vanilla Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu4">
					              <label for="menu4">Hazelnut Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu5">
					              <label for="menu5">Cafe Mocca</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu6">
					              <label for="menu6">Cafe Macchiato</label><span class="fr">1500원</span>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon" id="tab2"></i>
					      Quantity
					    </a>
					    <div class="content">
					      
					    </div>
					  </div>
					  
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon" id="tab3"></i>
					      Confirm Order
					    </a>
					    <div class="content">
					      
					    </div>
					  </div>
					  
					  
					</div>
					
					
					
					
					
					
					
					<!----------------------------------------------------->
					
					
					
					
					
					
					
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
			
			
			/* step 단계별 활성화 */
			$("#tab1").click(function(){
				
				$("#step1").removeClass('completed');
				$("#step1").addClass('active');
				
				$("#step2").css('background','white');
				$("#step2").removeClass('completed');
				$("#step2").removeClass('active');
				$("#step2").addClass('disabled');			
				
			});
			
			
			$("#tab2").click(function(){
				$("#step1").css('background','white');
				$("#step1").removeClass('active');
				$("#step1").addClass('completed');
				
				$("#step2").removeClass('disabled');
				$("#step2").addClass('active');			
				
			});
			
			
		});
		
		/* 화면 상단 스텝 깜빡임 시작 */
		
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
		
		/* 화면 상단 스텝 깜빡임 끝 */
		
		
		/* 메뉴담기 시작 */
		
		var menuArr = new Array();
		
		$('input[type="checkbox"]').change(function(){
			if($(this).prop('checked')){
				menuArr.push($(this).val());
			}else{
				for(var i in menuArr){
					if(menuArr[i] == $(this).val()){
						menuArr.splice(menuArr.indexOf($(this).val()),1);
					}
				}
			}
			console.log(menuArr);
		});
		
		/* 메뉴담기 끝 */
		
		$('.ui.accordion').accordion();
		
		
	
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/semantic/semantic.js"></script>
</body>
</html>