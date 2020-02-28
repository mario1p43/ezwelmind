<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>센터정보관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	$.validate({
		form : '#searchNotice',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			 
		}
	});
	
	
	
	j$("#searchBtn").click(function(){
		j$("#searchNotice").submit();
		return false;
	});
	
	j$(".noticeDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		location.href = "/partner/bbsNotice/noticeDetailForm?dataSeq="+dataSeq+"&noticeCd=3";
		return false;
	});
	
	
	
});

</script>
</head>
<body>
<div class="web">
<form:form name="searchNotice" id="searchNotice" modelAttribute="bbsAddDto" action="/partner/bbsNotice/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">서류 및 양식</td>
			</tr>
		</table>

		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
		
			<tr>
				<td>
				<input type="hidden" name="serviceType" value="PARTNER">
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">

						<tr>
							<td>
								<select id="searchCo" style="height: 24px;float: left;" name="searchCo" data-validation="required"  data-validation-error-msg-required="검색조건을 선택 해주세요.">
									<option value="">선택</option>
									<option value="제목">제목</option>
									<option value="내용">내용</option>
									<option value="전체">제목+내용</option>
								</select>
								
								<input type="text" id="searchNm" name="searchNm" data-validation="required" data-validation-error-msg-required="검색어를 입력 해주세요." placeholder="검색어를 입력 하세요."  style="width:200px; height:20px;margin: 0px 5px;float: left;"/>
								<span id="btn02" width="40px">
									<a href="#">
										<span id="searchBtn">검색</span>
									</a>
								</span>
							</td>

						</tr>
						<tr>
							<td  width="30%">
								<strong>
									총 ${paging.totalCount}건 | 페이지 : ${paging.currentPage}/${paging.getPageCount()}
								</strong>
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
			                  <th width="12%">종류</th>
			                  <th width="40%">제목</th>
			                  <th width="12%">등록일</th>
			                </tr>
			            </thead>
						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>
									서류 및 양식					
								</td>
								<td><a href="#" class="noticeDetail" value="${list.dataSeq}"><strong>${list.subject}</strong></a></td>
								<td>${list.regDt}</td>
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
</div>

</body>
</html>