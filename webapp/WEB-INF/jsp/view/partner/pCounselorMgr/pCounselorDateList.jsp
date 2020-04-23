<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인상담일지</title>

<script type="text/javascript">

j$(document).ready(function(){

	j$(".viewDetail").click(function(){
		var counselCd = $(this).attr("val");
		j$.divPop("viewDetail", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/intakeDetail?counselCd="+counselCd);
		return false;
	});
	
	j$("#enterNm").click(function(){
		if(j$("#beforeCounselCd").val() == ""){
			alert("신청코드를 입력해 주세요.");
			j$("#beforeCounselCd").focus();
			return false;
		}
		
		j$("#searchMgr").attr("action","/partner/pCounselorMgr/pCounselorDateInput");
		j$("#searchMgr").submit();
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchMgr").attr("action","/partner/pCounselorMgr/pCounselorDateList");
		var temp = "";
		var cnt = 0;

			// checkbox 값
			for(var i=0;i<document.searchMgr.elements["recordStatus"].length;i++){
				if(document.searchMgr.elements["recordStatus"][i].checked > 0){
					if(cnt!=0){
					   temp+=","+ document.searchMgr.elements["recordStatus"][i].value;

					}else{
					   temp+= document.searchMgr.elements["recordStatus"][i].value;
					}
					cnt++;
				    }
			    }
			document.searchMgr.elements["rStatusNm"].value = temp;



		j$("#searchMgr").submit();
		return false;
	});

	j$(".pCounselorDateModify").click(function(){
		var counselUser = j$(this).attr("value");
		var paramArr = counselUser.split('&');
		
		// 게시판일때
		if (paramArr[2] == "100435" && "${mindCounselIntakeDto.centerSeq}" != '10000462') {
			j$.ajax({
				url: '/partner/pCounselorMgr/pCounselBbs/confirm?intakeCd=' + paramArr[3],
				dataType: 'json',
				success: function(data){
					if (data.resultYn == "Y") {
						location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
						return false;
					} else {
						location.href = "/partner/pCounselorMgr/pCounselBbsAddForm?intakeCd=" + paramArr[3];
						return false;
					}
				}
			});
		}

		location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
		return false;
	});

	<c:if test='${not empty checkNo}'>
	var chkString = '${checkNo}';
	alert(chkString);
	</c:if>


	<c:if test='${not empty param.rStatusNm}'>
	var chkValue = '${param.rStatusNm}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=recordStatus][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>

	j$("#imsiBtn").click(function(){
		/* 게시판상담 답변등록 임시기능 */
		location.href = "/partner/pCounselorMgr/pCounselBbsAddForm?intakeCd=1000000729" ;
		return false;
	});

	$(".counselDiagnosis").click(function(){
		var counselCd = $(this).attr("counselCd");
		var intakeCd = $(this).attr("intakeCd");
		$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
		return false;
	});
	
});
</script>
</head>
<body>

<form id="searchMgr" name="searchMgr" action="/partner/pCounselorMgr/pCounselorDateList" method="post">
<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">개인상담일지</td>
			</tr>
		</table>
	</td>
</tr>

 <tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table align="right">
			<tr >
				<td> <font size="2px" style="font-weight: bold">상담일지조회(신청코드입력)</font>
					<input type="text" style="width:200px; height:20px;" name="beforeCounselCd" id="beforeCounselCd" value="${param.beforeCounselCd}"/>
					<input type="button" id="enterNm" name="enterNm" value="입력"/>
					<br/>
					<div style="font-weight: bold; color:red; margin-top:15px;">
						* 신청코드 입력 후 입력버튼 클릭 시 일지 조회 가능<br/>
						* 일지상태 "작성"글자 클릭 시 상담일지 작성 가능
					</div>
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td>
		<!-- 컨텐츠 -->
		<table cellpadding="5" cellspacing="0" border="1"  width="100%" style="border-collapse:collapse;">
			<tr>
				<th align="center" width="13%">신청코드</th>
				<td><input type="text" name="counselCd" id="counselCd" size="30%" maxlength="11" value="${param.counselCd }"/></td>
				<th align="center" width="13%">고객명</th>
				<td><input type="text" name="userNm" id="userNm" size="30%" maxlength="25" value="${param.userNm }"/></td>
			</tr>
			<tr>
				<th align="center">내담자명</th>
				<td colspan="3"><input type="text" name="counselNm" id="counselNm" size="30%" maxlength="25" value="${param.counselNm }"/></td>
			</tr>
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
			<tr>
				<th align="center">상담사명</th>
				<td colspan="3"><input type="text" name="counselorNm" id="counselorId" size="30%" maxlength="25" value="${param.counselorNm }"/></td>
			</tr>
			</sec:authorize>
			<tr>
				<th align="center">일지상태</th>
				<td colspan="3">
					<input type="checkbox" name="recordStatus" value="100692"></input>완료
					<input type="checkbox" name="recordStatus" value="100693"></input>작성
					<input type="checkbox" name="recordStatus" value="100694"></input>소명
					<input type="checkbox" name="recordStatus" value="100695"></input>불가
					<input type="checkbox" name="recordStatus" value="100696"></input>N/S
					<input type="hidden" name="rStatusNm" value="${param.rStatusNm}" >
				</td>
			</tr>

		</table>
		<!-- 컨텐츠 끝 -->
	</td>
</tr>


<tr><td height="20px"></td></tr>

<tr>
	<td align="center">
		<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검색"/>
	</td>
</tr>
<c:if test="${not empty paging}">
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
				<tr>
					<td align="left" width="30%">
					<c:choose>
						<c:when test="${checkNo != null}">
							<strong>
								총 건 |
							</strong>
							<span style="margin-left: 5px;"></span>
							<strong>페이지 : / </strong>
						</c:when>
						<c:otherwise>
							<strong>
								총 ${paging.totalCount}건 |
							</strong>
							<span style="margin-left: 5px;"></span>
							<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<!-- 목록 -->
			<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
					<tr>
						<th width="5%" >순번</th>
						<th width="8%" >신청코드</th>
						<th width="15%">고객사</th>
						<th width="8%" >고객명</th>
						<th width="8%">내담자명</th>
						<th width="12%">상담분야</th>
						<th width="12%">상담방법</th>
						<th width="8%">상담사</th>
						<th width="12%">상담일</th>
						<th width="5%">회기</th>
						<th width="7%">일지상태</th>
					</tr>
				</thead>
	
				<tbody>
				 	<c:forEach var="list" items="${paging.list}" varStatus="status">
						<tr align="" height="50px">
							<td class="" width="" align="" bgcolor="">
								${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
							</td>
							<td>${list.counselCd}</td>
							<td>${list.clientNm}</td>
							<td>${list.userNm}</td>
							<td class="viewDetail" val="${list.counselCd }">
								<div  style="font-weight: bold; color: blue;cursor: pointer;">
									${list.counselNm }
								</div>
							</td>
							<td><comm:commNmOut option="category" code="${list.counselDiv}"/></td>
							<td><comm:commNmOut option="commCd" code="${list.counselType}"/></td>
							<td>${list.counselorNm}</td>
							<td>${list.scheduleDt}</td>
							<td>${list.extensionNum}</td>
							<c:choose>
								<c:when test="${list.status == 101238}">
									<td><strong><comm:commNmOut option="commCd" code="${list.status}"/></strong></td>
								</c:when>
								<c:when test="${list.recordStatus == 100695}">
									<td><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></td>
								</c:when>
								<c:otherwise>
									<td><a href="#" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong>
										<comm:commNmOut option="commCd" code="${list.recordStatus}"/>
									</strong></a></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 목록 끝 -->
			<br />
	
			<!-- 페이징 처리 -->
			<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
				<tr>
					<td align="center">
					 <ui:paging value="${paging}"
						btnFirst="${url:img('/images/btn_first.jpg')}"
						btnPrev="${url:img('/images/btn_prev.jpg')}"
						btnNext="${url:img('/images/btn_next.jpg')}"
						btnLast="${url:img('/images/btn_last.jpg')}" />
					</td>
				</tr>
			</table>
			<!-- 페이징 처리 끝 -->
		</td>
	</tr>
</c:if>
</table>
</form>
</body>
</html>

