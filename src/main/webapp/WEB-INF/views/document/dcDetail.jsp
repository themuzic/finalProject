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






	<script src="resources/js/common_new.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/main.js"></script>


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
					
					
					
					<div id="contents" style="left: 255px;">
						<div class="content_title">
							<form>
								<fieldset>
									<span class="detail_select">
										<a href="javascript:void(0);" class="fl" onclick="ApprovalProcess.modifyDocument();">내용수정</a><a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:0;margin-left:10px"><span class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left:45px;top:0;color:#676767;">
											<div class="tooltip-box" style="width:400px;">
												<p>ㆍ기안자가 기안 내용 수정이 필요하다고 판단했을 경우 결재 진행 중에도<br>&nbsp;&nbsp; 할 수 있습니다.</p>
												<p>ㆍ내용을 수정하는 동안에는 결재가 진행되지만, 내용 수정이 완료되면, <br>&nbsp;&nbsp; 기존 결재 내역은 모두 초기화됩니다.</p>
											</div>
										</div>
									</span>
									<span class="detail_select">
										<a href="javascript:void(0);" class="fl" onclick="ApprovalProcess.cancelDocument('');">기안취소</a><a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:0;margin-left:10px"><span class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left:0;top:0;color:#676767;">
											<div class="tooltip-box" style="width:360px;">
												<p>ㆍ기안자가 기안 자체를 삭제하고 싶을 때 사용할 수 있습니다.</p>
												<p>ㆍ기존 결재 내역 뿐만 아니라 문서 번호 자체가 없어지게 됩니다.</p>
											</div>
										</div>
									</span>
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
								<a class="icon list_bt" href="/cocoa-test1.onhiworks.com/approval/document/lists/P/?&amp;list_mode=P" title="목록보기"></a>
							</div>
						</div>
			
						<input type="hidden" name="approval_document_no" value="278570">
						<input type="hidden" name="approval_first_line" value="57511">
						<input type="hidden" name="approval_second_line" value="57462">
						<input type="hidden" name="approval_third_line" value="">
						<input type="hidden" name="approval_fourth_line" value="56675">
						<input type="hidden" name="approval_fifth_line" value="">
						<input type="hidden" name="approval_preserved_term" value="5">
						<input type="hidden" name="approval_security_level" value="A">
						<input type="hidden" name="approval_list_view" value="/cocoa-test1.onhiworks.com/approval/document/lists/P/?&amp;list_mode=P">
			
					<div class="content_inbox">
						<!-- Contents -->
						<div class="cont_box view">
							<div class="approval-wrap write view">
											<h1>품의서</h1>
											
											<table class="tableType02">
									<colgroup>
										<col style="width:12.09%;">
										<col style="width:37.62%">
										<col style="width:22.17%">
										<col style="width:28.12%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">기안 부서</th>
											<td>cocoaTest</td>
											<th scope="row">기안자</th>
											<td>전재광</td>
										</tr>
										<tr>
											<th scope="row">문서 번호</th>
											<td>CO-품의-20191003-0001</td>
											<th scope="row">보존 연한 / 보안 등급</th>
											<td>
												<select name="preserved_term" class="fl write-select view" onchange="ApprovalProcess.modifyApprovalDocumentSetting('preserved_term');">
													<option value="1">1년</option>
													<option value="3">3년</option>
													<option value="5" selected="">5년</option>
													<option value="10">10년</option>
													<option value="0">영구</option>
												</select>
												<select name="security_level" class="fl write-select mgl_10 view" onchange="ApprovalProcess.modifyApprovalDocumentSetting('security_level');">
													<option value="S">S등급</option>
													<option value="A" selected="">A등급</option>
													<option value="B">B등급</option>
													<option value="C">C등급</option>
												</select>
												<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:4px;margin-left:10px"><span class="blind">세부 설명</span></a>
												<div class="tooltip hide" style="left:-290px;top:0">
													<div class="tooltip-box" style="width:570px;">
														<p>보존 연한</p>
														<p>ㆍ1년: 경미한 연결 문서 및 일시적인 사용 또는 처리에 그치는 문서</p>
														<p>ㆍ3년: 사무의 수행상 1년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 3년간 보존을 요하는 문서</p>
														<p>ㆍ5년: 사무의 수행상 3년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 5년간 보존을 요하는 문서</p>
														<p>ㆍ10년: 사무의 수행상 장기간 참고 또는 이용해야 할 문서 및 법률상 10년간 보존을 요하는 문서</p>
														<p>ㆍ영구: 회사의 존속에 필요 불가결한 문서 및 역사적 또는 기타 사유로 중요한 문서</p>
														<p class="pdt_10">보안 등급</p>
														<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수 있음.</p>
														<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(과장)등급 이상인 사람이 문서를 볼 수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
														<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(사원)등급 이상인 사람이 문서를 볼 수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
														<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수 있음.</p>
													</div>
												</div>
											</td>
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
												<span class="spr-approval set addPlus" title="결재" onclick="ApprovalProcess.getApprovalUserInfoLayer('A', 'approval_first_line');"></span>
												</div>
											</th>
											<td class="sign vt" id="approvalFirstLine">
												<table style="width:100%;table-layout:fixed">
													<colgroup><col><col><col><col><col><col><col></colgroup>
													<tbody><tr>
													<td class="team name">
													
													</td>
													<td class="team name">
													</td>
													<td class="team name">
													</td>
													<td class="team name">
													</td>
													<td class="team name">
													</td>
													<td class="team name">
													</td>
													<td class="team name">
													</td>
													</tr>
													<tr>
													<td class="stamp">
													<img src="resources/images/stamp_approval.png" alt="결재"><p class="date" title="2019-10-03 00:03:22">2019-10-03 </p>
													</td>
													<td class="stamp">
													</td>
													<td class="stamp">
													</td>
													<td class="stamp">
													</td>
													<td class="stamp">
													</td>
													<td class="stamp">
													</td>
													<td class="stamp">
													</td>
													</tr>
													<tr>
													<td class="name">
													전재광
													</td>
													<td class="name">
													</td>
													<td class="name">
													</td>
													<td class="name">
													</td>
													<td class="name">
													</td>
													<td class="name">
													</td>
													<td class="name">
													</td>
													</tr>
													</tbody>
												</table>
											</td>
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
								<th scope="row" class="agree">
									<div style="height: 54px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									합의									<span class="spr-approval set addPlus" title="합의" onclick="ApprovalProcess.getApprovalUserInfoLayer('D', 'approval_second_line');"></span>
													</div>
								</th>
								<td class="agree vt" id="approvalSecondLine">
									<table><colgroup><col><col><col><col><col></colgroup><tbody>
					<tr>
					<td class="gt-ph-20 gt-align-left gt-border-0">
					<span class="">원영주</span>
					</td>
					<td class="gt-ph-20 gt-align-left gt-border-0">
					</td>
					<td class="gt-ph-20 gt-align-left gt-border-0">
					</td>
					<td class="gt-ph-20 gt-align-left gt-border-0">
					</td>
					<td class="gt-ph-20 gt-align-left gt-border-0">
					</td>
					</tr>
					</tbody></table>
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
							<tr>
								<th scope="row">
									<div class="choice" style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									참조									<span class="spr-approval set addPlus" title="참조" onclick="ApprovalProcess.showApprovalInput('approvalFourthLine', 'inputApprovalFourthLine');"></span>
													</div>
								</th>
								<td id="approvalFourthLine">
													<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" style="display: none;" approval_type="F" autocomplete="off">
													<span class="refer-list" user_no="56675" node_id="46500" type="F">김상윤<span class="icon file_delete js-approval-line-delete" style="display: none;"></span></span>			</td>
							</tr>
						</tbody>
					</table>
					
								<div class="docu-common-wrap">
									<h2><span class="point_color"></span>테스트 제목</h2>
									<div class="contents after">
										<p style="font-family: &quot;맑은 고딕&quot;; font-size: 16px; line-height: 1.6; margin-top: 0px; margin-bottom: 0px;">테스트 내용</p>				</div>
					
									<div class="file after" style="padding-bottom: 30px;">
										<div class="top">
											<span class="body-color mgr_20">별첨</span>
											<a href="javascript:void(0);" class="addfile" onclick="$('#fileApprovalAttach').click();">파일 첨부</a>
											<input type="file" style="overflow: hidden; width:0px; height:0px;" name="approval_attach" id="fileApprovalAttach" multiple="">
										</div>
										<div class="filebox">
											<span class="cont_file" style="float: left;">
												<img src="/static/images/common/icon/pptx.png"><a href="/cocoa-test1.onhiworks.com/approval/download_file/298041">개발자의 삶이란_DB설계(수정3).pptx</a> (3.8MB)
												<a href="/cocoa-test1.onhiworks.com/common/poc/conv/approval/278570/298041" class="btn_search" style="vertical-align:middle;display:inline-block; margin-top:2px;" target="_blank"><span class="icon preview"><em class="blind">미리보기</em></span></a>
												<a href="javascript:void(0)" class="icon file_delete" onclick="ApprovalProcess.deleteAttachedFile(298041, '개발자의 삶이란_DB설계(수정3).pptx');"><span class="blind"></span></a>
											</span>
										</div>
									</div>
									
								</div>
							</div>
							
									<div class="board_comment_tab" id="approvalCommentsTab">
								<a href="javascript:void(0);" class="gt-nav-item gt-active approval-comments-tab1" data-id="tab1-1" onclick="ApprovalProcess.getApprovalComments();">의견</a>
					        	<a href="javascript:void(0);" class="gt-nav-item approval-comments-tab2" data-id="tab1-2" onclick="ApprovalProcess.getApprovalCommentsHistory();">이력</a>
							</div>
							<div id="divApprovalComments" class="board_comment approval">
								<p class="top number_comments">
						    		<span class="point_color bold" id="approvalCommentsCount">0</span>개의 의견	    	</p>
								<ul id="approvalComments"></ul>
								<div class="comment_write">
									<label for="commentInput" class="blind">댓글 입력란</label>
									<textarea id="approvalDocumentComment" placeholder="댓글을 남겨주세요." title="댓글을 남겨주세요." class="comment-texarea" style="overflow: hidden; overflow-wrap: break-word; height: 36px;"></textarea>
									<button type="button" class="bt_left" onclick="ApprovalProcess.addApprovalComment();" style="float:right;">등록</button>
								</div>
							</div>
							<div id="divApprovalCommentsHistory" class="board_comment approval hide" style="display: none;">
								<ul id="approvalCommentsHistory"></ul>
							</div>
								</div>
					</div>
			
			<script>
			ApprovalProcess._documentNo = '278570';
			ApprovalProcess._firstLine = '57511';
			ApprovalProcess._secondLine = '57462';
			ApprovalProcess._thirdLine = '';
			ApprovalProcess._fourthLine = '56675';
			ApprovalProcess._fifthLine = '';
			ApprovalProcess._approvalMethod = 'ADEF';
			ApprovalProcess._registerNo = '57511';
			ApprovalProcess._documentType = 'remittance';
			
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
		$(function(){
			
			$(".icon.question.tipsIcon").mouseenter(function(){
				$(this).siblings('.toolTip').addClass("show");
			}).mouseout(function(){
				$(this).siblings('.toolTip').removeClass("show");
			});
			
			
		})
	
	
	
	</script>

</body>
</html>