<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>마음왕진 | 등록</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>

<c:if test="${!empty msg }">
<script>
	alert("${msg }");
</script>
</c:if>

<script type="text/javascript">
j$(document).ready(function(){
	
});

var DISPATCH = {
	regist : function() {
		
		// vaild
		
		
		$("#saveForm").attr("action", "/madm/dispatch/regist");
		$("#saveForm").attr("method", "post");
		$("#saveForm").submit();
	},	
	update : function() {
		
		// vaild
		
		
		$("#saveForm").attr("action", "/madm/dispatch/update");
		$("#saveForm").attr("method", "post");
		$("#saveForm").submit();
	},	
	list : function() {
		location.href="/madm/dispatch/list";
	}
};
</script>
</head>
<body>

<form id="saveForm" name="saveForm">
<input name="infoSeq" id="infoSeq" value="${bean.infoSeq }" type="hidden" style="width:100%;"/>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">마음왕진 | 등록</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">제목</th>
		    	<td>
		    		<input name="subject" id="subject" value="${bean.subject }" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사코드</th>
		    	<td>
		    		<input name="clientCd" id="clientCd" value="${bean.clientCd }" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">로고 경로</th>
		    	<td>
		    		<span style="color:red; font-weight:bold;">* 미입력시 온라인진단 로고 경로가 적용됩니다.</span>
		    		<input name="logoPath" id="logoPath" value="${bean.logoPath }" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="left">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용 1</th>
		    	<td>
		    		<span style="color:red; font-weight:bold;">* 사용자를 조회하는 첫 화면에 노출됩니다.</span>
		    		<textarea rows="7" name="infoContents" id="infoContents" style="width: 98%">${empty bean.infoContents ? '상담신청 페이지에서 모든 정보를 빠짐없이 기재해주셔야 접수가 가능합니다.
* 임직원명과 아이디 정보 미 기재시 검색이 불가합니다.
* 기존 0000서비스 이용시,직접 회원가입을 하지 않으신 분은 아이디 검색시 "CR생년월일"로 검색바랍니다.
ex) CR601231 (60년 12월 31일자)
*사용자 정보 검색이 안될시, 하단의 "신규신청" 버튼을 눌러주세요.' : bean.infoContents }</textarea><br/>
		    	</td>
		    </tr>
			<tr align="left">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용 2</th>
		    	<td>
		    		<span style="color:red; font-weight:bold;">* 사용자가 작성하는 상담신청서 상단에 노출됩니다.</span>
		    		<textarea rows="7" name="contents" id="contents" style="width: 98%">${empty bean.contents ? '* 하단의 정보를 빠짐없이 기재해주셔야 접수가 가능합니다.' : bean.contents }</textarea>
		    	</td>
		    </tr>
			<tr align="left">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">이메일</th>
		    	<td>
		    		<span style="color:red; font-weight:bold;">* @ezwel.com 형식으로 작성하면, 상담신청서 이메일 부분에 자동으로 적용됩니다.</span>
		    		<input name="email" id="email" value="${bean.email }" placeholder="@ezwel.com" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="center" height="60px">
				<td colspan="2">
					<c:choose>
						<c:when test="${!empty bean.infoSeq }">
							<input type="button" value="수정" onclick="DISPATCH.update()" />
						</c:when>
						<c:otherwise>
							<input type="button" value="저장" onclick="DISPATCH.regist()" />
						</c:otherwise>
					</c:choose>
					<input type="button" value="목록" onclick="DISPATCH.list()" />
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

</table>
</form>
</body>
</html>

