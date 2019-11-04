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

<!-- summernote 에디터 -->

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
						<a href="#myModal" data-target="#myModal" data-toggle="modal" 
						onclick="preview();" style="font-size:16px; padding-left:10px;">미리보기</a>
					</span>
					<hr>
					<div class="write_input">
						<p style="width:80px; position:absolute;top:4px;">받는 사람</p>
						<div class="txt-firtst" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea class="cc_addr autocomplete" name="mailTo" id='mailTo' placeholder="메일 주소를 입력하세요." 
									style="width:97%; height:30px; padding-top:5px; padding-left:3px; resize:none;">${m.mailFrom}</textarea>
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
						<div class="txt second" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea  id="mailCc" name="mailCc" style="width:97%; height:30px; resize:none;">${m.mailCc}</textarea>
							</div>
					</div>
					
					<div class="write_input js-approval-input docuTitle">
						<label style="width:80px; position:absolute;top:4px;">제목</label>
						<div class="txt title" style="margin-left:80px; margin-top:10px; position:relative;">
							<div class="position">
								<textarea name="mailTitle" id="mailTitle" value="" style="width:97%; height:30px; resize:none;"></textarea>
							</div>
						</div>
					</div>
	
					<!-------------- 첨부파일존 시작 ---------------------------------------------------------->
					
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
						
					<!-------------- 첨부파일존 끝 ---------------------------------------------------------->
					
					<!-------------- 에디터 -------------------->
					
					<textarea id="summernote" name="mailContent">
					</textarea>
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
					      	<div style="padding:3px;">
								<p><b>보낸사람  : </b> 
									<span style="padding-left:7px;"> ${ loginUser.email }</span>
								</p>
								<p style="padding-top:10px;"><b>받는사람  : </b>
									<span id="toMail" style="padding-left:7px;">  ${ m.mailTo }</span>
								</p>
								<p style="padding-top:10px;"><b>참조인  : </b> 
									<span id="ccMail" style="padding-left:7px;">  ${ m.mailCc }</span>
								</p>
								<hr>
								<p style="padding-top:10px;"><b>제목  : </b> 
									<span id="titleMail" style="padding-left:7px;">  ${ m.mailTitle }</span>
								</p>
								<p style="padding-top:10px;"><b>내용  : </b> 
									<span id="contentMail">${ m.mailContent }</span>
								</p>
								<hr>
								<p style="padding-top:10px;"><b>첨부파일  : </b> 
									<span id="loadFile" style="padding-left:7px;"> ${ m.originalFileName }</span>
								</p>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					
						<!---------- 결제선 주소록 시작 ------------------------>
						
						<div id="approval_address_layer" class="booking_layer_div layer_box hide typeD">
						
						<div class="layer_box large address line " id="div_approval_view_one" style="margin-left: -400px; margin-top: -311px; display: block;width: 770px;">
							<div class="title_layer text_variables" id="titleApprovalLineSetting">주소록</div>
							
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
															<strong onclick="" id="subOffice" class="selectedNode">DEVELOFFICE <span style="font-weight:normal; color:silver; font-size:8pt">(${empSize})</span></strong>
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
									
								</div>
								<div class="fr mgb20">
									<div class="first-line four-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">받는 사람 <span class="point_color bold" id="sp_selectApprovalFirstLine">0</span></span>
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
									</div>
									
									<div class="three-line after">
										<div class="fl">
											<div class="to-item after">
												<span class="title">참조인 <span class="point_color bold" id="sp_selectApprovalThirdLine">0</span></span>
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
									</div>
									
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
		/* 에디터 */
		$(function(){
			$("#summernote").summernote({
				tabsize: 2,
		        height: 300,
		        lang: 'ko-KR'
			});
			$('.dropdown-toggle').dropdown();
			
			$("#menu2_1").removeClass("collapsed");
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_1").addClass("active");	
			
			$(".add-sendlist").click(function(){
				$("#divBCC").css("display", "block");
			});
			
			$("#addressSelect").click(function(){
				$("#rightList").html("");
				$("#selectApprovalFirstLine").html("");
				$("#selectApprovalThirdLine").html("");
				$("#sp_selectApprovalFirstLine").html("0");
				$("#sp_selectApprovalThirdLine").html("0");
				$("#approval_address_layer").addClass("show");
			});
			
			$("#select").click(function(){
				//$("#approval_address_layer").addClass("hide");
				$("#rightList").html("");
				$("#selectApprovalFirstLine").html("");
				$("#selectApprovalThirdLine").html("");
				$("#sp_selectApprovalFirstLine").html("0");
				$("#sp_selectApprovalThirdLine").html("0");
				$("#approval_address_layer").addClass("show");			
			});
		});
		
		// 메일 미리보기
		function preview(){
			var toMail = $("#mailTo").val();
			var ccMail = $("#mailCc").val();
			var titleMail = $("#mailTitle").val();
			var contentMail = $("#summernote").val();
			var loadFile = $("#test").val();
			
			$("#toMail").html(toMail);
			$("#ccMail").html(ccMail);
			$("#titleMail").html(titleMail);
			$("#contentMail").html(contentMail);
			$("#loadFile").html(loadFile);
			
			
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
			
			
			
		/* 결재선 창 기능 시작 */
		
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
				
				$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'" name="' + emp.email + '">').text(emp.empName+" "+emp.jobName);
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
					$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'" name="' + emp.email + '">').text(emp.empName+" "+emp.jobName);
					$("#rightList").append($op);
				}
			});
		});
		
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
					sortArr.sort(function(a, b){
						return a.jobCode - b.jobCode;
					});
					
				}
				
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
				
				$.each(sortArr, function(index, emp){
					if(conditionName == ""){	//파란색으로 선택된 부서명이 없으면 => 전체 직원 선택이면
						$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'" name="' + emp.email + '">').text(emp.empName+" "+emp.jobName);
						$("#rightList").append($op);
					} else {	// 파란색으로 선택된 부서명이 있으면
						if(conditionName == emp.deptName){
							$op = $('<option value="'+emp.empId+'" class="'+emp.jobCode+'" title="'+emp.deptName+'" name="' + emp.email + '">').text(emp.empName+" "+emp.jobName);
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
			var rf;
			
			if($(this).hasClass('js-btn-approval-first-line')){
				approval = $("#selectApprovalFirstLine");
				num = $("#sp_selectApprovalFirstLine");
				rf = $("#selectApprovalThirdLine");
			} else if($(this).hasClass('js-btn-approval-third-line')){
				approval = $("#selectApprovalThirdLine");
				num = $("#sp_selectApprovalThirdLine");
				rf = $("#selectApprovalFirstLine");
			}
			
			$.each(selectedArr, function(index, value){
				
				if(approval.children('option').length > 0){	// 비어있지 않을때
					var flag = 0;
					
					$.each(approval.children('option'), function(i, op){
						if(value.value == op.value){
							flag = 1;
						}
					});
					
					if(rf.children('option').length > 0){	// 비어있지 않을때
						$.each(rf.children('option'), function(i, op2){
							if(value.value == op2.value){
								flag = 1;
							}
						});
					}
					/* 검사 하고 나와서 */
					if(flag == 0){
						var $op = $('<option value="'+value.value+'" name="' + value.getAttribute('name') + '"  disabled>').text(value.text+'('+value.title+')');
						approval.append($op);
					}
					
				} else{	// 비어있을때
					var flag = 0;
				
					if(rf.children('option').length > 0){	// 비어있지 않을때
						$.each(rf.children('option'), function(i, op2){
							if(value.value == op2.value){
								flag = 1;
							}
						});
					}
					/* 검사 하고 나와서 */
					if(flag == 0){
						var $op = $('<option value="'+value.value+'" name="' + value.getAttribute('name') + '"disabled>').text(value.text+'('+value.title+')');
						approval.append($op);
					}
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
			
			var approvalList = $("#selectApprovalFirstLine").children('option')[0];		//결제라인
			var referList = $("#selectApprovalThirdLine").children('option')[0];		//참조라인

			$("#mailTo").val(approvalList.getAttribute('name'));
			
			if(referList != undefined){
				$("#mailCc").val(referList.getAttribute('name'));
			}
			
			$(this).next().click();
		});
		
		/* 결재선 창 기능 끝 */
				
	
	</script>

</body>
</html>