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

function selectNm(Cd,Nm){
	//등록상품 창에서 호출했을 경우 
	if(document.cspForm.Oform.value == "add"){
		window.opener.addGoodsForm.searchcsp.value=Nm;;
		self.close();
	}
	//등로대기상품 창에서 호출했을 경우
	if(document.cspForm.Oform.value == "delay"){
		window.opener.adddelayForm.searchcsp.value=Nm;;
		self.close();
	}
	if(document.cspForm.Oform.value == "addp"){
		window.opener.addpGoodsForm.searchcsp.value=Nm;;
		self.close();
	}
	if(document.cspForm.Oform.value == "csp"){
		window.opener.subGoodsForm.searchCspCd.value=Cd;
		window.opener.subGoodsForm.searchCspNm.value=Nm;
		self.close();
	}
	if(document.cspForm.Oform.value == "sub"){
		window.opener.subGoodsForm.searchClientCd.value=Cd;
		window.opener.subGoodsForm.searchClientNm.value=Nm;
		self.close();
	}
}
</script>
</head>
<body>
<form id="cspForm" name="cspForm" action="/madm/service/management/cspPopup" method="POST">
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
					<td align="left" class="subtitle">
						<c:if test="${param.Oform ne 'sub'}">
							CSP 업체명
						</c:if>
						<c:if test="${param.Oform eq 'sub'}">
							고객사
						</c:if>
					</td>
				</tr>
			</table>
			<tr>
				<td height="10px"></td>
			</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<c:if test="${param.Oform ne 'sub'}">
								<tr align="left" height="30px">
									<td bgcolor="#F5F5F5" align="center"><strong>유형구분</strong></td>
							    		<td class="line" colspan="3" >
							    		<input  type="checkbox" name="cspType1" value="100718" ${param.cspType1 == "100718" ? 'checked' : '' }> 온라인강좌
							    		<input  type="checkbox" name="cspType2" value="100720" ${param.cspType2 == "100720" ? 'checked' : '' }> 온라인심리검사
							    		<input  type="checkbox" name="cspType3" value="100721" ${param.cspType3 == "100721" ? 'checked' : '' }> 집단교육
							    		<input  type="checkbox" name="cspType4" value="100722" ${param.cspType4 == "100722" ? 'checked' : '' }> 배송
							    	</td>
								</tr>
							</c:if>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>
								<c:if test="${param.Oform ne 'sub'}">
								CSP 코드
								</c:if>
								<c:if test="${param.Oform eq 'sub'}">
								고객사 코드
								</c:if>
								</strong></td>
								<td>
									<input type="text" id="cspCd" name="cspCd" value="${param.cspCd }" />
								</td>
								<td bgcolor="#F5F5F5" align="center"><strong>
								<c:if test="${param.Oform ne 'sub'}">
								CSP 업체명
								</c:if>
								<c:if test="${param.Oform eq 'sub'}">
								고객사명
								</c:if>
								</strong></td>
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
											<th >
												<c:if test="${param.Oform ne 'sub'}">
													CSP 코드
												</c:if>
												<c:if test="${param.Oform eq 'sub'}">
													고객사 코드
												</c:if>
											</th>
											<th >
												<c:if test="${param.Oform ne 'sub'}">
													CSP 업체명
												</c:if>
												<c:if test="${param.Oform eq 'sub'}">
													고객사명
												</c:if>
											</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${list.cspCd }</td>
											<td ><a href="javascript:selectNm( '${list.cspCd} ','${list.cspNm} ');"  >${list.cspNm }</a></td>
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
