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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="resources/assets/Semantic-UI-CSS-master/semantic.css"> 
<!-- dataTable  -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
   jQuery(function($){
   	$("#myTable").DataTable({
   		responsive:true,
   		info: false,
   		 "language": {
	        "emptyTable": "글이 없습니다.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "search": "검색: ",
	        "searchPlaceholder" :"키워드를 입력하세요.",
	        "zeroRecords": "일치하는 결과가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": "다음",
	            "previous": "이전"
	        },
	    },
	    order :[0,"desc"],
	    
	    
   	});
   	
    $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
    	if(indexInArray == 1 || indexInArray == 2){
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    	}
    });
    
    $('.dataTables_filter input').unbind().bind('keyup', function () {
    	var table = $('#myTable').DataTable();
        var colIndex = document.querySelector('#select').selectedIndex;
	    table.column(colIndex+1).search(this.value).draw();
    });  
 
  
   	
   	

   });
</script>


<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous">
</script>
<script src="resources/assets/Semantic-UI-CSS-master/semantic.js"></script>

<style>
	#free_header{
		width:100%;
		height:40px;
		background-color:#3287B2;
		color:white;
		font-size:20px;
		padding:7px 20px;
	}
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
	
	#myTable > tbody > tr{
		text-align:center;
	}
	
	.pagination {
    float: left;
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
							<div id="free_header">공지사항</div>
							<hr>
					
							<table id="myTable" class="table table-bordered">
					        <thead>
					           
					            <tr>
						      		<th style="text-align:center;" width="50"><i class="fas fa-list-ol"></i></th>
							  		<th id="title" style="text-align:center;" >제목</th>
							  		<th data-orderable="false" id="writer" width="60" style="text-align:center;">작성자</th>
							  		<th data-orderable="false"	width="60" style="text-align:center">첨부파일</th>
							  		<th style="text-align:center;" width="50">조회수</th>
							  		<th data-orderable="false" style="text-align:center;" width="100">작성일</th>
					    		</tr>
					        </thead>
					        <tbody>
					        	<c:forEach items="${list}" var="n">
						            <tr> 
						            	<td>${n.noId}</td>
						            	<td style="text-align:left">
						            		
						            		<c:if test="${empty loginUser}">
												${n.noTitle} 
											</c:if> 
											<c:if test="${!empty loginUser}">
												<c:url value="noticeDetail.do" var="nodetail">
													<c:param name="noId" value="${n.noId}"/>
												</c:url> 
												<a href="${nodetail}">${n.noTitle}</a>						
											</c:if> 
						            	</td>
						            	<td>${n.empName}</td>
						            	<td>
						            		<c:if test="${!empty n.originalFileName }">
												<i class="far fa-file-alt"></i>           
											</c:if>
						            	</td>
						            	<td>${n.noCount}</td>
						            	<td>${f.noCreateDate.split(" ")[0]}</td>
						            </tr>
					        	</c:forEach>
					            
					        </tbody>
					       
					    </table>

						<c:if test="${loginUser.deptCode eq 2 || loginUser.deptCode eq 3 || loginUser.deptCode eq 4}">				
						    <button onclick="location.href='insertNoticeView.do';" class="btn btn-primary" style="float:right;">글쓰기</button>
						</c:if>
						
						
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
	
	

	<script>
	
	$(function(){
		
		$("#myTable td").mouseenter(function(){
			$(this).parent().css({"background" : "#f9f9f9", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css("background", "white");
			
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
	
			
		});
		
	});
	
	$(function(){
		
		/* 사이드바의 해당 메뉴 활성화 유지하기 */
		$("#menu6_1").removeClass("collapsed");
		$("#menu6").addClass("in");
		$("#menu6").attr('aria-expanded',true);
		$("#menu6_1").addClass("active");
		$("#menu6_1").attr('aria-expanded',true);
		$("#m6_1").addClass("active");	
	});
	
	</script>

</body>
</html>