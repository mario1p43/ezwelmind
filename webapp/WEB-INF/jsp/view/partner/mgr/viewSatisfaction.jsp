<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>센터정보관리</title>
<script type="text/javascript">
function monthMove() {
	wrapWindowByMask();
	if($("[name='counselorId']").val() == ""){
		location.href = "/partner/bbsNotice/viewSatisfaction";
	}else{
		location.href = "/partner/bbsNotice/viewSatisfaction?counselorId=" + $("[name='counselorId']").val();	
	}
	
}

function wrapWindowByMask() {
    var loadingImg = '';
    
    var topPx = Math.max(0, (($(window).height() - 10) / 2) + $(window).scrollTop());
    var leftPx = Math.max(0, (($(window).width() - 200) / 2) + $(window).scrollLeft());
     
    loadingImg += "<div id='loadingImg' style='position:absolute; left:" + leftPx + "px; top:" + topPx + "px; display:none; z-index:8000;'>";
    loadingImg += " <img src='http://img.ezwelmind.co.kr/sangdam4u/images/common/viewLoading.gif'/>"; 
    loadingImg += "</div>";   
 
    //화면에 레이어 추가 
    j$('body').append(loadingImg)
       
    //로딩중 이미지 표시
    j$('#loadingImg').show();
}

</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="80%">
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<c:if test="${not empty counselorList }">
				<b>상담사 선택 : </b>
				<select name="counselorId" onchange="monthMove();" >
					<option value="">전체</option>
						<c:forEach var="list" items="${counselorList }">
							<option value="${list.userId }" <c:if test="${param.userId eq list.userId }"> selected </c:if> >${list.userNm }</option>
						</c:forEach>
				</select>	
			</c:if>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>	
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">만족도 보기</td>
				</tr>
			</table>
		</td>	
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
			
	<tr>
		<td  width="30%">
			<strong>
				총 ${paging.totalCount}건 | 페이지 : ${paging.currentPage}/${paging.getPageCount()}
			</strong>
		</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td>
			<table class="" cellpadding="5" align="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
					<tr>
				        <th width="3%">no</th> 
				        <th width="6%">상담사명</th>
				        
				        <th width="8%">상담서비스에 대해서 만족하십니까?</th> 
				        <th width="12%">서비스를 이용하면서 느낀점을 자유롭게 기술해주세요.</th>
					</tr>
		           </thead>
		
				<tbody>
					<c:forEach var="list" items="${paging.list}" varStatus="status">
						<tr align="" height="50px">
						
							<td class="" width="" align="" bgcolor="">
								${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
							</td>
							<td>${list.counselorNm}</td>
							<c:if test="${list.evalSeq eq '6'}">
								<td>${list.item02Ans}</td>
								<td>${list.item03Ans}</td>

							</c:if>
							
						    <c:if test="${list.evalSeq eq '1'}">
								<td>${list.item01Ans}</td>
								<td>${list.item06Ans}</td>
							</c:if>
						    
						    


						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td><div>평균 : ${itemAvg.itemAvg } / 최고점 : ${itemAvg.itemMax } / 최하점 : ${itemAvg.itemMin } / (1번 응답:N 미포함)</div></td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
			
	<tr>
		<td>
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
		</td>
	</tr>
</table>

		<!-- 채널 영역 종료 -->
<br>
					

</body>
</html>