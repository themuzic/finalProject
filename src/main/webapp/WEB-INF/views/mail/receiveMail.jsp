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
				<form action="search.bo">
					<select id="searchCondition" name="condition" style="height:32px; border:1px solid lightgray">
					       <option>------</option>
					       <option value="writer">이름</option>
					       <option value="title">제목</option>
					       <option value="content">내용</option>
					    </select>
					    <div class="ui input">
					<input type="search" name="search" value="" placeholder="Search..." style="height:32px;">
					<i class="circular search link icon"></i>
					</div>	         
					<button type="submit" onclick="return validate();" style="color:#3287B2">검색하기</button>
				</form>
	       </div>
	       
	       <script>
		       function validate(){
		           if($("option:selected").val() == "------"){
		              alert("검색 조건을 체크해주세요");
// 		              alertify.alert("검색 조건을 체크해주세요");
		           return false;
		           }
		        }
	       </script>
	       
		 	<div id='m_list_default_menu'>
				<input type="checkbox" id="chkAll" name="chkAll" onclick="">
	            <span class="detail_select menu">
					<a href="javascript:void(0)" id="lookAll" class="lookAll" style="color:#3287B2; font-size:15px;">보기: 모두
					 	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif">
				 	</a>
		            <div class="dropdown1 hide" id="m_view_move_mbox_detail" style="margin-top:5px;">
	                    <div class="dropscroll-menu1" style="width:150px; border:1px solid #999; z-index: 110;">
	                        <ul style="min-width:220px; border-color:#2985db;" id="ul" class="ul">
					            <li class="li" class="li">
	                                <a href="javascript:void(0)" id="move_b0" onclick="" style="color:gray;">모두</a>
	                            </li>
					            <li class="li" class="li">
	                                <a href="javascript:void(0)" id="move_b1" onclick="" style="color:gray;">별 표시</a>
	                            </li>
					            <li class="li" class="li">
	                                <a href="javascript:void(0)" id="move_b2" onclick="" style="color:gray;">첨부 있음</a>
	                            </li>
					            <li class="li" class="li">
	                                <a href="javascript:void(0)" id="move_b3" onclick="" style="color:gray;">안 읽은 메일</a>
	                            </li>
					            <li class="li" class="li">
	                                <a href="javascript:void(0)" id="move_b5" onclick="" style="color:gray;">읽은 메일</a>
	                            </li>
							</ul>
	                     </div>  
					</div>
	            </span>
	        </div>

	        
	        
	        <div id='chkMenu' class="chkMenu hide" name="chkMenu" style="font-size:15px; margin-left:30px; display:none">
	            <span class="detail_select" id="m_list_checked_menu_delete">
	                <a href="javascript:void(0)" onclick="">삭제</a>&nbsp;&nbsp;
	            </span>
	            <span class="detail_select">
	                <a href="javascript:void(0)" onclick="">완전삭제</a>&nbsp;&nbsp;
	            </span>
	            <span class="detail_select" id="m_list_checked_menu_resend">
	                <a href="javascript:void(0)" onclick="">재발송</a>&nbsp;&nbsp;
	            </span>
	        
	            <span class="detail_select move">
	                <a href="javascript:void(0)" id='m_list_move_mbox' >이동
	                	<img src="https://office.hiworks.com/static/ui/images/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
	                </a>
	                <div class="dropdown2 hide" id='m_list_move_mbox_detail' style="margin-top:5px; margin-left:180px;">
	                    <div class="dropscroll-menu2">
	                        <ul style="min-width:110px; border-color:#2985db; margin:10px; line-height:2">
	                            <li>
	                                <a href="" id="receive"onclick="" style="color:gray">받은 편지함</a>
	                            </li>
	                            <li>
	                                <a href="" id="send"onclick="" style="color:gray"> 보낸 편지함</a>
	                            </li>
	                            <li>
	                                <a href="" id="delete"onclick="" style="color:gray">휴지통</a>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
            	</span>
            </div>   
	 	</fieldset>
	 	
			
		<table class="ui selectable celled table">
			<colgroup>
				<col style="width:2%;">
				<col style="width:4%;">
				<col style="width:8%;">
				<col style="width:60%;">
				<col style="width:12%;">
				<col style="width:15%;">
			</colgroup>
				<thead>
					<tr>
						<th>chk</th>
						<th><i class="far fa-star"></i></th>
						<th>보낸사람</th>
						<th>메일제목</th>
						<th class="aa">첨부파일</th>
						<th class="aa">날짜</th>
					</tr>
				</thead>
				<tbody class="select_subject">
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><i class="far fa-star"></i></td>
						<td class="mName">전재광</td>
						<td class="mTitle"><a href="receiveDetail.do" style="color:black;">메일제목입니다.</a></td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-16 09:47</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><i class="far fa-star"></i></td>
						<td class="mName">유현규</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-17 10:43</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><i class="far fa-star"></i></td>
						<td class="mName">설용환</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-18 11:53</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><i class="far fa-star"></i></td>
						<td class="mName">김상윤</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-19 14:00</td>
					</tr>
					<tr>
						<td>
							<input type="hidden">
							<input type="checkbox" class="check">
						</td>
						<td><i class="far fa-star"></i></td>
						<td class="mName">원영주</td>
						<td class="mTitle">메일제목입니다.</td>
						<td align="right">첨부파일</td>
						<td class="aa">19-09-19 15:43</td>
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
			
			/* 체크박스 전체 선택하기 */
			$("#chkAll").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $(".select_subject input").prop('checked', true);
				else  $(".select_subject input").prop('checked', false);
				
				$(".chkMenu").addClass("show");
				$("#lookAll").addClass("hide");
				$("#lookAll").css("display","none");
				$(".chkMenu").css("display", "block");
			});
			
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
			
			$("#lookAll").click(function(){
				$(".dropdown1").addClass("show");
			});
			
			
			$('.dropdown1').on({
			    mouseover: function(){
			        $(this).addClass("show");
			    },
			     mouseleave: function(){
			    	$(this).removeClass("show");
			        $(this).addClass("hide");
 			    }
			});

			$(".move").click(function(){
				if($(".dropdown2").addClass("show")){
					
				}else{
					$(".dropdown2").removeClass("show");
				}			
			});
			
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

	</script>

</body>
</html>