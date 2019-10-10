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
								<a class="icon list_bt" href="/cocoa-test1.onhiworks.com/approval/document/box/writer/?&amp;box_mode=writer" title="목록보기"></a>
								<a class="icon next_bt rotate-90" href="/cocoa-test1.onhiworks.com/approval/document/view/281989/condition/JmJveF9tb2RlPXdyaXRlcg==" title="다음으로 이동"></a>
							</div>
						</div>
			
						<input type="hidden" name="approval_document_no" value="283009">
						<input type="hidden" name="approval_first_line" value="57511">
						<input type="hidden" name="approval_second_line" value="">
						<input type="hidden" name="approval_third_line" value="">
						<input type="hidden" name="approval_fourth_line" value="">
						<input type="hidden" name="approval_fifth_line" value="">
						<input type="hidden" name="approval_preserved_term" value="5">
						<input type="hidden" name="approval_security_level" value="A">
						<input type="hidden" name="approval_list_view" value="/cocoa-test1.onhiworks.com/approval/document/box/writer/?&amp;box_mode=writer">
			
						<div class="content_inbox">
							<!-- Contents -->
							<div class="cont_box view">
								<div class="approval-wrap write view">
									<h1>지출 결의서</h1>
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
												<td>공통 &gt; 지출 결의서</td>
												<th scope="row">문서 번호</th>
												<td>CO-지결-20191008-0001</td>
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
														<option value="A" selected="">A등급</option>
													</select>															
												</td>			
											</tr>
											<tr>
												<th scope="row">기안 일시</th>
												<td>2019-10-08 15:10:51</td>
												<th scope="row">완료 일시</th>
												<td>2019-10-08 15:10:51</td>
											</tr>
										</tbody>
									</table>
									
									<table class="cal_table1 approve-write js-approval-line">
										<colgroup>
											<col style="width:12.09%;">
											<col style="width:37.62%;">
											<col style="width:12.09%;">
											<col style="width:38.02%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="agree">
													<div class="choice" style="height: 162px; display: table-cell; width: 116.01px; vertical-align: middle; text-align: center;">
														신청
													</div>
												</th>
												<td class="confer vt" id="approvalFirstLine">
													<table style="height: 163px;">\
														<colgroup>
															<col width=""><col width=""><col width=""><col width="">
														</colgroup>
									<tbody><tr>
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
									<img src="/cocoa-test1.onhiworks.com/approval/sign/approval/B/2/57511" alt="결재"><p class="date" title="2019-10-08 15:10:51">2019-10-08 </p>
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
									</tr>
									</tbody></table>
												</td>
												<th scope="row" class="confer">
													<div class="choice" style="height: 162px; display: table-cell; width: 116.01px; vertical-align: middle; text-align: center;">
														처리									</div>
												</th>
												<td class="confer vt" id="approvalSecondLine">
													<table style="height: 163px;"><colgroup><col width=""><col width=""><col width=""><col width=""></colgroup>
									<tbody><tr>
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
									</td>
									<td class="name">
									</td>
									<td class="name">
									</td>
									<td class="name">
									</td>
									</tr>
									</tbody></table>
												</td>
											</tr>
										</tbody>
								</table>
								<table class="cal_table1 approve-write refer">
									<colgroup>
										<col style="width:12.09%;">
										<col style="width:87.91%;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<div class="choice" style="min-height: 45px; height: 44.0104px; display: table-cell; width: 115.01px; vertical-align: middle; text-align: center;">
												참조									<span class="spr-approval set" title="참조" onclick="ApprovalProcess.showApprovalInput('approvalThirdLine', 'inputApprovalThirdLine');"></span>
																</div>
											</th>
											<td id="approvalThirdLine">
												<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalThirdLine" style="display: none;" approval_type="F" autocomplete="off">
															</td>
										</tr>
									</tbody>
								</table>
						
									<div class="docu-common-wrap">
										<h2>
											<a href="javascript:void(0)" class="icon impt " style="top:57px;" onclick="Approval.setFavorites(this, '283009')"><span class="blind"></span></a>
											<span class="point_color"></span>
											2019년 10월 지출 결의서 - 개인
										</h2>
										<div class="contents after">
											<div class="account-area">
												<table class="tableType01 account">
													<colgroup>
														<col width="135">
														<col>
													</colgroup>
													<tbody>
																						<tr>
															<th>회계 기준월</th>
															<td>2019년 10월</td>
														</tr>
																						
														<tr>
															<th>지출자</th>
															<td>전재광</td>
														</tr>
																						<tr>
															<th>계좌 정보</th>
															<td>IBK기업은행 / 01048992851</td>
														</tr>
																					</tbody>
												</table>
												<h3>거래 내역</h3>
												<table class="tableType01 account">
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th scope="col">계정과목</th>
															<th scope="col">지출일자</th>
															<th scope="col">코스트센터</th>
															<th scope="col">금액</th>
															<th scope="col">거래처</th>
															<th scope="col">적요</th>
														</tr>
													</thead>
													<tbody align="center">
														<tr>
															<td>유류비</td>
															<td>2019-10-08</td>
															<td>
																<span class="">영업부</span>
																<!-- 
																<a href="javascript:void(0);" class="icon question tipsIcon" style="position: relative;top:2px;margin-left:10px"><span class="blind">세부 설명</span></a>
																<span class="tooltip hide" style="left:0;top:0;color:#676767;">
																	<div class="tooltip-box" style="width:230px;">
																		<p>
																			코드 : 001&nbsp;
																			코스트센터 : 영업부
																		</p>
																	</div>
																</span>
																 -->
															</td>
															<td class="ta_r">30,000</td>
															<td>
																<span class="">주유소</span>
																<!-- 
																<a href="javascript:void(0);" class="icon question tipsIcon" style="position: relative;top:2px;margin-left:10px"><span class="blind">세부 설명</span></a>
																<span class="tooltip hide" style="left:0;top:0;color:#676767;">
																	<div class="tooltip-box" style="width:230px;">
																		<p>
																			코드 : -&nbsp;
																			거래처명 : 주유소
																		</p>
																	</div>
																</span>
																 -->
															</td>
															<td>유류비</td>
														</tr>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td class="ta_r">총 30,000</td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
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
							    		<span class="point_color bold" id="approvalCommentsCount">0</span>개의 의견	    	</p>
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
				ApprovalProcess._documentNo = '283009';
				ApprovalProcess._firstLine = '57511';
				ApprovalProcess._secondLine = '';
				ApprovalProcess._thirdLine = '';
				ApprovalProcess._fourthLine = '';
				ApprovalProcess._fifthLine = '';
				ApprovalProcess._approvalMethod = 'BCF';
				ApprovalProcess._registerNo = '57511';
				ApprovalProcess._documentType = 'spending_report';
				
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