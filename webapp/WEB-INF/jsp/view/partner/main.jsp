<%@page import="com.ezwel.admin.service.security.UserDetailsHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>
<% pageContext.setAttribute("loginUserId", UserDetailsHelper.getAuthenticatedUser().getUserId()); %>
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
		<c:if test="${loginUserId eq 'nexon_maum'}">
		<script type="text/javascript">
			location.href="/partner/pCounselorMgr/totalSchedule";
		</script>
		</c:if>
	</head>
	<body>
	<style>
		ul.tabs {
		    margin: 0;
		    padding: 0;
		    float: left;
		    list-style: none;
		    height: 32px;
		    border-bottom: 1px solid #eee;
		    border-left: 1px solid #eee;
		    width: 85%;
		    font-family:"dotum";
		    font-size:12px;
		}
		ul.tabs li {
		    float: left;
		    text-align:center;
		    cursor: pointer;
		    width:33.33%;
		    height: 31px;
		    line-height: 31px;
		    border: 1px solid #eee;
		    border-left: none;
		    font-weight: bold;
		    background: #fafafa;
		    overflow: hidden;
		    position: relative;
		}
		ul.tabs li.active {
		    background: #FFFFFF;
		    border-bottom: 1px solid #FFFFFF;
		}
		.tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 85%;
		    background: #FFFFFF;
		}
		.tab_content {
		box-sizing: border-box;
		    padding: 5px;
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
		</style>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">

		var sdate= new Date("2019/04/25 00:00:00");
		var edate= new Date("2019/04/27 01:00:00");

		if(Date.now() >= sdate && Date.now() <= edate){
			$("#popupDispYn").show();
		}

		$(document).ready(function() {
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
		
<div class="web clearfix" style="display: block;">

	<div style="width: 300px;float: left;">
	<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="profile_icon">접속자 정보</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td>
				<!-- 검색 영역 시작 -->
				<table cellpadding="5" cellspacing="0" border="1" width="250px" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr align="center" height="30px">
						<td width="100px" bgcolor="#F5F5F5" align="center"><strong>이 름</strong></td>
				    	<td width="150px" >
				    		<sec:authentication property="principal.user.userNm"/>
				    	</td>
					</tr>
					<tr align="center" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>아이디</strong></td>
				    	<td >
				    		<sec:authentication property="principal.user.userId"/>
				    	</td>
					</tr>
					<tr align="center" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>모바일</strong></td>
				    	<td >
				    		<sec:authentication property="principal.user.mobile"/>
				    	</td>
					</tr>
					<tr align="center" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>이메일</strong></td>
				    	<td >
				    		<sec:authentication property="principal.user.email"/>
				    	</td>
					</tr>
				</table>
				<!-- 검색 영역 종료 -->
			</td>
		</tr>

		<tr>
			<td height="10px"></td>
		</tr>
	
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="shortcuts">바로가기</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td><a href="/partner/pCounselorMgr/totalSchedule"><div class="round_btn">전체 일정 보기</div></a></td>
		</tr>
		<tr>
			<td><a href="/partner/pCounselorMgr/counselFixList"><div class="round_btn">예약확정현황</div></a></td>
		</tr>
		<tr>
			<td><a href="/partner/pCounselorMgr/pCounselorDateList" ><div class="round_btn">상담일지 작성</div></a></td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="naver_talk">네이버 톡톡 상담</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td style="width:100px;"><div class="talk_banner_div" data-id="41666"></div></td>
		</tr>
		<tr>
			<td><div class="talk_banner_div" data-id="34517"></div></td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
	
	
	</table>
</div>

	<div style="float:left;width: calc(100% - 300px);">
	<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
 
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
		<td>
		<div id="container">
		    <ul class="tabs">
		        <li class="active" rel="tab1">공지사항</li>
		        <li rel="tab2">모집공고</li>
		        <li rel="tab3">가이드북 & 양식</li>
		    </ul>
		    <div class="tab_container">
		        <div id="tab1" class="tab_content">
		             <c:if test="${!empty notice }">
				        <table>
					        <tr>
								<td align="left" class="subtitle">공지사항</td>
								</tr>
								<tr>
									<td height="10px"></td>
								</tr>
								<tr>
									<td>
										<div style="width: 550px; height: auto; overflow-y:auto">
											<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; width: 100%" bordercolor="#DDDDDD">
												<tr height="30px">													
											    	<td class="pt_size16">
											    		
											    		<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${notice.dataSeq}"><b>${notice.subject }</b></a>
											    	</td>
												</tr>
												<tr>
											    	<td>
											    	<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${notice.dataSeq}"><b>${notice.content }</b></a>
											    		
											    	</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
				        </table>
						</c:if>
						
						<!-- 비어있을때 추가 -->
		             <c:if test="${empty notice }">
		             	<p> 공지사항이 없습니다. </p>
					</c:if>
		        </div>
        		<!-- #tab1 -->
		        <div id="tab2" class="tab_content">
		        <c:if test="${!empty recruit }">
				        <table>
					        <tr>
								<td align="left" class="subtitle">모집공고</td>
								</tr>
								<tr>
									<td height="10px"></td>
								</tr>
								<tr>
									<td>
										<div style="width: 550px; height: auto; overflow-y:auto">
											<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; width: 100%" bordercolor="#DDDDDD">
												<tr height="30px">													
											    	<td class="pt_size16">
											    		
											    		<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${recruit.dataSeq}"><b>${recruit.subject }</b></a>
											    	</td>
												</tr>
												<tr>
											    	<td>
											    	<a href="/partner/bbsNotice/noticeDetailForm?dataSeq=${recruit.dataSeq}"><b>${recruit.content }</b></a>
											    		
											    	</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
				        </table>
						</c:if>
		        </div>
        <!-- #tab2 -->
        <div id="tab3" class="tab_content">
	       <table style="width:100%;table-layout:fixed;">
		        <tr>
						<td height="20px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">파트너어드민 가이드북 & 양식</td>
					</tr>
					<tr>
						<td>
							<!-- 검색 영역 시작 -->
							<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr align="center" height="30px">
						<td style="width:290px;" bgcolor="#F5F5F5" align="center"><strong>가이드 북</strong></td>
				    	<td style="width:47px;" id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_GUIDEBOOK_v3.0.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>(일반용)개인정보수집 및 이용동의서</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_individual.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>개인정보수집 및 이용동의서</strong><br/><span style="font-size: 11px; color:red">(삼성생명, 삼성웰스토리, 삼성증권)</span></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_highrisk_hustory.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>개인정보수집 및 이용동의서 + 상담동의서</strong><br/><span style="font-size: 11px; color:red">(삼성생명서비스용)</span></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_sls.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>(일반용)상담동의서</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_counsel.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>생명존중(자살방지)서약서</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_suicide.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>심리검사 동의서</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_testagreement.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>심리검사 회기차감 테이블</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_testchargetable.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>상담연장 신청서</strong><br/><span style="font-size: 11px">*연장접수:grace88@ezwel.com</span></td>
				    	<td id="btn02" >
				    		<!-- <a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_extentionapplication.pdf" target="_blank"><span>보기</span></a> -->
				    		<a href="javascript:fileDownLoad('/download/partner_form_extentionapplication.hwp', 'partner_form_extentionapplication.hwp');" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>고위험군 사례관리 안내</strong></td>
				    	<td id="btn02" >
				    		<a href="http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_highrisk.pdf" target="_blank" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr>
					<!-- <tr align="left" height="30px">
						<td bgcolor="#F5F5F5" align="center"><strong>성범죄경력조회동의서(UST용)</strong><br/><span style="font-size: 11px">*접수:ezwelmind00@naver.com</span></td>
				    	<td id="btn02" >
				    		<a href="javascript:fileDownLoad2('http://img.ezwelmind.co.kr/sangdam4u/files/partner_form_criminalrecord_UST.hwp', 'partner_form_criminalrecord_UST.hwp');" style="font-size: 10px"><span>보기</span></a>
				    	</td>
					</tr> -->
				</table>
							<!-- 검색 영역 종료 -->
						</td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
		        </table>
        </div>
        <!-- #tab3 -->
    </div>
    <!-- .tab_container -->
</div>
<br>
${sesUser.authCd}
<div class="clear_both"></div>
<div class="h20"></div>
<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_CENTER' || sesUser.authCd eq 'ROLE_ADMIN' }">
	<div class="wd100 ">
		<div class="float_left padding10">
			<a href="/partner/pCounselorMgr/counselFixList?startDt=<%=iTYear  %>%2F<%=iTMonth  %>%2F<%=iTDay  %>&endDt=<%=iTYear  %>%2F<%=iTMonth %>%2F<%=iTDay  %>">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="">
				    오늘 상담
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
				    ${sangdamcnt.todayCsCnt}
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding10">
			<a href="/partner/pCounselorMgr/counselFixList">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="">
				    진행중 상담
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
				    ${sangdamcnt.processCsCnt}
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding10">
			<a href="/partner/pCounselorMgr/pCounselorDateList">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="20%" fill="#191919" font-size="14" font-family="">
				    미작성
				</text>
				<text text-anchor="middle"   x="50%" y="35%" fill="#191919" font-size="14" font-family="">   
				    상담일지
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
				    ${sangdamcnt.unWritenCsCnt}
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding10">
			<a href="/partner/pCounselorMgr/counselFixList">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="">
				    연장 신청
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
				    ${sangdamcnt.extenCsCnt}
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding10">
			<a href="/partner/mgr/counselorInfoMgrList?searchMgrStatus=S">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="">
				    승인 대기
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
				    ${sangdamcnt.waitAppCnt}
				</text>
				</svg>
			</a>
		</div>
		
		<div class="float_left padding10">
		<a href="/partner/mgr/counselorInfoMgrList?searchMgrStatus=Y">
			<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
			<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
			<defs>
			<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
			<stop stop-color="#006DBA"/>
			<stop offset="1" stop-color="#7EC041"/>
			</linearGradient>
			</defs>
			<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="">
			    상담사 수
			</text>
			<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="">
			   ${sangdamcnt.counselorCnt}
			</text>
			</svg>
		</a>
	</div>
	</div>

</c:if>

<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_SANGDAM' }">
	<div class="clear_both"></div>
	<div class="h20"></div>
<div class="wd100 c2">
	<div class="float_left padding15">
		<a href="/partner/pCounselorMgr/counselFixList">
			<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
			<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
			<defs>
			<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
			<stop stop-color="#006DBA"/>
			<stop offset="1" stop-color="#7EC041"/>
			</linearGradient>
			</defs>
			<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
			    내담자
			</text>
			<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
			    ${sangdamcnt.processCsCnt}
			</text>
			</svg>
		</a>
	</div>
	<div class="float_left padding15">
		<a href="/partner/pCounselorMgr/counselFixList?startDt=<%=iTYear  %>%2F<%=iTMonth  %>%2F<%=iTDay  %>&endDt=<%=iTYear  %>%2F<%=iTMonth  %>%2F<%=iTDay  %>">
			<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
			<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
			<defs>
			<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
			<stop stop-color="#006DBA"/>
			<stop offset="1" stop-color="#7EC041"/>
			</linearGradient>
			</defs>
			<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
			    오늘 상담
			</text>
			<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
			    ${sangdamcnt.todayCsCnt}
			</text>
			</svg>
		</a>
	</div>
	
	<div class="float_left padding15">
		<a href="/partner/pCounselorMgr/counselFixList">
			<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
			<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
			<defs>
			<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
			<stop stop-color="#006DBA"/>
			<stop offset="1" stop-color="#7EC041"/>
			</linearGradient>
			</defs>
			<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
			    연장 신청
			</text>
			<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
			    ${sangdamcnt.extenCsCnt}
			</text>
			</svg>
		</a>
	</div>
	<div class="float_left padding15">
		<a href="/partner/pCounselorMgr/pCounselorDateList">
			<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
			<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
			<defs>
			<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
			<stop stop-color="#006DBA"/>
			<stop offset="1" stop-color="#7EC041"/>
			</linearGradient>
			</defs>
			<text text-anchor="middle"   x="50%" y="20%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
			    미작성
			</text>
			<text text-anchor="middle"   x="50%" y="35%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">   
			    상담일지
			</text>
			<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
			    ${sangdamcnt.unWritenCsCnt}
			</text>
			</svg>
		</a>
	</div>
	
</div>
</c:if>
<c:if test="${sesUser.authCd eq 'ROLE_PARTNER_SEND'}">

<div class="clear_both"></div>
<div class="h20"></div>
<div class="wd100 c3">
	<div class="float_left padding15">
			<a href="/partner/pCounselorMgr/counselFixList">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="25%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
				    진행중 상담
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
				    ${sangdamcnt.processCsCnt}
				</text>
				</svg>
			</a>
		</div>
		<div class="float_left padding15">
			<a href="/partner/pCounselorMgr/pCounselorDateList">
				<svg width="134" height="134" viewBox="0 0 134 134" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="67" cy="67" r="64" stroke="url(#paint0_linear)" stroke-width="6"/>
				<defs>
				<linearGradient id="paint0_linear" x1="21.5" y1="16.5" x2="118.5" y2="116" gradientUnits="userSpaceOnUse">
				<stop stop-color="#006DBA"/>
				<stop offset="1" stop-color="#7EC041"/>
				</linearGradient>
				</defs>
				<text text-anchor="middle"   x="50%" y="20%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">
				    미작성
				</text>
				<text text-anchor="middle"   x="50%" y="35%" fill="#191919" font-size="14" font-family="'Leckerli One', cursive">   
				    상담일지
				</text>
				<text text-anchor="middle"   x="50%" y="70%" fill="#191919" font-size="40"  font-family="'Leckerli One', cursive">
				    ${sangdamcnt.unWritenCsCnt}
				</text>
				</svg>
			</a>
		</div>
	</div>
</c:if>
	<!-- #container -->
	</td>
</tr>
</table>
</div>
</div>

	</body>
</html>

