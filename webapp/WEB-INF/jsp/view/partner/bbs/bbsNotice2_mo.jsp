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
	.notice-wrapper .data-list-wrapper table{width:100%;border:0;border-collapse:collapse}
	.notice-wrapper .data-list-wrapper table tr td{height:32px;padding:2vw 1vw;font-size:14px}
	
	.notice-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.notice-wrapper .content-wrapper .search-type-wrapper .search-type{float:left;width:30%;height:8vw;padding:0 2vw;font-size:14px;border:1px solid #828282;background:url('/resources/img/ic_select.png') no-repeat;background-size:12px 7px;background-position:right 6px top 50%;background-color:white;-webkit-appearance:none;-moz-appearance:none;appearance:none;outline:none;}
	.notice-wrapper .content-wrapper .search-keyword-wrapper{float:left;width:calc(70% - 4.5vw);height:8vw;line-height:8vw;margin-left:4.5vw;border-bottom:1px solid #828282}
	.notice-wrapper .content-wrapper .search-keyword-wrapper .search-keyword{float:left;width:80%;height:100%;padding:0 2vw;font-size:14px;border:0;outline:none}
	.notice-wrapper .content-wrapper .search-keyword-wrapper .btn-search{float:right}
	.notice-wrapper .content-wrapper .search-keyword-wrapper .btn-search img{vertical-align:middle}
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
		location.href = "/partner/bbsNotice/noticeDetailForm?dataSeq="+dataSeq+"&noticeCd=2";
		return false;
	});
	
	
	
});

</script>
</head>
<body>
<form:form name="searchNotice" id="searchNotice" modelAttribute="bbsAddDto" action="/partner/bbsNotice/list2" method="GET">
	<div class="notice-wrapper">
		<div class="data-list-wrapper">
			<table>
			<c:forEach var="list" items="${paging.list}" varStatus="status">
				<tr>
					<td>${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
					<td width="20%">
						<c:if test='${ list.reqCd1 eq "101231" }'>공지사항</c:if>
						<c:if test='${ list.reqCd1 eq "101232" }'>모집공고</c:if>							
					</td>
					<td><a href="#" class="noticeDetail" value="${list.dataSeq}">${list.subject}</a></td>
					<td width="20%">${list.regDt}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="content-wrapper">
			<div class="search-type-wrapper">
				<select id="searchCo" name="searchCo" class="search-type" data-validation="required" data-validation-error-msg-required="검색조건을 선택 해주세요.">
					<option value="">선택</option>
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="전체">제목+내용</option>
				</select>
			</div>
			<div class="search-keyword-wrapper">
				<input type="text" id="searchNm" name="searchNm" class="search-keyword" data-validation="required" data-validation-error-msg-required="검색어를 입력 해주세요." placeholder="검색어를 입력 하세요."/>
				<span class="btn-search"><img id="searchBtn" src="/resources/img/ic_search.png"></span>
			</div>
		</div>
		<div class="content-wrapper">
			<table style="width:100%;border:0;border-collapse:collapse;">
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
		</div>
	</div>
</form:form>


</body>
</html>