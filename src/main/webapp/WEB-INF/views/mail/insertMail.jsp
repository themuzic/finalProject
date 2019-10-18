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

<!-- 부트스트랩 이미지 -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 


<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	.contentWrap{
		float:left;
		width:80%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
	}
	h4 {
	    font-size: 14px;
	    color: #333;
	    font-weight: 700;
	}
	.add-sendlist{
		cursor:pointer;
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
					<div class="contentWrap">
					
					<!-- 이 아래부터 내용 작성 -->
					
				<form action="mailSending.do" id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
					<span class="detail_select">
						<input type="hidden" name="empId" value="${ loginUser.empId }">
						<input type="hidden" name="mailFrom" value="${ loginUser.email }">
						<input type="submit" value="보내기" style="font-size:14px; width:82px; height:37px;" class="ui primary button">
					</span> &nbsp;
					<span class="earlyView" id="earlyView">
						<a href="#myModal" data-target="#myModal" data-toggle="modal" style="font-size:16px; padding-left:10px;">미리보기</a>
					</span>
					<hr>
					<div class="write_input">
						<p style="width:80px; position:absolute;top:4px;">받는 사람</p>
						<div class="txt" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea class="cc_addr autocomplete" name="mailTo" id='to_addr' placeholder="메일 주소를 입력하세요." 
									style="width:97%; height:30px; padding-top:5px; padding-left:3px;"></textarea>
								<button type="button" class="" id="addressSelect" onclick="" style="display:inline-block;padding:0; font-size:20px">
									<i class="fas fa-plus" style="font-size:15px; padding-left:3px;"></i>
								</button>
							</div>
							<div class="dropdown" style="display:none">
								<ul class="dropdown-menu address2">
									<li><a href=""><span class="point_color">자동 완성 설정</span></a></li>
								</ul>
							</div>
						</div>
					</div>
									
					<div class="write_input js-approval-input docuTitle">
						<p style="width:80px; position:absolute;top:4px;">참조 </p>
						<div class="txt title" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea  id="approval_document_title" style="width:97%; height:30px;"></textarea>
								<button type="button" class="" id="select" onclick="" style="display:inline-block;padding:0; font-size:20px">
									<i class="fas fa-plus" style="font-size:15px; padding-left:3px;"></i>
								</button>
							</div>
					</div>
					
					<div class="write_input js-approval-input docuTitle">
						<label style="width:80px; position:absolute;top:4px;">제목</label>
						<div class="txt title" style="margin-left:80px; margin-top:10px; position:relative;">
							<div class="position">
								<textarea name="mailTitle" id="approval_document_title" value="" style="width:97%; height:30px;"></textarea>
							</div>
						</div>
					</div>
	
					<!-------------- 첨부파일존 시작 ---------------------------------------------------------->
					
<!-- 					<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">	 -->
						<div class="filezone">
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
<!-- 				    </form> -->
						
					<!-------------- 첨부파일존 끝 ---------------------------------------------------------->
					
					<!-------------- 에디터 -------------------->
					
					<textarea id="summernote" name="mailContent"></textarea>
				</form>
					
					<!---------------------------------------->	
					
					<!---------------------- 미리보기창 모달 -------------------------->
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel" style="color:#3287B2; font-size:16px;">메일 미리보기</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" style="height:450px; width:600px; padding-left:20px;">
					      <br>
							<p>보낸사람  : 	</p><br>
							<p>받는사람  : 	</p><br>
							<p>참조  :		</p><br>
							<p>숨은참조:		</p><br>
							<hr>
							<p>제목  : 		</p><br>
							<hr>
							<p>내용  :	 	</p><br>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					
					<!-- 결제선 주소록 테스트 -->
						
						<div id="approval_address_layer" class="booking_layer_div layer_box hide typeD">
						
						<div class="layer_box large address line " id="div_approval_view_one" style="margin-left: -400px; margin-top: -311px; display: block;width: 800px;">
							<div class="title_layer text_variables" id="titleApprovalLineSetting">결재선 설정</div>
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
						
							<div class="after line-list-wrap">
								<div class="fl">
									<div class="after">
										<div class="fl" id="searchMessage" style="display: none;"><span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span></div>
										<div class="fr">
											<a class="icon order" href="javascript:void(0);" title="정렬" id="anchorApprovalUserOrder"></a>
											<ul class="dropdown-menu hide" id="orderApprovalDropdown" style="width: 70px; top: 124px; left: 314px;">
												<li><a href="javascript:void(0);" class="js-approval-node-order" onclick="addressbook.click_orderBtn('name', 'ASC');$j('#orderApprovalDropdown').toggleClass('show');">이름순</a></li>
												<li><a href="javascript:void(0);" class="js-approval-node-order" onclick="addressbook.click_orderBtn('position', 'DESC');$j('#orderApprovalDropdown').toggleClass('show');">직급순</a></li>
												<li><a href="javascript:void(0);" class="js-approval-node-order" onclick="addressbook.click_orderBtn('priority', '');$j('#orderApprovalDropdown').toggleClass('show');">설정순</a></li>
											</ul>
										</div>
									</div>
									<div class="after">
										<div class="category-list" style="height: 397px;width: 205px;">
											<select id="leftList" size="19" frameborder="0" style="display:none;" onclick="addressbook.click_leftList(this)">
																	</select>
											<div id="treeDiv" style="white-space: nowrap;float: none;" class="treeDiv OrgTree"><ul><li id="addressTreeNode_45295" class="last"><div class="Container"><img onclick="addressbook.ToggleTree(this);" src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_m.gif" class="plus"><strong onclick="addressbook.selectNode(this);" class="selectedNode">cocoaTest <span style="font-weight:normal; color:silver; font-size:8pt">(6)</span></strong></div><ul style=""><li id="addressTreeNode_46498"><div class="Container"><strong onclick="addressbook.selectNode(this);">경영지원팀 <span style="font-weight:normal; color:silver; font-size:8pt">(1)</span></strong></div></li><li id="addressTreeNode_46499"><div class="Container"><strong onclick="addressbook.selectNode(this);">개발팀 <span style="font-weight:normal; color:silver; font-size:8pt">(1)</span></strong></div></li><li id="addressTreeNode_46500"><div class="Container"><strong onclick="addressbook.selectNode(this);">서비스팀 <span style="font-weight:normal; color:silver; font-size:8pt">(2)</span></strong></div></li><li id="addressTreeNode_46501" class="last"><div class="Container"><strong onclick="addressbook.selectNode(this);">영업팀 <span style="font-weight:normal; color:silver; font-size:8pt">(1)</span></strong></div></li></ul></li></ul></div>
											<div id="leftProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
										</div>
										<div class="name-list" style="width: auto;">
											<select multiple="multiple" id="rightList" style="">
																	<option value="56672" title="sfsfy1 (개발팀)" node_id="46499">sfsfy1 (개발팀)</option><option value="56675" title="김상윤 (서비스팀)" node_id="46500">김상윤 (서비스팀)</option><option value="56674" title="김성은 (영업팀)" node_id="46501">김성은 (영업팀)</option><option value="57462" title="원영주 (경영지원팀)" node_id="46498">원영주 (경영지원팀)</option><option value="56673" title="유현규 (서비스팀)" node_id="46500">유현규 (서비스팀)</option><option value="57511" title="전재광 (cocoaTest)" node_id="45295">전재광 (cocoaTest)</option></select>
						
											<div class="choice-area" style="width: 203px;font-size: 12px;padding: 5px;">
																		<a href="javascript:void(0);" class="text_variables fl mgr_20" onclick="addressbook.click_rightSelect('select');">전체</a> <a href="javascript:void(0);" class="text_variables mgr_20" onclick="addressbook.click_rightSelect('deselect');">선택안함</a>
												<span id="pagingP"></span>
											</div>
											<div id="rightProgressDiv" style="display: none;" class="progressDiv"><img src="resources/images/progress_big.gif"></div>
										</div>
									</div>
						
								</div>
								<div class="add-del-btn with-fourline">
									<div class="top" style="margin-top: 70px;">
										<a href="javascript:void(0);" class="icon btn-add js-btn-approval-first-line" onclick="Approval.addUser('selectApprovalFirstLine');"><span class="blind"></span></a>
										<a href="javascript:void(0);" class="icon btn-del js-btn-approval-first-line" onclick="Approval.deleteUser('selectApprovalFirstLine');"><span class="blind"></span></a>
									</div>
									<div class="middle" style="margin-top: 50px;">
										<a href="javascript:void(0);" class="icon btn-add js-btn-approval-second-line" onclick="Approval.addUser('selectApprovalSecondLine');"><span class="blind"></span></a>
										<a href="javascript:void(0);" class="icon btn-del js-btn-approval-second-line" onclick="Approval.deleteUser('selectApprovalSecondLine');"><span class="blind"></span></a>
									</div>
									<div class="bottom" style="margin-top: 34px;">
										<a href="javascript:void(0);" class="icon btn-add js-btn-approval-third-line" onclick="Approval.addUser('selectApprovalThirdLine');"><span class="blind"></span></a>
										<a href="javascript:void(0);" class="icon btn-del js-btn-approval-third-line" onclick="Approval.deleteUser('selectApprovalThirdLine');"><span class="blind"></span></a>
									</div>
									<div class="last" style="margin-top: 25px;">
										<a href="javascript:void(0);" class="icon btn-add js-btn-approval-fourth-line" onclick="Approval.addUser('selectApprovalFourthLine');"><span class="blind"></span></a>
										<a href="javascript:void(0);" class="icon btn-del js-btn-approval-fourth-line" onclick="Approval.deleteUser('selectApprovalFourthLine');"><span class="blind"></span></a>
									</div>
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
												<button type="button" class="btn_variables" onclick="Approval.selectMultiNodeUser();">확인</button> <button type="button" onclick="$j('#layerMultiNode').hide();">취소</button>
											</div>
										</div>
									</div>
									<div class="first-line four-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">결재 <span class="point_color bold" id="sp_selectApprovalFirstLine">1</span></span>
												<div class="updown-wrap first js-move-approval-first-line" style="width: 55px;">
													<span class="blind icon down" onclick="Approval.downUser('selectApprovalFirstLine');"></span>
													<span class="blind icon up" onclick="Approval.upUser('selectApprovalFirstLine');"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalFirstLine">
												<option value="57511" node_id="45295" title="전재광 (cocoaTest)" disabled="" edit="N" old_new="old" enable_delete="Y">전재광 (cocoaTest)</option></select>
											</div>
						
										</div>
										<div class="spr-approval approval-direction">
											결<br>
											재<br>
											방<br>
											향<br>
										</div>
									</div>
									<div class="three-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">합의 <span class="point_color bold" id="sp_selectApprovalSecondLine">0</span></span>
												<div class="updown-wrap first js-move-approval-second-line" style="width: 55px;">
													<span class="blind icon down" onclick="Approval.downUser('selectApprovalSecondLine');"></span>
													<span class="blind icon up" onclick="Approval.upUser('selectApprovalSecondLine');"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalSecondLine">
												</select>
											</div>
										</div>
									</div>
									<div class="three-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">재무합의 <span class="point_color bold" id="sp_selectApprovalThirdLine">0</span></span>
												<div class="updown-wrap first js-move-approval-third-line" style="width: 55px;">
													<span class="blind icon down" onclick="Approval.downUser('selectApprovalThirdLine');"></span>
													<span class="blind icon up" onclick="Approval.upUser('selectApprovalThirdLine');"></span>
												</div>
											</div>
											<div class="list">
												<select multiple="multiple" id="selectApprovalThirdLine">
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
									<div class="last-line two-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">참조 <span class="point_color bold" id="sp_selectApprovalFourthLine">0</span></span>
												<div class="updown-wrap first js-move-approval-fourth-line" style="width: 55px;">
													<span class="blind icon down" onclick="Approval.downUser('selectApprovalFourthLine');"></span>
													<span class="blind icon up" onclick="Approval.upUser('selectApprovalFourthLine');"></span>
												</div>
											</div>
											<div class="list" style="height: 54px;>
												<select multiple="multiple" id="selectApprovalFourthLine"">
												</select>
										   </div>
										</div>
						
									</div>
								</div>
							</div>
							<div class="layer_button">
								<button type="button" class="btn_variables" onclick="addressbook.btnApply();">확인</button> <button type="button" class="closeBtn" onclick="addressbook.closeAddressbook();">취소</button>
							</div>
							<a href="javascript:void(0);" class="icon btn_closelayer closeBtn" onclick="addressbook.closeAddressbook();" title="레이어 닫기"></a>
						</div>
						
						
						<div class="layer_back" style="position: fixed;width: 100%;height: 100%;z-index: 1000;background-color: rgb(0, 0, 0);opacity: 0.3;top: 0px;left: 0px;margin: 0px;padding: 0px;"></div>
					</div>

						<!-- 결제선 주소록 테스트 -->
					
					
					
					
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
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
		
		$(function(){
			$("#summernote").summernote({
				tabsize: 2,
		        height: 300,
		        lang: 'ko-KR'
			});
			
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_1").addClass("active");	
			
			$(".add-sendlist").click(function(){
				$("#divBCC").css("display", "block");
			});
			
			$("#addressSelect").click(function(){
				$("#approval_address_layer").addClass("show");
			});
			
			$("#select").click(function(){
				$("#approval_address_layer").addClass("hide");
				$("#approval_address_layer").addClass("show");			
			});
			
			$("#hideSelect").click(function(){
				$("#approval_address_layer").addClass("hide");
				$("#approval_address_layer").addClass("show");				
			});
		});
		
		
	
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
		                /*
		               inFile = "<input type='file' name='uploadFile'>";
		                inFile.files[0]=e.originalEvent.dataTransfer.files;
		                //inFile = $("<input type='file' name='uploadFile'>").prop('files',e.originalEvent.dataTransfer.files);
			            console.log(inFile);
			            */
			            
		                selectFile(files);
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
		        var html = "";
		        html += "<tr id='fileTr_" + fIndex + "'>";
		        html += "    <td class='left' >";
		        html +=         fileName + " / " + fileSize + "MB "  + "&nbsp;<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02' style='box-shadow:none; border:1px solid #ececec;'>삭제</a>"
		        html +=	"       <input type='file' name='uploadFile' id='test'>"
		        //html += inFile
		        html += "    </td>"
		        html += "</tr>"
		        $('#fileTableTbody').append(html);
		        
		        $("#test").prop("files", files);
		        console.log($("#test"));
		        
		        // input file 숨기기
		        $("#test").css("display", "block");
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

</body>
</html>