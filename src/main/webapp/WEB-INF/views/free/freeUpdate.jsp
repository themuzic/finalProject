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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<!-- 부트스트랩 이미지 -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 


<style>
	.contentWrap{
		float:left;
		width:100%;
		background: white;
		padding-top:30px;
		padding-bottom:30px;
		padding-left:50px;
		padding-right:50px;
		font-size:14px;
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
	
	
	#update-write{
		width:100%;
		height:40px;
		background-color:#3287B2;
		color:white;
		font-size:20px;
		padding:7px 20px;
		
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
					
					<div id="update-write">
						수정 사항 작성
					</div>
					<hr>
					
					
					<form action="freeUpdate.do" class="ui form uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
					  <div class="field">
					    <label style="font-size:15px;">제목</label>
					    <input type="text" name="frTitle" placeholder="제목" value="${f.frTitle}">
					  </div>
					  <div class="field">
					    <label style="font-size:15px;">내용</label>
					    <textarea id="summernote" name="frContent">${f.frContent}</textarea>
					  </div>
					  <input type="hidden" name="frId" value="${f.frId }">
					  <input type="hidden" name="frWriter" value="${loginUser.empId}">
					  <input type="hidden" name="originalFileName" value="${f.originalFileName }">
					  <input type="hidden" name="renameFileName" value="${f.renameFileName }"> 
					  <div class="filezone">
					        <table class="table" width="100%" style="border: 2px dashed #e4e4e4;height: 50px;">
					            <tbody id="fileTableTbody">
					                <tr>
					                    <td id="dropZone" style="padding: 15px;text-align: center;">
					                        파일을 드래그 하세요
					                    </td>
					                </tr>
					                <tr id="fileTr_0">    
					                	<td class="left">
					                		<c:if test="${!empty f.originalFileName }">
					                				${f.originalFileName} &nbsp;
					                			
					                				<a href="#" onclick='removeTR();' class="btn small bg_02" style="box-shadow:none; border:1px solid #ececec;">삭제</a>       
					                				<input type='file' name='frReloadFile' class='test1' style="display:none">
					                		</c:if>
					                	</td>
					                </tr>
					            </tbody>
					        </table>
					    </div>
					  
					  
					  <button class="ui secondary button" type="submit" style="float:right;font-size:15px;">
						  수정
					  </button>
					  <button type="button" onclick="location.href='listFree.do';" class="ui button" style="float:left;font-size:15px;">
						  취소
					  </button>
		
					</form>
					
			
				    
				    
					
					
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
	
	<!-- script 작성 -->
	<script>
		
			
			$(function(){
				$("#summernote").summernote({
					tabsize: 2,
			        height: 300,
			        lang: 'ko-KR'
				});
				$('.dropdown-toggle').dropdown();
				
				$("#menu6").addClass("in");
				$("#menu6").attr('aria-expanded',true);
				$("#menu6_1").addClass("active");
				$("#menu6_1").attr('aria-expanded',true);
				$("#m6_3").addClass("active");	
				
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
	              html +=         fileName + " / " + fileSize + "MB "  + "&nbsp;<a href='#'onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02' style='box-shadow:none; border:1px solid #ececec;'>삭제</a>"
	              html +=   "       <input type='file' name='frReloadFile' class='test1'>"
	              html += "    </td>"
	              html += "</tr>"
	              $('#fileTableTbody').append(html);
	              
	              $(".test1").prop("files", files);
	              
	              
	              // input file 숨기기
	              $(".test1").css("display", "none");
	          }
	      
	       
	          // 업로드 파일 삭제
	          function deleteFile(fIndex){
	        	  
	        	  console.log('들어옴');
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
			
			
			function removeTR(){
				$("#fileTr_0").remove();
	         }
			
	
	</script>
	
	

	
</body>
</html>