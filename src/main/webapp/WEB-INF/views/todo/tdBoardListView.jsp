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

<link rel="stylesheet" href="resources/css/semantic_dropdown.css">
<link rel="stylesheet" href="resources/css/semantic_icon.css">
<link rel="stylesheet" href="resources/css/semantic_button.css">


<style>
.ui.card {
  max-width: 100%;
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  width: 290px;
  min-height: 0px;
  background: #FFFFFF;
  padding: 0em;
  border: none;
  border-radius: 0.28571429rem;
  -webkit-box-shadow: 0px 1px 3px 0px #D4D4D5, 0px 0px 0px 1px #D4D4D5;
          box-shadow: 0px 1px 3px 0px #D4D4D5, 0px 0px 0px 1px #D4D4D5;
  -webkit-transition: -webkit-box-shadow 0.1s ease, -webkit-transform 0.1s ease;
  transition: -webkit-box-shadow 0.1s ease, -webkit-transform 0.1s ease;
  transition: box-shadow 0.1s ease, transform 0.1s ease;
  transition: box-shadow 0.1s ease, transform 0.1s ease, -webkit-box-shadow 0.1s ease, -webkit-transform 0.1s ease;
  z-index: '';
}
.ui.card {
  margin: 1em 0em;
}
.ui.card a {
  cursor: pointer;
}
.ui.card:first-child {
  margin-top: 0em;
}
.ui.card:last-child {
  margin-bottom: 0em;
}

.ui.card > :first-child {
  border-radius: 0.28571429rem 0.28571429rem 0em 0em !important;
  border-top: none !important;
}
.ui.card > :last-child {
  border-radius: 0em 0em 0.28571429rem 0.28571429rem !important;
}
.ui.card > :only-child {
  border-radius: 0.28571429rem !important;
}

.ui.card > .image {
  position: relative;
  display: block;
  -webkit-box-flex: 0;
      -ms-flex: 0 0 auto;
          flex: 0 0 auto;
  padding: 0em;
  background: rgba(0, 0, 0, 0.05);
}
.ui.card > .image > img {
  display: block;
  width: 100%;
  height: auto;
  border-radius: inherit;
}
.ui.card > .image:not(.ui) > img {
  border: none;
}

.ui.card > .content {
  -webkit-box-flex: 1;
      -ms-flex-positive: 1;
          flex-grow: 1;
  border: none;
  border-top: 1px solid rgba(34, 36, 38, 0.1);
  background: none;
  margin: 0em;
  padding: 1em 1em;
  -webkit-box-shadow: none;
          box-shadow: none;
  font-size: 1em;
  border-radius: 0em;
}
.ui.card > .content:after {
  display: block;
  content: ' ';
  height: 0px;
  clear: both;
  overflow: hidden;
  visibility: hidden;
}
.ui.card > .content > .header {
  display: block;
  margin: '';
  font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
  color: rgba(0, 0, 0, 0.85);
}

.ui.card > .content > .header:not(.ui) {
  font-weight: bold;
  font-size: 1.28571429em;
  margin-top: -0.21425em;
  line-height: 1.28571429em;
}
.ui.card > .content > .meta + .description,
.ui.card > .content > .header + .description {
  margin-top: 0.5em;
}

.ui.card [class*="left floated"] {
  float: left;
}
.ui.card [class*="right floated"] {
  float: right;
}

.ui.card [class*="left aligned"] {
  text-align: left;
}
.ui.card [class*="center aligned"] {
  text-align: center;
}
.ui.card [class*="right aligned"] {
  text-align: right;
}

.ui.card .content img {
  display: inline-block;
  vertical-align: middle;
  width: '';
}
.ui.card img.avatar,
.ui.card .avatar img {
  width: 2em;
  height: 2em;
  border-radius: 500rem;
}

.ui.card > .content > .description {
  clear: both;
  color: rgba(0, 0, 0, 0.68);
}

.ui.card > .content p {
  margin: 0em 0em 0.5em;
}
.ui.card > .content p:last-child {
  margin-bottom: 0em;
}

.ui.card .meta {
  font-size: 1em;
  color: rgba(0, 0, 0, 0.4);
}
.ui.card .meta * {
  margin-right: 0.3em;
}
.ui.card .meta :last-child {
  margin-right: 0em;
}
.ui.card .meta [class*="right floated"] {
  margin-right: 0em;
  margin-left: 0.3em;
}

.ui.card > .content a:not(.ui) {
  color: '';
  -webkit-transition: color 0.1s ease;
  transition: color 0.1s ease;
}
.ui.card > .content a:not(.ui):hover {
  color: '';
}

