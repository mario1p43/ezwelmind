<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>공개상담 관리</title>
<script type="text/javascript">
j$(document).ready(function(){

 	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	var searchRegNmType = j$("select[name='searchRegNmType']").val();
			var regNm = j$("input[name='regNm']").val();

			if(searchRegNmType.length == 0 && regNm.length > 0 ){
				alert("등록/수정자를 선택해주세요.");
				j$("select[name='searchRegNmType']").focus();
			}else{
				j$("#searchPublic").submit();
			}
			return false;
	    };
	});

	j$("#searchBtn").click(function(){

		var searchRegNmType = j$("select[name='searchRegNmType']").val();
		var regNm = j$("input[name='regNm']").val();

		if(searchRegNmType.length == 0 && regNm.length > 0 ){
			alert("등록/수정자를 선택해주세요.");
			j$("select[name='searchRegNmType']").focus();
		}else{
			j$("#searchPublic").submit();
		}

		return false;
	});

	j$(".publicDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		var bbsCd = j$("#bbsCd").val();
		var serviceType = j$("#serviceType").val();
		location.href = "/madm/bbsPublic/modifyPublicDetailForm?dataSeq="+dataSeq+"&bbsCd="+bbsCd+"&serviceType="+serviceType;
		return false;
	});

	j$(".modifyDisp").click(function(){
		var params = {};
		var dataSeq = j$(this).attr("value");
		var dispYn  = j$(this).attr("disp");

		if(dispYn == "Y"){
			dispYn = "N";
		}else if(dispYn == "N"){
			dispYn = "Y";
		}

		params.dataSeq = dataSeq;
		params.dispYn  = dispYn;

		if(confirm("노출여부를 변경 하시겠습니까?")){
			j$.ajax({
				url: '/madm/common/bbs/ajaxModifyBbsDisp',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});
		}
		return false;
	});

	j$(".replyBtn").click(function(){
		var dataSeq = j$(this).attr("value");
		var bbsCd = j$("#bbsCd").val();
		var serviceType = j$("#serviceType").val();
		location.href = "/madm/bbsPublic/modifyPublicDetailForm?dataSeq="+dataSeq+"&bbsCd="+bbsCd+"&serviceType="+serviceType;
		return false;
	});
});
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>

<form:form id="searchPublic" modelAttribute="bbsAddDto" action="/madm/bbsPublic/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
		<input type="hidden" name="bbsCd" id="bbsCd" value="${bbsCd }">
	</td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">공개상담 관리</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>		
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>구분</strong></td>
		    	<td width="40%" colspan="3" align="left">
		    		<comm:select name="reqCd1"   code="100860"  basicValue="---- 선택 ----" selectValue="${param.reqCd1}" />
		    	</td>
			</tr>

			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>제목</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="searchNm" placeholder="검색어를 입력하세요." value="${param.searchNm }" style="width:350px; height:20px;">
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>등록/수정자</strong></td>
		    	<td width="40%" align="left">
					<select name="searchRegNmType" style="height: 20px;">
		    			<option value="">---- 선택 ----</option>
		    			<option value="등록" 	<c:if test="${param.searchRegNmType eq '등록'}"> selected </c:if> >등록자</option>
		    			<option value="수정"	<c:if test="${param.searchRegNmType eq '수정'}"> selected </c:if> >수정자</option>
		    		</select>
		    		<input type="text" name="regNm" placeholder="검색어를 입력하세요." value="${param.regNm }" style="width:350px; height:20px;">
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>노출여부</strong></td>
		    	<td width="40%" align="left">
		    		<select name="dispYn" style="height: 20px;">
		    			<option value="">---- 선택 ----</option>
		    			<option value="Y" <c:if test="${param.dispYn eq 'Y'}"> selected </c:if>>Y</option>
		    			<option value="N" <c:if test="${param.dispYn eq 'N'}"> selected </c:if>>N</option>
		    		</select>
		    	</td>
		    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>처리상태</strong></td>
		    	<td width="40%" align="left">
		    		<comm:select name="status"   code="100872"  basicValue="---- 선택 ----" selectValue="${param.status}" />
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
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="right">
								<strong>총 ${paging.totalCount}건</strong>
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
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
				                 <th width="5%" >순번</th>
				                  <th width="10%">구분</th>
				                  <th width="40%">제목</th>
				                  <th width="12%">등록/<span class="fontBlue">수정일</span></th>
				                  <th width="12%">등록/<span class="fontBlue">수정자</span></th>
				                  <th width="5%" >노출</th>
								  <th width="10%">처리상태</th>
								  <th width="8%">답변</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
			                  	<td width="">${list.reqCd1Nm}</td>
								<td align="center"><a href="javascript:void(0)" class="publicDetail" value="${list.dataSeq}" style="padding-left: 10px;"><strong>${list.subject}</strong></a></td>
								<c:choose>
									<c:when test="${not empty list.modiNm}">
										<td><span class="fontBlue">${list.modiDt}</span></td>
										<td><span class="fontBlue">${list.modiNm}</span></td>
									</c:when>
									<c:otherwise>
										<td>${list.regDt}</td>
										<td>${list.regNm}</td>
									</c:otherwise>
								</c:choose>
								<td>
									<a href="#" class="modifyDisp" value="${list.dataSeq}" disp="${list.dispYn}">
										${list.dispYn}
									</a>
								</td>
								<td>${list.statusNm }</td>
								<td align="center">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td id="btn02">
											<a href="javascript:void(0);"><span class="replyBtn" value="${list.dataSeq }">답변</span></a>
										</tr>
						    		</table>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
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
</form:form>
</body>
</html>

