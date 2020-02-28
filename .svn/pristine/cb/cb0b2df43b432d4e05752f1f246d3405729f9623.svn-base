<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>CSP 업체명</title>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
window.onload = function() {
	$("#cspCd , #cspNm").keypress(function(e) {
		if(e.which == 13 || e.keyCode == 13){
			getcsp();
		}
	})
};

function getcsp() {
	var frm = document.cspForm;
	var temp ="" ;
	var cnt = 0;
	
	/* for(var i=0;i<frm.elements["cspstatus"].length;i++){
		if(frm.elements["cspstatus"][i].checked > 0){
			if(cnt!=0){   
				temp +=","+ frm.elements["cspstatus"][i].value + '';
			}else{
				temp += '' + frm.elements["cspstatus"][i].value + '';
			}
			cnt++;
		}
	}
	frm.elements["cspstatustmp"].value = temp; */
	
	frm.submit();
}

function selectNm(Nm,Cd){
	if(document.cspForm.Oform.value == "csp"){
		window.opener.cspList.searchcsp.value=Nm;
		window.opener.cspList.searchcspNm.value=Nm;
		window.opener.cspList.searchcspCd.value=Cd;
		self.close();
	}
	if(document.cspForm.Oform.value == "cspAccount"){
		window.opener.cspAdd.searchcsp.value=Nm;
		window.opener.cspAdd.searchcspCd.value=Cd;
		self.close();
	}

}
</script>
</head>
<body>
<form id="cspForm" name="cspForm" action="/partner/service/csp/cspPopup" method="POST">
<input type="hidden" id="Oform" name="Oform"  value="${param.Oform }"  />
<input type="hidden" name="cspstatustmp"  value="${param.cspstatustmp }"  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">CSP 업체명</td>
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
								<td bgcolor="#F5F5F5" align="center"><strong>유형구분</strong></td>
						    		<td class="line" colspan="3" >
						    		<input  type="checkbox" name="cspType1" value="100718" ${param.cspType1 == "100718" ? 'checked' : '' }> 온라인강좌
						    		<input  type="checkbox" name="cspType2" value="100720" ${param.cspType2 == "100720" ? 'checked' : '' }> 온라인심리검사
						    		<input  type="checkbox" name="cspType3" value="100721" ${param.cspType3 == "100721" ? 'checked' : '' }> 집단교육
						    		<input  type="checkbox" name="cspType4" value="100722" ${param.cspType4 == "100722" ? 'checked' : '' }> 배송
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>CSP 코드</strong></td>
								<td>
									<input type="text" id="cspCd" name="cspCd" value="${param.cspCd }" />
								</td>
								<td bgcolor="#F5F5F5" align="center"><strong>CSP 업체명</strong></td>
						    	<td align="left">
						    		<input type="text" id="cspNm" name="cspNm" value="${param.cspNm }" />
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
								    			<!-- <a href="#"><span class="searchbtn" onclick="javascript:getcsp()">검 색</span></a> -->
								    			<input type="button" value="검 색" onclick="javascript:getcsp();" >
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
											<th >CSP 코드</th>
											<th >CSP 업체명</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${list.cspCd }</td>
											<td ><a href="javascript:selectNm( '${list.cspNm}','${list.cspCd}');"  >${list.cspNm }</a></td>
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
