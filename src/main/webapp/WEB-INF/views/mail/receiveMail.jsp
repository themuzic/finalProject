<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Insert title here</title>
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
	#ul{
    	margin:8px;
    	line-height:2;
    }
    .li{
    	width:140px;
    }
    .dropscroll-menu1 {
	    position: absolute;
	    float: left;
	    font-size: 14px;
	    background-color: #fff;
	    border: 1px solid #999;
	    z-index: 130;
    }
    .dropscroll-menu2 {
	    position: absolute;
	    float: left;
	    font-size: 14px;
	    background-color: #fff;
	    border: 1px solid #999;
	    z-index: 130;
    }
    .icon.file {
	    display: block;
	    width: 9px;
	    height: 14px;
	    background-position: -210px -15px;
	    margin-top: 3px;
	    cursor: pointer;
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

		<fieldset>
			<div id="searchArea" align="right">
				<form action="search2.do">
					<select id="searchCondition" name="condition" style="height:32px; border:1px solid lightgray">
					    <option>------</option>
					    <option value="writer">이메일</option>
					    <option value="title">제목</option>
					    <option value="content">내용</option>
					</select>
					<div class="ui input">
						<input type="search" name="search" value="${ search }" placeholder="Search..." style="height:32px;">
						<i class="circular search link"></i>
					</div>	         
					<button type="submit" onclick="return validate();" style="color:#3287B2">검색하기</button>
				</form>
	       </div>
	       
	       <script>
		       function validate(){
		           if($("option:selected").val() == "------"){
// 		              alert("검색 조건을 체크해주세요");
		              alertify.alert("", "검색 조건을 체크해주세요");
		           return false;
		           }
		        }
	       </script>
	       
	        <div id='chkMenu' class="chkMenu hide" name="chkMenu" style="font-size:15px; display:block">
	            <span class="detail_select" id="m_list_checked_menu_delete">
					<a href="javascript:void(0)" onclick="deleteM();">삭제</a>&nbsp;&nbsp;
	            </span>
	            <span class="detail_select">
	                <a href="javascript:void(0)" onclick="deleteAll();">완전삭제</a>&nbsp;&nbsp;
	            </span>
            </div> 
              
	 	</fieldset>
	 	
			
		<table class="ui selectable celled table">
			<colgroup>
				<col style="width:2%;">
				<col style="width:4%;">
				<col style="width:17%;">
				<col style="width:60%;">
				<col style="width:8%;">
				<col style="width:15%;">
			</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="chkAll" class="chkBox" name="chkAll" value="${ m.mailNum }"></th>
						<th><i class="far fa-star"></i></th>
						<th>보낸사람</th>
						<th>메일제목</th>
						<th class="aa">첨부파일</th>
						<th class="aa">날짜</th>
					</tr>
				</thead>
				<tbody class="select_subject">
				<c:forEach items="${ list }" var="m">
					<c:if test="${ m.mailTo == loginUser.email }">
							<tr>
								<td>
									<input type="checkbox" id="check" name="check" class="check chkBox" value="${ m.mailNum }">
									<input type="hidden" value="${ m.mailNum }">
									<input type="hidden" value="${ m.mailCc }">
								</td>
								<td>
									<div class="star">
									<c:if test="${ m.mailImportant == 0 }">
										<i class="far fa-star"></i>
										<i class="fas fa-star" style="color:yellow; display:none;"></i>
									</c:if>
									<c:if test="${ m.mailImportant == 1 }">
										<i class="far fa-star" style="display:none;"></i>
										<i class="fas fa-star" style="color:yellow; display:inline-block;"></i>
									</c:if>
									</div>
								</td>
								<td class="mName">${ m.mailFrom }</td>
								<td class="mTitle">
									<c:if test="${ empty loginUser }">
										${ m.mailTitle }
									</c:if>
									<c:if test="${ !empty loginUser }">
										<c:url value="receiveDetail.do" var="mdetail">
											<c:param name="mailNum" value="${ m.mailNum }"/>
										</c:url>
										<a href="${ mdetail }" style="color:gray;">${ m.mailTitle }</a>
									</c:if>
								</td>
								
								<td align="right">
									<c:if test="${ !empty m.renameFileName }">
										<div class="icon file" style="width:20px; height:20px;">
										</div>
									</c:if>
									<c:if test="${ empty m.renameFileName }">
										<div>
										</div>
									</c:if>
								</td>
								<td class="mDate aa">${ m.mailDate }</td>
							</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<div id="pagingArea" align="center">
 			<!-- [이전] -->
			<c:if test="${ pi.currentPage == 1 }">
				이전&nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:if test="${ !empty m }">
					<c:url var="mlistBack" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
					<c:url var="mlistBack" value="receiveMail.do">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
					</c:url>
				</c:if>
				<a href="${ mlistBack }">이전</a>
			 </c:if>
         
	         <!-- [번호들] -->
	         <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            <c:if test="${ p eq pi.currentPage }">
	               <font color="#3287B2" size="3">${ p }</font>
	            </c:if>
	            <c:if test="${ p ne pi.currentPage }">
	               <c:if test="${ !empty m }"> <!-- 검색결과 있으면 -->
	                  <c:url var="mlistPage" value="search2.do">
	                     <c:param name="currentPage" value="${ p }"/>
	                     <c:param name="condition" value="${ condition }"/>
	                     <c:param name="search" value="${ search }"/>
	                     <c:param name="mailFrom" value="${ m.mailFrom }"/>
						 <c:param name="mailTo" value="${ m.mailTo }"/>
	                  </c:url>
	               </c:if>
	               <c:if test="${ empty m }"> <!-- 검색 결과 없으면 -->
		               <c:url var="mlistPage" value="receiveMail.do">
		                  <c:param name="currentPage" value="${ p }"/>
		               </c:url>                  
	               </c:if>
	               <a href="${ mlistPage }">${ p }</a>
	            </c:if>
	         </c:forEach>
         
        	<!-- [다음] -->
			<c:if test="${ pi.currentPage == pi.maxPage }">
				&nbsp;다음
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:if test="${ !empty m }">
					<c:url var="mlistNext" value="search2.do">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						<c:param name="condition" value="${ condition }"/>
						<c:param name="search" value="${ search }"/>
						<c:param name="mailFrom" value="${ m.mailFrom }"/>
						<c:param name="mailTo" value="${ m.mailTo }"/>
					</c:url>
				</c:if>
				<c:if test="${ empty m }">
					<c:url var="mlistNext" value="receiveMail.do">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
				</c:if>
				<a href="${ mlistNext }">다음</a>
			</c:if>
		</div>
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
			
			/* 호버 기능 */
		    $("#listArea").find("td").mouseenter(function(){
		       $(this).parent().css({"background":"#ddd","cursor":"pointer"});
		    }).mouseout(function(){
		       $(this).parent().css("background","white");
		    });
			
			/* 사이드바의 해당 메뉴 활성화 유지하기 */
			$("#menu2").addClass("in");
			$("#menu2").attr('aria-expanded',true);
			$("#menu2_1").addClass("active");
			$("#menu2_1").attr('aria-expanded',true);
			$("#m2_2").addClass("active");	
			
			/* 체크박스 선택하기 */
			$("#chkAll").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $(".select_subject input").prop('checked', true);
				else $(".select_subject input").prop('checked', false);
				
				$(".chkMenu").addClass("show");
				$("#lookAll").addClass("hide");
				$("#lookAll").css("display","none");
				$(".chkMenu").css("display", "block");
			});
			
			/* 체크박스 하나라도 선택되면 메뉴바 변경 */
			$(".chkBox").change(function() {			
				var checked = $(this).prop('checked');
				if(checked)
			        $(".chkMenu").addClass("show"); 
					$(".chkMenu").css("display","block");
					$("#lookAll").addClass("hide");
			});
			
			
