<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>
<%

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth2=ca.get(Calendar.MONTH)+1;
 String iTMonth = "";
if(iTMonth2<10){
	iTMonth="0"+iTMonth2;
}
  
%>
<html>
	<head>
		<title>Main</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	<body>
	<style>
		ul.tabs {
			padding: 0;
			padding-right: 15px;
			padding-left:15px;
			display: flex;
			-webkit-justify-content: center; 
			justify-content: center; 
			-webkit-align-items: center; 
			align-items: center;
			list-style-type: none;
		}
		ul.tabs li {
			height: 11.1111vw;
			font-size:3.8889vw;
		    color:#828282;
		}
		ul.tabs li:last-child {
		    margin-left: 4.4444vw;
		}
		ul.tabs li.active {
			color: #F58900;
			border-bottom: 1px solid #F58900;
		}
		.tab_container {
		    width: 100%;
		    background: #FFFFFF;
		}
		.tab_content {
		    width:100%;
		    font-size: 12px;
		    display: none;
		}
		.tab_container .tab_content ul {
		    width:100%;
		    margin:0px;
		    padding:0px;
		}
		.tab_container .tab_content ul li {
		    padding:5px;
		    list-style:none;
		}
		#container {
		    width: 100%;
		    margin: 0 auto;
		}
		
		/* mobile style */
		.flexColumn{display: flex;  flex-direction: column; display: -webkit-flex;  -webkit-flex-direction: column; }
		.flex{display: flex; display: -webkit-flex;}
		.flexGrow{-webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0;  -webkit-flex : 1 1 0;}
		.center{-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; }/* 가로세로중앙정렬 */
		.centerH{-webkit-align-items: center; align-items: center; }/* 세로중앙정렬 */
		.rightR{-webkit-justify-content: flex-end; justify-content: flex-end; }
		.rightC{-webkit-align-items: flex-end; align-items: flex-end;}
		.m_main_header{
			display:flex;
			padding-top: 4.2667vw;
			padding-bottom: 6.4vw;
			padding-right: 5.5556vw;
		}
		.m_header_logo{
			height: 6.9444vw;
		}
		.m_header_logout {
			display:flex;
		}
		.m_header_nav a span {
			letter-spacing: 0.0427vw;
			color: #FF8B7E;
			font-size: 3.8889vw;
		}
		.m_header_logout {
			justify-content: space-evenly;
		}
		.m_header_nav a img{
			margin-left: 2.2667vw;
			height: 3.8889vw;
		}
		.box_row {
			padding-right:15px;
			padding-left:15px;
			justify-content: space-between;
		}
		.box_row:last-child {
			margin-top:5.5556vw;
		}
		.consulting_count {
			margin-top:2.2222vw;
			color:#8D8D8D;
			font-size: 3.8889vw;
		}
		.m_main_box {
			width: 26.6667vw;
			height: 26.6667vw;
			box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
			border-radius: 2.7778vw;
			background-size: 115%;
			background-position: center;
		}
		.m_main_box a {
			width: 100%;
			height: 100%;
		}
		.m_main_box a:hover {
			text-decoration: none;
		}
		.m_main_box p{
			font-size: 13.8889vw;
			color: white;
		}
		.today_consulting {
			background-image: url(${url:resource('/resources/img/box1.png')});
		}
		.consulting {
			background-image: url(${url:resource('/resources/img/box2.png')});
		}
		.counselor_count {
			background-image: url(${url:resource('/resources/img/box3.png')});
		}
		.unwritten {
			background-image: url(${url:resource('/resources/img/box4.png')});
		}
		.extension {
			background-image: url(${url:resource('/resources/img/box5.png')});
		}
		.approval {
			background-image: url(${url:resource('/resources/img/box6.png')});
		}
		.notice_subject a {
			color:black;
			font-size: 4.4444vw;
			font-weight: bold;
		}
		.notice_content a {
			font-size: 3.8889vw;
			color:black;
			line-height: 130%;
			white-space: normal;
			word-wrap: break-word;
		}
		
		.main_section{padding-bottom: 60px;}
		</style>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">

		var sdate= new Date("2019/04/25 00:00:00");
		var edate= new Date("2019/04/27 01:00:00");

		if(Date.now() >= sdate && Date.now() <= edate){
			$("#popupDispYn").show();
		}

		$(document).ready(function() {
			$('.mobile_nav ul li a').eq(0).addClass('active');
			$('.mobile_nav ul li a img').eq(0).attr('src', "${url:resource('/resources/img/home_icon_active.png')}");
			$(".tab_content").hide();
			$(".tab_content:first").show();
	
			$("ul.tabs li").click(function () {
				$("ul.tabs li").removeClass("active").css("color", "#333");
				//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
				$(this).addClass("active").css("color", "darkred");
				$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn()
			});
		});
	</script>
			<div id="popupDispYn" style="display:none">
			<div class="layer_area img_layer" style="top: 25%; left: 40%; margin-left: -1px; margin-top: -1px; position:absolute;">
				<div class="pop_cont"><iframe scrolling="no" width="455" height="455" frameborder="0" src="http://img.ezwelmind.co.kr//upload/popup/jpg/2019/04/190425_popup.jpg"></iframe>
				</div>
			</div>
		</div>

		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="sesUser" property="principal.user" />
		</sec:authorize>
