<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Insert title here</title>
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
					<div class="contentWrap" style="width:1210px;">
					
		<!-- 이 아래부터 내용 작성 -->

		<fieldset>
		 	<div id='m_list_default_menu'>
	            <span class="detail_select">
					<input type="checkbox" id="chkAll" name="chkAll" onclick="">
					<a href="" id="look" style="color:#3287B2; font-size:15px;">
					 	<span id="lookAll" class="lookAll" style="">보기: 모두</span>
					 	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif">
				 	</a>
		            <span id='m_list_checked_action' style='display:none'>
		            	<label id='m_list_checked_cnt' ></label>
		            </span>
		            <!-- Drop Down -->                            
		            <div id='m_list_view_option_detail' class="dropdown hide" >
		                <ul class="dropdown-menu">
		                    <li><a href="" onclick="">모두</a></li>
		                    <li><a href="" onclick="">별 표시</a></li>
		                    <li><a href="" onclick="">첨부 있음</a></li>
		                    <li><a href=""onclick="">안 읽은 메일</a></li>
		                    <li><a href="" onclick="">읽은 메일</a></li>
		                </ul>
		            </div>
		           	<!-- // Drop Down -->
	            </span>
	        </div>
	        
	        <div id='chkMenu' class="chkMenu" name="chkMenu" style="display:none">
	            <span class="detail_select" id="m_list_checked_menu_delete">
	                <a href="javascript:void(0)" onclick="">삭제</a>
	            </span>
	            <span class="detail_select">
	                <a href="javascript:void(0)" onclick="">완전삭제</a>
	            </span>
	            <span class="detail_select" id="m_list_checked_menu_resend">
	                <a href="javascript:void(0)" onclick="">재발송</a>
	            </span>
	        
	            <span class="detail_select">
	                <a href="javascript:void(0)" id='m_list_move_mbox' >이동
	                	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
	                </a>
	                <div class="dropdown hide" id='m_list_move_mbox_detail'>
	                    <div class="dropscroll-menu">
	                        <ul style="min-width:220px; border-color:#2985db">
	                            <li>
	                                <a href="" id="receive"onclick="">받은 편지함</a>
	                            </li>
	                            <li>
	                                <a href="" id="send"onclick=""> 보낸 편지함</a>
	                            </li>
	                            <li>
	                                <a href="" id="delete"onclick="">휴지통</a>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
            	</span>
            </div>   
	 	</fieldset>
	 	
	 	<div id='optionDetail' class="dropdown hide" style="display:none;">
           <ul class="dropdown-menu">
               <li><a href="" onclick="allMail">모두</a></li>
               <li><a href="" onclick="starMail;" >별 표시</a></li>
               <li><a href="" onclick="fileMail" >첨부 있음</a></li>
               <li><a href=""onclick="noReadMail" >안 읽은 메일</a></li>
               <li><a href="" onclick="readMail">읽은 메일</a></li>
           </ul>
       </div>
	 	
			
		<table class="ui selectable celled table">
			<colgroup>
				<col style="width:2%;">
				<col style="width:4%;">
				<col style="width:8%;">
				<col style="width:60%;">
				<col style="width:12%;">
				<col style="width:15%;">
			</colgroup>
				<thead>
					<tr>
						<th>chk</th>
						<th>별</th>
						<th>보낸사람</th>
						<th>메일제목</th>
						<th class="aa">첨부파일</th>
						<th class="aa">날짜</th>
					</tr>
				</thead>
				<tbody class="select_subject">
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><img src=""></td>
						<td class="mName">전재광</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-16 09:47</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><img src=""></td>
						<td class="mName">유현규</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-17 10:43</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><img src=""></td>
						<td class="mName">설용환</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-18 11:53</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><img src=""></td>
						<td class="mName">김성은</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-19 14:00</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><img src=""></td>
						<td class="mName">원영주</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-19 15:43</td>
					</tr>
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
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
		$(function(){
		    $("#listArea").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		    });
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_2").addClass("active");	
			
			/* 체크박스 전체 선택하기 */
			$("#chkAll").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $(".select_subject input").prop('checked', true);
				else  $(".select_subject input").prop('checked', false);
			});
						
			$("#chkAll").click(function(){
				 if($(this).attr("checked")){
				      $('.lookAll').css('display', 'none');
				      $(".chkMenu").css('display', 'block');
				 }else{
				      $('.lookAll').css('display', 'block');
				      $('.chkMenu').css('display', 'none');
				 }
			});
			
			
			
			
		});

	</script>

</body>
</html>