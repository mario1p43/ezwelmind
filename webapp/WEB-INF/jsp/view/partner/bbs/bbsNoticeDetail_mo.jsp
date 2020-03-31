<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>상세조회</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.flexColumn{display: flex;  flex-direction: column; display: -webkit-flex;  -webkit-flex-direction: column; }
	.flex{display: flex; display: -webkit-flex;}
	.flexGrow{-webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0;  -webkit-flex : 1 1 0;}
	.center{-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; }/* 가로세로중앙정렬 */
	.centerH{-webkit-align-items: center; align-items: center; }/* 세로중앙정렬 */
	.rightR{-webkit-justify-content: flex-end; justify-content: flex-end; }
	.rightC{-webkit-align-items: flex-end; align-items: flex-end;}
	
	.notice-wrapper{padding:0 5vw}
	.notice-wrapper .content-wrapper{padding:3vw 0}
	.notice-wrapper .content-wrapper .notice-title{margin-right:2vw;font-size:16px}
	.notice-wrapper .content-wrapper .notice-date{font-size:12px}
	.notice-wrapper .content-wrapper .file-wrapper{display:flow-root}
	.notice-wrapper .content-wrapper .file-name{display:inline-block;width:calc(100% - 16px);float:left}
	.notice-wrapper .content-wrapper .file-name a{display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:1;overflow:hidden;text-overflow:ellipsis;margin-right:2vw}
	.notice-wrapper .content-wrapper .download-icon{display:flex;float:right}
	.notice-wrapper .data-wrapper p:first-child{margin-top:0}
	.notice-wrapper .data-wrapper p:last-child{margin-bottom:0}
	.notice-wrapper .border-bottom{border-bottom:1px solid #C4C4C4}
	
	.notice-wrapper .content-wrapper .bottom-btn{width:100%;height:11vw;font-weight:bold;font-size:16px;text-align:center;color:white;background-color:#006CBA;border:0}
</style>

</head>
<body>
	<script>
		j$(function() {
			$('.mobile_nav ul li a').eq(3).addClass('active');
			$('.mobile_nav ul li a img').eq(3).attr('src', '/resources/img/home_icon_active.png');
		});
	</script>
	<div class="notice-wrapper">
		<div class="content-wrapper border-bottom flex">
			<div class="notice-title flexGrow">${vo.subject}</div>
			<div class="notice-date flex centerH">
				<span>${fn:replace(fn:substring(vo.regDt, 0, 10), '-', '.')}</span>
			</div>
		</div>
		<div class="content-wrapper border-bottom data-wrapper">
			${fn:replace(vo.content,newLineChar,'<br>')}
		</div>
		<div class="content-wrapper border-bottom">
			<c:choose>
				<c:when test="${not empty files1.filePath}">
						<div class="file-wrapper">
							<div class="file-name">
								<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" class="attach_file" target="_blank">${files1.fileNm}</a>
							</div>
							<div class="download-icon">
								<img src="${url:resource('/resources/img/ic_download.png')}" style="width:16px;height:16px">
							</div>
						</div>
					<c:if test="${not empty files2.filePath}">
						<div class="file-wrapper">
							<div class="file-name">
								<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" class="attach_file"  target="_blank">${files2.fileNm}</a>
							</div>
							<div class="download-icon">
								<img src="${url:resource('/resources/img/ic_download.png')}" style="width:16px;height:16px">
							</div>
						</div>
					</c:if>
					<c:if test="${not empty files3.filePath}">
						<div class="file-wrapper">
							<div class="file-name">
								<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" class="attach_file"  target="_blank">${files3.fileNm}</a><br>
							</div>
							<div class="download-icon">
								<img src="${url:resource('/resources/img/ic_download.png')}" style="width:16px;height:16px">
							</div>
						</div>
					</c:if>
					<c:if test="${not empty files4.filePath}">
						<div class="file-wrapper">
							<div class="file-name">
								<a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" class="attach_file"  target="_blank">${files4.fileNm}</a><br>
							</div>
							<div class="download-icon">
								<img src="${url:resource('/resources/img/ic_download.png')}" style="width:16px;height:16px">
							</div>
						</div>
					</c:if>
					<c:if test="${not empty files5.filePath}">
						<div class="file-wrapper">
							<div class="file-name">
								<a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" class="attach_file" target="_blank">${files5.fileNm}</a><br>
							</div>
							<div class="download-icon">
								<img src="${url:resource('/resources/img/ic_download.png')}" style="width:16px;height:16px">
							</div>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>등록된 첨부 파일이 없습니다.</c:otherwise>
			</c:choose>
		</div>
		<div class="content-wrapper">
			<button id="modifyBtn" class="bottom-btn" onclick="history.back()" type="button">목록</button>
		</div>
	</div>

</body>
</html>