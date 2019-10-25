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
					
					<div id="contents">
						<div class="content_title">
							<form>
								<fieldset>
									<span class="detail_select">
										<a href="javascript:void(0);" onclick="">결재선변경</a>
									</span>
									<span class="detail_select">
										<a href="javascript:void(0);" onclick="printDocument();">인쇄</a>
									</span>
								</fieldset>
							</form>
							<div class="setting_box">
								<a class="icon list_bt" href="/cocoa-test1.onhiworks.com/approval/document/box/all/?&amp;box_mode=all" title="목록보기"></a>
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
									<h1>회람</h1>
									<table class="tableType02">
										<caption></caption>
										<colgroup>
											<col style="width:12.09%;">
											<col style="width:37.62%">
											<col style="width:22.17%">
											<col style="width:28.12%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">문서 종류</th>
												<td>공용 &gt; 회람</td>
												<th scope="row">문서 번호</th>
												<c:if test="${document.docuNum lt '10' }">
							            			<td>회람-${document.docuCode}-000${document.docuNum}</td>
							            		</c:if>
							            		<c:if test="${document.docuNum ge '10' }">
							            			<td>회람-${document.docuCode}-00${document.docuNum}</td>
							            		</c:if>
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
									
									<table class="cal_table1  approve-write refer">
									<colgroup>
										<col style="width:12.09%;">
										<col style="width:87.91%;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<div class="choice" style="min-height: 45px; height: 44.0104px; display: table-cell; width: 115.01px; vertical-align: middle; text-align: center;">
												회람
												</div>
											</th>
											<td id="approvalFirstLine" style="padding-left:15px;">
												
												<c:if test="${!empty rfList}">
									
													<c:forEach var="rf" items="${rfList}">
														<span class="refer-list mgl_20" empId="${rf.empId}">${rf.empName}</span>
													</c:forEach>
												
												</c:if>
											
											</td>
										</tr>
									</tbody>
									</table>
						
									<div class="docu-common-wrap">
										<h2>${document.title}</h2>
										<div class="contents after">
											<p style="font-family: &quot;맑은 고딕&quot;; font-size: 16px; line-height: 1.6; margin-top: 0px; margin-bottom: 0px;">${docu.content}</p>
										</div>
						
										<div class="file after">
											<div class="top">
												<span class="body-color mgr_20">별첨</span>
												<a href="javascript:void(0);" class="addfile" onclick="$('#fileApprovalAttach').click();">파일 첨부</a>
												<input type="file" style="overflow: hidden; width:0px; height:0px;" name="approval_attach" id="fileApprovalAttach" multiple="multiple">
											</div>
											<div class="filebox">
											
												<c:if test="${document.fileStatus ne 'N'}">
													<span class="cont_file" style="float: left;">
														<img src="resources/images/pptx.png"><a href="${dFile.filePath}" download="${dFile.originName}">${dFile.originName}</a>
														<a href="javascript:void(0)" class="icon file_delete" onclick=""><span class="blind"></span></a>
													</span>
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
	
		/* 인쇄  시작 */
		
		function printDocument() {
			const completeParam = makeHtml();
		    reportPrint(completeParam);
		}
		
		function makeHtml(){
			
			var content = document.getElementById('content_inbox').innerHTML;
			
		    const obj = {html : ''};
		    let html = '<div class="printPop">';
		    html += content;
		    html += '</div>';    
		    obj.html = html;
		    return obj;
		}
		
		function reportPrint(param){
		    const setting = "width=890, height=841";
		    const objWin = window.open('', 'print', setting);
		    objWin.document.open();
		    objWin.document.write('<html><head><title>DEVELOFFICE</title>');
		    objWin.document.write('<link rel="stylesheet" href="resources/css/style.css">');
		    objWin.document.write('<link rel="stylesheet" href="resources/css/style_approval.css"/>');
		    objWin.document.write('</head><body>');
		    objWin.document.write(param.html);
		    objWin.document.write('</body></html>');
		    objWin.focus(); 
		    objWin.document.close();
		 	
		    setTimeout(function(){objWin.print();objWin.close();}, 100);
		}
		
		/* 인쇄 끝 */
	
	
	
	</script>
	
	
	
	
	
	
	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>

</body>
</html>