<div class="">

	
	<div id="container">
		<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_CENTER' || sesUser.authCd eq 'ROLE_ADMIN'   || sesUser.authCd eq 'ROLE_PARTNER_ADMIN'  }">
		<div class="flex box_row">
			<div class="consulting_container">
				<div class="m_main_box flex center today_consulting">
					<p>
							${sangdamcnt.todayCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">오늘 상담</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center consulting">
					
						<p>
							${sangdamcnt.processCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">진행 중 상담</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center counselor_count">
					<a class="flex center" >	
						<p>
							${sangdamcnt.counselorCnt}
						</p>
					</a>
				</div>
				<div class="flex center">
					<p class="consulting_count">상담사 수</p>
				</div>
			</div>
		</div>
		<div class="flex box_row">
			<div class="consulting_container">
				<div class="m_main_box flex center unwritten">
						
						<p>
							${sangdamcnt.unWritenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">미작성일지</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center extension">
					
						<p>
							${sangdamcnt.extenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">연장신청</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center approval">
						
						<p>
							${sangdamcnt.unWritenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">승인대기</p>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_SANGDAM' }">
		<!-- 상담사  화면 -->
		
		<div class="flex box_row">
			<div class="consulting_container">
				<div class="m_main_box flex center today_consulting">
					
						<p>
							${sangdamcnt.processCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">내담자</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center consulting">
					<p>
							${sangdamcnt.todayCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">오늘 상담</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center counselor_count">
					
						<p>
							${sangdamcnt.extenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">연장 신청</p>
				</div>
			</div>
		</div>
		
		<div class="flex box_row">
			<div class="consulting_container">
				<div class="m_main_box flex center unwritten">
					
						<p>
							${sangdamcnt.unWritenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">상담일지</p>
				</div>
			</div>
		</div>
		
	
		<!-- 상담사 화면 끝 -->
	</c:if>
<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_SEND'}">

<div class="flex box_row">
			<div class="consulting_container">
				<div class="m_main_box flex center unwritten">
					
						<p>
							 ${sangdamcnt.processCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">진행중 상담</p>
				</div>
			</div>
			<div class="consulting_container">
				<div class="m_main_box flex center unwritten">
					
						<p>
							${sangdamcnt.unWritenCsCnt}
						</p>
					
				</div>
				<div class="flex center">
					<p class="consulting_count">미작성 상담일지</p>
				</div>
			</div>
		</div>
<!-- 		
	<div class="float_left padding15">
			<a href="">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
				    
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
				   
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding15">
			<a href="">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="20%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
				    
				</text>
				<text text-anchor="middle"   x="50%" y="35%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">   
				    상담일지
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
				    
				</text>
				</svg>
			</a>
		</div>
 -->
	</div>
</c:if>
		<ul class="tabs">
			<li class="flex center flexGrow active" rel="tab1"><span class="">공지사항</span></li>
			<li class="flex center flexGrow" rel="tab2"><span>모집공고</span></li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<c:if test="${!empty notice }">
				<ul class="main__notice-list">
					<li class="main__notice-item">
						<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${notice.dataSeq}">
							<h3 class="notice_subject">${notice.subject }</h3>
							<div class="notice_content">${notice.content }</div>
							<div class="notice_createdAt">${notice.regDt}</div>
						</a>
					</li>
					
				</ul>
				</c:if>
			</div>
			
			
			<div id="tab2" class="tab_content">
				<c:if test="${!empty recruit }">
				<ul class="main__notice-list">
					<li class="main__notice-item">
						<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${recruit.dataSeq}">
							<h3 class="notice_subject">${recruit.subject }</h3>
							<div class="notice_content">${recruit.content }</div>
							<div class="notice_createdAt">${recruit.regDt}</div>
						</a>
					</li>
					
				</ul>
				</c:if>
			</div>


	

</div>

	</body>
</html>

