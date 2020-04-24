<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>개인상담일지</title>
<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.counsel-wrapper{padding:0 5vw}
	.counsel-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.counsel-wrapper .content-wrapper:first-child{margin-top:0vw}
	.counsel-wrapper .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height: 130%}
	.counsel-wrapper .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.counsel-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.counsel-wrapper .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.counsel-wrapper .content-wrapper .input-block .input-btn{width:40px;float:right;padding:4px;color:#004B85;font-weight:bold;font-size:16px;line-height:130%;text-align:center}
	.counsel-wrapper .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.counsel-wrapper .content-wrapper .search-btn{height:40px;width:100%;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.counsel-wrapper .description{color:red;font-size:12px;line-height: 130%}
	
	.counsel-wrapper .data-list-wrapper{display:table;width:100%;margin-top:2vw;table-layout:fixed;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper .result-list-left{float:left;width:calc(40% - 1px);border-right:1px solid #C4C4C4}
	.counsel-wrapper .data-list-wrapper .result-list-right{float:left;width:60%;overflow:auto}
	.counsel-wrapper .data-list-wrapper table{width:100%;text-align:center;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper table thead{background-color:#F2F2F2;border-bottom:1px solid #C4C4C4}
	.counsel-wrapper .data-list-wrapper .result-list-left table tr th{height:32px;padding:0}
	.counsel-wrapper .data-list-wrapper .result-list-right table tr th{height:32px;padding:0 2vw}
	.counsel-wrapper .data-list-wrapper table tr td{height:44px;padding:0 2vw}
	.counsel-wrapper .data-list-wrapper table tr:nth-child(odd){background-color:#E0E0E0}
	.counsel-wrapper .data-list-wrapper table tr:nth-child(even){background-color:#F2F2F2}
</style>

<script type="text/javascript">

j$(document).ready(function(){

	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', "${url:resource('/resources/img/re_list_icon_active.png')}");

	j$(".viewDetail").click(function(){
		var counselCd = $(this).attr("val");
		j$.divPop_mo("viewDetail", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/intakeDetail?counselCd="+counselCd);
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
		$.divPop_mo("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
		return false;
	});
	
});
</script>
</head>
<body>

<form id="searchMgr" name="searchMgr" action="/partner/pCounselorMgr/pCounselorDateList" method="post">
	<div class="counsel-wrapper">
		<div class="content-wrapper">
			<div class="title-block">상담일지조회(신청코드입력)</div>
			<div class="input-block line-bottom">
				<input type="text" name="beforeCounselCd" id="beforeCounselCd" value="${param.beforeCounselCd}" style="width:calc(100% - 48px)"/>
				<span id="enterNm" class="input-btn">입력</span>
			</div>
		</div>
		<div class="description">
			* 신청코드 입력 후 입력버튼 클릭 시 일지 조회 가능<br/>
			* 일지상태 "작성"글자 클릭 시 상담일지 작성 가능
		</div>
		<div class="content-wrapper">
			<div class="title-block">신청코드</div>
			<div class="input-block line-bottom">
				<input type="text" name="counselCd" id="counselCd" size="30%" maxlength="11" value="${param.counselCd }"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">고객명</div>
			<div class="input-block line-bottom">
				<input type="text" name="userNm" id="userNm" size="30%" maxlength="25" value="${param.userNm }"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">내담자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="counselNm" id="counselNm" size="30%" maxlength="25" value="${param.counselNm }"/>
			</div>
		</div>
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
		<div class="content-wrapper">
			<div class="title-block">상담사명</div>
			<div class="input-block line-bottom">
				<input type="text" name="counselorNm" id="counselorId" size="30%" maxlength="25" value="${param.counselorNm }"/>
			</div>
		</div>
		</sec:authorize>
		<div class="content-wrapper">
			<div class="title-block">일지상태</div>
			<div class="input-block">
				<div class="checkbox-wrapper">
					<input type="checkbox" name="recordStatus" id="recordStatus1" value="100692">
					<label for="recordStatus1"></label>
					<label for="recordStatus1">완료</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="recordStatus" id="recordStatus2" value="100693">
					<label for="recordStatus2"></label>
					<label for="recordStatus2">작성</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="recordStatus" id="recordStatus3" value="100694">
					<label for="recordStatus3"></label>
					<label for="recordStatus3">소명</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="recordStatus" id="recordStatus4" value="100695">
					<label for="recordStatus4"></label>
					<label for="recordStatus4">불가</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="recordStatus" id="recordStatus5" value="100696">
					<label for="recordStatus5"></label>
					<label for="recordStatus5">N/S</label>
				</div>
				<input type="hidden" name="rStatusNm" value="${param.rStatusNm}" >
			</div>
		</div>
		<div class="content-wrapper">
			<input type="button" id="searchBtn" name="searchBtn" class="search-btn" value="검색"/>
		</div>
		<c:if test="${not empty paging}">
			<div class="content-wrapper">
			<c:choose>
				<c:when test="${checkNo != null}">
					총 | 페이지 : /
				</c:when>
				<c:otherwise>
					총 ${paging.totalCount}건 | 페이지 : ${paging.currentPage}/${paging.getPageCount()}
				</c:otherwise>
			</c:choose>
			</div>
			<div class="data-list-wrapper">
				<div class="result-list-left">
					<table border="0" style="width:100%;text-align:center;border-collapse:collapse;">
						<thead>
							<tr>
								<th width="25%">선택</th>
								<th width="25%">순번</th>
								<th width="50%">신청코드</th>
							</tr>
						</thead>
						<tbody>
						 	<c:forEach var="list" items="${paging.list}" varStatus="status">
								<tr>
									<td>
										<div class="checkbox-wrapper">
											<input type="checkbox" id="data${status.index}">
											<label for="data${status.index}"></label>
										</div>
									</td>
									<td>
										${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
									</td>
									<td>${list.counselCd}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="result-list-right">
					<div style="width:max-content">
						<table border="0" style="width:100%;text-align:center;border-collapse:collapse;">
							<thead>
								<tr>
									<th>고객사</th>
									<th>고객명</th>
									<th>내담자명</th>
									<th>상담분야</th>
									<th>상담방법</th>
									<th>상담사</th>
									<th>상담일</th>
									<th>회기</th>
									<th>일지상태</th>
								</tr>
							</thead>
							<tbody>
							 	<c:forEach var="list" items="${paging.list}" varStatus="status">
									<tr>
										<td style="font-weight:bold">${list.clientNm}</td>
										<td>${list.userNm}</td>
										<td class="viewDetail" val="${list.counselCd }">
											<div style="cursor:pointer;">
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
											<c:when test="${list.recordStatus == 101238}">
												<td><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></td>
											</c:when>
											<c:when test="${list.recordStatus == 100695}">
												<td><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></td>
											</c:when>
											<c:otherwise>
												<td><a href="#" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" >
												<strong style="color:#2F80ED">
												<comm:commNmOut option="commCd" code="${list.recordStatus}"/>
												&gt;</strong></a></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="content-wrapper">
				<table border="0" width="100%" style="border-collapse:collapse;">
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
			</div>
		</c:if>
	</div>
</form>
</body>
</html>