// 			if($(".chkBox").is(":checked") == false) {
// 				  $("#lookAll").addClass("show");
// 				  $(".chkMenu").addClass("hide");
// 				  $(".chkMenu").css("display","none");
// 				  $("#lookAll").css("display","block");
// 				}
			
			if($(".chkBox").is(":checked") == true) {
				  $("#lookAll").addClass("hide");
				  $(".chkMenu").addClass("show");
				  $(".chkMenu").css("display","block");
				  $("#lookAll").css("display","none");
				}

			
			/* 호버 기능 */
			$(".dropscroll-menu1").find("li").mouseenter(function(){
			       $(this).css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).css("background","white");
			});
			
			$(".dropscroll-menu2").find("li").mouseenter(function(){
			       $(this).css({"background":"#ddd","cursor":"pointer"});
			    }).mouseout(function(){
			       $(this).css("background","white");
			});
			
			/* 드롭바 나타내기 */
			$("#lookAll").click(function(){
				$(".dropdown1").addClass("show");
			});
			
			/* 드롭바 마우스 이벤트 */
			$('.dropdown1').on({
			    mouseover: function(){
			        $(this).addClass("show");
			    },
			     mouseleave: function(){
			    	$(this).removeClass("show");
			        $(this).addClass("hide");
 			    }
			});

			/* 드롭바 나타내기 */
			$(".move").click(function(){
				if($(".dropdown2").addClass("show")){
					
				}else{
					$(".dropdown2").removeClass("show");
				}			
			});
			
			/* 드롭바 마우스 이벤트 */
			$('.dropdown2').on({
			    mouseover: function(){
			        $(this).addClass("show");
			    },
			     mouseleave: function(){
			    	$(this).removeClass("show");
			        $(this).addClass("hide");
 			    }
			});
			
		});
			
		// 체크박스 선택 삭제
		function deleteM(){
			
			var dd = $("input:checkbox[name=check]:checked");

			$.each(dd, function(i, ck){
				
				var tr = ck.parentNode.parentNode;
				
				$.ajax({
					url: "trash.do",
					type: "POST",
					data: {mailNum: ck.value,
						   empId:"${loginUser.empId}"
					},
					success: function(data){
						if(data == "success"){
							tr.remove();
						}else{
							alertify.alert("", "삭제실패");
						}
					},
					error: function(){
						alertify.alert("", "통신실패");
					}
				});
			});
		};
		
		function deleteAll(){
			
			var dd = $("input:checkbox[name=check]:checked");

			$.each(dd, function(i, ck){
				
				var tr = ck.parentNode.parentNode;
				
				$.ajax({
					url: "deleteAll.do",
					type: "POST",
					data: {mailNum: ck.value,
						   empId:"${loginUser.empId}"
					},
					success: function(data){
						if(data == "success"){
							tr.remove();
						}else{
							alertify.alert("", "삭제실패");
						}
					},
					error: function(){
						alertify.alert("", "통신실패");
					}
				});
			});
			
		};
		
		$(document).ready(function(){
			
			$(".star").on('click',function(){
				
				 var importantFlag;
				 var mailNum = $(this).parent().prev().children().first().val();
				 
				 if($(this).children().first().css('display') == 'inline-block'){
					
					$(this).children().first().css('display','none');
					$(this).children().first().next().css('display','inline-block');
					
					importantFlag = 1;
					
				}else{
					
					$(this).children().first().next().css('display','none');
					$(this).children().first().css('display','inline-block');
					
					importantFlag = 0;
				}
			
			$.ajax({
				url: "updateImportant.do",
				type:"POST",
				data:{mailNum:mailNum,
					  importantFlag:importantFlag,
					  empId:"${loginUser.empId}"
					
				},
				success: function(data){
					/* ajax 통신 성공 */
				},
				error: function(){
					alertify.alert("", "통신실패");		
				}
			
			});
			
		});
			
			
		});

	</script>

</body>
</html>