<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 선택</title>
<script type="text/javascript">

j$(document).ready(function(){
// 	j$("#svcChk").click(function(){

// 		var svcVal = j$(this).attr("value");
// 		var svcArr = svcVal.split('&');

// 		j$("#svcSeq").val(svcArr[0]);
// 		j$("#setSvcNm").val(svcArr[1]);

// 		var svcSeq = j$("#svcSeq").val();
// 		var svcNm = j$("#setSvcNm").val();
// 		alert(svcSeq);
// 		alert(svcNm);
// 	});
});

function svcChk(svcSeq, svcNm) {

	j$("#svcSeq").val(svcSeq);
	j$("#setSvcNm").val(svcNm);
}

function searchSvc() {
	var frm = document.serviceListForm;

	frm.submit();
}

function selectNm(){

	var svcSeq = j$("#svcSeq").val();
	var svcNm = j$("#setSvcNm").val();

	j$("#svcSeq").val('');
	j$("#setSvcNm").val('');

	//등록 창에서 호출했을 경우
	if(document.serviceListForm.Oform.value == "add"){
		window.opener.svcSet(svcSeq, svcNm);
// 		window.opener.addSurvey.svcSeq.value=svcSeq;
// 		window.opener.addSurvey.svcNm.value=svcNm;

	//수정 창에서 호출했을 경우
	}else if(document.serviceListForm.Oform.value == "update"){
		window.opener.svcSetUp(svcSeq, svcNm);
	}
	this.close();
}

</script>
</head>
<body>
<form id="serviceListForm" name="serviceListForm" action="/madm/survey/popup/serviceListPopup" method="POST">
<input type="hidden" id="Oform" name="Oform"  value="${param.Oform }"  />
<input type="hidden" id="svcSeq" name="svcSeq"  value=""  />
<input type="hidden" id="setSvcNm" name="setSvcNm"  value=""  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">서비스 선택</td>
				</tr>
			</table>
			<tr>
				<td height="10px"></td>
			</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>서비스명</strong></td>
						    	<td align="left">
						    		<input type="text" id="searchSvcNm" name="searchSvcNm" value="${param.searchSvcNm }"/>
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
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01">
								    			<input type="button" value="검 색" onclick="javascript:searchSvc();" >
								    		</td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="left">
												<strong>총 ${paging.totalCount} 건 |</strong>
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th >선택</th>
											<th >서비스명</th>
											<th >설명</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td ><input type="radio" value="${list.svcSeq}&${list.svcNm}" onclick="svcChk('${list.svcSeq}','${list.svcNm}');"/></td>
											<td >${list.svcNm }</td>
											<td >${list.svcDesc }</td>
										</tr>
										</c:forEach>
									</table>
									<br>
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
										<tr>
											<td height="10px"></td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" border="0" width="100%" >
													<tr>
											    		<td align="center">
															<input type="button" value="취 소" onClick="self.close();">
															<input type="button" value="적 용" onclick="javascript:selectNm();">
											    		</td>
									    			</tr>
									    		</table>
											</td>
										</tr>
										<tr>
											<td height="10px"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>
