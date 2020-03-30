<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.counsel_wrapper{background-color: white;padding:2.2222vw}
	.pop_title{font-size: 3.8889vw; color: black;}
	.box_title{margin-top: 4.4444vw; color:#004B85; font-size: 5.5556vw;text-align: center;font-weight: bold;margin-bottom: 1.1111vw;}
	.content_wrapper {width: 100%;}
	.flex {display: flex; display: -webkit-flex;}
	.info_label { display:flex; -webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; width: 27.7778vw; border: 1px solid #828282; background-color:#d2d2d2;height: 8.3333vw;color:#000000; font-size:3.6111vw;; font-weight: bold;border-top:none;}
	.flex:first-child .info_label {border-top: 1px solid #828282;}
	.info_content {display:flex; -webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0; padding-left: 2.2222vw; -webkit-flex : 1 1 0; -webkit-align-items: center; align-items: center; height: 8.3333vw; border-bottom: 1px solid #828282; border-right: 1px solid #828282; background-color:#f2f2f2; color:#000000; font-size:3.6111vw;}
	.flex:first-child .info_content {border-top: 1px solid #828282;}
	.big_label {display:flex; width: 100%; -webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center;color:#000000; font-size:3.6111vw; font-weight: bold;border-left: 1px solid #828282; border-right: 1px solid #828282; height: 8.3333vw; background-color: #D2D2D2;}
	.text_content {color:#333333;  font-size:3.6111vw; padding:1.9444vw; border: 1px solid #828282; background-color: #f2f2f2;}
	.text_content span {display: block; color:#333333; font-size: 3.6111vw;}
	.submit_btn {width: 100%; height: 11.1111vw; background-color: #006CBA; font-size: 4.4444vw; font-weight: bold; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); color:white;border: none; margin-top:4.4444vw;}
	.counselDiagnosis {border: none; background-color: #F2F2F2; color:#2F80ED; font-size: 3.6111vw;}
	.info_content a { color: #2F80ED;}
</style>
<script>
	j$(document).ready(function(){
		$(".counselDiagnosis").click(function(){
			var counselCd = $(this).attr("counselCd");
			var intakeCd = $(this).attr("intakeCd");
			$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
			return false;
		});
		var rootLayer = $('#viewDetail').parent();
		setTimeout(function() {
			$('body').on('click', function(e) {
				if($(e.target).closest('.counsel_wrapper').length === 1) return;
				//close
				$("div[class='divpopuplayer']").eq($("div[class='divpopuplayer']").length-1).remove();
				rootLayer.fadeOut();
				$('body').off('click');
				$(this).css('overflow', 'auto');
			});
		}, 2000);
		
	});
</script>
<div class="counsel_wrapper">
	<div class="pop_title">상세보기 (신청코드 : ${intake_detail.counselCd })</div>
	<div class="box_title">인테이크</div>
	<div class="content_wrapper">
		<div class="flex">
			<div class="info_label">상담 받을 분</div>
			<div class="info_content">
				<input type="hidden" name="education" value="${intake_detail.relation }"/> 
				<comm:commNmOut option="commCd" code="${intake_detail.relation } "/>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">생년월일</div>
			<div class="info_content">
				<input type="hidden" name="rrn" value="${intake_detail.rrn }"/> 
				${intake_detail.rrn }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">성별</div>
			<div class="info_content">
				<input type="hidden" name="gender" value="${intake_detail.gender }"/> 
				${intake_detail.gender }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">성명</div>
			<div class="info_content">
				<input type="hidden" name="userNm" value="${baseInfo_detail.counselNm}"/>
				${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">학력/학년</div>
			<div class="info_content">
				<input type="hidden" name="education" value="${intake_detail.education }"/> 
				<comm:commNmOut option="commCd" code="${intake_detail.education } "/>
				<c:if test="${not empty intake_detail.session }">
					/
					<input type="hidden" name="session" value="${intake_detail.session }"/> 
					<comm:commNmOut option="commCd" code="${intake_detail.session } "/>
				</c:if>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">직업</div>
			<div class="info_content">
				<c:if test="${not empty intake_detail.job }">
					<input type="hidden" name="job" value="${intake_detail.job }"/> <comm:commNmOut option="commCd" code="${intake_detail.job }"/>
				</c:if>
				<c:if test="${empty intake_detail.job }">
					<input type="hidden" name="job" value="${intake_detail.job }"/> -
				</c:if>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">휴대전화</div>
			<div class="info_content">
				<input type="hidden" name="mobile" value="${intake_detail.mobile }"/> ${intake_detail.mobile }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">이메일</div>
			<div class="info_content">
				<input type="hidden" name="email" value="${intake_detail.email }"/> ${intake_detail.email }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">상담분야</div>
			<div class="info_content">
				<input type="hidden" name="counselDiv" value="${intake_detail.counselDiv }"/>${intake_detail.counselDivNm }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">상담 세부주제</div>
			<div class="info_content">
				<input type="hidden" name="cause" value="${intake_detail.cause }"/> ${intake_detail.cause }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">사전 질문</div>
			<div class="info_content">
				<c:choose>
					<c:when test="${baseInfo_detail.counselType eq '100433' }">
						<button class="counselDiagnosis" type="button" counselCd="${intake_detail.counselCd }" intakeCd="${intake_detail.intakeCd }">자세히 ></button>
					</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="big_label">자유기술</div>
		<div class="text_content">
			<input type="hidden" name="memo" value="${intake_detail.memo }"/> ${empty intake_detail.memo ? '-' : intake_detail.memo}
		</div>
	</div>
	<div class="box_title">기본 정보</div>
	<div class="content_wrapper">
		<div class="flex">
			<div class="info_label">상담일자</div>
			<div class="info_content">
				<input type="hidden" name="ymdSelect" value="${baseInfo_detail.scheduleDt}"/>${baseInfo_detail.scheduleDt}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">전화상담시간</div>
			<div class="info_content">
				<input type="hidden" name="timeSelect" value="${baseInfo_detail.time}"/>
				<c:if test="${not empty baseInfo_detail.time }">
					${baseInfo_detail.time.substring(0,2)}시간 ${baseInfo_detail.time.substring(2,4)}분
				</c:if>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">일지 작성일자</div>
			<div class="info_content">
				<input type="hidden" name="regDtSelect" value="${baseInfo_detail.regDt}"/>${baseInfo_detail.regDt}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">내담자명</div>
			<div class="info_content">
				<input type="hidden" name="counselNmSelect" value="${baseInfo_detail.counselNm}"/>
				<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}">${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm} ></a>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">신청코드</div>
			<div class="info_content">
				<input type="hidden" name="counselCdSelect" value="${baseInfo_detail.counselCd}"/>${baseInfo_detail.counselCd}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">상담사명</div>
			<div class="info_content">
				<input type="hidden" name="counselorNmSelect" value="${baseInfo_detail.counselorNm}"/>${baseInfo_detail.counselorNm}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">고객명</div>
			<div class="info_content">
				<input type="hidden" name="userNmSelect" value="${baseInfo_detail.userNm}"/>${baseInfo_detail.userNm}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">직원간의 관계</div>
			<div class="info_content">
				<input type="hidden" name="relation" value="${baseInfo_detail.relation}"/><comm:commNmOut option="commCd" code="${baseInfo_detail.relation}"/>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">고객사</div>
			<div class="info_content">
				<input type="hidden" name="clientNm" value="${baseInfo_detail.clientCd}"/>${baseInfo_detail.clientCd}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">연락처</div>
			<div class="info_content">
				<input type="hidden" name="mobile" value="${baseInfo_detail.mobile}"/>${baseInfo_detail.mobile}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">사례위험도</div>
			<div class="info_content">
				<input type="hidden" name="risksSelect" value="${baseInfo_detail.risks}"/>${baseInfo_detail.risks}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">회기정보</div>
			<div class="info_content">
				<input type="hidden" name="intakeNumSelect" value="${baseInfo_detail.extensionNum }"/>${baseInfo_detail.extensionNum }
			</div>
		</div>
		<div class="flex">
			<div class="info_label">서비스기간</div>
			<div class="info_content">${jedo.startDd } ~ ${jedo.endDd }</div>
		</div>
		<div class="flex">
			<div class="info_label">잔여/전체 포인트</div>
			<div class="info_content">${privateRemainPoint} / ${ceiling } </div>
		</div>
		<div class="big_label">고객사 주요정책</div>
		<div class="text_content">
			${baseInfo_detail.memo}
		</div>
	</div>
	<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}" style="text-decoration:none">
		<button class="submit_btn">연장 신청 및 동의서 등록 상세보기</button>
	</a>
	
</div>

<!-- <table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; " >
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ인테이크</span></h3></td>
	</tr>
	<tr>
		<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
		
			<tr align="left" height="30px" >
				<th class="line" align="center" width="13%">상담 받을 분</th>
				<td width="20%">
					<input type="hidden" name="education" value="${intake_detail.relation }"/> <comm:commNmOut option="commCd" code="${intake_detail.relation } "/>
				</td>
				<th class="line" align="center" width="13%">생년월일</th>
				<td width="15%">
					<input type="hidden" name="rrn" value="${intake_detail.rrn }"/> ${intake_detail.rrn }
				</td>
				<th class="line" align="center" width="13%">성별</th>
				<td>
					<input type="hidden" name="gender" value="${intake_detail.gender }"/> ${intake_detail.gender }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">성명</th>
				<td>
					<input type="hidden" name="userNm" value="${baseInfo_detail.counselNm}"/>${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}
					
					 
				</td>
				<th class="line" align="center">학력/학년</th>
				<td>
					<input type="hidden" name="education" value="${intake_detail.education }"/> <comm:commNmOut option="commCd" code="${intake_detail.education } "/>

					<c:if test="${not empty intake_detail.session }">
						/
						<input type="hidden" name="session" value="${intake_detail.session }"/> <comm:commNmOut option="commCd" code="${intake_detail.session } "/>
					</c:if>
				</td>
				<th class="line" align="center">직업</th>
				<td>
					<c:if test="${not empty intake_detail.job }">
						<input type="hidden" name="job" value="${intake_detail.job }"/> <comm:commNmOut option="commCd" code="${intake_detail.job }"/>
					</c:if>
					<c:if test="${empty intake_detail.job }">
						<input type="hidden" name="job" value="${intake_detail.job }"/> -
					</c:if>
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">휴대전화</th>
				<td>
					<input type="hidden" name="mobile" value="${intake_detail.mobile }"/> ${intake_detail.mobile }
				</td>
				<th class="line" align="center">이메일</th>
				<td>
					<input type="hidden" name="email" value="${intake_detail.email }"/> ${intake_detail.email }
				</td>
				<th class="line" align="center">상담분야</th>
				<td>
					<input type="hidden" name="counselDiv" value="${intake_detail.counselDiv }"/>${intake_detail.counselDivNm }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">상담방법</th>
				<td>
					<input type="hidden" name="counselType" value="${intake_detail.counselType }"/><comm:commNmOut option="commCd" code="${intake_detail.counselType }"/>
				</td>
				<th class="line" align="center">상담 세부주제</th>
				<td>
					<input type="hidden" name="cause" value="${intake_detail.cause }"/> ${intake_detail.cause }
				</td>
				<th class="line" align="center">사전질문</th>
				<td>
					<c:choose>
						<c:when test="${baseInfo_detail.counselType eq '100433' }">
							<button class="counselDiagnosis" type="button" counselCd="${intake_detail.counselCd }" intakeCd="${intake_detail.intakeCd }">자세히</button>
						</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">자유기술</th>
				<td colspan="5">
					<input type="hidden" name="memo" value="${intake_detail.memo }"/> ${empty intake_detail.memo ? '-' : intake_detail.memo}
				</td>
			</tr>
		</table>
	</tr>

	<tr>
		<td height="80px"></td>
	</tr>
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ기본정보</span></h3></td>
	</tr>
	<tr>
		<td>
		<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="13%">상담일자</th>
				<td width="20%">
					<input type="hidden" name="ymdSelect" value="${baseInfo_detail.scheduleDt}"/>${baseInfo_detail.scheduleDt}
				</td>
				<th class="line" align="center" width="13%">전화상담시간</th>
				<td width="15%">
					<input type="hidden" name="timeSelect" value="${baseInfo_detail.time}"/>
						<c:if test="${not empty baseInfo_detail.time }">
							${baseInfo_detail.time.substring(0,2)}시간 ${baseInfo_detail.time.substring(2,4)}분
						</c:if>
				</td>
				<th class="line" align="center" width="13%">일지 작성일자</th>
				<td>
					<input type="hidden" name="regDtSelect" value="${baseInfo_detail.regDt}"/>${baseInfo_detail.regDt}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">내담자명</th>
				<td>
					<input type="hidden" name="counselNmSelect" value="${baseInfo_detail.counselNm}"/>
					<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}"><strong>${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}(상세보기)</strong></a>
				</td>
				<th class="line" align="center">신청코드</th>
				<td>
					<input type="hidden" name="counselCdSelect" value="${baseInfo_detail.counselCd}"/>${baseInfo_detail.counselCd}
				</td>
				<th class="line" align="center">상담사명</th>
				<td>
					<input type="hidden" name="counselorNmSelect" value="${baseInfo_detail.counselorNm}"/>${baseInfo_detail.counselorNm}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">고객명</th>
				<td>
					<input type="hidden" name="userNmSelect" value="${baseInfo_detail.userNm}"/>${baseInfo_detail.userNm}
				</td>
				<th class="line" align="center">직원관의 관계</th>
				<td>
					<input type="hidden" name="relation" value="${baseInfo_detail.relation}"/><comm:commNmOut option="commCd" code="${baseInfo_detail.relation}"/>
				</td>
				<th class="line" align="center">고객사</th>
				<td>
					<input type="hidden" name="clientNm" value="${baseInfo_detail.clientCd}"/>${baseInfo_detail.clientCd}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">연락처</th>
				<td>
					<input type="hidden" name="mobile" value="${baseInfo_detail.mobile}"/>${baseInfo_detail.mobile}
				</td>
				<th class="line" align="center">사례위험도</th>
				<td>
					<input type="hidden" name="risksSelect" value="${baseInfo_detail.risks}"/>${baseInfo_detail.risks}
				</td>
				<th class="line" align="center">회기정보</th>
				<td>
					<input type="hidden" name="intakeNumSelect" value="${baseInfo_detail.extensionNum }"/>${baseInfo_detail.extensionNum }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">서비스 기간</th>
				<td colspan="2">
					${jedo.startDd } ~ ${jedo.endDd }
				</td>
				<th class="line" align="center">잔여/전체 포인트</th>
				<td colspan="2">
					${privateRemainPoint} / ${ceiling } 
				</td>
			</tr>
			<%-- <tr align="left" height="30px" >
				<th class="line" align="center" colspan="2">고객사 상담운영 담당자</th>
				<td colspan="4">
					<input type="hidden" name="mobile" value="${baseInfo_detail.counselMgrNm}"/>${baseInfo_detail.counselMgrNm}
				</td>
			</tr> --%>
			<tr align="left" height="30px" >
				<th class="line" align="center">고객사<br>주요정책</td>
				<td colspan="5">
					<textarea rows="5" cols="10" id="ir1" name="memo" style="width:100%; height:100px;" readonly="readonly">${baseInfo_detail.memo} </textarea>
					
				</td>
			</tr>
		</table>
		</td>
	</tr>
	
	<tr>
		<td height="60px"></td>
	</tr>
</table> -->
<!-- <br/>
<br/>
		<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}" style="text-decoration:none">
			<div style="height: 30px;border: 1px solid #666;width: 260px;line-height: 30px;font-size: 13px;">
			<strong>연장 신청 및 동의서 등록 상세보기</strong>
			</div>
		</a>
		<br/>
<br/> -->