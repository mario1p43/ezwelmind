<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>팝업등록관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchPopup").submit();
			return false;
	    };
	});

	j$("#insertBtn").click(function(){
		var url = "/madm/popupManage/addPopupForm";
		location.href = url;
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchPopup").submit();
		return false;
	});

	j$(".popupDetail").click(function(){
		var popupSeq = j$(this).attr("value");
		location.href = "/madm/popupManage/modifyPopupDetail?popupSeq="+popupSeq;
		return false;
	});

	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#btendDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});
});
</script>
</head>
<body>

<form:form id="searchPopup" modelAttribute="invPopupDto" action="/madm/popupManage/popupMain" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">팝업등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>서비스</strong></td>
						    	<td colspan="3" width="90%" align="left">
						    		<select name="serviceType">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${serviceList}">
					            			<option value="${list.optionCd }" ${invPopupDto.serviceType == list.optionCd  ? 'selected':''}>${list.commNm}</option>
					            		</c:forEach>
						    		</select>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>팝업 제목</strong></td>
						    	<td width="40%" align="left">
									<input type="text" name="popupTitle" value="${invPopupDto.popupTitle }" style="width:350px;">
						    	</td>
						    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>팝업 URL</strong></td>
						    	<td width="40%" align="left">
									<input type="text" name="popupUrl" value="${invPopupDto.popupUrl }" style="width:350px;">
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>시작일/종료일</strong></td>
						    	<td width="40%" align="left">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${invPopupDto.startDt }"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${invPopupDto.endDt }"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>메뉴 URL</strong></td>
						    	<td width="40%" align="left">
						    		<input type="text" name="menuUrl" value="${invPopupDto.menuUrl }" style="width:350px;">
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
								    		<td id="btn01"><a href="#"><span id="insertBtn">신규등록</span></a></td>
								    		<td><span style="margin-left: 20px;"></span></td>
								    		<td id="btn01"><a href="#"><span id="searchBtn">검 색</span></a></td>
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
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="right">
												<strong>조회건 : ${paging.totalCount} </strong>
												<span style="margin-left: 20px;"></span>
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<td bgcolor="#F5F5F5"><strong>순번</strong></td>
											<td bgcolor="#F5F5F5"><strong>팝업코드</strong></td>
											<td bgcolor="#F5F5F5"><strong>팝업명</strong></td>
											<td bgcolor="#F5F5F5"><strong>우선순위</strong></td>
											<td bgcolor="#F5F5F5"><strong>시작일<br>종료일</strong></td>
											<td bgcolor="#F5F5F5"><strong>전체고객사<br>적용여부</strong></td>
											<td bgcolor="#F5F5F5"><strong>사용여부</strong></td>
											<td bgcolor="#F5F5F5"><strong>등록/수정자</strong></td>
											<td bgcolor="#F5F5F5"><strong>등록/수정일</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.popupSeq }</td>
											<td >
												<a href="#" class="popupDetail" value="${list.popupSeq }">
													<strong>${list.popupTitle }</strong>
												</a>
											</td>
											<td >${list.orderNo }</td>
											<td >${list.startDt }<br>~${list.endDt }</td>
											<td >${list.allClientYn }</td>
											<td >${list.useYn }</td>
											<td >${list.regId }</td>
											<td >${list.regDt }</td>
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
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>

</body>
</html>

