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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


<style>
.contentWrap {
	float: left;
	width: 75%;
	background: white;
	padding-top: 30px;
	padding-bottom: 30px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 14px;
}

#free_header {
	width: 100%;
	height: 40px;
	background-color: #3287B2;
	color: white;
	font-size: 20px;
	padding: 7px 20px;
}

#outer {
	width: 100%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}

.bd {
	padding: 0;
	max-width: 2000px;
	margin: 0 auto;
	font-weight: normal;
	overflow-x: hidden;
	font-size: 12px;
	letter-spacing: -0.03em;
	background: transparent;
	line-height: 1.5;
}

#D_ ._hd .btm_area {
	padding: 10px 16px 25px 16px;
	background: #fff;
}

.bd .clear {
	display: block;
	position: relative;
}

#D_ ._hd .btm_area>span {
	padding: 0;
	font-size: 12px;
	color: #777;
}

.divider {
	display: inline;
}

.free_content {
	line-height: 210%;
}

#C_ {
	padding: 0;
	background: transparent;
}

#C_ ._hd {
	width: 100%;
	height: 44px;
	line-height: 44px;
	background: #fafafa;
	border: 1px solid #e5e5e5;
	padding: 0 16px;
	font-size: 13px;
}

.test1 {
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.test2 {
	width: 170px;
	display: inline-block
}

.test2 i {
	color: white;
}

.test2 a {
	display: block;
	color: white;
	font-size: 14px;
	font-weight: 300;
	background-color: #3287B2;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 50px;
	text-decoration: none;
}

#comment_start {
	width: 150px;
	cursor: pointer;
	border-radius: 3px;
	margin-bottom: 5px;
	margin-top: 0;
	height: 35px;
	padding-top: 7px;
}

#comment_start, #comment_start:after, .article_link,
	.article_link_internal, .lounge_submenu_li, .menu_item:hover,
	.rc_category_unselected, .xp_title_top_button {
	transition: all .2s ease-in-out;
}

.theme_box2, .btn, .btn_input, .rc_category_unselected:hover,
	.list_comment_em:hover {
	background-color: #2b8a44;
	color: white;
	border-color: #2b8a44;
}

.reply {
	color: #3287B2 !important;
}

.ui.comments {
	max-width: 100% !important;
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
						<div id="outer">
							<div id="free_header">공지사항 상세 보기</div>
							<hr>
							<div id="bd" class="bd" data-content-width="" data-pjax="off">
								<div id="D_" class="clear">
									<div class="_wrapper">
										<div class="_hd clear">
											<div class="_section" style="">
												<h2>
													<span>${n.noTitle}</span> <input type="hidden"
														name="refnoId" value="${n.noId}">
												</h2>
											</div>
											<div class="btm_area clear">
												</span><b>${n.empName}</b>ㆍ
												</sapn>
												<div class="divider"></div>
												<span>조회 수&nbsp;<b>${n.noCount}</b>ㆍ
												</span>
												<div class="divider"></div>
												<span class="fa fa-clock-o"></span> <span>${n.noCreateDate}</span>
												<div class="divider"></div>

												<c:if test="${!empty n.originalFileName }">
													<span> ㆍ첨부파일: <a
														href="${contextPath}/resources/nupload/${n.renameFileName}"
														download=${f.originalFileName}>${n.originalFileName }</a>
													</span>
												</c:if>
											</div>
											<div class="free_content" style="margin-bottom: 100px;">
												<p style="font-size: 16px;">${n.noContent}</p>
											</div>
										</div>
									</div>
								</div>

								<div class="test1" style="text-align: center;">
									<div class="test2">
										<a href="listNotice.do"><i class="fas fa-bars "></i><span>
												목록보기</span></a>
									</div>
									<c:if test="${loginUser.deptCode eq n.deptCode }">
										<div class="test2">
											<c:url var="update" value="noticeUpdateView.do">
												<c:param name="noId" value="${n.noId}" />
											</c:url>
											<a href="${update}"><i class="far fa-edit"></i><span>
													수정하기</span></a>
										</div>

										<div class="test2">
											<c:url var="delete" value="noticeDelete.do">
												<c:param name="noId" value="${n.noId}"></c:param>
											</c:url>
											<a href="${delete}"><i class="far fa-trash-alt"></i><span>
													삭제하기</span></a>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<br>
						<hr>

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

			$("#menu6").addClass("in");
			$("#menu6").attr('aria-expanded', true);
			$("#menu6_1").addClass("active");
			$("#menu6_1").attr('aria-expanded', true);
			$("#m6_1").addClass("active");

			$(".add-sendlist").click(function() {
				$("#divBCC").css("display", "block");
			})

		});
	</script>


	<!-- Javascript -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="resources/assets/scripts/klorofil-common.js"></script>

</body>
</html>