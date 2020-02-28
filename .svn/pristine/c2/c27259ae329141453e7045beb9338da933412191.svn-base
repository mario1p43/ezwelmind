<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>Menu 리스트</title>
<script type="text/javascript">
function getMenu() {
	var fr = document.menuForm;
	fr.submit();
}

function selectNm(Cd,Nm){
	//등록상품 창에서 호출했을 경우 
	if(document.menuForm.Oform.value == "add"){
		window.opener.addpromotionForm.promotionmenuCd.value=Cd;
		window.opener.addpromotionForm.promotionmenu.value=Nm;
		self.close();
	}
	//등로대기상품 창에서 호출했을 경우
	if(document.menuForm.Oform.value == "modify"){
		window.opener.modifypromotionForm.promotionmenuCd.value=Cd;
		window.opener.modifypromotionForm.promotionmenu.value=Nm;
		self.close();
	}
}
</script>
</head>
<body>
<form id="menuForm" name="menuForm" action="/madm/service/exposure/menuPopup" method="POST">
<input type="hidden" id="Oform" name="Oform"  value="${param.Oform }"  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">Menu 리스트</td>
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
								<td bgcolor="#F5F5F5" align="center"><strong>메뉴 코드</strong></td>
								<td>
									<input type="text" id="menuCd" name="menuCd" value="${param.menuCd }" />
								</td>
								<td bgcolor="#F5F5F5" align="center"><strong>메뉴명</strong></td>
						    	<td align="left">
						    		<input type="text" id="menuNm" name="menuNm" value="${param.menuNm }" />
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
								    			<input type="button" value="검 색" onclick="javascript:getMenu();" >
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
											<th >메뉴 코드</th>
											<th >메뉴명</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${list.menuCd }</td>
											<td ><a href="javascript:selectNm( '${list.menuCd} ','${list.menuNm} ');"  >${list.menuNm }</a></td>
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
