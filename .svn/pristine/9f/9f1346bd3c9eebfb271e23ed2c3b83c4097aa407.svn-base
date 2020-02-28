\<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>FAQ 수정</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});

	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
});

j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		oEditors[1].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.

		j$("#announceDd").val(replaceAll($("#announceDd").val(), "/", ""));
		j$("#enforceDd").val(replaceAll($("#enforceDd").val(),   "/", ""));

		j$("#modifyFaq").submit();

		return false;
	});

	j$("#deleteBtn").click(function(){
		j$("#deleteFaq").submit();
		return false;
	});

	j$("#cancleBtn").click(function(){
		var url =  "/madm/bbsFaq/list?serviceType=" + j$("#serviceType").val() + "&bbsCd=faq";
		location.href = url;
		return false;
	});
	
	j$("#checkAll").click(function(){
		if ( $("#checkAll").prop('checked') ) {
			j$("input[id^=check_]").prop('checked',true);
		}else if( $("#checkAll").prop('checked') == false ){
			j$("input[id^=check_]").prop('checked',false);
		}
	});
});

</script>
</head>
<body>

<form:form id="modifyFaq" modelAttribute="bbsAddDto" action="/madm/bbsFaq/modifyFaqDetail" method="PUT">
<input type="hidden" id="serviceType" name="serviceType" value="${serviceType }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr><td height="20px"><td><tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
			    	FAQ 수정
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="center">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<td class="line" width="15%" align="center" bgcolor="#F5F5F5">게시판순번</td>
					    	<td class="line" width="35%" colspan="">
					    		${faqDetail.dataSeq }
					    		<input type="hidden" name="dataSeq" value="${faqDetail.dataSeq }"/>
					    	</td>
					    	<td class="line" width="15%" align="center" bgcolor="#F5F5F5">등록자</td>
					    	<td class="line" width="35%" colspan="">
					    		${faqDetail.regNm }
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">글제목</td>
					    	<td class="line" colspan="3">
					    		<textarea rows="10" cols="30" id="ir1" name="subject" style="width:100%;">${faqDetail.subject }</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">내용</td>
					    	<td class="line" colspan="3">
					    		<textarea rows="10" cols="30" id="ir2" name="content" style="width:100%;height:250px;">${faqDetail.content }</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">구분1</td>
					    	<td class="line" colspan="3">
					    		${faqDetail.reqCd1Nm } (${faqDetail.reqCd1 })
					    	</td>
						</tr>
						
						<c:if test="${serviceType eq 'SANGDAM4U' }">
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">구분2</td>
					    	<td class="line" colspan="3">
					    		<c:if test="${not empty faqDetail.reqCd2 }">
					    			${faqDetail.reqCd2Nm } (${faqDetail.reqCd2 })
					    		</c:if>
					    		<c:if test="${empty faqDetail.reqCd2 }">
					    			-
					    		</c:if>
					    	</td>
						</tr>
						</c:if>
						
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">노출여부</td>
					    	<td class="line" colspan="3">
					    		<input type="radio" name="dispYn" value="Y" ${faqDetail.dispYn == 'Y'  ? 'checked':''} > 노출
		    					<input type="radio" name="dispYn" value="N" ${faqDetail.dispYn == 'N'  ? 'checked':''} > 비노출
					    	</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사선택</th>
					    	<td class="line" colspan="3">
			    				<table>
			    					<tr>
			    						<td>
			    							<input type="checkbox" name="allClientYn" id="checkAll" value="Y" <c:if test="${faqDetail.allClientYn eq 'Y'}"> checked </c:if>>
			    							<label for="checkAll">전체선택</label>
			    						</td>
			    					</tr>
					    			<c:forEach var="list" items="${clientList}" varStatus="idx">
				    					<c:if test="${(idx.index mod 4) eq 0 }"><tr></c:if>
						    				<td width="200px">
						    					<input type="checkbox" name="clientCdArr" id="check_${list.clientCd }" value="${list.clientCd }" <c:if test="${list.dataSeq eq faqDetail.dataSeq}"> checked </c:if>>
						    					<label for="check_${list.clientCd }">${list.clientNm }</label>
						    				</td>
				    					<c:if test="${(idx.index mod 4) eq 3 }"></tr></c:if>
									</c:forEach>
			    				</table>
					    	</td>
						</tr>
					</table>
				</td>
			</tr>
	
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="2" align="center">
					    		<button id="modifyBtn" style="height:30px; width:100px;">수정</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="cancleBtn" style="height:30px; width:100px;">취소</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="deleteBtn" style="height:30px; width:100px;">삭제</button>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>

<form:form id="deleteFaq" modelAttribute="bbsAddDto" action="/madm/bbsFaq/modifyFaqDetail" method="DELETE">
	<input type="hidden" name="serviceType" value="${serviceType }">
	<input type="hidden" name="dataSeq" value="${faqDetail.dataSeq}">
</form:form>
</body>
</html>

