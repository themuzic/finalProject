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
		
		<input type="checkbox" id="chkAll" onclick="">
		<a href="" id="look" style="color:#3287B2; font-size:15px;">보기: 
		 	<span id='special_search_label'>모두</span>
		 	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif">
	 	</a>
	 	<br><br>
					
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
						<th>1</th> <!-- 메일번호 -->
						<th>별</th>
						<th>보낸사람</th>
						<th>메일제목</th>
						<th class="aa">첨부파일</th>
						<th class="aa">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox">
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
							<input type="checkbox">
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
							<input type="checkbox">
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
							<input type="checkbox">
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
							<input type="checkbox">
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
		 });
		
		$(function(){
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_4").addClass("active");	
		});

	</script>

</body>
</html>