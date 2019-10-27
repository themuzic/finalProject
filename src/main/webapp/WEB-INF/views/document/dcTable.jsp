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
	    order: [[3,"desc"],[0,"desc"]]
   	});
   	
   	/* 검색바 */
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
					
					
							<table id="myTable" class="table table-bordered">
								<colgroup>
									<col style="width:15%;">
									<col style="width:40%;">
									<col style="width:10%;">
									<col style="width:15%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
					        <thead>
					            <tr>
						      		<th data-orderable="false" style="text-align:center;">문서 번호</th>
							  		<th data-orderable="false" id="title" style="text-align:center;">제목</th>
							  		<th data-orderable="false" id="writer" width="100" style="text-align:center;">기안자</th>
							  		<th style="text-align:center;" width="150">기안일</th>
							  		<th data-orderable="true" style="text-align:center;" width="100">구분</th>
							  		<th data-orderable="true" style="text-align:center;" width="100">상태</th>
					    		</tr>
					        </thead>
					        <tbody>
					        	<c:forEach items="${docuList}" var="d">
						            <tr> 
						            	<c:if test="${d.docuType eq 'AP'}">
						            		<c:if test="${d.docuNum lt '10' }">
						            			<td>지결-${d.docuCode}-000${d.docuNum}</td>
						            		</c:if>
						            		<c:if test="${d.docuNum ge '10' }">
						            			<td>지결-${d.docuCode}-00${d.docuNum}</td>
						            		</c:if>
						            	</c:if>
						            	<c:if test="${d.docuType eq 'CN'}">
						            		<c:if test="${d.docuNum lt '10' }">
						            			<td>회람-${d.docuCode}-000${d.docuNum}</td>
						            		</c:if>
						            		<c:if test="${d.docuNum ge '10' }">
						            			<td>회람-${d.docuCode}-00${d.docuNum}</td>
						            		</c:if>
						            	</c:if>
						            	<c:if test="${d.docuType eq 'CF'}">
						            		<c:if test="${d.docuNum lt '10' }">
						            			<td>품의-${d.docuCode}-000${d.docuNum}</td>
						            		</c:if>
						            		<c:if test="${d.docuNum ge '10' }">
						            			<td>품의-${d.docuCode}-00${d.docuNum}</td>
						            		</c:if>
						            	</c:if>
						            	<c:if test="${d.docuType eq 'VA'}">
						            		<c:if test="${d.docuNum lt '10' }">
						            			<td>휴가-${d.docuCode}-000${d.docuNum}</td>
						            		</c:if>
						            		<c:if test="${d.docuNum ge '10' }">
						            			<td>휴가-${d.docuCode}-00${d.docuNum}</td>
						            		</c:if>
						            	</c:if>
						            	<c:if test="${d.docuType eq 'RT'}">
						            		<c:if test="${d.docuNum lt '10' }">
						            			<td>퇴사-${d.docuCode}-000${d.docuNum}</td>
						            		</c:if>
						            		<c:if test="${d.docuNum ge '10' }">
						            			<td>퇴사-${d.docuCode}-00${d.docuNum}</td>
						            		</c:if>
						            	</c:if>
						            	<td style="text-align:left;padding-left:30px;padding-right:30px;">
												<c:url value="documentDetailView.do" var="documentDetailView">
													<c:param name="docuNum" value="${d.docuNum}"/>
												</c:url> 
												<a href="${documentDetailView}">${d.title}</a>	<!-- 문서제목 -->
						            	</td>
						            	<td>${d.empName}</td>	<!-- 기안자 -->
						            	<td>${d.docuDate}</td>	<!-- 기안일 -->
						            	<td>${d.dv}</td>	<!-- 구분 -->
						            	<c:choose>
						            		<c:when test="${d.status eq '결재 대기' }">
								            	<td style="color:red;">${d.status}</td>	
						            		</c:when>
						            		<c:otherwise>
						            			<td>${d.status}</td>
						            		</c:otherwise>
						            	</c:choose>
						            </tr>
					        	</c:forEach>
					            
					        </tbody>
					       
					    </table>
					
					
					
					
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
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
	$(function(){
		/* 사이드바의 해당 메뉴 활성화 유지하기 */
		if('${condition}' == '전체'){
			$("#menu1").addClass("in");
			$("#menu1").attr('aria-expanded',true);
			$("#menu1_1").addClass("active");
			$("#menu1_1").attr('aria-expanded',true);
			$("#m1_2").addClass("active");
		}else if('${condition}' == '진행중'){
			$("#menu1").addClass("in");
			$("#menu1").attr('aria-expanded',true);
			$("#menu1_1").addClass("active");
			$("#menu1_1").attr('aria-expanded',true);
			$("#m1_3").addClass("active");
		}else if('${condition}' == '완료'){
			$("#menu1").addClass("in");
			$("#menu1").attr('aria-expanded',true);
			$("#menu1_1").addClass("active");
			$("#menu1_1").attr('aria-expanded',true);
			$("#m1_4").addClass("active");
		}else if('${condition}' == '참조'){
			$("#menu1").addClass("in");
			$("#menu1").attr('aria-expanded',true);
			$("#menu1_1").addClass("active");
			$("#menu1_1").attr('aria-expanded',true);
			$("#m1_5").addClass("active");
		}else if('${condition}' == '내가'){
			$("#menu1").addClass("in");
			$("#menu1").attr('aria-expanded',true);
			$("#menu1_1").addClass("active");
			$("#menu1_1").attr('aria-expanded',true);
			$("#m1_6").addClass("active");
		}
	});
	
	
	</script>

</body>
</html>