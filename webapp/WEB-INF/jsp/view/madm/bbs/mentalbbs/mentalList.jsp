<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html> 
<head>
<title>칼럼/이슈 관리</title>
<script type="text/javascript">
j$(document).ready(function(){

 	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchNotice").submit();
			return false;
	    };
	});
	j$("#searchBtn").click(function(){
		//alert("검색");
		j$("#searchNotice").submit();
		return false;
	});


	j$("#insertBtn").click(function(){
		location.href = "/madm/bbsMental/mentalDetail?serviceType=${bbsAddDto.getServiceType()}";
		return false;
	});

	j$(".mentalDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		location.href = "/madm/bbsMental/mentalDetail?dataSeq="+dataSeq+"&serviceType=${bbsAddDto.getServiceType()}";
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

});
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>

<form:form id="searchNotice" modelAttribute="bbsAddDto" action="/madm/bbsMental/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">칼럼/이슈 등록 관리 </td>
		    	<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<td align="right">
								구분 :
								<comm:select name="reqCd1" code="100309"  basicValue="구분" selectValue="${param.reqCd1}"/>
								<span style="margin-left: 20px;"></span>
								<input type="text" id="searchNm" name="searchNm" placeholder="검색어를 입력 하세요." value="${param.searchNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
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
			                  <th width="8%" >순번</th>
							  <th width="12%">구분</th>
			                  <th width="52%">제목</th>
			                  <th width="12%">등록/<span class="fontBlue">수정일</span></th>
			                  <th width="12%">등록/<span class="fontBlue">수정자</span></th>
			                  <th width="8%" >노출</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
 								<td>${list.reqCd1Nm}</td>
								<td><a href="#" class="mentalDetail" value="${list.dataSeq}"><strong>${list.subject}</strong></a></td>
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

