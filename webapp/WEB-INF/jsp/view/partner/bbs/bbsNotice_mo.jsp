<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>센터정보관리</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.notice-wrapper{padding:0 5vw}
	.notice-wrapper .data-list-wrapper{display:flow-root;margin-top:5vw}
	.notice-wrapper .data-list-wrapper table{width:100%;text-align:center;border:0;border-collapse:collapse}
	.notice-wrapper .data-list-wrapper table tr{height:8vw}
	
	.notice-wrapper .content-wrapper:first-child{margin-top:0vw}
	.notice-wrapper .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height:130%}
	.notice-wrapper .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.notice-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.notice-wrapper .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.notice-wrapper .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.notice-wrapper .content-wrapper .datetimepicker-block{display:flex}
	.notice-wrapper .content-wrapper .datetimepicker-block span{display:inline-block;float:left;width:20px;text-align:center;line-height:36px}
	.notice-wrapper .content-wrapper .datetimepicker-block input[type=text]{float:left;width:calc(50% - 10px);height:32px;padding:0 8px;font-size:14px;border:1px solid #828282}
	.notice-wrapper .content-wrapper .datetimepicker-btn-block{display:flow-root;margin-top:2vw}
	.notice-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]{float:left;width:calc((100% - 6vw) / 4);height:32px;font-weight:bold;font-size:16px;background-color:#E0E0E0;border:1px solid #BDBDBD;border-radius:4px}
	.notice-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]:not(:last-child){margin-right:2vw}
	.notice-wrapper .content-wrapper .search-btn{height:40px;width:100%;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.notice-wrapper .content-wrapper .result-info-left{float:left}
	.notice-wrapper .content-wrapper .result-info-right{float:right}
	.notice-wrapper .content-wrapper .insert-btn{color:#2F80ED;font-size:14px;line-height:130%}
	
	.notice-wrapper .data-list-wrapper{display:table;width:100%;margin-top:2vw;table-layout:fixed;border-collapse:collapse}
	.notice-wrapper .data-list-wrapper .result-list-left{float:left;width:calc(43% - 1px);border-right:1px solid #C4C4C4}
	.notice-wrapper .data-list-wrapper .result-list-right{float:left;width:57%;overflow:auto}
	.notice-wrapper .data-list-wrapper table{width:100%;text-align:center;border-collapse:collapse}
	.notice-wrapper .data-list-wrapper table thead{background-color:#F2F2F2;border-bottom:1px solid #C4C4C4}
	.notice-wrapper .data-list-wrapper .result-list-left table tr th{height:32px;padding:0}
	.notice-wrapper .data-list-wrapper .result-list-right table tr th{height:32px;padding:0 2vw}
	.notice-wrapper .data-list-wrapper table tr td{height:44px;padding:0 2vw}
	.notice-wrapper .data-list-wrapper table tr:nth-child(odd){background-color:#E0E0E0}
	.notice-wrapper .data-list-wrapper table tr:nth-child(even){background-color:#F2F2F2}
	
	.notice-wrapper .data-list-wrapper select{width:20vw;height:8vw;padding:0 2vw;border:1px solid #828282;background:url('/resources/img/ic_select.png') no-repeat;background-size:12px 7px;background-position:right 6px top 50%;background-color:white;-webkit-appearance:none;-moz-appearance:none;appearance:none;}
</style>

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
		location.href = "/partner/bbsNotice/noticeDetailForm?dataSeq="+dataSeq+"&noticeCd=1";
		return false;
	});
	
	
	
});

</script>
</head>
<body>
<form:form name="searchNotice" id="searchNotice" modelAttribute="bbsAddDto" action="/partner/bbsNotice/list" method="GET">
	<div class="notice-wrapper">
		<div class="data-list-wrapper">
			<table>
			<c:forEach var="list" items="${paging.list}" varStatus="status">
				<tr>
					<td class="" width="" align="" bgcolor="">
						${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
					</td>
					<td>
						<c:if test='${ list.reqCd1 eq "101231" }'>
						공지사항
						</c:if>
						<c:if test='${ list.reqCd1 eq "101232" }'>
						모집공고
						</c:if>							
					</td>
					<td><a href="#" class="noticeDetail" value="${list.dataSeq}"><strong>${list.subject}</strong></a></td>
					<td>${list.regDt}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
<%-- <table cellpadding="0" cellspacing="0" border="0" width="80%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">공지사항</td>
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
									<c:if test='${ list.reqCd1 eq "101231" }'>
									공지사항
									</c:if>
									<c:if test='${ list.reqCd1 eq "101232" }'>
									모집공고
									</c:if>							
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
</table> --%>
</form:form>


</body>
</html>