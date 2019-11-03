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
	.hidden.content{
		display:block !important;
	}
	.visible.content{
		text-align:center;
		font-size:13px;
	}
	.item a{
		cursor:default !important;
	}
	.dropdown.icon{
		display: none !important;
	}
	.item > .content{
		margin-top: 20px;
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
					  <div class="disabled step" id="step4">
					    <div class="content">
					      <div class="title">Complete</div>
					      <div class="description">주문이 완료되었습니다.</div>
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
					    <div class="active content" id="mDiv">
					    	<div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu1" value="Americano">
					              <label>Americano</label><span class="fr">1000원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu2" value="Cafe Latte">
					              <label for="menu2">Cafe Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu3" value="Vanilla Latte">
					              <label for="menu3">Vanilla Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu4" value="Hazelnut Latte">
					              <label for="menu4">Hazelnut Latte</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu5" value="Cafe Mocca">
					              <label for="menu5">Cafe Mocca</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui checkbox">
					              <input type="checkbox" name="menu" id="menu6" value="Cafe Macchiato">
					              <label for="menu6">Cafe Macchiato</label><span class="fr">1500원</span>
					            </div>
					          </div>
					          
					          <div class="field" style="text-align: center;">
					            <div class="ui vertical animated button nextBtn" id="nextTo2" tabindex="0" >
					              <div class="visible content">Next</div>
								  <div class="hidden content">
								  	<span class="lnr lnr-chevron-right"></span>
								  </div>
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
					    <div class="content" id="qDiv" style="padding-left: 27px;">
					    
					    </div>
					  </div>
					  
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon" id="tab3"></i>
					      Confirm Order
					    </a>
					    <div class="content" id="oDiv" style="padding-left: 27px;">
					    	
					    </div>
					  </div>
					  
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon" id="tab4"></i>
					      Complete
					    </a>
					    <div class="content" id="cDiv" style="padding-left: 27px;">
					    	
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
			$("#menu5_1").removeClass("collapsed");
			$("#menu5").addClass("in");
			$("#menu5").attr('aria-expanded',true);
			$("#menu5_1").addClass("active");
			$("#menu5_1").attr('aria-expanded',true);
			$("#m5_5").addClass("active");
			
			
			
			
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
		
		
		$('.ui.accordion').accordion();
		
		
		/* 메뉴담기 시작 */
		
		var menuArr = new Array();		//메뉴이름
		var quantityArr = new Array();	//갯수
		
		
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
		
		/* 버튼 클릭 */
		$("#nextTo2").on('click',function(){
			console.log(menuArr);
			if(menuArr.length == 0){
				$(this).parent('div').click();
				alert('선택된 메뉴가 없습니다.');
				return;
			}
			
			for(var i in menuArr){
				/* 메뉴 생성 */
				var $div1 = $('<div class="field">');
				var $div2 = $('<div class="ui checkbox">');
				var $menuName = $('<span>').text(menuArr[i]);
				var $number = $('<input type="number" min="1" placeholder="1" value="1" class="fr qtt" style="width:40px;">');
				
				$div2.append($menuName);
				$div2.append($number);
				$div1.append($div2);
				
				$(this).closest('.item').next('.item').children('.content').append($div1);
			}
			
			/* 버튼 생성 */
			var $bDiv = $('<div class="field" style="text-align:center;">');
			var $bDiv1 = $('<div class="ui vertical animated button prevBtn" id="prevTo1" tabindex="0">');
			var $bDiv2 = $('<div class="ui vertical animated button nextBtn" id="nextTo3" tabindex="0">');
			var $bDivPrev = $('<div class="visible content">').text('Prev');
			var $bDivNext = $('<div class="visible content">').text('Next');
			var $bDivHidden1 = $('<div class="hidden content">');
			var $bDivHidden2 = $('<div class="hidden content">');
			var $spanPrev = $('<span class="lnr lnr-chevron-left">');
			var $spanNext = $('<span class="lnr lnr-chevron-right">');
			
			$bDivHidden1.append($spanPrev);
			$bDivHidden2.append($spanNext);
			$bDiv1.append($bDivPrev);
			$bDiv1.append($bDivHidden1);
			$bDiv2.append($bDivNext);
			$bDiv2.append($bDivHidden2);
			$bDiv.append($bDiv1);
			$bDiv.append($bDiv2);
			
			$(this).closest('.item').next('.item').children('.content').append($bDiv);
			
			$(this).closest('.item').next('.item').children('a').click();
			
			$("#step1").css('background','white');
			$("#step1").removeClass('active');
			$("#step1").addClass('completed');
			
			$("#step2").removeClass('disabled');
			$("#step2").addClass('active');
		});
		
		
		$("#qDiv").on('click','#prevTo1',function(){
			$(this).closest('.item').prev('.item').children('a').click();
			$(this).closest('.content').html("");
			
			$("#step1").removeClass('completed');
			$("#step1").addClass('active');
			
			$("#step2").css('background','white');
			$("#step2").removeClass('active');
			$("#step2").addClass('disabled');
		});
		
		
		$("#qDiv").on('click','#nextTo3',function(){
			quantityArr = document.getElementsByClassName("qtt");
			console.log(quantityArr);
			
			for(var i in menuArr){
				var $div1 = $('<div class="field">');
				var $div2 = $('<div class="ui checkbox">');
				var $div2_1 = $('<div class="fl" style="width:50%;">');
				var $div2_2 = $('<div class="fl" style="width:50%;padding-left:17%;">');
				var $span2_1_1 = $('<span class="fl"></span>').text(menuArr[i]);
				
				
				for(var j in quantityArr){
					if(i == j){
						var $span2_2_1 = $('<span class="fl"></span>').text(quantityArr[j].value);
						
						if(menuArr[i] == 'Americano'){
							var $span2_2_2 = $('<span class="pr"></span>').text(parseInt(quantityArr[j].value)*1000);
						} else {
							var $span2_2_2 = $('<span class="pr"></span>').text(parseInt(quantityArr[j].value)*1500);
						}
					}
				}
				
				var $div2_2_1 = $('<div class="fr">');
				
				var $span2_2_3 = $('<span></span>').text('원');
				
				
				$div2_2_1.append($span2_2_2);	//가격
				$div2_2_1.append($span2_2_3);
				
				$div2_2.append($span2_2_1);		//수량
				$div2_2.append($div2_2_1);
				
				$div2_1.append($span2_1_1);		//메뉴이름
				
				$div2.append($div2_1);
				$div2.append($div2_2);
				
				$div1.append($div2);
				
				$(this).closest('.item').next('.item').children('.content').append($div1);
			}
			
			/* 버튼 생성 */
			var $bDiv = $('<div class="field" style="text-align:center;margin-top:15px;">');
			var $bDiv1 = $('<div class="ui vertical animated button prevBtn" id="prevTo2" tabindex="0">');
			var $bDiv2 = $('<div class="ui vertical animated button nextBtn" id="pay" tabindex="0">');
			var $bDivPrev = $('<div class="visible content">').text('Prev');
			var $bDivNext = $('<div class="visible content">').text('Pay');
			var $bDivHidden1 = $('<div class="hidden content">');
			var $bDivHidden2 = $('<div class="hidden content">');
			var $spanPrev = $('<span class="lnr lnr-chevron-left">');
			var $spanNext = $('<span>').text('결제');
			
			$bDivHidden1.append($spanPrev);
			$bDivHidden2.append($spanNext);
			$bDiv1.append($bDivPrev);
			$bDiv1.append($bDivHidden1);
			$bDiv2.append($bDivNext);
			$bDiv2.append($bDivHidden2);
			$bDiv.append($bDiv1);
			$bDiv.append($bDiv2);
			
			var $div1 = $('<div class="field">');
			var $div2 = $('<div class="ui checkbox">');
			var $div2_1 = $('<div class="fl" style="width:50%;">');
			var $div2_2 = $('<div class="fl" style="width:50%;padding-left:17%;">');
			var $span2_1_1 = $('<span class="fl"></span>').text('Total');
			
			
			sumQ = 0;
			sumP = 0;
			$.each(quantityArr, function(index, qtt){
				sumQ += parseInt(qtt.value);
			})
			
			$.each($('.pr'),function(index, price){
				
				console.log(price.innerText);
				sumP += parseInt(price.innerText);
			})
			
			var $span2_2_1 = $('<span class="fl"></span>').text(sumQ);
			
			var $div2_2_1 = $('<div class="fr">');
			var $span2_2_2 = $('<span></span>').text(sumP);
			var $span2_2_3 = $('<span></span>').text('원');
			
			$div2_2_1.append($span2_2_2);	//총가격
			$div2_2_1.append($span2_2_3);
			
			$div2_2.append($span2_2_1);	//총갯수
			$div2_2.append($div2_2_1);
			
			$div2_1.append($span2_1_1);
			$div2.append($div2_1);
			$div2.append($div2_2);
			
			$div1.append($div2);
			
			
			$(this).closest('.item').next('.item').children('.content').append($('<hr>'));
			
			$(this).closest('.item').next('.item').children('.content').append($div2);
			
			$(this).closest('.item').next('.item').children('.content').append($bDiv);
						
			$("#step2").css('background','white');
			$("#step2").removeClass('active');
			$("#step2").addClass('completed');
			
			$("#step3").removeClass('disabled');
			$("#step3").addClass('active');
			
			$(this).closest('.item').next('.item').children('a').click();
		});
		
		
		
		$("#oDiv").on('click','#prevTo2',function(){
			
			$(this).closest('.item').prev('.item').children('a').click();
			$(this).closest('.content').html("");
			
			$("#step2").removeClass('completed');
			$("#step2").addClass('active');
			
			$("#step3").css('background','white');
			$("#step3").removeClass('active');
			$("#step3").addClass('disabled');
		});
		
		
		$("#oDiv").on('click','#pay',function(){
			
			inicis();
		});
		
		
		
		
		function completeOrder() {
			
			var $div = $('<div class="field">');
			var $div1 = $('<div class="ui checkbox">');
			var $div2 = $('<div class="ui checkbox">');
			var $span1_1 = $('<span class="fl">').text(menuArr[0]+' 외 '+(sumQ-1)+'건');
			var $span1_2 = $('<span class="fr">').text(sumP+'원');
			var $p2_1 = $('<p class="fl" style="color:#4183C4;margin-top:10px;font-size:12px;">').text('* 카페에서 사원증을 제시해 주세요.');
			
			$div1.append($span1_1);
			$div1.append($span1_2);
			$div2.append($p2_1);
			$div.append($div1);
			$div.append($div2);
			
			
			/* 버튼 생성 */
			var $bDiv = $('<div class="field" style="text-align:center;">');
			var $bDiv1 = $('<div class="ui vertical animated button prevBtn" id="check" tabindex="0">');
			var $bDiv2 = $('<div class="ui vertical animated button nextBtn" id="myReserv" tabindex="0">');
			var $bDivPrev = $('<div class="visible content">').text('Okay');
			var $bDivNext = $('<div class="visible content">').text('내 예약');
			var $bDivHidden1 = $('<div class="hidden content">');
			var $bDivHidden2 = $('<div class="hidden content">');
			var $spanPrev = $('<span>').text('확인');
			var $spanNext = $('<span>').text('확인');
			
			$bDivHidden1.append($spanPrev);
			$bDivHidden2.append($spanNext);
			$bDiv1.append($bDivPrev);
			$bDiv1.append($bDivHidden1);
			$bDiv2.append($bDivNext);
			$bDiv2.append($bDivHidden2);
			$bDiv.append($bDiv1);
			$bDiv.append($bDiv2);
			
			
			$("#cDiv").append($div);
			$("#cDiv").append($bDiv);
			
			$("#tab4").parent('a').click();
			
			$("#step3").css('background','white');
			$("#step3").removeClass('active');
			$("#step3").addClass('completed');
			
			$("#step4").removeClass('disabled');
			$("#step4").addClass('active');			
		}
		
		
		
		/* 이니시스 결제 */
		function inicis() {
			
			var fullMenuName = "";
			
			$.each(menuArr, function(index, value){
				if((menuArr.length-1) == index){
					fullMenuName += value;
				} else{
					fullMenuName += value+',';
				}
			});
			
			<!-- 결제  -->
		    	IMP.init('imp80836035');
		    
		    	IMP.request_pay({
		    	    pg : 'html5_inicis',	/* 결제PG사 */
		    	    pay_method : 'card',/* 결제방법 */
		    	    merchant_uid : 'R' + new Date().getTime(),	/* 주문번호 */
		    	    name : menuArr[0]+' 외 '+(menuArr.length-1)+'잔'+' 결제',	/* 주문이름 */
		    	    amount : sumP,		/* 결제 가격 */
		    	    buyer_email : '${loginUser.email}',	/* 구매자 이멜 */
		    	    buyer_name : '${loginUser.empName}',	/* 구매자 이름 */
		    	    buyer_tel : '${loginUser.phone}',		/* 구매자 전화번호(필수) '010-1234-5678' */
		    	}, function(rsp) {
		    		$.ajax({
		    			url:"payment.do",
		    			type:"post",
		    			data:{payNum:rsp.imp_uid,
		    				  reservNum:rsp.merchant_uid,
		    				  payPrice:rsp.paid_amount,
		    				  confirmNum:rsp.apply_num,
		    				  empId:'${loginUser.empId}',
		    				  price:sumP,
		    				  product:fullMenuName,
		    				  quantity:sumQ
		    				 },
		    			success:function(data){
		    				
		    				if(data == "success"){
		    					
		    					completeOrder();
		    					
		    				} else{
		    					alertify.alert('', '결제 실패');
		    				}
		    			},
		    			error:function(){
		    				alertify.alert('', '통신 실패 : 다시 시도해 주세요.');
		    			}			    			
		    			
		    		});	/* ajax close */
		    	});		/* function(rsp) close */
		    
		}	<!--  이니시스 결제 close   -->
		
		$(document).on('click','#myReserv',function(){
			location.href="myReservListView.do?empId=${loginUser.empId}";
		});
		
		
		
	</script>
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	<script src="resources/semantic/semantic.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</body>
</html>