.ui.card > .content > a.header {
  color: rgba(0, 0, 0, 0.85);
}
.ui.card > .content > a.header:hover {
  color: #1e70bf;
}

.ui.card .meta > a:not(.ui) {
  color: rgba(0, 0, 0, 0.4);
}
.ui.card .meta > a:not(.ui):hover {
  color: rgba(0, 0, 0, 0.87);
}

.ui.card > .buttons,
.ui.card > .button {
  margin: 0px -1px;
  width: calc(100% +  2px );
}

.ui.card .dimmer {
  background-color: '';
  z-index: 10;
}
.ui.card > .content .star.icon {
  cursor: pointer;
  opacity: 0.75;
  -webkit-transition: color 0.1s ease;
  transition: color 0.1s ease;
}
.ui.card > .content .star.icon:hover {
  opacity: 1;
  color: #FFB70A;
}
.ui.card > .content .active.star.icon {
  color: #FFE623;
}

.ui.card > .content .like.icon {
  cursor: pointer;
  opacity: 0.75;
  -webkit-transition: color 0.1s ease;
  transition: color 0.1s ease;
}
.ui.card > .content .like.icon:hover {
  opacity: 1;
  color: #FF2733;
}
.ui.card > .content .active.like.icon {
  color: #FF2733;
}

.ui.card > .extra {
  max-width: 100%;
  min-height: 0em !important;
  -webkit-box-flex: 0;
      -ms-flex-positive: 0;
          flex-grow: 0;
  border-top: 1px solid rgba(0, 0, 0, 0.05) !important;
  position: static;
  background: none;
  width: auto;
  margin: 0em 0em;
  padding: 0.75em 1em;
  top: 0em;
  left: 0em;
  color: rgba(0, 0, 0, 0.4);
  -webkit-box-shadow: none;
          box-shadow: none;
  -webkit-transition: color 0.1s ease;
  transition: color 0.1s ease;
}
.ui.card > .extra a:not(.ui) {
  color: rgba(0, 0, 0, 0.4);
}
.ui.card > .extra a:not(.ui):hover {
  color: #1e70bf;
}

a.ui.card,
.ui.link.card {
  -webkit-transform: none;
          transform: none;
}
a.ui.card:hover,
.ui.link.card:hover {
  cursor: pointer;
  z-index: 5;
  background: #FFFFFF;
  border: none;
  -webkit-box-shadow: 0px 1px 3px 0px #BCBDBD, 0px 0px 0px 1px #D4D4D5;
          box-shadow: 0px 1px 3px 0px #BCBDBD, 0px 0px 0px 1px #D4D4D5;
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
}

/*--------------
      Size
---------------*/

.ui.cards > .card {
  font-size: 1em;
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
					
					<table>
						<tr>
							<td>
								<div class="ui selection dropdown error">
								  Dropdown 
								  <i class="dropdown icon"></i>
								  <div class="menu">
								    <div class="item">Choice 1</div>
								    <div class="item">Choice 2</div>
								    <div class="item">Choice 3</div>
								  </div>
								</div>
							</td>
							<td colspan="3">
								<i class="plus circle icon"></i>
							</td>
							<td>
								<div class="ui inverted segment">
								  <button class="ui inverted primary button">새 Board 생성하기</button>
								</div>
							</td>
						</tr>
					</table>
					
					<!-- 테이블 만들어서 3열로 카드 넣으면 ? -->
					
					<a class="ui card" href="todoDetail.do">
					  <div class="content">
					    <div class="header">2019-10</div>
					    <div class="meta">
					      <span class="category">2019년 10월 업무 관리</span>
					    </div>
					    <!-- <div class="description">
					      <p> 2019년 10월 </p>
					    </div> -->
					  </div>
					  <div class="extra content">
					    <div class="right floated author">
					      <img class="ui avatar image" src="resources/images/sky1.jpg"> Matt
					    </div>
					  </div>
					</a>
					
					<a class="ui card" href="http://www.dog.com">
					  <div class="content">
					    <div class="header">2019-10</div>
					    <div class="meta">
					      <span class="category">2019년 10월 업무 관리</span>
					    </div>
					    <!-- <div class="description">
					      <p> 2019년 10월 </p>
					    </div> -->
					  </div>
					  <div class="extra content">
					    <div class="right floated author">
					      <img class="ui avatar image" src="resources/images/sky1.jpg"> Matt
					    </div>
					  </div>
					</a>
					
				
					
					
					
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
	
	
	
	
	</script>

</body>
</html>