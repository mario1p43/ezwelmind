<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>모바일 버전 관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchVersion").submit();
			return false;
	    };
	});

	j$("#insertBtn").click(function(){
		var url = "/madm/mobile/version/addVersionForm";
		location.href = url;
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchVersion").submit();
		return false;
	});

	j$(".versionDetail").click(function(){
		var appSeq = j$(this).attr("value");		
		location.href = "/madm/mobile/version/modifyVersionDetail?appSeq="+appSeq;
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

<form:form id="searchVersion" modelAttribute="VersionDto" action="/madm/mobile/version/versionManage" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">버전 등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>OS</strong></td>
						    	<td width="40%" align="left" colspan="3">
						    		<input type="radio" name="osType" value="" ${versionDto.osType == '' ? 'checked':''}>  전체
						    		<input type="radio" name="osType" value="I" ${versionDto.osType == 'I' ? 'checked':''}> IOS
						    		<input type="radio" name="osType" value="A" ${versionDto.osType == 'A' ? 'checked':''}> 안드로이드
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
									<!-- APP스플래쉬 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th width="5%">순번</th>
											<th width="5%">OS</th>
											<th width="5%">버전코드</th>
											<th width="5%">사용여부</th>
											<th width="50%">적용사항</th>
											<th width="5%">Update Date</th>
											<th width="25%">Download URL</th>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >
											<c:choose>
											<c:when test="${list.osType eq 'I' }">IOS</c:when>
											<c:when test="${list.osType eq 'A' }">안드로이드</c:when>
											<c:otherwise></c:otherwise>
											</c:choose>
											</td>
											<td >${list.versionCd }</td>
											<td >
											<c:choose>
											<c:when test="${list.useYn eq 'Y' }">사용</c:when>
											<c:when test="${list.useYn eq 'N' }">미사용</c:when>
											<c:otherwise></c:otherwise>
											</c:choose>
											</td>
											<td >
												<a href="#" class="versionDetail" value="${list.appSeq }">
													<strong>${list.content }</strong>
												</a>
											</td>
											<td >${list.updateDt }</td>
											<td >
												<c:if test="${empty list.apkPath}">
										    		<a href="${list.ipaPath}" download="downIpa">${list.ipaPath}</a>
										    	</c:if>
										    	<c:if test="${empty list.ipaPath}">
										    		<a href="${list.apkPath}" download="downApk">${list.apkPath}</a>
										    	</c:if>												
											</td>
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
									<!-- APP스플래쉬 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- APP스플래쉬 영역 종료 -->
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

