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
										<a href="javascript:void(0);" class="fl" onclick="ApprovalProcess.copyDocument();">기안복사</a><a href="javascript:void(0);" class="icon question tipsIcon" style="position: relative;top:0;margin-left:10px"><span class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left:0;top:0;color:#676767;">
											<div class="tooltip-box" style="width:300px;">
												<p>ㆍ기안한 문서를 복사해서 문서를 작성할 수 있습니다.</p>
												<p>ㆍ결재선과 결재 양식 정보가 입력된 채로 작성을 할 수 있습니다.</p>
											</div>
										</div>
									</span>
															<span class="detail_select">
										<a href="javascript:void(0);" onclick="ApprovalProcess.getApprovalLineLayer();">결재선변경</a>
									</span>
																		<span class="detail_select">
										<a href="javascript:void(0);" onclick="ApprovalProcess.documentPrint();">인쇄</a>
									</span>
											</fieldset>
							</form>
							<div class="setting_box">
								<a class="icon list_bt" href="/cocoa-test1.onhiworks.com/approval/document/box/all/?&amp;box_mode=all" title="목록보기"></a>
							</div>
						</div>
			
						<input type="hidden" name="approval_document_no" value="281989">
						<input type="hidden" name="approval_first_line" value="56675">
						<input type="hidden" name="approval_second_line" value="">
						<input type="hidden" name="approval_third_line" value="">
						<input type="hidden" name="approval_fourth_line" value="">
						<input type="hidden" name="approval_fifth_line" value="">
						<input type="hidden" name="approval_preserved_term" value="5">
						<input type="hidden" name="approval_security_level" value="C">
						<input type="hidden" name="approval_list_view" value="/cocoa-test1.onhiworks.com/approval/document/box/all/?&amp;box_mode=all">
			
						<div class="content_inbox">
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
												<td>CO-회람-20191007-0001</td>
											</tr>
											<tr>
												<th scope="row">기안 부서</th>
												<td>cocoaTest</td>
												<th scope="row">기안자</th>
												<td>전재광</td>
											</tr>
											<tr>
												<th scope="row">보존 연한</th>
												<td>5년</td>
												<th scope="row">보안 등급</th>
												<td>
													<select name="security_level" class="fl write-select view" onchange="ApprovalProcess.modifyApprovalDocumentSetting('security_level');">
														<option value="S">S등급</option>
														<option value="A">A등급</option>
														<option value="B">B등급</option>
														<option value="C" selected="">C등급</option>
													</select>
															
												</td>			
											</tr>
											<tr>
												<th scope="row">기안 일시</th>
												<td>2019-10-07 19:20:06</td>
												<th scope="row">완료 일시</th>
												<td>2019-10-07 19:20:06</td>
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
												회람									<span class="spr-approval set" title="회람" onclick="ApprovalProcess.showApprovalInput('approvalFirstLine', 'inputApprovalFirstLine');"></span>
																</div>
											</th>
											<td id="approvalFirstLine">
												<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFirstLine" style="display: none;" approval_type="I" autocomplete="off">
												<span class="refer-list" user_no="56675" node_id="46500" type="I">김상윤<span class="icon file_delete js-approval-line-delete" style="display: none;"></span></span>			</td>
										</tr>
									</tbody>
									</table>
						
									<div class="docu-common-wrap">
										<h2>
											<a href="javascript:void(0)" class="icon impt " style="top:57px;" onclick="Approval.setFavorites(this, '281989')"><span class="blind"></span></a>
											<span class="point_color"></span>
											테스트 회람
										</h2>
										<div class="contents after">
											<p style="font-family: &quot;맑은 고딕&quot;; font-size: 16px; line-height: 1.6; margin-top: 0px; margin-bottom: 0px;">테스트 회람</p>
										</div>
						
										<div class="file after">
											<div class="top">
												<span class="body-color mgr_20">별첨</span>
													<a href="javascript:void(0);" class="addfile" onclick="ApprovalProcess.getAttchedFileLayer();">파일 첨부</a>
											</div>
											<div class="filebox"></div>
										</div>
									</div>
								</div>
								
								<div class="board_comment_tab" id="approvalCommentsTab">
									<a href="javascript:void(0);" class="gt-nav-item gt-active approval-comments-tab1" data-id="tab1-1" onclick="ApprovalProcess.getApprovalComments();">의견</a>
								</div>
								<div id="divApprovalComments" class="board_comment approval">
									<p class="top number_comments">
							    		<span class="point_color bold" id="approvalCommentsCount">0</span>개의 의견	
							    	</p>
									<ul id="approvalComments"></ul>
										<div class="comment_write">
										<label for="commentInput" class="blind">댓글 입력란</label>
										<textarea id="approvalDocumentComment" placeholder="댓글을 남겨주세요." title="댓글을 남겨주세요." class="comment-texarea" style="overflow: hidden; overflow-wrap: break-word; height: 37px;"></textarea>
										<button type="button" class="bt_left" onclick="ApprovalProcess.addApprovalComment();">등록</button>
									</div>
								</div>
								<div id="divApprovalCommentsHistory" class="board_comment approval hide" style="display: none;">
									<ul id="approvalCommentsHistory"></ul>
								</div>
							</div>
						</div>
			
			<script>
				ApprovalProcess._documentNo = '281989';
				ApprovalProcess._firstLine = '56675';
				ApprovalProcess._secondLine = '';
				ApprovalProcess._thirdLine = '';
				ApprovalProcess._fourthLine = '';
				ApprovalProcess._fifthLine = '';
				ApprovalProcess._approvalMethod = 'I';
				ApprovalProcess._registerNo = '57511';
				ApprovalProcess._documentType = 'common';
				
				var approvalRelatedDocumentTable = new approvalTableClass( {table:"tableRelatedDocument", row : [["action2", ""], ["star", ""], ["document_code", "docu-num"], ["none_link_title", "title"], ["register", "docu-register"]]} );
				
				$j(document).ready(function(){
					autoComplete();
					Approval.settingDblClickForDeleteApprovalSelectUser();
						ApprovalProcess.getApprovalComments();
					autosize(document.querySelector("#approvalDocumentComment"));
					});
				
				$j(document).on("click", '.js-approval-line-delete', function(){
					if($j(this).parent().attr("user_no") === undefined){
						alert("다시 시도해주시기 바랍니다.");
						return;
					}
				
					if(ApprovalProcess.deleteApprovalLinUser($j(this).parent().attr("user_no"), $j(this).parent().contents().eq(0).text(), $j(this).parent().attr("type"), $j(this).closest('td').attr('id'))){
						$j(this).parent().remove();
					}
				});
				
				$j(document).on("click", '.js-approval-circulation', function(){
					$j(this).parent().remove();
				});
				
				$j(document).on("mousedown", '.js-approval-li-types', function(event){
					event.preventDefault();
					$j('.js-approval-li-forms').removeClass("active");
					$j(this).addClass("active");
					$j('#anchorApprovalType').html("보기: " +$j(this).text());
					$j("#menuApprovalTypeMode").toggleClass("show");
					ApprovalProcess._searchRelatedDocument['type'] = $j(this).attr("value");
					ApprovalProcess.getRelatedDocumentList();
				});
				
				$j(document).on("keydown", '#textSearchRelatedDocument', function(e){
					if(e.keyCode == 13){ // enter
						e.preventDefault();
						e.stopPropagation();
				
						ApprovalProcess.searchRelatedDocument();
					}
				});
				
				$j(document).on("click", '.js-approval-btn-box-mode', function(){
					if($j(this).parent().children("ul").hasClass("dropdown-menu")){
						$j(this).parent().children("ul").toggleClass("show");
						$j(".js-approval-li-types").removeClass("active");
					}
				});
				
				$j('#m_view_more_menu').on('click', function(e){
					e.preventDefault();
					e.stopPropagation();
					$j('#m_view_more_menu_detail').show();
				});
				
				$j(document).on('click', function(){
					$j('#m_view_more_menu_detail').hide();
				});
			
			</script>
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
	
	
	
	
	</script>

</body>
</html>