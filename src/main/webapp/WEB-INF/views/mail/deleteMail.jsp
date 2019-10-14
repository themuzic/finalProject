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
	        "search": "메일검색: ",
	        "zeroRecords": "일치하는 결과가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": "다음",
	            "previous": "이전"
	        }
	    },
	    
	    
	  		/* columns: [
            {"data": "no"},
            {"data": "title"},
            {"data": "writer"}, 
            {"data": "count"}, 
            {"data": "date"}
            ],  */
	    
	    
   	});
   	
   /*  $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
 
    	$('.dataTables_filter input').unbind().bind('keyup', function () {
        var colIndex = document.querySelector('#select').selectedIndex;
        table.column(colIndex).search(this.value).draw();
        
      	
    }); */
 
   	   
   	$(document).ready(function() {
   	    $('#myTable').DataTable();
   	} );
   	
   	

   });
</script>


<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous">
</script>
<script src="resources/assets/Semantic-UI-CSS-master/semantic.js"></script>

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
	.date{
		text-align:right;
	}
	.person{
		text-align:center;
	}
	.subject{
		padding-left:30px;
	}
	table.table-bordered.dataTable tbody td{
		border:none;
		font-size:15px;
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
					<div class="contentWrap" style="width:1210px;">
					
					<!-- 이 아래부터 내용 작성 -->
					
					
					<table id="myTable" class="table table-bordered" style="border:none;">
					
						<colgroup>
							<col style="width:2%;">
							<col style="width:4%;">
							<col style="width:12%;">
							<col style="width:61%;">
							<col style="width:7%;">
							<col style="width:15%;">
						</colgroup>
					
				        <thead>
				            <tr>
				             	<th data-orderable="false" style="text-align:left;"><i><input type="checkbox" id="chkAll"></i></th>
					      		<th style="text-align:center;"><i class="fas fa-list-ol"><!-- no --></i></th>
						  		<th data-orderable="false" id="writer" style="text-align:center;"><i class="fa fa-user"><!-- writer --></i></th>
						  		<th id="title" width="300" style="text-align:center;"><!-- title --></th>
						  		<th data-orderable="false" style="text-align:center;"><i class="fa fa-eye"><!-- count --></i></th>
						  		<th data-orderable="false" style="text-align:center;"><i class="far fa-clock"><!-- date --></i></th>
				    		</tr>
				        </thead>
				        <tbody class="select_subject">
				            <tr>
				            	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><i class="star icon"></i></td>
				            	<td class="person">설용환</td>
				            	<td style="padding-left:60px;">!!!긴급</td>
				            	<td>첨부파일</td>
				            	<td class="date">19-09-16 09:47</td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">전재광</td>
				            	<td style="padding-left:60px;">급한메일입니다.</td>
				            	<td>첨부파일</td>
				            	<td class="date">19-09-17 10:43</td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">유현규</td>
				            	<td style="padding-left:60px;">당신뭐야!!!</td>
				            	<td>첨부파일</td>
				            	<td class="date">19-09-18 11:53</td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">원영주</td>
				            	<td style="padding-left:60px;">뭐하잔 거죠</td>
				            	<td>첨부파일</td>
				            	<td class="date">19-09-19 14:00</td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">유현규</td>
				            	<td style="padding-left:60px;">보는 즉시 연락해</td>
				            	<td>첨부파일</td>
				            	<td class="date">19-09-19 15:43</td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">원영주</td>
				            	<td style="padding-left:60px;">2019년 신입교육 안내</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">설용환</td>
				            	<td style="padding-left:60px;">개발팀 회식 안내</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">전재광</td>
				            	<td style="padding-left:60px;">2019년 10월 급여안내</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">전재광</td>
				            	<td style="padding-left:60px;">(긴급) 공지사항 확인</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">유현규</td>
				            	<td style="padding-left:60px;">점심 뭐 먹을래요?</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
				             <tr>
				             	<td>
				            		<input type="hidden">
				            		<input type="checkbox">
				            	</td>
				            	<td><img src=""></td>
				            	<td class="person">설용환</td>
				            	<td style="padding-left:60px;">아 빡치네</td>
				            	<td>첨부파일</td>
				            	<td class="date"></td>
				            </tr>
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
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>
	
	<!-- script 작성 -->
	<script>
	
		$(function(){
		
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_4").addClass("active");	
			
			/* 체크박스 전체 선택하기 */
			$("#chkAll").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $(".select_subject input").prop('checked', true);
				else  $(".select_subject input").prop('checked', false);
			});
			
			 $("#myTable").find("td").mouseenter(function(){
			       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).parent().css("background","white");
			 });
			
		});
	
	
	</script>

</body>
</html>