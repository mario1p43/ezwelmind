<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>모바일 푸쉬관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchBnr").submit();
			return false;
	    };
	});

	j$("#insertBtn").click(function(){
		var url = "/madm/mobile/push/addPushForm";
		location.href = url;
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchBnr").submit();
		return false;
	});

	j$(".pushDetail").click(function(){
		var bnrSeq = j$(this).attr("value");
		location.href = "/madm/mobile/push/modifyPushDetail?pushSeq="+bnrSeq;
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

<script type="text/javascript">
function viewlayoutHtml(strObj){
	if(strObj == "null"){
    	return false;
	}

	var X = event.x;
	var Y = event.y;
	var viewObj;
	var viewDiv = document.getElementById("viewlayout");

	if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1){
		viewObj="<img src='"+strObj+"'>";
	} else {
		viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
	}
	
	X -= 100;
	Y += 30;
	
	viewDiv.style.left = X+"px";
	viewDiv.style.top  = Y+"px";
	viewDiv.style.display = "block";
	viewDiv.innerHTML=viewObj; 
}

function cutlayout(){
	var viewDiv = document.getElementById("viewlayout");
		viewDiv.style.display = "none";
}
</script>
</head>
<body>

<form:form id="searchBnr" modelAttribute="pushDto" action="/madm/mobile/push/pushManage" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">PUSH 등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>검색</strong></td>
						    	<td width="40%" align="left">
					    			<select name="searchType">
					    				<option value="regId">등록ID</option>
					    				<option value="title">타이틀</option>
					    			</select>
						    		<input type="text" name="searchValue" value="" style="width:200px;" />
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>OS</strong></td>
						    	<td width="40%" align="left">
						    		<select name="osType">
						    			<option value="">전체</option>
						    			<option value="I">IOS</option>
						    			<option value="A">안드로이드</option>
						    		</select>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>등록일</strong></td>
						    	<td width="90%" align="left" colspan="3">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${pushDto.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${pushDto.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
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
						<!-- 푸쉬 영역 시작 -->
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
									<!-- 푸쉬 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th width="5%">순번</th>
											<th width="5%">PUSH번호</th>
											<th width="17%">타이틀</th>
											<th width="5%">OS</th>
											<th width="6%">등록자</th>
											<th width="7%">발송일시</th>
											<th width="5%">상태</th>
											<th width="5%">발송대상자</th>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.pushSeq }</td>
											<td >
												<a href="#" class="pushDetail" value="${list.pushSeq }">
													<strong>${list.title }</strong>
												</a>
											</td>
											<td >
											<c:choose>
											<c:when test="${list.osType eq 'I' }">IOS</c:when>
											<c:when test="${list.osType eq 'A' }">안드로이드</c:when>
											<c:otherwise></c:otherwise>
											</c:choose>
											</td>
											<td >${list.regId }</td>
											<td >${list.sendDt }</td>
											<td >
												<c:choose>
												<c:when test="${list.status eq 'Y'}">완료</c:when>
												<c:otherwise>대기</c:otherwise>
												</c:choose>
											</td>
											<td >${list.pushCnt }</td>
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
									<!-- 푸쉬 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 푸쉬 영역 종료 -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

