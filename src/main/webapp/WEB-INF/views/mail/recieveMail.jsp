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
	.mName hover{
		cursor:pointer;
	}
	.aa{
		text-align:right;
	}
	.placeholderBackground{ 
		background-color: #a5a5a5; 
		height: 0.5em; 
		line-height: 0.5em; 
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
					<div class="contentWrap" style="width:1230px;">
					
		<!-- 이 아래부터 내용 작성 -->

		<div class="panel contents content_title" style="width:1130px;">
			<div class="panel-heading" id='m_list_default_menu'>
					<span class="panel-title detail_select" style="font-size:16px; color:#2985db">
						<input type="checkbox" id="chkAll" onclick="MailList.CheckAll();">
						 <a href="javascript:void(0)" id='m_list_view_option' >보기: 
						 	<span id='special_search_label'>모두</span>
						 	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif">
					 	</a>
					 	<span id='m_list_checked_action' style='display:none'><label id='m_list_checked_cnt' ></label></span> 
						<div id='m_list_view_option_detail' class="dropdown hide" >
		                    <ul class="dropdown-menu">
		                        <li><a href="javascript:void(0)" onclick="MailList.SpecialSearch('');">모두</a></li>
		                        <li><a href="javascript:void(0)" onclick="MailList.SpecialSearch('star');" >별 표시</a></li>
		                        <li><a href="javascript:void(0)" onclick="MailList.SpecialSearch('attach');" >첨부 있음</a></li>
		                        <li><a href="javascript:void(0)"onclick="MailList.SpecialSearch('unread');" >안 읽은 메일</a></li>
		                        <li><a href="javascript:void(0)" onclick="MailList.SpecialSearch('read');">읽은 메일</a></li>
		                    </ul>
		                </div>
					</span>
			</div>

	        <div id='m_list_checked_menu' style='display:none'>
	            <span class="detail_select" id="m_list_checked_menu_delete">
	                <a href="javascript:void(0)" onclick="MailList.moveToTrash();">삭제</a>
	            </span>
	            <span class="detail_select">
	                <a href="javascript:void(0)" onclick="MailList.DeleteSelected();">완전삭제</a>
	            </span>
	<!--             <span class="detail_select" id="m_list_checked_menu_resend"> -->
	<!--                 <a href="javascript:void(0)" onclick="MailList.ResendSelected(event);">재발송</a> -->
	<!--             </span> -->
	        
	            <span class="detail_select">
	                <a href="javascript:void(0)" id='m_list_move_mbox' >이동
	                	<img src="/static/ui/images/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
	                </a>
	                
	                <div class="dropdown hide" id='m_list_move_mbox_detail'>
	                    <div class="dropscroll-menu">
	                        <ul style="min-width:220px; border-color:#2985db">
	                            <li>
	                                <a href="javascript:void(0)" id="move_b0"onclick="MailList.moveTo('b0')">받은 편지함</a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)" id="move_b1"onclick="MailList.moveTo('b1')"> 보낸 편지함</a>
	                            </li>    
	                            <li>
	                                <a href="javascript:void(0)" id="move_b3"onclick="MailList.moveTo('b3')">임시 보관함 </a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)" id="move_b5"onclick="MailList.moveTo('b5')"> 휴지통</a>
	                            </li>
	                        </ul>
	                   </div>
	                </div>
	            </span>
	        </div>        

			<div class="panel-body">
				<table class="table" id="listArea">
					<thead>
						<tr>
							<th style="width:0.1px"></th> <!-- 메일번호 -->
							<th>체크/별</th>
							<th>보낸 사람</th>
							<th style="width:550px;">메일 제목</th>
							<th style="width:130px;" class="aa">파일 첨부 여부</th>
							<th style="width:130px;" class="aa">받은 날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden"></td>
							<td><input type="checkbox"></td>
							<td class="mName">전재광</td>
							<td class="mTitle">메일제목입니다.</td>
							<td align="right">첨부파일</td>
							<td class="aa">19-09-16 09:47</td>
						</tr>
						<tr>
							<td><input type="hidden"></td>
							<td><input type="checkbox"></td>
							<td class="mName">유현규</td>
							<td class="mTitle">메일제목입니다.</td>
							<td align="right">첨부파일</td>
							<td class="aa">19-09-17 10:43</td>
						</tr>
						<tr>
							<td><input type="hidden"></td>
							<td><input type="checkbox"></td>
							<td class="mName">설용환</td>
							<td class="mTitle">메일제목입니다.</td>
							<td align="right">첨부파일</td>
							<td class="aa">19-09-18 11:53</td>
						</tr>
						<tr>
							<td><input type="hidden"></td>
							<td><input type="checkbox"></td>
							<td class="mName">김성은</td>
							<td class="mTitle">메일제목입니다.</td>
							<td align="right">첨부파일</td>
							<td class="aa">19-09-19 14:00</td>
						</tr>
						<tr>
							<td><input type="hidden"></td>
							<td><input type="checkbox"></td>
							<td class="mName">원영주</td>
							<td class="mTitle">메일제목입니다.</td>
							<td align="right">첨부파일</td>
							<td class="aa">19-09-19 15:43</td>
						</tr>
					</tbody>
				</table>
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
		 });
		
		$(function(){
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_2").addClass("active");	
		});

	</script>

</body>
</html>