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
					
					<span class="detail_select">
						<a href="" onclick="" style="font-size:16px;">보내기</a>
					</span> &nbsp;
					<span class="earlyView" id="earlyView">
						<a href="#myModal" data-target="#myModal" data-toggle="modal" onclick="" style="font-size:16px;">미리보기</a>
					</span>
					<hr>
					
					<div class="write_input">
						<p style="width:80px; position:absolute;top:4px;">받는 사람</p>
						<div class="txt" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea class="cc_addr autocomplete" name="to_addr" id='to_addr' placeholder="메일 주소를 입력하세요." style="width:100%; height:30px; padding-top:5px; padding-left:3px;"></textarea>
								<a href="" class="addaddr icon" onclick=""></a>
							</div>
							<div class="dropdown" style="display:none">
								<ul class="dropdown-menu address2">
									<li><a href=""><span class="point_color">자동 완성 설정</span></a></li>
								</ul>
							</div>
						</div>
					</div>
									
					<div class="write_input js-approval-input docuTitle">
						<p style="width:80px; position:absolute;top:4px;">참조 
							<span class="add-sendlist">+</span>
						</p>
						<div class="txt title" style="margin-left:80px; position:relative;">
							<div class="position">
								<textarea name="title" id="approval_document_title" style="width:100%; height:30px;"></textarea>
							</div>
					</div>
					
					<div class="write_input" style='display:none' id='divBCC'>
						<p style="width:80px; position:absolute;top:4px;">숨은 참조</p>
						<div class="txt" style="margin-left:80px; margin-top:10px; position:relative;">
							<div class="position">
								<textarea class="cc_addr autocomplete" name="bcc_addr" id='bcc_addr' style="width:100%; height:30px;"></textarea>
								<a href="" class="addaddr icon" onclick=""></a>
							</div>
						</div>
					</div>
					
					<div class="write_input js-approval-input docuTitle">
						<label style="width:80px; position:absolute;top:4px;">제목</label>
						<div class="txt title" style="margin-left:80px; margin-top:10px; position:relative;">
							<div class="position">
								<input type="text" name="title" id="approval_document_title" value="" style="width:100%; height:30px;">
							</div>
						</div>
					</div>
					
					
					<!---------------------- 미리 보기창 모달 -------------------------->
					
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
					
					<!-------------------------------------------------------------->
					
					
	
					<!-------------- 첨부파일존 시작 ---------------------------------------------------------->
					
					<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">	
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
				    </form>
						
					<!-------------- 첨부파일존 끝 ---------------------------------------------------------->
					
					<!-------------- 에디터 -------------------->
					
					<div id="summernote" name="content"></div>
					
					<!---------------------------------------->	
	
					
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
			})
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
		                    addFileList(fileIndex, fileName, fileSize);
		 
		                    // 파일 번호 증가
		                    fileIndex++;
		                }
		            }
		        }else{
		            alert("ERROR");
		        }
		    }
		 
		    // 업로드 파일 목록 생성
		    function addFileList(fIndex, fileName, fileSize){
		        var html = "";
		        html += "<tr id='fileTr_" + fIndex + "'>";
		        html += "    <td class='left' >";
		        html +=         fileName + " / " + fileSize + "MB "  + "&nbsp;<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02' style='box-shadow:none; border:1px solid #ececec;'>삭제</a>"
		        html += "    </td>"
		        html += "</tr>"
		 
		        $('#fileTableTbody').append(html);
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