<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date ct = new Date();
	SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
	
	//today
	String today = fmt.format(ct);
	
	//today-7
	ct.setDate(ct.getDate()-7);
	String owa = fmt.format(ct);
	
	//today -15
	ct.setDate(ct.getDate()-8);
	String hma = fmt.format(ct);
	
	//today -30
	ct.setDate(ct.getDate()-15);
	String oma = fmt.format(ct);

	//today -90
	ct.setDate(ct.getDate()-60);
	String tma = fmt.format(ct);
	
%>
<html>
<head>
<title>고객사 업무요청</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	//j$("#searchBnr").submit();
			return false;
	    };
	});

	j$("#searchBtn").click(function(){
		j$("#frm").submit();
		return false;
	});
	
	j$(".replyBtn").click(function(){
		var dataSeq = j$(this).attr("value");
		location.href = "/madm/ecrm/addTaskRequestForm?dataSeq="+dataSeq;
	});

	j$(".taskDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		location.href = "/madm/ecrm/taskRequestDetail?dataSeq="+dataSeq;
	});
	
	j$('.date_timepicker_start').datetimepicker({
		format:'Ymd',
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
		format:'Ymd',
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

function clientReload(setType){
	if(setType == "sel"){
		var tempClientCd = $("#clientCd option:selected").val();
		if(tempClientCd == "") return;
		var tempClientNm = $("#clientCd option:selected").text();
		$("#chkClientCd").val(tempClientNm);
	}else if(setType == "txt"){
		var tempClientCd = $("#chkClientCd").val();
		if(tempClientCd == "") return;
		
		var clientList = new Array();
		<c:forEach var="list" items="${clientList}">
		var arr = { nm : "${list.clientNm}", cd : "${list.clientCd}"};
		clientList.push(arr);
		</c:forEach>
		
		for(var i=0 ; i < clientList.length ; i++){
			var checkClientArr = clientList[i];
			if(checkClientArr.nm.indexOf(tempClientCd) != -1) {
				$("#clientCd").val(checkClientArr.cd);
				break;
			}	
		}
	}
}

function jsSearchDate(arg) {
	
	var fr = document.frm;
	var startDt = "startDt";
	var endDt	= "endDt";
	
     if (arg == "today") { //오늘
    	fr.elements[startDt].value  = <%=today %>;
    	fr.elements[endDt].value  = <%=today %>;
    }
    if (arg == "week") {  //일주일
    	fr.elements[startDt].value  = <%=owa %>;
    	fr.elements[endDt].value  = <%=today %>;
    }
    if (arg == "halfMonth") {  //보름
    	fr.elements[startDt].value  = <%=hma %>;
    	fr.elements[endDt].value  = <%=today %>;
    }
    if (arg == "month") {  //한달
    	fr.elements[startDt].value  = <%=oma %>;
    	fr.elements[endDt].value  = <%=today %>;
    }
    if (arg == "threeMonths") {  //세달
    	fr.elements[startDt].value  = <%=tma %>;
    	fr.elements[endDt].value  = <%=today %>;
    } 
}

function jsSearchDateClear() {
	var startDt = "startDt";
	var endDt	= "endDt";
	var fr = document.frm;

	fr.elements[startDt].value = "";
	fr.elements[endDt].value = "";
} 

</script>
</head>
<body>
<form id="frm" name="frm" action="/madm/ecrm/taskRequestList">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">고객사 업무요청</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객사</strong></td>
						    	<td width="40%" colspan="3" align="left">
						    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${clientList}">
						    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq ecrmTaskDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
						    			</c:forEach>
						    		</select>
						    		<input type="text" id="chkClientCd" value="${ecrmTaskDto.clientCd }" onkeyup="clientReload('txt');" style="width:350px;" placeholder="고객사명을 입력 또는 선택하세요.">
						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>유형</strong></td>
						    	<td width="40%" align="left">
						    		<comm:select name="searchType"   code="100570"  basicValue="---- 선택 ----" selectValue="${ecrmTaskDto.searchType}" />
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>진행상태</strong></td>
						    	<td width="40%" align="left">
						    		<comm:select name="searchStatus" code="100563"  basicValue="---- 선택 ----" selectValue="${ecrmTaskDto.searchStatus}" />
						    	</td>
							</tr> 
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>검색어</strong></td>
						    	<td width="40%" colspan="3" align="left">
						    		<select name="searchNmType" style="height: 20px;">
						    			<option value="">---- 선택 ----</option>
						    			<option value="제목" 	<c:if test="${ecrmTaskDto.searchNmType eq '제목'}"> selected </c:if> >제목</option>
						    			<option value="등록자" 	<c:if test="${ecrmTaskDto.searchNmType eq '등록자'}"> selected </c:if> >등록자</option>
						    			<option value="담당자"	<c:if test="${ecrmTaskDto.searchNmType eq '담당자'}"> selected </c:if> >담당자</option>
						    		</select>
						    		<input type="text" name="searchNm" placeholder="검색어를 입력하세요." value="${ecrmTaskDto.searchNm }" style="width:350px;">
						    	</td>
							</tr>
							<tr align="left" height="30px">
						    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>요청일</strong></td>
						    	<td width="40%" colspan="3" align="left" id="btn01">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${ecrmTaskDto.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${ecrmTaskDto.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />&nbsp;
									<input type="button" value="오늘" 	onclick="javascript:jsSearchDate('today');">&nbsp;
									<input type="button" value="1주" 	onclick="javascript:jsSearchDate('week');">&nbsp;
									<input type="button" value="15일" 	onclick="javascript:jsSearchDate('halfMonth');">&nbsp;
									<input type="button" value="1개월" 	onclick="javascript:jsSearchDate('month');">&nbsp;
									<input type="button" value="3개월" 	onclick="javascript:jsSearchDate('threeMonths');">&nbsp;
									<input type="button" value="지우기" onclick="javascript:jsSearchDateClear();">&nbsp;
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
								    		<td id="btn01"><a href="javascript:void(0);"><span id="searchBtn">검 색</span></a></td>
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
											<th width="30%">제목</th>
											<th width="10%">이름</th>
											<th width="15%">고객사</th>
											<th width="12%">등록일</th>
											<th width="10%">요청분류</th>
											<th width="10%">처리상태</th>
											<th width="8%">답변</th>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
											<tr align="center">
												<td>
													${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
												</td>
												<td align="left">
													<a href="javascript:void(0)" class="taskDetail" value="${list.dataSeq }"><strong>${list.subject}</strong></a>
												</td>
												<td>${list.regNm }</td>
												<td>${list.clientNm }</td>
												<td>${list.regDt }</td>
												<td>${list.reqCd1Nm }</td>
												<td>${list.statusNm }</td>
												<td> 
													<table cellpadding="0" cellspacing="0" border="0">
														<tr><td id="btn02"><a href="javascript:void(0);"><span class="replyBtn" value="${list.dataSeq }">답변</span></a></td></tr>
										    		</table>
												</td>
											</tr>
											<c:forEach var="reList" items="${replyList }" >
												<c:if test="${list.dataSeq eq reList.highDataSeq }">
													<tr align="center">
														<td></td>
														<td align="left">
															<a href="javascript:void(0)" class="taskDetail" value="${reList.dataSeq }">  └─>  [RE] ${reList.subject} </a>
														</td>
														<td>${reList.regNm }</td>
														<td>${reList.clientNm }</td>
														<td>${reList.regDt }</td>
														<td>${reList.reqCd1Nm }</td>
														<td>${reList.statusNm }</td>
														<td></td>
													</tr>
												</c:if>
											</c:forEach>
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
</form>
</body>
</html>

