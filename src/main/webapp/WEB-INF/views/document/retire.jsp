<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<link rel="stylesheet" href="resources/css/insa.css?ver=1">

<script src="resources/assets/scripts/approval_ref.js?v=30281"></script>
<script src="resources/assets/scripts/write_vacation.js?v=30281"></script>


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
	#rtTbody th{
		text-align: center;
	}
	#rtTbody th,#rtTbody td{
		border:1px solid black;
	}
</style>


</head>
<body>
<fmt:formatDate var="now" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>
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
					
					
					<div id="contents">
						<div class="content_title">
							<form>
								<fieldset>
								
								<c:if test="${document.empId eq loginUser.empId}">
									<span class="detail_select">
										<a href="javascript:void(0);" onclick="cancelDocument();">기안취소</a>
									</span>
								</c:if>
									<span class="detail_select">
										<a href="javascript:void(0);" onclick="printDocument();">인쇄</a>
									</span>
								</fieldset>
							</form>
							<div class="setting_box">
								<a class="icon list_bt" href="/cocoa-test1.onhiworks.com/approval/document/lists/P/?&amp;list_mode=P" title="목록보기"></a>
							</div>
						</div>
			
						<input type="hidden" name="docuNum" value="${document.docuNum}">
						<input type="hidden" name="title" value="">
						<input type="hidden" name="saveTerm" value="">
						<input type="hidden" name="security" value="">
						<input type="hidden" name="content" value="">
			
					<div class="content_inbox" id="content_inbox">
						<!-- Contents -->
						<div class="cont_box view">
							<div class="approval-wrap write view">
								<h1>사직원</h1>
								<table class="tableType02">
										<colgroup>
											<col style="width:12.09%;">
											<col style="width:37.62%">
											<col style="width:22.17%">
											<col style="width:28.12%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">문서 종류</th>
												<td>공통 &gt; 사직원</td>
												<th scope="row">문서 번호</th>
												<c:choose>
													<c:when test="${document.docuNum lt '10'}">
														<td>퇴사-${document.docuCode}-000${document.docuNum}</td>
													</c:when>
													<c:when test="${document.docuNum gt '9'}">
														<td>퇴사-${document.docuCode}-00${document.docuNum}</td>
													</c:when>
												</c:choose>
											</tr>
											<tr>
												<th scope="row">기안 부서</th>
												<td>${document.deptName}</td>
												<th scope="row">기안자</th>
												<td>${document.empName}</td>
											</tr>
											<tr>
												<th scope="row">보존 연한</th>
												
												<c:if test="${document.saveTerm eq '0'}">
													<td>영구</td>
												</c:if>
												<c:if test="${document.saveTerm ne '0'}">
													<td>${document.saveTerm}년</td>
												</c:if>
												
												<th scope="row">보안 등급</th>
												<td>
													<span id="security_span">${document.security}등급</span>
												</td>			
											</tr>
											<tr>
												<th scope="row">기안 일시</th>
												<td>${document.docuDate}</td>
												<th scope="row">완료 일시</th>
												<c:if test="${document.modifyDate eq null}">
													<td>${document.docuDate}</td>
												</c:if>
												<c:if test="${document.modifyDate ne null}">
													<td>${document.modifyDate}</td>
												</c:if>
											</tr>
										</tbody>
									</table>	
											
								
								<table class="cal_table1 approve-write js-approval-line">
									<colgroup>
										<col style="width:12.09%;">
										<col style="width:87.91%;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="sign">
												<div style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
												결재
												</div>
											</th>
											<td class="sign vt" id="approvalFirstLine">
												<table style="width:100%;table-layout:fixed">
													<colgroup><col><col><col><col><col><col><col></colgroup>
													<tbody>
													<tr id="jobRow">
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
													</tr>
													<tr id="stampRow">
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
													</tr>
													<tr id="nameRow">
														<td class="name"></td>
														<td class="name"></td>
														<td class="name"></td>
														<td class="name"></td>
														<td class="name"></td>
														<td class="name"></td>
														<td class="name"></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
					<table class="cal_table1 approve-write refer js-approval-line">
						<colgroup>
							<col style="width:12.09%;">
							<col style="width:87.91%;">
						</colgroup>
						<tbody>
							<tr id="rfRow">
								<th scope="row">
									<div class="choice" style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									참조
									</div>
								</th>
								<td id="approvalFourthLine" style="padding-left:15px;">
									
									<c:if test="${!empty rfList}">
									
										<c:forEach var="rf" items="${rfList}">
											<c:choose>
												<c:when test="${rf.status eq 'Y'}">
													<span class="refer-list mgl_20" empId="${rf.empId}">${rf.empName}</span><img src="resources/images/check.png">
												</c:when>
												<c:when test="${rf.status eq 'N' and rf.empId eq loginUser.empId}">
													<span class="refer-list mgl_20" empId="${rf.empId}">${rf.empName}</span><button type="button" class="rfCheckBtn" style="color:#779ec0">확인</button>
												</c:when>
												<c:otherwise>
													<span class="refer-list mgl_20" empId="${rf.empId}">${rf.empName}<span class="icon file_delete js-approval-line-delete"></span></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									
									</c:if>
									
								</td>
							</tr>
						</tbody>
					</table>
					
								<div class="docu-common-wrap">
									<h2><span class="point_color"></span>${document.title}</h2>
									
									
									
									
									
									
									<div class="contents after">
									
										<table class="tableType01 account">
											<colgroup>
												<col width="22%">
												<col width="28%">
												<col width="22%">
												<col width="28%">
											</colgroup>
											<tbody id="rtTbody">
												
											</tbody>
										</table>
									</div>
									<div class="file after" style="padding-bottom: 30px;">
											<div class="top">
												<span class="body-color mgr_20">첨부파일</span>
											</div>
										<div class="filebox">
										
											<c:if test="${document.fileStatus eq 'Y'}">
												<c:forEach var="file" items="${fileList}">
													<span class="cont_file" style="float: left;">
														<img src="resources/images/pptx.png">&nbsp;
														<a href="${contextPath}/resources/upload/documentFile/${file.changeName}" download="${file.originName}">${file.originName}</a>
													</span><br clear="both">
												</c:forEach>
											</c:if>
										
										</div>
									</div>
									
								</div>
							</div>
						</div>
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
			
			/* 툴팁 */
			$(".icon.question.tipsIcon").mouseenter(function(){
				$(this).siblings('.toolTip').addClass("show");
			}).mouseout(function(){
				$(this).siblings('.toolTip').removeClass("show");
			});
			
			/* 결제, 참조 라인 채우기 */
			var jobRow = $("#jobRow").children();
			var stampRow = $("#stampRow").children();
			var nameRow = $("#nameRow").children();
			
			for(var i = 0; i < 7; i++){
				
				for(var j = 0; j < ${apList}.length; j++){
					if(i == j){
						jobRow[i].innerHTML = ${apList}[j].jobName;
						nameRow[i].innerHTML = ${apList}[j].empName;
						
						if(j != 0 && ${apList}[j].empId == ${loginUser.empId} && ${apList}[j].status == 'N'){
							
							if(${apList}[j-1].status == 'N'){
								stampRow[i].innerHTML = '<button type="button" class="confirm" style="background:#fff;padding:5px 16px 6px;border:1px solid #c8c8c8;color:#cdcdcd;" disabled>결재</button>';
							} else{
								stampRow[i].innerHTML = '<button type="button" class="confirm" style="background:#fff;padding:5px 16px 6px;border:1px solid #c8c8c8;color:#2c86dc;">결재</button>';
							}
						}else if(${apList}[j].status == 'Y'){
							stampRow[i].innerHTML = '<img src="resources/images/stamp_approval.png"><p class="date">'+${apList}[j].approvalDate+'</p>';
						}else if(j == 0 && ${apList}[j].empId == ${loginUser.empId} && ${apList}[j].status == 'N'){
							stampRow[i].innerHTML = '<button type="button" class="confirm" style="background:#fff;padding:5px 16px 6px;border:1px solid #c8c8c8;color:#2c86dc;">결재</button>';
						}
					}
				}
			}
			
			/* 사직원 정보 채우기 */
			var rtInfo = $('#rtTbody');
			
			//vaInfo.append('<tr><th>신청일시</th><td colspan="3">'+'${d.docuDate}'+'</td></tr>');
			rtInfo.append('<tr><th>신청인</th><td>${rt.empName}</td><th>직급</th><td>${rt.jobName}</td></tr>');
			rtInfo.append('<tr><th>소속</th><td colspan="3">${rt.deptName}</td></tr>');
			rtInfo.append('<tr><th>입사일</th><td>${rt.enrollDate}</td><th>퇴사일</th><td>${rt.retireDate}</td></tr>');
			rtInfo.append('<tr><th rowspan="2">사유</th><td colspan="3" rowspan="2"><p>${rt.reason}</p></td></tr>');
		});
	
		/* 결재 버튼을 누르면 */
		$("#stampRow").on('click','.confirm',function(){
			var thisBtn = $(this);
			var dNum = $("input[name=docuNum]").val(); 
			/* console.log(${now});
			console.log(${now2}); */
			$.ajax({
				url:"apCheck.do",
				type:"POST",
				data:{
					docuNum:dNum,
					empId:${loginUser.empId},
					retireDate:'${rt.retireDate}',
					docuType:'${d.docuType}',
					vaId:'${d.empId}',
					useDay:'0'
				},
				success:function(data){
						
					if(data == 'success'){
						thisBtn.hide();
						var confirm = $('<img src="resources/images/stamp_approval.png"><p class="date">${now}</p>');
						thisBtn.parent('td').append(confirm);
					} else {
						alertify.alert('', '결재 확인 실패');
					}
				},
				error:function(){
					alertify.alert('', 'AJAX통신 실패');
				}
			});
		});
		/* 참조 확인 버튼을 누르면 */
		$("#rfRow").on('click','.rfCheckBtn',function(){
			var thisBtn = $(this);
			var dNum = $("input[name=docuNum]").val(); 
			
			$.ajax({
				url:"rfCheck.do",
				type:"POST",
				data:{
					docuNum:dNum,
					empId:${loginUser.empId}
				},
				success:function(data){
					
					if(data == 'success'){
						thisBtn.hide();
						var checkImg = $('<img src="resources/images/check.png" style="magrin-left:5px;">');
						thisBtn.prev().after(checkImg);
					} else {
						alertify.alert('', '결재 확인 실패');
					}
				},
				error:function(){
					alertify.alert('', 'AJAX통신 실패');
				}
			});
		});
		
		/* 기안 취소 버튼을 누르면 */
		function cancelDocument() {
			
			alertify.confirm('DEVELOFFICE', '문서는 완전히 삭제되며 복구 되지 않습니다. 계속 하시겠습니까?', function(){deleteDocument();}
                , function(){});
			
			if($("#stampRow img").length == 0 && $("#approvalFourthLine img").length == 0){
				console.log('변경가능');
			}else{
				console.log('변경불가능');
			}
		}
		
		function deleteDocument() {
			var dNum = $('input[name=docuNum]').val();
			console.log(dNum);
			
			$.ajax({
				url:"deleteDocument.do",
				type:"POST",
				data:{docuNum:dNum},
				success:function(data){
					
					if(data == 'success'){
						location.href="documentTable.do";
					} else {
						alertify.alert('', '기안 취소 실패');
					}
					
				},
				error:function(){
					alertify.alert('', 'AJAX통신 실패');
				}
			});
			
		}
		
		
		
		
	</script>
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	
</body>
</html>