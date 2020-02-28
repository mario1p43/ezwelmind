<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>CSP 업체명</title>
<script type="text/javascript">


function selectNm(Cd){
	window.opener.onlinementalform.goodsLink.value = Cd;
	self.close();
}
</script>
</head>
<body>
<form id="cspForm" name="cspForm" action="/madm/service/enrollment/cspPopup" method="POST" >
<input type="hidden" id="Oform" name="Oform"  value="${param.Oform }"  />
<input type="hidden" name="cspstatustmp"  value="${param.cspstatustmp }"  />

	<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">

			<tr>
				<td height="10px"></td>
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
											<th >일련번호</th>
											<th >프로모션명</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${list.grpSeq }</td>
											<td ><a href="javascript:selectNm( '${list.grpSeq}');">${list.grpNm }</a></td>
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
		
</form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>
