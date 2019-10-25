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



<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- summernote 에디터 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	




<style>
	#tableAccoutingDealInformation th{
		padding-left: 12px;
	}
	
	/* 에디터 CSS 시작 */
	
	.note-toolbar, .panel-heading{
		padding-top:0px !important;
		padding-bottom:5px !important;
	}
	.note-btn-group{
		padding-right: 5px !important;
	}
	.panel-heading button{
		padding:0 10px 0 10px !important;
	}
	.note-btn{
		height: 30px;
		border: 1px solid #ccc !important;
		background:white !important;
		box-shadow: none !important;
	}
	.btn-add, .btn-del{
		cursor:pointer;
	}
	.popup_li:hover{
		background:#b9dcee;
	}
	.team-membername {
	    display: inline-block;
	    color: #333;
	    width: 130px !important;
	}
	.team-name{
		margin-right: 10px;
	}
	/* 에디터 CSS 끝 */
	
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
					<!-- 이 아래부터 내용 작성 -->
					
					
					<div class="documentWrap">
					
					
						<form action="" name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
						
						<div style="padding-bottom:15px;">
							<span style="padding-right:20px;"><a href="javascript:void(0);" onclick="insertDocument();"><b>기안하기</b></a></span>
							<span><a href="javascript:void(0);"><b>임시저장</b></a></span>
						</div>
						
						<!--------------------------------------------------------------------------------->
						
							<h4 style="padding: 2px 0 15px 0;">기본 설정</h4>
							<table class="docuTable">
								<colgroup>
									<col style="width:14.15%;">
									<col style="width:42.94%">
									<col style="width:14.15%">
									<col style="width:28.76%">
								</colgroup>
								<tr>
									<th>문서종류</th>
									<td>
										<select name="" class="write-select" autocomplete="off">
											<option value="" selected="">공용</option>
										</select>
										<input type="hidden" id="prevApprovalCategoryNo" value="">
										<select name="docuType" class="write-select" id="documentTypeSelect" autocomplete="off">																
											<option value="N">선택</option>
											<option value="AP">지출 결의서</option>
											<option value="CN">회람</option>
											<option value="CF">품의서</option>
										</select>
										<!-- <button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button> -->
										<input type="hidden" id="prevApprovalFormNo" value="26723">
										<input type="hidden" id="prevApprovalFormTitle" value="">										
									</td>
									<th>작성자</th>
									<td><span>${loginUser.empName} ${loginUser.jobName}</span></td>
								</tr>
								<tr>
									<th>보존연한</th>
									
									<td>
										<select name="saveTerm" class="fl write-select" id="set_preserved_term_y">
											<option value="">보존 연한</option>
											<option value="1">1년</option>
											<option value="3">3년</option>
											<option value="5">5년</option>
											<option value="10">10년</option>
											<option value="0">영구</option>
										</select>
										<span class="fl hide" id="set_preserved_term_n">년</span>
										<span class="lnr lnr-question-circle detailQ" style="padding-left:5px;line-height: 30px;"></span>
										<div class="toolTip hide">
											<div class="tooltip-box" style="width:570px; display:block;">
												<p>ㆍ1년: 경미한 연결 문서 및 일시적인 사용 또는 처리에 그치는 문서</p>
												<p>ㆍ3년: 사무의 수행상 1년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 3년간 보존을 요하는 문서</p>
												<p>ㆍ5년: 사무의 수행상 3년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 5년간 보존을 요하는 문서</p>
												<p>ㆍ10년: 사무의 수행상 장기간 참고 또는 이용해야 할 문서 및 법률상 10년간 보존을 요하는 문서</p>
												<p>ㆍ영구: 회사의 존속에 필요 불가결한 문서 및 역사적 또는 기타 사유로 중요한 문서</p>
											</div>
										</div>
									</td>
									<th>보안등급</th>
									
									<td>
										<select name="security" class="fl write-select" id="set_security_level_y">
											<option value="">보안 등급</option>
											<option value="S">S등급</option>
											<option value="A">A등급</option>
											<option value="B">B등급</option>
											<option value="C">C등급</option>
										</select>
										<span class="fl hide" id="set_security_level_n">등급</span>
										<span class="lnr lnr-question-circle detailQ" style="padding-left:5px;line-height: 30px;"></span>
										<div class="toolTip hide" >
											<div class="tooltip-box" style="width:470px; display:block;">
												<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수 있음.</p>
												<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(과장)등급 이상인 사람이 문서를 볼 수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
												<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(사원)등급 이상인 사람이 문서를 볼 수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
												<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수 있음.</p>
											</div>
										</div>
									</td>
									
								</tr>
							</table>
						
						
						<!--------------------------------------------------------------------------------->
						
						<div class="after">
							<h4 style="padding: 2px 0 15px 0;margin:0;margin-right:20px; float:left;">결재선</h4>
							<button type="button" class="hide" id="btnApprovalSelect" onclick="" style="display:inline-block;padding:0;">결재선설정</button>
						</div>
						<br clear="both">
						
						<!--------------------------------------------------------------------------------->
						
						<div class="guide">문서 종류 선택 시 결재선이 노출됩니다.</div>
						
						<!--------------------------------------------------------------------------------->
						
						<!-- 
						<div id="approvalDocumentLine" class="typeA hide">
						<table class="cal_table1 approve-write js-approval-line typeA hide" style="text-align:center">
							<colgroup>
								<col style="width:12.09%;">
								<col style="width:37.62%;">
								<col style="width:12.09%;">
								<col style="width:38.02%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="agree">
										<div class="choice" style="height:162px;display:table-cell;width:112px;vertical-align:middle;text-align:center;line-height:normal;position:relative;">신청</div>
									</th>
									<td class="confer vt" id="approvalFirstLine">
										<table>
										<colgroup>
											<col width="25%;">
											<col width="25%;">
											<col width="25%;">
											<col width="25%;">
										</colgroup>
											<tbody>
												<tr>
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
														${loginUser.empName}
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
									<th scope="row" class="confer">
										<div class="choice" style="height:162px;display:table-cell;width:112px;vertical-align:middle;text-align:center;line-height:normal;position:relative;">처리</div>
									</th>
									<td class="confer vt" id="approvalSecondLine">
										<table>
										<colgroup>
											<col width="25%">
										</colgroup>
											<tbody>
											<tr>
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
											</tbody>
										</table>
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
										<th scope="row" style="text-align:center">참조</th>
										<td id="approvalThirdLine" style="padding: 8px 0 8px 12px;border-bottom: 1px solid #cdcdcd;text-align: left;height: 40px;">
											<span class="refer-list" empId="">참조인 생기기</span>
											
											<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalThirdLine" autocomplete="off">
											<span class="lnr lnr-cross-circle" style="padding-left:7px;cursor:pointer;"></span></span>
											
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						 -->
						
						
						
						<!-- 회람 -------------------------------------------------------->
						
						
						<div id="approvalDocumentLine" class="referTable2 hide">
						
							<table class="cal_table1 approve-write refer">
								<colgroup>
									<col style="width:12.09%;">
									<col style="width:87.91%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" style="text-align:center">회람</th>
										<td id="approvalThirdLine" class="referRow2" style="padding: 8px 0 8px 12px;border-bottom: 1px solid #cdcdcd;text-align: left;height: 40px;">
											
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						 
						<!-- 회람 -------------------------------------------------------->
						
						
						
						<div id="approvalDocumentLine" class="approvalTable hide">
						
						<!-- 결제 -->
						<table class="cal_table1 approve-write js-approval-line">
							<colgroup>
								<col style="width:12.09%;">
								<col style="width:87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="sign"><div style="height: 162px; display: table-cell; width: 110px; vertical-align: middle; text-align: center;position: relative;">결재</div></th>
									<td class="sign vt" id="approvalFirstLine">
										<table style="width:100%;table-layout:fixed"><colgroup><col><col><col><col><col><col><col></colgroup>
											<tbody id="apTbody">
											<tr>
												<td class="team name"></td>
												<td class="team name"></td>
												<td class="team name"></td>
												<td class="team name"></td>
												<td class="team name"></td>
												<td class="team name"></td>
												<td class="team name"></td>
											</tr>
											<tr>
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
						 
						<!-- 참조 -->
						<table class="cal_table1 approve-write refer" id="referTable1">
								<colgroup>
									<col style="width:12.09%;">
									<col style="width:87.91%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" style="text-align:center">참조</th>
										<td id="approvalThirdLine" class="referRow" style="padding: 8px 0 8px 12px;border-bottom: 1px solid #cdcdcd;text-align: left;height:40px;">
										</td>
									</tr>
								</tbody>
							</table>
										
							
						</div>
						
						
						
						
						
						
						<!---------- 결제선 주소록 시작 ------------------------>
						
						<div id="approval_address_layer" class="booking_layer_div layer_box hide typeD">
						
						<div class="layer_box large address line " id="div_approval_view_one" style="margin-left: -400px; margin-top: -311px; display: block;width: 770px;">
							<div class="title_layer text_variables" id="titleApprovalLineSetting">결재선 설정</div>
							
							<!-- 
							<div class="line-search after" id="searchP" style="display: block;">
								<ul class="after">
									<li><label for="rdo_sch_name"><input type="radio" value="name" name="searchField" id="rdo_sch_name" onclick="$j('#keyword').focus();" checked="checked"> 이름</label></li>
									<li><label for="rdo_sch_const"><input type="radio" value="const" name="searchField" id="rdo_sch_const" onclick="$j('#keyword').focus();"> 조직</label></li>
								</ul>
								<div class="fl input-area">
									<input type="text" style="width:203px;position: absolute;" class="text-box vm" id="keyword" onkeypress="if(event.keyCode == 13){ event.preventDefault(); addressbook.click_searchBtn();}">
									<span class="icon h_detail vm"></span>
									<span class="refresh vm" onclick="addressbook.setTab(addressbook.currentTab);"></span>
								</div>
								<select class="fl " style="width: 203px; margin-left: 24px; display: inline-block;position: absolute;right: 110px;" onchange="ApprovalDocument.selectApprovalLine();" id="selectApprovalLine">
									<option value="">자주 쓰는 결재선</option>
								</select>
							</div>
							 -->
						
							<div class="after line-list-wrap">
								<div class="fl">
									<div class="after">
										<div class="fl" id="searchMessage" style="display: none;"><span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span></div>
										<div class="fr">
											<a class="icon order" title="정렬" id="anchorApprovalUserOrder" style="cursor:pointer;"></a>
											<ul class="dropdown-menu hide" id="orderApprovalDropdown" style="width: 70px; top: 124px; left: 314px;">
												<li><a class="js-approval-node-order sortByName">이름순</a></li>
												<li><a class="js-approval-node-order sortByJob">직급순</a></li>
											</ul>
										</div>
									</div>
									<div class="after">
										<div class="category-list" style="height: 397px;width: 205px;">
											<select id="leftList" size="19" frameborder="0" style="display:none;">
																	</select>
											<div id="treeDiv" style="white-space: nowrap;float: none;" class="treeDiv OrgTree">
												<ul>
													<li id="" class="last">
														<div class="Container">
															<img onclick="" src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_m.gif" class="plus">
															<strong onclick="" id="subOffice" class="selectedNode">DEVELOFFICE <span style="font-weight:normal; color:silver; font-size:8pt">(${deptSize})</span></strong>
														</div>
														<ul style="" id="subDept">
														</ul>
													</li>
												</ul>
											</div>
											<div id="leftProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
										</div>
										<div class="name-list" style="width: auto;">
											<select multiple="multiple" id="rightList" style=""></select>
						
											<div class="choice-area" style="width: 203px;font-size: 12px;padding: 5px;">
												<a class="text_variables fl mgr_20" id="selectAll" style="cursor:pointer">전체</a>
												<a class="text_variables mgr_20" id="cancelAll" style="cursor:pointer">선택안함</a>
												<span id="pagingP"></span>
											</div>
											<div id="rightProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
										</div>
									</div>
						
								</div>
								<div class="add-del-btn with-fourline">
									<div class="top" style="margin-top: 70px;">
										<a class="icon btn-add js-btn-approval-first-line"><span class="blind"></span></a>
										<a class="icon btn-del js-btn-approval-first-line"><span class="blind"></span></a>
									</div>
									<div class="middle" style="margin-top: 60px;">
										<a class="icon btn-add js-btn-approval-third-line"><span class="blind"></span></a>
										<a class="icon btn-del js-btn-approval-third-line"><span class="blind"></span></a>
									</div>
									
									<!-- 
									<div class="bottom" style="margin-top: 34px;">
										<a class="icon btn-add js-btn-approval-third-line"><span class="blind"></span></a>
										<a class="icon btn-del js-btn-approval-third-line"><span class="blind"></span></a>
									</div>
									<div class="last" style="margin-top: 25px;">
										<a class="icon btn-add js-btn-approval-fourth-line"><span class="blind"></span></a>
										<a class="icon btn-del js-btn-approval-fourth-line"><span class="blind"></span></a>
									</div>
									 -->
									
								</div>
								<div class="fr mgb20">
									<div class="dropdown hide show" style="top:60px;right:0">
										<div class="dropdown-menu multi-team hide" id="layerMultiNode" style="width:290px">
											<p class="pdb_20">선택된 결재자가 여러 조직에 속해 있을 경우, 하나의 조직을 선택하셔야 합니다.</p>
											<p class="pdb_10" id="multiNodeUser"></p>
											<div style="overflow:auto;max-height:132px;padding:0;">
												<table class="tableType01" id="tableMultiNode">
													<caption>문서 수정 이력 목록으로 시간, 관리로 구성되어 있습니다.</caption>
													<colgroup>
														<col width="15%">
														<col width="85%">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">선택</th>
															<th scope="col">소속 부서</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
						
											<div class="layer_button">
												<button type="button" class="btn_variables">확인</button> <button type="button" onclick="$j('#layerMultiNode').hide();">취소</button>
											</div>
										</div>
									</div>
									<div class="first-line four-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">결재 <span class="point_color bold" id="sp_selectApprovalFirstLine">0</span></span>
												<div class="updown-wrap first js-move-approval-first-line" style="width: 55px;">
													<span class="blind icon down"></span>
													<span class="blind icon up"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalFirstLine" style="overflow-y: hidden !important;">
												</select>
											</div>
						
										</div>
										<div class="spr-approval approval-direction">
											결<br>
											재<br>
											방<br>
											향<br>
										</div>
									</div>
									
									
									<!-- 
									<div class="three-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">합의 <span class="point_color bold" id="sp_selectApprovalSecondLine">0</span></span>
												<div class="updown-wrap first js-move-approval-second-line" style="width: 55px;">
													<span class="blind icon down"></span>
													<span class="blind icon up"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalSecondLine">
												</select>
											</div>
										</div>
									</div>
									 -->
									
									
									
									<div class="three-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">참조 <span class="point_color bold" id="sp_selectApprovalThirdLine">0</span></span>
												<div class="updown-wrap first js-move-approval-third-line" style="width: 55px;">
													<span class="blind icon down"></span>
													<span class="blind icon up"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalThirdLine" style="overflow-y: hidden !important;">
												</select>
										   </div>
										</div>
										<div class="spr-approval approval-direction">
											결<br>
											재<br>
											방<br>
											향<br>
										</div>
									</div>
									
									<!-- 
									<div class="last-line two-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">참조 <span class="point_color bold" id="sp_selectApprovalFourthLine">0</span></span>
												<div class="updown-wrap first js-move-approval-fourth-line" style="width: 55px;">
													<span class="blind icon down"></span>
													<span class="blind icon up"></span>
												</div>
											</div>
											<div class="list" style="height: 54px;">
												<select multiple="multiple" id="selectApprovalFourthLine">
												</select>
										   </div>
										</div>
									</div>
									 -->
									
								</div>
							</div>
							<div class="layer_button">
								<button type="button" class="btn_variables confirmBtn">확인</button> <button type="button" class="closeBtn">취소</button>
							</div>
							<a class="icon btn_closelayer closeBtn" title="레이어 닫기"></a>
						</div>
						
						<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
					</div>
						
						
						
						
						
						
						<!---------- 결제선 주소록 끝 ------------------------>
						
						
						
						
						
						
						
						
						<!--------------------------------------------------------------------------------->
						
						<h4 style="margin-top:50px;margin-bottom:0;padding: 0 0 15px 0;">상세 입력</h4>
						
						<!--------------------------------------------------------------------------------->
						
						<div class="guide">문서 종류 선택 시 상세 입력이 노출됩니다.	</div>
						
						<!--------------------------------------------------------------------------------->
						
						<div class="write_input js-approval-input docuTitle hide" style="display: block;">
							<label style="width:80px;position:absolute;top:4px;">제목</label>
							<div class="txt title" style="margin-left: 80px;position:relative;">
								<div class="position">
									<input type="text" name="title" id="approval_document_title" value="" style="width:100%; height:26px;">
								</div>
							</div>
						</div>
						
						<!--------------------------------------------------------------------------------->
						<!--------- 에디터 ------------------------------------------------------------------>
						
						
						
						<textarea id="summernote" class="summernote" name="content" value=""></textarea>
						<!-- <div id="summernote" class="summernote" name="content" value=""></div> -->
						
						
						
						<!--------------------------------------------------------------------------------->
						
						<div class="js-approval-input typeA hide" id="approvalDbContent" style="display: block;">
						<table class="tableType02 account docuTable">
						<colgroup>
							<col style="width:12.09%;">
							<col style="width:87.91%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">구분</th>
								<td>
									<label>
										<input type="radio" name="accountingType" value="P" checked="" onchange="">
										개인
									</label>
									<label style="margin-left: 20px;">
										<input type="radio" name="accountingType" value="C" onchange="">
										법인
									</label>
								</td>
							</tr>
							<tr>
								<th scope="row" id="th_spending_regist_month">회계 기준월</th>
								<th scope="row" style="display:none;" id="th_spending_regist_days">회계 기준일</th>
								<td>
									<div class="to-item" id="spending_regist_md">
										<!-- 회계 기준 : 월별 -->
										<select class="write-select" name="spendingYear" style="width: 80px;" onchange="ApprovalDocument.changeFixedDate();" id="selectFixedYear">
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
										</select>
										년
										<select class="write-select" name="spendingMonth" style="width: 55px;" onchange="ApprovalDocument.changeFixedDate();" id="selectFixedMonth">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
										월
										<!-- 회계 기준 : 일별 -->
										<select class="write-select" style="width: 120px; display:none;" onchange="ApprovalDocument.changeFixedDate();" id="selectFixedDays">
											<option value="0">회계 기준일</option>
										</select>
									</div>
									<div class="to-item" id="spending_regist_c" style="display:none;">
										<!-- 회계 기준 : 사용자 정의 -->
										<input type="text" class="cal hasDatepicker" id="spendingDateCustom" readonly="readonly" value="2019-09-27">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">지출자</th>
								<td>
									<input type="text" class="account-add js-complete ui-autocomplete-input hide" value="" id="inputSpenderName" >
									<span class="" id="textSpenderName">${loginUser.empName}</span>
									<input type="hidden" name="spenderName" value="${loginUser.empName}" id="spenderName">
									<button type="button" class="weakblue mgl_20" id="modifySpenderName">변경</button>

									
									<!-- 자동 완성 팝업창 시작 -->
						
									<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content dropdown-menu block approval-autocomplete" id="ui-id" tabindex="0" style="display:none; position:absolute; top:838px; left:198px; width:285px; padding:0;z-index:1500;">
										<!-- top:836px; left:198px; -->
										<!-- top:854px; left:145px; -->
										<!-- 
										<li class="ui-menu-item popup_li" id="ui-id-5" tabindex="-1">
											<div>
												<span class="team-membername">김상윤</span>
												<span class="team-name">서비스팀</span>
											</div>
										</li>
										<li class="ui-menu-item popup_li" id="ui-id-6" tabindex="-1">
											<div>
												<span class="team-membername">김성은</span>
												<span class="team-name">영업팀</span>
											</div>
										</li>
										 -->
										
									</ul>
									
									<!-- 자동 완성 팝업창 끝 -->
									
									
								</td>
							</tr>
							<tr id="accountRow">
								<th scope="row">계좌 정보</th>
								<td id="accountTd">
									IBK기업은행 / ${loginUser.account}
								</td>
							</tr>
							
							<!-- 
							<tr id="infoEmployeeAccount">
								<th scope="row">계좌 정보</th>
								<td></td>
							</tr>
							<tr id="infoCorporationCard" class="hide">
								<th scope="row">법인 카드</th>
								<td>
									<select id="corporationCard" class="write-select" style="min-width:240px; width:auto;">
										<option value="">법인 카드</option>
																	</select>
								</td>
							</tr>
							 -->
							
						</tbody>
						</table>
						<div class="after" style="padding-bottom:10px;">
							<h4 class="fl" style="float:left;">거래 내역</h4>
							<button type="button" class="weakblue mgl_20 vt" id="addDealInfo" onclick="">추가</button>
						</div>
						
						
						
						<script>
							
						
						
						</script>
						
						
						<!-- 추가창 팝업 시작 --------------------------------------------------------------------->
						
						<div id="add_account_layer" class="booking_layer_div layer_box hide">
						
							<div class="layer_box large account" id="layerDealInformation" style="margin-left: -375px; margin-top: -171px; display: block; width: 750px;">
								<div class="title_layer text_variables">
											거래 내역 추가(개인)			</div>
								<table class="tableType02">
									<colgroup>
										<col width="120">
										<col>
										<col width="120">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">계정과목</th>
											<td>
												<label>
													<select id="inputAccountingAccount">
														<option value="">항목</option>
														<option value="A">차량유지비</option>
														<option value="B">복리후생비</option>
														<option value="C">사무용품비</option>
														<option value="E">기타</option>
													</select>
											</td>
											<th scope="row">지출일자</th>
											<td>
												<label>
													<input type="text" id="textExpenseDate" class="datepicker" readonly style="width:150px;">
													<script>				
														$(".datepicker").datepicker();
													</script>
													<button type="button" class="icon month" onclick="$('#textExpenseDate').focus();"><span class="blind">날짜 선택</span></button>
												</label>
											</td>
										</tr>
										<tr>
											<th scope="row">코스트센터</th>
											<td>
												<select class="" id="selectAccountingDept" onchange="">
													<option value="">부서</option>
													<c:forEach var="d" items="${deptList}">
														
														<option value="${d.deptCode}">${d.deptName}</option>
														
													</c:forEach>
													
												</select>
											</td>
											<th scope="row">증빙</th>
											<td>
												<select class="" id="selectAccountingProof" onchange="">
													<option value="">증빙</option>
													<option value="receipt">일반 영수증</option>
													<option value="card">개인 카드</option>
													<option value="tax_bill">세금 계산서</option>
													<option value="bill">계산서</option>
													<option value="cash_receipt">현금 영수증</option>
													<option value="etc">기타</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row">금액</th>
											<td>
												<label><input type="text" id="inputSupplyPrice" maxlength="20"></label>
											</td>
											<th scope="row">적요</th>
											<td>
												<label><input type="text" id="inputBrief"></label>
											</td>
										</tr>
										<tr>
											<th scope="row">거래처</th>
											<td>
												<label>
													<input type="text" class="account-add" placeholder="직접 입력하세요." id="inputDealCustomer" maxlength="20">
													<input type="text" class="account-add js-complete hide ui-autocomplete-input" placeholder="클릭 후 입력" id="inputAccountingCustomer" autocomplete="off">
													<button id="btnAccountingCustomerSearchLayer" class="hide" onclick="ApprovalDocument.getCustomerSearchLayer('deal');"><span class="icon src"><em class="blind">검색</em></span></button>
												</label>
												<span class="hide" id="textAccountingCustomer"></span>
												<button class="weakblue vm hide" id="btnAccountingCustomer" onclick="ApprovalDocument.setAccountingCustomer('', '', '', true);">변경</button>
											</td>
											
										</tr>
										
									</tbody>
								</table>
								<div class="layer_button">
									<button type="button" class="btn_variables" id="saveBtn">저장</button>
									<button type="button" class="btn_variables" id="addBtn">저장 후 추가</button>
									<button type="button" class="closeBtn">취소</button>
								</div>
								<a href="javascript:void(0)" class="icon btn_closelayer closeBtn" title="레이어 닫기"></a>
							
							</div>
							
							<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
						</div>
						
						
						<!-- 추가창 팝업 끝 ---------------------------------------------------------------------->
						
						
			
						<table class="tableType01 account mgb_20" id="tableAccoutingDealInformation" style="margin-bottom:20px;">
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
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="account_name">계정 과목<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="expense_date">지출일자<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="department_name">코스트센터<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="price">금액<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="customer_name">거래처<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="brief">적요<span class="down hide"></span></a></th>
									<th scope="col"><a href="javascript:void(0);" class="js-approval-spending-order js-approval-order black" value="">관리<span class="down hide"></span></a></th>
								</tr>
							</thead>
							 
						<tbody id="spendTbody"></tbody>
							 
						</table>
					</div>				
					
					<!------------------------------------------------------------------------>
					
					<h4 class="filezone hide" style="margin-top:50px;margin-bottom:0;padding: 0 0 15px 0;">첨부 파일</h4>
						
					<!-------------- 첨부파일존 시작 ---------------------------------------------------------->
					
					
					
					<div class="filezone hide">
				        <table class="table" width="100%" style="border: 2px dashed #e4e4e4;height: 50px;">
				            <tbody id="fileTableTbody">
				                <tr>
				                    <td id="dropZone" style="padding: 15px;text-align: center;">
				                        파일을 드래그 하세요
				                    </td>
				                </tr>
				            </tbody>
				        </table>
				    </div>
				        


						
					<!-------------- 첨부파일존 끝 ---------------------------------------------------------->
					
				</form>
						
						
						
						
						
						
						
					</div>
					
					
					
					
					
					
					
					<!-- 이 위까지 내용작성 -->
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<div class="clearfix"></div>
		
		<!-- 
		<footer>
			<div class="container-fluid">
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
			</div>
		</footer>
		 -->

	<!--  -->
	</div>
	<!-- END WRAPPER -->
	
	
	
	
	
	
	
	
	
	
	<!-- script 작성 -->
	<script>
	$(function(){
		
		
		/* 사이드바의 해당 메뉴 활성화 유지하기 */
		$("#menu1").addClass("in");
		$("#menu1").attr('aria-expanded',true);
		$("#menu1_1").addClass("active");
		$("#menu1_1").attr('aria-expanded',true);
		$("#m1_1").addClass("active");
		
		
		
		/* 오늘 날짜 구해서 년/월 세팅 */
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;

		$.each($("select[name=spendingYear] option"), function(i, op){
			
			if(op.value == year){
				op.selected = true;
			}
		});

		$.each($("select[name=spendingMonth] option"), function(i, op){
			if(op.value == month){
				op.selected = true;
			}
		});

		
		/* ?에 마우스 올리면 툴팁 보이기 */
		$(".detailQ").mouseenter(function(){
			$(this).css("cursor","pointer");
			$(this).siblings('.toolTip').addClass("show");			
		}).mouseout(function(){
			$(this).siblings('.toolTip').removeClass("show");
		});
		

		/* 에디터 */
		$("#summernote").hide();
		
		/* 문서 타입 바꿀 때 마다 */
		$("#documentTypeSelect").on('change',function(){
			
			/* 각종 초기화 */
			$(".referRow").html("");
			$(".referRow2").html("");
			$("#summernote").html("");
			
			$.each($("#nameRow").children(), function(i, td){
				td.innerHTML = "";
			});
			$("#rightList").html("");
			$("#selectApprovalFirstLine").html("");
			$("#selectApprovalThirdLine").html("");
			$("#sp_selectApprovalFirstLine").html("0");
			$("#sp_selectApprovalThirdLine").html("0");
			
			
			if( $("#documentTypeSelect option:selected").val() == 'N' ){
				
				$("#approval_document_title").val("");
				
				$(".guide").css("display","block");
				$(".docuTitle").removeClass("show");			//제목
				$("#btnApprovalSelect").removeClass("show");	//결제선 추가창 버튼
				$(".approvalTable").removeClass("show");		//결제선 테이블
				$(".referTable2").removeClass("show");			//회람 테이블
				$(".typeA").removeClass("show");				//지출 테이블
				$(".filezone").removeClass("show");				//첨부파일
								
				// 에디터 off-----------------------------
				$("#summernote").summernote('destroy');	
				//--------------------------------------
				$("#summernote").hide();
			}
			if( $("#documentTypeSelect option:selected").val() == 'AP' ){	// 지출결의서
				
				$("#approval_document_title").val('2019년 '+month+'월 지출 결의서 - 개인');
				
				$(".guide").css("display","none");
				$(".docuTitle").addClass("show");
				$("#btnApprovalSelect").addClass("show");
				$(".approvalTable").addClass("show");
				$(".referTable2").removeClass("show");
				$(".typeA").addClass("show");
				$(".filezone").addClass("show");
				
				$("#summernote").summernote('destroy');
				$("#summernote").hide();
				
			}
			if( $("#documentTypeSelect option:selected").val() == 'CN' ){	// 회람
				
				$("#approval_document_title").val("");
				
				$(".guide").css("display","none");
				$(".docuTitle").addClass("show");
				$("#btnApprovalSelect").addClass("show");
				$(".approvalTable").removeClass("show");
				$(".typeA").removeClass("show");
				$(".referTable2").addClass("show");
				$(".filezone").addClass("show");
				
				// 에디터 on--------------------
				$("#summernote").summernote({
					tabsize: 2,
			        height: 300,
			        lang: 'ko-KR'
				});
				$('.dropdown-toggle').dropdown();
				//--------------------------
				
			}
			if( $("#documentTypeSelect option:selected").val() == 'CF' ){	// 참조
				
				$("#approval_document_title").val("");
				
				$(".guide").css("display","none");
				$(".docuTitle").addClass("show");
				$("#btnApprovalSelect").addClass("show");
				$(".approvalTable").addClass("show");
				$(".typeA").removeClass("show");
				$(".referTable2").removeClass("show");
				$(".filezone").addClass("show");

				$("#summernote").summernote({
					tabsize: 2,
			        height: 300,
			        lang: 'ko-KR'
				});
				$('.dropdown-toggle').dropdown();
			}
			if( $("#documentTypeSelect option:selected").val() == 'D' ){
				$(".guide").css("display","none");
				$(".docuTitle").addClass("show");
				$("#btnApprovalSelect").addClass("show");
				$(".typeA").removeClass("show");
				$(".typeB").removeClass("show");
				$(".typeC").removeClass("show");
				$(".filezone").addClass("show");
			}
			
		});
		
		/* 모달 close 버튼 */
		$(".closeBtn").click(function(){
			$('.layer_box').removeClass("show");
		});
		/* 결제선 모달 on */
		$("#btnApprovalSelect").click(function(){
			$("#approval_address_layer").addClass("show");
		});
		/* 지출내역 추가 모달 on */
		$("#addDealInfo").click(function(){
			$("#add_account_layer").addClass("show");				
		});
		
			
		/* 결재선 창 기능 시작 */
		
		//console.log(${deptList}.length);
		/* 제일 왼쪽 div에 모든 부서명 출력 */
		$.each(${deptList}, function(index, dept){
			
			if(index != 0){
				
				if(index != ${deptList}.length-1){	// 마지막 인덱스가 아니면
					
					$subDeptLi = $('<li class="subDept_li" id="subDept'+index+'">');
					$subDeptDiv = $('<div class="Container">');
					$subDeptStrong = $('<strong>')
					$subDeptSpan1 = $('<span class="subDeptName">').text(dept.deptName);
					$subDeptSpan2 = $('<span style="font-weight:normal; color:silver; font-size:8pt">').text('('+dept.count+')');
					
					$subDeptStrong.append($subDeptSpan1);
					$subDeptStrong.append($subDeptSpan2);
					$subDeptDiv.append($subDeptStrong);
					$subDeptLi.append($subDeptDiv);
				} else{		// 마지막 인덱스이면
					
					$subDeptLi = $('<li class="subDept_li last" id="subDept'+index+'">');
					$subDeptDiv = $('<div class="Container">');
					$subDeptStrong = $('<strong>')
					$subDeptSpan1 = $('<span class="subDeptName">').text(dept.deptName);
					$subDeptSpan2 = $('<span style="font-weight:normal; color:silver; font-size:8pt">').text('('+dept.count+')');
					
					$subDeptStrong.append($subDeptSpan1);
					$subDeptStrong.append($subDeptSpan2);
					$subDeptDiv.append($subDeptStrong);
					$subDeptLi.append($subDeptDiv);
				}
				
				
				$("#subDept").append($subDeptLi);
			}
		});
		
		var imgFlag = 0;	// 기본 : -
		/* 조직도 펼치기 / 접기 */
		$(".plus").on('click',function(){
			
			if(imgFlag == 0){	// - 일때
				imgFlag = 1;	// + 로 바꿈
			} else if(imgFlag == 1){	// + 일때
				imgFlag = 0;	// - 로 바꿈
			}
			
			if(imgFlag == 0){	// + > - 로 변환
				$(this).attr('src','resources/images/tree_m.gif');
				$("#subDept").css('display','block');
			} else if(imgFlag == 1){	// - > + 로 변환
				$(this).attr('src','resources/images/tree_p.gif');
				$("#subDept").css('display','none');
			}
			
		});
		
		
		
		/* 부서명들 중 가장 상단의 회사명 클릭 시 */
		$("#subOffice").click(function(){
			$("#rightList").html("");
			$(".subDept_li").css('color','#676767');
			
			$.each(${empList}, function(index, emp){
				
				$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
				$("#rightList").append($op);
			});
		});
		
		/* 부서명 클릭 시 */
		$("#subDept").on('click','.subDept_li',function(){
			
			$(this).css('color','#2985db');
			$(this).siblings().css('color','#676767');
			var dept = $(this).find('.subDeptName').text();
			$("#rightList").html("");
			
			$.each(${empList}, function(index, emp){
				
				if(dept == emp.deptName){
					$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
					$("#rightList").append($op);
				}
			});
		});
		
		// 직원이름 여러개 선택 하는거
		/* 
		$("#rightList").on('mouseup','option',function(){
			console.log($("#rightList option:selected"));
		});
		 */
		
		//전체선택
		$("#selectAll").on('click',function(){
			$("#rightList option").attr('selected',true);
			$("#rightList option").css({
				'background-color':'#e8ecee',
				'color':'#676767'
			});
		});
		//전체선택취소
		$("#cancelAll").on('click',function(){
			$("#rightList option").attr('selected',false);
			$("#rightList option").css({
				'background-color':'white',
				'color':'#676767'
			})
		});
		//정렬 버튼
		$('#anchorApprovalUserOrder').on('click',function(){
			$("#orderApprovalDropdown").toggleClass('show');
		});
		//이름 or 직급 정렬
		$(".js-approval-node-order").on('click',function(){
			
			var sortArr = ${empList};
			
			if(document.getElementById('rightList').innerHTML != ""){
				
				//console.log('if문 통과1');
				
				if($(this).hasClass('sortByName')){	//이름정렬
					//console.log('if문 통과2');
					sortArr.sort(function(a, b){
						return a.empName < b.empName ? -1 : a.empName > b.empName ? 1: 0;
					});
					
				} else{	//직급정렬
					//console.log('if문 통과3');
					sortArr.sort(function(a, b){
						return a.jobCode - b.jobCode;
					});
					
				}
				//console.log(sortArr);
				
				$("#rightList").html("");
				
				var conditionArr = $(".subDept_li");
				var conditionName = "";
				
				//선택된 부서(파란색) 이름 찾기
				$.each(conditionArr, function(index, li){					
					//console.log(li.style.color);
					if(li.style.color == 'rgb(41, 133, 219)'){
						conditionName = li.childNodes[0].childNodes[0].childNodes[0].innerHTML;
					}
				});
				
				//console.log('선택된 부서명 : '+conditionName);
				
				$.each(sortArr, function(index, emp){
					if(conditionName == ""){	//파란색으로 선택된 부서명이 없으면 => 전체 직원 선택이면
						$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
						$("#rightList").append($op);
					} else {	// 파란색으로 선택된 부서명이 있으면
						if(conditionName == emp.deptName){
							$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'">').text(emp.empName+" "+emp.jobName);
							$("#rightList").append($op);
						}
					}
				});
			}
			
			$("#orderApprovalDropdown").toggleClass('show');
		});

		
		/* 결제선 추가 버튼 */
		$(".btn-add").on('click',function(){
			
			var selectedArr = $("#rightList option:selected");
			var approval;
			var num;
			
			if($(this).hasClass('js-btn-approval-first-line')){
				approval = $("#selectApprovalFirstLine");
				num = $("#sp_selectApprovalFirstLine");
			} else if($(this).hasClass('js-btn-approval-second-line')){
				approval = $("#selectApprovalSecondLine");
				num = $("#sp_selectApprovalSecondLine");
			} else if($(this).hasClass('js-btn-approval-third-line')){
				approval = $("#selectApprovalThirdLine");
				num = $("#sp_selectApprovalThirdLine");
			} else if($(this).hasClass('js-btn-approval-fourth-line')){
				approval = $("#selectApprovalFourthLine");
				num = $("#sp_selectApprovalFourthLine");
			}
			
			$.each(selectedArr, function(index, value){
				
				if(approval.children('option').length > 0){	// 비어있지 않을때
					var flag = 0;
					
					$.each(approval.children('option'), function(i, op){
						
						if(value.value == op.value){
							flag = 1;
						}
					});
					
					if(flag == 0){
						var $op = $('<option value="'+value.value+'" disabled>').text(value.text+'('+value.title+')');
						approval.append($op);
					}
					
				} else{
					
					var $op = $('<option value="'+value.value+'" disabled>').text(value.text+'('+value.title+')');
					approval.append($op);
				}
				
			});
				num.text(approval.children().length);
		});
		
		/* 결제선 삭제 버튼 */
		$(".btn-del").on('click',function(){
			
			var selectedArr = $("#rightList option:selected");
			var zone;
			var approvalArr;
			var num;
			
			if($(this).hasClass('js-btn-approval-first-line')){
				approvalArr = $("#selectApprovalFirstLine option");
				zone = $("#selectApprovalFirstLine");
				num = $("#sp_selectApprovalFirstLine");
			} else if($(this).hasClass('js-btn-approval-second-line')){
				approvalArr = $("#selectApprovalSecondLine option");
				zone = $("#selectApprovalSecondLine");
				
			} else if($(this).hasClass('js-btn-approval-third-line')){
				approvalArr = $("#selectApprovalThirdLine option");
				zone = $("#selectApprovalThirdLine");
				num = $("#sp_selectApprovalThirdLine");
			} else if($(this).hasClass('js-btn-approval-fourth-line')){
				approvalArr = $("#selectApprovalFourthLine option");
				zone = $("#selectApprovalFourthLine");
			}
			
			console.log(approvalArr);
			console.log(zone.children());
			$.each(approvalArr, function(i, value1){
				$.each(selectedArr, function(j, value2){
					
					if(value1.value == value2.value){
						value1.remove();
					}
				});
			});
			
			num.text(zone.children().length)
		});
		
		/* 결제선 추가 창 확인 버튼 */
		$(".confirmBtn").on('click',function(){
			
			var approvalList = $("#selectApprovalFirstLine").children('option');	//결제라인
			var referList = $("#selectApprovalThirdLine").children('option');	//참조라인
			var apTbody = $("#nameRow").children();	//이름들어갈 td들
			
			/* 결제선 이름 넣기 */
			$.each(approvalList,function(i, op){
				$.each(apTbody,function(j, td){
					if(i == j){
						var str = op.text.split(' ');
						td.innerHTML = str[0];
						
						var hiddenId = $('<input type="hidden" name="empId">');
						hiddenId[0].value = op.value;
						td.append(hiddenId[0]);
					}
				});
			});
			
			
			/* 참조인 이름 넣기 */
			
			var docuType = $("#documentTypeSelect option:selected").val();
			//$("#documentTypeSelect option:selected").val()
			
			if(docuType == 'AP' || docuType == 'CF'){
				
				var referRow = $(".referRow");
				referRow.html('');
				
				$.each(referList,function(i, op){
					var str = op.text.split(' ');
					var referSpan = $('<span class="refer-list ml-20" empId="">');
					
					referSpan[0].setAttribute('empId',op.value);
					referSpan[0].innerHTML = str[0];
					referRow[0].append(referSpan[0]);
				});
			} else{
				
				var referRow = $(".referRow2");
				referRow.html('');
				
				$.each(referList,function(i, op){
					var str = op.text.split(' ');
					var referSpan = $('<span class="refer-list ml-20" empId="">');
					
					referSpan[0].setAttribute('empId',op.value);
					referSpan[0].innerHTML = str[0];
					referRow[0].append(referSpan[0]);
				});
			}
			
			$(".closeBtn").click();
		});
		
		
		
		/* 결재선 창 기능 끝 */
		
		
		
		
		
		
		
		/* 지출자 변경 버튼 */
		$("#modifySpenderName").on('click',function(){
			
			$(this).addClass('hide');
			$("#textSpenderName").addClass('hide');
			$("#inputSpenderName").addClass('show');
			$("#inputSpenderName").val("");
			$("#inputSpenderName").focus();
			$("#accountTd").text("");
		});
		
		/* 지출자 변경 자동완성 */
		$("#inputSpenderName").keyup(function(e){
			$('#dfs').prop('checked')
			console.log($(this).val());
			console.log(e);
			var key = $(this).val();
			var $ui = $("#ui-id");
			
			if(key != ""){
				
				$ui.html("");
				
				$.ajax({
					url:"autocomplete.do",
					type:"POST",
					data:{key:key},
					success:function(data){
						
						if(data != null){
							
								$ui.html("");
								
							$.each(data, function(i, e){
								
								var li = document.createElement('li');
									li.classList.add('ui-menu-item','popup_li');
									li.setAttribute('tabindex','-1');
								
								var div = document.createElement('div');
								
								var span1 = document.createElement('span');
									span1.classList.add('team-membername','fl');
									span1.setAttribute('id',e.account);
									span1.innerHTML = e.empName;
									
								var span2 = document.createElement('span');
									span2.classList.add('team-name','fr');
									span2.innerHTML = e.deptName;
								
								div.appendChild(span1);		//js
								div.appendChild(span2);		//js
								li.appendChild(div);		//js
								
								$ui.append(li);				//jquery
								
								$("#ui-id").addClass('show');
							});
						} else{
							return;
						}
					},
					error:function(){
						alertify.alert('', 'AJAX통신 실패');
					}
				});
				
				
				
			} else{
				$("#ui-id").removeClass('show');
			}
		});
		
		/* 자동완성으로 출력한 리스트를 선택하면 */
		$("#ui-id").on('click','li',function(){
			
			$("#textSpenderName").text($(this).find(".team-membername").text());
			$("#spenderName").val($(this).find(".team-membername").text());
			$("#textSpenderName").removeClass('hide');
			$("#modifySpenderName").removeClass('hide');
			$("#inputSpenderName").removeClass('show');
			$("#accountTd").text('IBK기업은행 / '+$(this).find(".team-membername").attr('id'));
			$("#ui-id").removeClass('show');
		});
		
		/* 개인 / 법인 선택(라디오버튼) */
		$(document).on('change','input[name=accountingType]',function(){
			console.log($(this));
			if($(this).val() == 'C'){
				$("#approval_document_title").val('2019년 10월 지출 결의서 - 법인');
				$("#accountRow").hide();
			}else{
				$("#approval_document_title").val('2019년 10월 지출 결의서 - 개인');
				$("#accountRow").show();
			}
			
		});
		
	})
		
		/* 결제 추가 모달창 기능 */
		
		/* 저장 버튼 */
		$("#saveBtn").on('click',function(){
			$("#spRow").remove();
			addSpendRow();
			sumPriceRow();
			initSpend();
			$("#add_account_layer").removeClass("show");
		});
		
		$("#addBtn").on('click',function(){
			$("#spRow").remove();
			addSpendRow();
			sumPriceRow();
			initSpend();
		});
	
	
		/* 추가하는 메소드 */
		function addSpendRow() {
			
			var $tr = $('<tr>');
			
			var $td1 = $('<td>').text( $("#inputAccountingAccount option:selected").text() );
			var $h1 = $('<input type="hidden" name="accountName">').val($("#inputAccountingAccount option:selected").text());
			$td1.append($h1);
			
			var $td2 = $('<td>').text( $("#textExpenseDate").val() );
			var $h2 = $('<input type="hidden" name="expenseDate">').val($("#textExpenseDate").val());
			$td2.append($h2);
			
			var $td3 = $('<td>').text( $("#selectAccountingDept option:selected").text() );
			var $h3 = $('<input type="hidden" name="departmentName">').val($("#selectAccountingDept option:selected").text());
			$td3.append($h3);
			
			var $td4 = $('<td>').text( $("#inputSupplyPrice").val() );
			var $h4 = $('<input type="hidden" name="price1">').val($("#inputSupplyPrice").val());
			$td4.append($h4);
			
			var $td5 = $('<td>').text( $("#inputDealCustomer").val() );
			var $h5 = $('<input type="hidden" name="customer">').val($("#inputDealCustomer").val());
			$td5.append($h5);
			
			var $td6 = $('<td>').text( $("#inputBrief").val() );
			var $h6 = $('<input type="hidden" name="brief">').val($("#inputBrief").val());
			$td6.append($h6);
			
			var $td7 = $('<td>');
			var $btn1 = $('<button type="button" name="button" class="weakblue" onclick="">').text('수정');
			var $span = $('<span class="weakgray">').text(' | ');
			var $btn2 = $('<button type="button" name="button" class="weakblue" onclick="removeRow(this);">').text('삭제');
			$td7.append($btn1);
			$td7.append($span);
			$td7.append($btn2);
			
			$tr.append($td1);
			$tr.append($td2);
			$tr.append($td3);
			$tr.append($td4);
			$tr.append($td5);
			$tr.append($td6);
			$tr.append($td7);
			
			$("#spendTbody").append($tr);
		}
	
		/* 결제 추가 창 초기화  */
		function initSpend() {
			$("#inputAccountingAccount option:eq(0)").prop('selected',true);
			$("#textExpenseDate").val("");
			$("#selectAccountingDept option:eq(0)").prop('selected',true);
			$("#selectAccountingProof option:eq(0)").prop('selected',true);
			$("#inputSupplyPrice").val("");
			$("#inputBrief").val("");
			$("#inputDealCustomer").val("");
		}
		
		/* 결제 정보 한줄 지우기 */
		function removeRow(obj) {
			$(obj).parent().parent().remove();
		}
		
		/* 지출 가격 총 합 나타내기 */
		
		function sumPriceRow() {
			
			var sumPrice = 0;
			
			$.each($("input[name=price1]"), function(i, price){
				sumPrice += Number(price.value);
			});
			
			var $tr = $('<tr id="spRow">');
			var $td1 = $('<td>');
			var $td2 = $('<td>');
			var $td3 = $('<td>');
			var $td4 = $('<td>').text('총 '+sumPrice);
			var $h = $('<input type="hidden" name="price">').val(sumPrice);
			$td4.append($h);
			var $td5 = $('<td>');
			var $td6 = $('<td>');
			var $td7 = $('<td>');
			
			$tr.append($td1);
			$tr.append($td2);
			$tr.append($td3);
			$tr.append($td4);
			$tr.append($td5);
			$tr.append($td6);
			$tr.append($td7);
			
			$("#spendTbody").append($tr);			
		}
		
	
		/* 기안하기 */
		function insertDocument() {
			
			/* 통합문서 테이블 */
			var docuType = $("#documentTypeSelect option:selected").val();
			
			var date = new Date(); 
			var year = date.getFullYear(); 
			var month = new String(date.getMonth()+1); 
			var day = new String(date.getDate()); 

			// 한자리수일 경우 0을 채워준다. 
			if(month.length == 1){ 
			  month = "0" + month; 
			} 
			if(day.length == 1){ 
			  day = "0" + day; 
			} 

			var docuCode = year + "" + month + "" + day;
			var empId = ${loginUser.empId};
			var saveTerm = $("#set_preserved_term_y option:selected").val();
			var security = $("#set_security_level_y option:selected").val();
						
			if(saveTerm == "" || security == ""){
				alertify.alert('', '보존연한 및 보안등급을 설정해 주세요.');
				return;
			}
			
			var formData = new FormData();
			/* 첨부 파일 */
			if($('input[name=uploadFile]').length > 0){		//첨부파일이 있으면
				formData.append('uploadFile',$('input[name=uploadFile]')[0].files[0]);
			}
		
			formData.append('docuType',docuType);
			formData.append('docuCode',docuCode);
			formData.append('empId',empId);
			formData.append('saveTerm',saveTerm);
			formData.append('security',security);
			
			
			/* 제목 */
			var title = $("#approval_document_title").val();
			formData.append('title',title);
			
			
			if(docuType == 'AP'){	//지출결의서
				
				/* 결재라인(배열) */
				var apArr = "";
				var apNames = $('#nameRow input[name=empId]');
				$.each(apNames,function(i, id){
					if(i == 0){
						apArr += id.value;
					}else{
						apArr += ","+id.value;
					}
				});
				if(apArr == null){
					alertify.alert('', '결재 라인이 지정되지 않았습니다.');
					return;
				}
				formData.append('apArr',apArr);
				
				if($("#spendTbody tr") > 0){	// 거래내역 입력이 없으면
					alertify.alert('', '거래내역이 없습니다.');
					return;
				}
				
				/* 참조라인(배열) */
				var rfArr = "";
				var rfNames = $('.referRow span');
				$.each(rfNames,function(i, id){
					if(i == 0){
						rfArr += id.getAttribute('empId');
					}else{
						rfArr += ","+id.getAttribute('empId');
					}
				});
				formData.append('rfArr',rfArr);
			
				/* 지출결의서 테이블 */
				var accountingType = $('input[name=accountingType]:checked').val();
				var spendingYear = $("#selectFixedYear option:selected").val();
				var spendingMonth = $("#selectFixedMonth option:selected").val();
				var spenderName = $("#textSpenderName").text();
				
				/* 지출 내역 */
				var accountName = "";
				var tempArr = $("input[name=accountName]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						accountName += v.value;
					}else{
						accountName += ','+v.value;
					}
				});
				
				var expenseDate = "";
				tempArr = $("input[name=accountName]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						expenseDate += v.value;
					}else{
						expenseDate += ','+v.value;
					}
				});
				
				var departmentName = "";				
				tempArr = $("input[name=departmentName]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						departmentName += v.value;
					}else{
						departmentName += ','+v.value;
					}
				});
				
				var price = "";
				tempArr = $("input[name=price1]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						price += v.value;
					}else{
						price += ','+v.value;
					}
				});
				
				var customer = "";
				tempArr = $("input[name=customer]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						customer += v.value;
					}else{
						customer += ','+v.value;
					}
				});
				
				var brief = "";
				tempArr = $("input[name=brief]");
				$.each(tempArr,function(i, v){
					if(i == 0){
						brief += v.value;
					}else{
						brief += ','+v.value;
					}
				});
				
				formData.append('accountingType',accountingType);
				formData.append('spendingYear',spendingYear);
				formData.append('spendingMonth',spendingMonth);
				formData.append('spenderName',spenderName);
				formData.append('accountName',accountName);
				formData.append('expenseDate',expenseDate);
				formData.append('departmentName',departmentName);
				formData.append('price',price);
				formData.append('customer',customer);
				formData.append('brief',brief);
				
			}else if(docuType == 'CN'){	//회람
				
				/* 참조라인(배열) */
				var rfArr = "";
				var rfNames = $('.referRow2 span');
				$.each(rfNames,function(i, id){
					if(i == 0){
						rfArr += id.getAttribute('empId');
					}else{
						rfArr += ","+id.getAttribute('empId');
					}
				});
				formData.append('rfArr',rfArr);
				
				/* 에디터 내용 */
				var content = $(".summernote").val();
				formData.append('content',content);
				
			}else if(docuType == 'CF'){	//품의서
				
				/* 에디터 내용 */
				var content = $("#summernote").val();
				formData.append('content',content);
				
				/* 결재라인(배열) */
				var apArr = "";
				var apNames = $('#nameRow input[name=empId]');
				$.each(apNames,function(i, id){
					if(i == 0){
						apArr += id.value;
					}else{
						apArr += ","+id.value;
					}
				});
				if(apArr == null){
					alertify.alert('', '결재 라인이 지정되지 않았습니다.');
					return;
				}
				formData.append('apArr',apArr);
				
				/* 참조라인(배열) */
				var rfArr = "";
				var rfNames = $('.referRow span');
				$.each(rfNames,function(i, id){
					if(i == 0){
						rfArr += id.getAttribute('empId');
					}else{
						rfArr += ","+id.getAttribute('empId');
					}
				});
				formData.append('rfArr',rfArr);
			}
			
			
			$.ajax({
				url:"insertDocument.do",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(data){
					
					if(data == "success"){
    					location.href="documentTable.do";
    					
    				} else{
    					alertify.alert('', '기안 실패');
    				}
				},
				error:function(){
					alertify.alert('', 'AJAX통신 실패');
				}
			});
			
		}
		
	
	
		
		
		
		
		
		
		
		
		
	
	
	
			/*------------------------- 파일 드랍 시작 ---------------------------  */
			
			// 파일 리스트 번호
		    var fileIndex = 0;
		    // 등록할 전체 파일 사이즈
		    var totalFileSize = 0;
		    // 파일 리스트
		    var fileList = new Array();
		    // 파일 사이즈 리스트
		    var fileSizeList = new Array();
		    // 등록 가능한 파일 사이즈 MB
		    var uploadSize = 50;
		    // 등록 가능한 총 파일 사이즈 MB
		    var maxUploadSize = 500;
		 
		    $(function (){
		        // 파일 드롭 다운
		        fileDropDown();
		    });

		    
		 	// 파일 드롭 다운
		    function fileDropDown(){
		        var dropZone = $("#dropZone");
		        //Drag기능 
		        dropZone.on('dragenter',function(e){
		            e.stopPropagation();
		            e.preventDefault();
		            // 드롭다운 영역 css
		            dropZone.css('background-color','#E3F2FC');
		        });
		        dropZone.on('dragleave',function(e){
		            e.stopPropagation();
		            e.preventDefault();
		            // 드롭다운 영역 css
		            dropZone.css('background-color','#FFFFFF');
		        });
		        dropZone.on('dragover',function(e){
		            e.stopPropagation();
		            e.preventDefault();
		            // 드롭다운 영역 css
		            dropZone.css('background-color','#E3F2FC');
		        });
		        dropZone.on('drop',function(e){
		            e.preventDefault();
		            // 드롭다운 영역 css
		            dropZone.css('background-color','#FFFFFF');
		            
		            var files = e.originalEvent.dataTransfer.files;
		            if(files != null){
		                if(files.length < 1){
		                    alert("업로드 불가");
		                    return;
		                }
		                selectFile(files)
		            }else{
		                alert("ERROR");
		            }
		        });
		    }


		 	// 파일 선택시
		    function selectFile(files){
		        // 다중파일 등록
		        if(files != null){
		            for(var i = 0; i < files.length; i++){
		                // 파일 이름
		                var fileName = files[i].name;
		                var fileNameArr = fileName.split("\.");
		                // 확장자
		                var ext = fileNameArr[fileNameArr.length - 1];
		                // 파일 사이즈(단위 :MB)
		                var fileSize = files[i].size / 1024 / 1024;
		                
		                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
		                    // 확장자 체크
		                    alert("등록 불가 확장자");
		                    break;
		                }else if(fileSize > uploadSize){
		                    // 파일 사이즈 체크
		                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
		                    break;
		                }else{
		                    // 전체 파일 사이즈
		                    totalFileSize += fileSize;
		                    
		                    // 파일 배열에 넣기
		                    fileList[fileIndex] = files[i];
		                    
		                    // 파일 사이즈 배열에 넣기
		                    fileSizeList[fileIndex] = fileSize;
		 
		                    // 업로드 파일 목록 생성
		                    addFileList(fileIndex, fileName, fileSize, files);
		 
		                    // 파일 번호 증가
		                    fileIndex++;
		                }
		            }
		        }else{
		            alert("ERROR");
		        }
		    }
		 	
			// 업로드 파일 목록 생성
		    function addFileList(fIndex, fileName, fileSize, files){
				
				console.log(files);
				
		        var html = "";
		        html += "<tr id='fileTr_" + fIndex + "'>";
		        html += "    <td class='left' >";
		        html +=         fileName + " / " + fileSize + "MB "  + "&nbsp;<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02' style='box-shadow:none; border:1px solid #ececec;'>삭제</a>"
		        html +=	"       <input type='file' name='uploadFile' id='test' multiple='multiple'>"
		        html += "    </td>"
		        html += "</tr>"
		        $('#fileTableTbody').append(html);
		        
		        $("#test").prop("files", files);
		        console.log($("#test"));
		        
		        // input file 숨기기
		        $("#test").css("display", "none");
		    }
		 
		 
		    // 업로드 파일 삭제
		    function deleteFile(fIndex){
		        // 전체 파일 사이즈 수정
		        totalFileSize -= fileSizeList[fIndex];
		        
		        // 파일 배열에서 삭제
		        delete fileList[fIndex];
		        
		        // 파일 사이즈 배열 삭제
		        delete fileSizeList[fIndex];
		        
		        // 업로드 파일 테이블 목록에서 삭제
		        $("#fileTr_" + fIndex).remove();
		    }
		 
		    // 파일 등록
		    function uploadFile(){
		        // 등록할 파일 리스트
		        var uploadFileList = Object.keys(fileList);
		 
		        // 파일이 있는지 체크
		        if(uploadFileList.length == 0){
		            // 파일등록 경고창
		            alert("파일이 없습니다.");
		            return;
		        }
		        
		        // 용량을 500MB를 넘을 경우 업로드 불가
		        if(totalFileSize > maxUploadSize){
		            // 파일 사이즈 초과 경고창
		            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
		            return;
		        }
		            
		        if(confirm("등록 하시겠습니까?")){
		            // 등록할 파일 리스트를 formData로 데이터 입력
		            var form = $('#uploadForm');
		            var formData = new FormData(form);
		            for(var i = 0; i < uploadFileList.length; i++){
		                formData.append('files', fileList[uploadFileList[i]]);
		            }
		            
		            $.ajax({
		                url:"업로드 경로",
		                data:formData,
		                type:'POST',
		                enctype:'multipart/form-data',
		                processData:false,
		                contentType:false,
		                dataType:'json',
		                cache:false,
		                success:function(result){
		                    if(result.data.length > 0){
		                        alert("성공");
		                        location.reload();
		                    }else{
		                        alert("실패");
		                        location.reload();
		                    }
		                }
		            });
		        }
		    }


			
			
			
			
			
			
			
			/*------------------------- 파일 드랍 끝 ---------------------------  */
	</script>
	
	
	
	
<!-- Javascript -->
	
	<script src="resources/assets/scripts/klorofil-common.js"></script>



<!-- HI-WORKS -->
	<script src="resources/js/main.js"></script>
 	<script src="resources/js/common_new.js"></script>
	<script src="resources/js/approval_table.js"></script>
</body>
</html>