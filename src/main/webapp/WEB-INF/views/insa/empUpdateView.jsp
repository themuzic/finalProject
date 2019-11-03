<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>DEVELOFFICE</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.contentWrap {
	float: left;
	width: 62%;
	background: white;
	padding-top: 30px;
	padding-bottom: 10px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 14px;
}
.layer_box{
	position:relative;
	top:auto;
	bottom:auto;
	border:0px;
}
body{
	overflow: hidden;
}
</style>


</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!--  -->
		<jsp:include page="../common/navibar.jsp" />
		<!--  -->

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="contentWrap">

						<!-- 이 아래부터 내용 작성 -->

							<div class="layer_box large address line "
								id="div_approval_view_one"
								style="display: block; width: 770px; position:relative;border:0px; left:0;">
								<div class="title_layer text_variables" id="titleApprovalLineSetting" style="padding-bottom:0;">인사이동</div>
								<div class="after line-list-wrap">
									<div class="fl">
										<div class="after">
											<div class="fr">
												<a class="icon order" title="정렬"
													id="anchorApprovalUserOrder" style="cursor: pointer;"></a>
												<ul class="dropdown-menu hide" id="orderApprovalDropdown"
													style="width: 70px; top: 80px;left: 315px;">
													<li><a class="js-approval-node-order sortByName">이름순</a></li>
													<li><a class="js-approval-node-order sortByJob">직급순</a></li>
												</ul>
											</div>
										</div>
										<div class="after">
											<div class="category-list"
												style="height: 397px; width: 205px;">
												<div id="treeDiv" style="white-space: nowrap; float: none;"
													class="treeDiv OrgTree">
													<ul>
														<li id="" class="last">
															<div class="Container">
																<img onclick=""
																	src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_m.gif"
																	class="plus"> <strong onclick="" id="subOffice"
																	class="selectedNode">DEVELOFFICE <span
																	style="font-weight: normal; color: silver; font-size: 8pt">(${empSize})</span></strong>
															</div>
															<ul style="" id="subDept">
															</ul>
														</li>
													</ul>
												</div>
												<div id="leftProgressDiv" style="display: none;"
													class="progressDiv">
													<img src="resources/images/progress_big.gif">
												</div>
											</div>
											<div class="name-list" style="width: auto;">
												<select multiple="multiple" id="rightList" style="height:395px;"></select>

												<div id="rightProgressDiv" style="display: none;"
													class="progressDiv">
													<img src="resources/images/progress_big.gif">
												</div>
											</div>
										</div>

									</div>
									<div class="fr mgb20" style="margin-left:60px;">
										<div class="first-line four-line after">
											<div class="fl">
												<div class="to-item after">
													<span class="title">부서 <span
														class="point_color bold" id="sp_selectApprovalFirstLine">0</span></span>
													<div class="updown-wrap first js-move-approval-first-line"
														style="width: 55px;">
														<span class="blind icon down"></span> <span
															class="blind icon up"></span>
													</div>
												</div>
												<div class="list" style="height:180px;">
													<select multiple="multiple" class="deptSelect" id="selectApprovalFirstLine"
														style="overflow-y: hidden !important; height:180px;">
													</select>
												</div>

											</div>
										</div>
										<div class="three-line after">
											<div class="fl">
												<div class="to-item after">
													<span class="title">직급 <span
														class="point_color bold" id="sp_selectApprovalThirdLine">0</span></span>
													<div class="updown-wrap first js-move-approval-third-line"
														style="width: 55px;">
														<span class="blind icon down"></span> <span
															class="blind icon up"></span>
													</div>
												</div>
												<div class="list" style="height:150px;">
													<select multiple="multiple" class="jobSelect" id="selectApprovalThirdLine"
														style="overflow-y: hidden !important;height:150px;">
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="layer_button">
									<button type="button" class="btn_variables confirmBtn" disabled>변경하기</button>
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




	<!-- script 작성 -->
	<script>
		$(function() {
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
			
			
// 			//전체선택
// 			$("#selectAll").on('click',function(){
// 				$("#rightList option").attr('selected',true);
// 				$("#rightList option").css({
// 					'background-color':'#e8ecee',
// 					'color':'#676767'
// 				});
// 			});
// 			//전체선택취소
// 			$("#cancelAll").on('click',function(){
// 				$("#rightList option").attr('selected',false);
// 				$("#rightList option").css({
// 					'background-color':'white',
// 					'color':'#676767'
// 				})
// 			});
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

			
			/* 사원이름 눌렀을때 */
			$("#rightList").on('click','option',function(){
				
				var selected = $(this);
				var deptList = ${deptList};
				var jobList = ${jobList};
				var deptHtml = '';
				var jobHtml = '';

				$.each(${deptList}, function(index, dept){
					if(index == 0){
						
					}else{
						if(selected.attr('title') == dept.deptName){
							deptHtml += '<option value="' + dept.deptCode + '" selected>' + dept.deptName + '</option>';
						}else{
							deptHtml += '<option value=' + dept.deptCode + '>' + dept.deptName + '</option>';
						}
					}
				});
				$.each(${jobList}, function(index, job){
					if(selected.attr('class') == job.jobCode){
						jobHtml += '<option value="' + job.jobCode + '" selected>' + job.jobName + '</option>';
					}else{
						jobHtml += '<option value=' + job.jobCode + '>' + job.jobName + '</option>';
					}
				});
				$("#selectApprovalFirstLine").html(deptHtml);		// 부서쪽 select 채워주고
				$("#selectApprovalThirdLine").html(jobHtml);		// 직급쪽 select 채워주고
				
				
				$("#sp_selectApprovalFirstLine").text($("#selectApprovalFirstLine").children().length);	// 부서쪽 숫자 적어주고
				$("#sp_selectApprovalThirdLine").text($("#selectApprovalThirdLine").children().length);	// 직급쪽 숫자 적어주고
			});
			
			/* 부서, 직급 옵션 눌렀을때 */
			$(".list select").on('click', 'option', function(){
				var emp = $("#rightList option:selected");
				var dept = $(".deptSelect option:selected");
				var job = $(".jobSelect option:selected");
				console.log(dept.html() + ' ' + emp.attr('title') + ' ' + job.val() + ' ' + emp.attr('class'));
				if(job.val() == emp.attr('class') && dept.html() == emp.attr('title')){
					$(".confirmBtn").attr('disabled', true);
				}else{
					$(".confirmBtn").attr('disabled', false);
				}
			})
			
			/* 결제선 추가 창 확인 버튼 */
			$(".confirmBtn").on('click',function(){
				
				var deptCode = $("#selectApprovalFirstLine").children('option:selected').val();	// 부서
				var jobCode = $("#selectApprovalThirdLine").children('option:selected').val();	// 직급
				var empId = $("#rightList option:selected").val();	// 사원
				console.log(deptCode + " " + jobCode + ' ' + empId);
				
				$.ajax({
					url:'insaUpdate.do',
					type:"POST",
					data:{empId:empId,deptCode:deptCode,jobCode:jobCode},
					success:function(data){
						if(data == 'success'){
							alertify.alert('Develoffice', '인사이동 성공!!', function () {location.href='insaUpdateForm.do';});
							
						}
					},
					error:function(){
						alertify.alert('', '통신실패')
					}
				});
				
				
				
			});
			
			/* 결재선 창 기능 끝 */

		});
	</script>



	<!-- Javascript -->
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>

</body>
</html>