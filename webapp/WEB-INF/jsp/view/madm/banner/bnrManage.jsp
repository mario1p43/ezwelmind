<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너등록관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchBnr").submit();
			return false;
	    };
	});

	j$("#insertBtn").click(function(){
		var url = "/madm/banner/addBnrForm";
		location.href = url;
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchBnr").submit();
		return false;
	});

	j$(".bannerDetail").click(function(){
		var bnrSeq = j$(this).attr("value");
		location.href = "/madm/banner/modifyBnrDetail?bannerSeq="+bnrSeq;
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

	var X = screen.width/2;
	var Y = screen.height/2 - 300;
	var viewObj;
	var viewDiv = document.getElementById("viewlayout");

	if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1){
		viewObj="<img src='"+strObj+"'>";
	} else {
		viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
	}
	
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

<form:form id="searchBnr" modelAttribute="invBannerDto" action="/madm/banner/bnrManage" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">배너등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>코너</strong></td>
						    	<td colspan="3" width="90%" align="left">
						    		<select name="cornerCd">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${cornerList}" varStatus="status">
						    				<option value="${list.cornerCd}" ${invBannerDto.cornerCd == list.cornerCd  ? 'selected':''}>${list.cornerNm}</option>
										</c:forEach>
						    		</select>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>시작일/종료일</strong></td>
						    	<td width="40%" align="left">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${invBannerDto.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${invBannerDto.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>사용유무</strong></td>
						    	<td width="40%" align="left">
						    		<input type="radio" name="useYn" value="" >  전체
						    		<input type="radio" name="useYn" value="Y" ${invBannerDto.useYn == 'Y' ? 'checked':''}> 사용
						    		<input type="radio" name="useYn" value="N" ${invBannerDto.useYn == 'N' ? 'checked':''}> 비사용
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>배너명</strong></td>
						    	<td width="40%" align="left">
						    		<input name="bannerNm" value="${invBannerDto.bannerNm }" type="text" style="width:200px;"/>
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>타이틀</strong></td>
						    	<td width="40%" align="left">
						    		<input name="subject" value="${invBannerDto.subject }" type="text" style="width:200px;"/>
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
											<th width="5%">순번</th>
											<th width="5%">배너번호</th>
											<th width="5%">채널코드</th>
											<th width="5%">코너코드</th>
											<th width="20%">배너명</th>
											<th width="17%">타이틀</th>
											<th width="20%">노출URL</th>
											<th width="5%">우선순위</th>
											<th width="6%">미리보기</th>
											<th width="7%">시작일<br>종료일</th>
											<th width="5%">사용여부</th>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.bannerSeq }</td>
											<td >${list.channelCd }</td>
											<td >${list.cornerCd }</td>
											<td >
												<a href="#" class="bannerDetail" value="${list.bannerSeq }">
													<strong>${list.bannerNm }</strong>
												</a>
											</td>
											<td >${list.subject }</td>
											<td >${list.targetLink }</td>
											<td ></td>
											<td >
												<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${list.bannerImgUrl}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${list.bannerImgUrl}')" onMouseOut="cutlayout()"></a>
											</td>
											<td >${list.startDt }<br>~${list.endDt }</td>
											<td >${list.useYn }</td>
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
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

