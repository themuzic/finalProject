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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


<!-- 풀캘린더 -->
<script src="resources/calendar/jquery.min.js"></script>

<script>
	var j = jQuery.noConflict();
</script>

<link rel="stylesheet" href="resources/calendar/main.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.css">
<link rel="stylesheet" href="resources/calendar/fullcalendar.min.css">
<!-- <script src="resources/calendar/addEvent.js"></script>   -->
<!-- <script src="resources/calendar/editEvent.js"></script>   -->
<!-- <script src="resources/calendar/etcSetting.js"></script>   -->
<script src="resources/calendar/moment.min.js"></script>  
<script src="resources/calendar/fullcalendar.min.js"></script>
<script src="resources/calendar/ko.js"></script>


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
	#calendar {
		max-width: 900px;
		margin: 0 auto;
		font-size: 0.8em;
	}
	.panel .panel-heading {
	    position: relative;
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
			
				<!-- 일자 클릭시 메뉴오픈 -->
		        <div id="contextMenu" class="dropdown clearfix">
		            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
		                style="display:block;position:static;margin-bottom:5px;">
		                <li><a tabindex="-1" href="#">카테고리1</a></li>
		                <li><a tabindex="-1" href="#">카테고리2</a></li>
		                <li><a tabindex="-1" href="#">카테고리3</a></li>
		                <li><a tabindex="-1" href="#">카테고리4</a></li>
		                <li class="divider"></li>
		                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		            </ul>
		        </div>
			
			
			
			
				<!-- 풀캘린더 불러오기 -->	
				<div class="wrap">
					 <div id="loading"></div>
					<div id="calender"></div>
				</div>
			
			
			
				 <!-- 일정 추가 MODAL -->
		        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
		            <div class="modal-dialog" role="document">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
		                                aria-hidden="true">&times;</span></button>
		                        <h4 class="modal-title"></h4>
		                    </div>
		                    <div class="modal-body">
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
		                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-title">일정명</label>
		                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
		                                    required="required" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-start">시작</label>
		                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-end">끝</label>
		                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-type">구분</label>
		                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
		                                    <option value="카테고리1">카테고리1</option>
		                                    <option value="카테고리2">카테고리2</option>
		                                    <option value="카테고리3">카테고리3</option>
		                                    <option value="카테고리4">카테고리4</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-color">색상</label>
		                                <select class="inputModal" name="color" id="edit-color">
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-desc">설명</label>
		                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
		                                    id="edit-desc"></textarea>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modal-footer modalBtnContainer-addEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
		                    </div>
		                    <div class="modal-footer modalBtnContainer-modifyEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
		                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
		                    </div>
		                </div><!-- /.modal-content -->
		            </div><!-- /.modal-dialog -->
		        </div><!-- /.modal -->
	        
	        
		        <br>
		        <!-- 카테고리 별로 일정 확인하기 -->
		        <div class="panel panel-default" style="-webkit-box-shadow: none;">
	
	            <div class="panel-heading" style="height:40px; padding-top:10px; padding-left:9px; background:#F9FAFB;">
	                <h3 class="panel-title" style="font-size:16px; color:#505363;"><b>필터</b></h3>
	            </div>
	
	            <div class="panel-body" style="padding-left:9px;">
	
	                <div class="col-lg-6" style="padding-left:0px;">
	                    <label for="calendar_view"><b>구분별</b></label>
<!-- 	                    <div class="input-group"> -->
<!-- 	                        <select class="filter" id="type_filter" multiple="multiple"> -->
<!-- 	                            <option value="카테고리1">카테고리1</option> -->
<!-- 	                            <option value="카테고리2">카테고리2</option> -->
<!-- 	                            <option value="카테고리3">카테고리3</option> -->
<!-- 	                            <option value="카테고리4">카테고리4</option> -->
<!-- 	                        </select> -->
<!-- 	                    </div> -->
	                </div>
	
	                <div class="col-lg-6">
	                    <label for="calendar_view"><b>등록자별</b></label>
	                    <div class="input-group" style="width:380px; box-shadow: none;">
	                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="전재광"
	                                checked>전재광</label>
	                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="김상윤"
	                                checked>김상윤</label>
	                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="설용환"
	                                checked>설용환</label>
	                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="유현규"
	                                checked>유현규</label>
	                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="원영주"
	                                checked>원영주</label>
	                </div>
	             </div>
	
            </div>
        </div>
        <!-- /.filter panel -->
		<hr>	
			
			
			
			
			
			
			<div id="searchArea" align="right">
				<form action="search.do">
					<select id="searchCondition" name="condition" style="height:32px; border:1px solid lightgray" >
					    <option>------</option>
					    <option value="writer">작성자</option>
					    <option value="type">유형</option>
					    <option value="title">제목</option>
					    <option value="content">내용</option>
					</select>
					<div class="ui input">
						<input type="search" name="search" value="${ search }" placeholder="Search..." style="height:32px;">
						<i class="circular search link"></i>
					</div>	         
					<button type="submit" onclick="return validate();" style="color:#3287B2">검색하기</button>
				</form>
	       </div>
	       
	       <script>
		       function validate(){
		           if($("option:selected").val() == "------"){
// 		              alert("검색 조건을 체크해주세요");
		              alertify.alert("", "검색 조건을 체크해주세요");
		           return false;
		           }
		        }
	       </script>
	       
	       <div align="left">
				<b style="color: #505363">팀 일정</b>
				<input type="radio" name="radio" value="team" style="margin-bottom:7px;">&nbsp;
				<b style="color: #505363">전체 일정</b>
				<input type="radio" name="radio" value="all" style="margin-bottom:7px;">
			</div>			
					
			<table class="ui selectable celled table">
			<colgroup>
				<col style="width:10%;">
				<col style="width:15%;">
				<col style="width:40%;">
				<col style="width:15%;">
				<col style="width:20%;">
			</colgroup>
				<thead>
					<tr>
						<th style="color: #676767;">번호</th>
						<th style="color: #676767;">작성자</th>
						<th style="color: #676767;">제목</th>
						<th style="color: #676767;">유형</th>
						<th class="aa" style="color: #676767;">작성일</th>
					</tr>
				</thead>
				<tbody class="select_subject">
					<tr>
						<td class="sNo">1</td>
						<td class="sName">김상윤</td>
						<td class="sTitle">휴가올립니다</td>
						<td class="sType">휴가
<%-- 							<a href="${ mdetail }" style="color:gray;">${ m.mailTitle }</a> --%>
						</td>
						
						<td class="sDate aa">2019-10-28</td>
					</tr>
			</tbody>
		</table>

		<div id="pagingArea" align="center">
 			<!-- [이전] -->
			<c:if test="${ pi.currentPage == 1 }">
				이전&nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:if test="${ !empty m }">
					<c:url var="mlistBack" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
					<c:url var="mlistBack" value="receiveMail.do">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
					</c:url>
				</c:if>
				<a href="${ mlistBack }">이전</a>
			 </c:if>
         
	         <!-- [번호들] -->
	         <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            <c:if test="${ p eq pi.currentPage }">
	               <font color="#3287B2" size="3">${ p }</font>
	            </c:if>
	            <c:if test="${ p ne pi.currentPage }">
	               <c:if test="${ !empty m }"> <!-- 검색결과 있으면 -->
	                  <c:url var="mlistPage" value="search2.do">
	                     <c:param name="currentPage" value="${ p }"/>
	                     <c:param name="condition" value="${ condition }"/>
	                     <c:param name="search" value="${ search }"/>
	                     <c:param name="mailFrom" value="${ m.mailFrom }"/>
						 <c:param name="mailTo" value="${ m.mailTo }"/>
	                  </c:url>
	               </c:if>
	               <c:if test="${ empty m }"> <!-- 검색 결과 없으면 -->
		               <c:url var="mlistPage" value="receiveMail.do">
		                  <c:param name="currentPage" value="${ p }"/>
		               </c:url>                  
	               </c:if>
	               <a href="${ mlistPage }">${ p }</a>
	            </c:if>
	         </c:forEach>
         
        	<!-- [다음] -->
			<c:if test="${ pi.currentPage == pi.maxPage }">
				&nbsp;다음
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:if test="${ !empty m }">
					<c:url var="mlistNext" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
					<c:url var="mlistNext" value="receiveMail.do">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
				</c:if>
				<a href="${ mlistNext }">다음</a>
			</c:if>
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
	$("#menu4").addClass("in");
	$("#menu4").attr('aria-expanded',true);
	$("#menu4_1").addClass("active");
	$("#menu4_1").attr('aria-expanded',true);
	$("#m4_2").addClass("active");	
	
	});
		 
	</script>
	
	<script>
	
	j(function(){
		fullCalendar();
	});
	
	function fullCalendar(){
	 
		j("#calender").html("");
			 
			 var date = new Date();
			 var d = date.getDate();
			 var m = date.getMonth();
			 var y = date.getFullYear();
			 
			 var calendar = j('#calender').fullCalendar({
			  
			   header: {
				   left: "month,basicWeek,basicDay",
				   center: "title",
				   right: "today prev,next"
			   },
			   defaultDate: '2019-10-27',   // 기본설정 날짜
			   defaultView: 'month',		// 처음 화면에 보여질 영역(월, 주, 일)
			   locale: 'ko',				// 언어
			   navLinks: true,				// 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능을 사용하는지에 대한 여부
			   editable: true,				// 실행된 달력에서 일정(event)을 표시한 바(bar)를 마우스로 이동할 수 있게 하는 것
			   allDaySlot: false,			// 캘린더 상단에 "하루 종일"슬롯이 표시되는지 여부
			   eventLimit: true,			// 하루 기본일정 3개, 그 이상시, more로 처리
			   minTime: '09:00:00',
			   maxTime: '24:00:00',
			   contentHeight: 450,
			   theme: true, 				// css 사용할 수 있게
			   
			   titleFormat: {
				   month: "YYYY년 MMMM",
				   week: "YYYY년 MMM DD일 (ddd) ",
				   day: "YYYY년 MMM DD일 dddd"
			   },
			   
			   selectable: true,
			   selectHelper: true,
			   select: function(start, end) {
			   		var title = prompt("뭐추가할라고,,,");
					var eventData;
					if (title) {
						eventData = {
							title: title,
							start: start,
							end: end
						};
						console.log(start);
						j('#calendar').fullCalendar('renderEvent', eventData, true); 
					}
					j('#calendar').fullCalendar('unselect');
			   },
			   
			   events: [
				{
					title: '회사 쉬는날',
					start: '2019-10-28'
				},
				{
					title: '휴가',
					start: '2019-10-29',
					end: '2019-11-01'
				},
				{
					id: 999,
					title: '미팅 시간',
					start: '2019-11-04T16:00'
				},
				{
					title: '1팀 회의',
					start: '2019-11-11',
					end: '2019-11-14'
				},
				{
					title: '차량 대여',
					start: '2019-11-13T09:30:00',
					end: '2019-11-13T11:30:00'
				},
				{
					title: '점심시간',
					start: '2019-10-29T12:00:00'
				},
				{
					title: '1팀 회의',
					start: '2019-10-30T14:30:00'
				},
				{
					title: '클라이언트 연락',
					start: '2019-10-31T17:30:00'
				},
				{
					title: '학원 끝나는 날',
					start: '2019-11-05T07:00:00',
					color : '#FF0000',
		            textColor : '#FFFF00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2019-10-28'
				}
			]
		});
	};
		
</script>








	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
</body>
</html>