<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>버전 수정</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
var oEditors1 = [];
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		var title = j$("#title").val();
		if(title == ""){
			alert("제목을 입력하세요.");
			j$("#title").focus();
			return false;
		}
		var content = j$("#content").val();
		if(content == ""){
			alert("내용을 입력하세요.");
			j$("#content").focus();
			return false;
		}
		
		var updateDt = j$("#updateDt").val();
		
		if(updateDt == ""){
			alert("업데이트일자를 선택하세요.");
			j$("#updateDt").focus();
			return false;
		}
		
		var appPath = j$("#appPath").val();
		if(appPath != ""){
			if(j$("#osType").val() == "I"){
				if(appPath.toLowerCase().indexOf(".ipa") < 0){
					alert("선택하신 OS(IOS)의 첨부파일은\n파일확장자가 .ipa만 등록 가능합니다.");
					j$("#appPath").focus();
					return false;		
				}
			}else{
				if(appPath.toLowerCase().indexOf(".apk") < 0){
					alert("선택하신 OS(안드로이드)의 첨부파일은\n파일확장자가 .apk만 등록 가능합니다.");
					j$("#appPath").focus();
					return false;		
				}
			}
		}
		
		if(confirm("수정 하시겠습니까?")){
			j$("#modifyVersion").submit();
		}
		
		return false;
	});

	j$("#deleteBtn").click(function(){
		if(confirm("삭제하시면 복구하실수 없습니다.\n삭제하시겠습니까?")){
			j$("#deleteVersion").submit();	
		}		
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/version/versionManage";
		return false;
	});

	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
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
		format:'Y/m/d',
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

</script>

</head>
<body>
<form:form id="modifyVersion" modelAttribute="versionDto" action="/madm/mobile/version/modifyVersionDetail" method="POST" enctype="multipart/form-data">
<input type="hidden" name="appSeq" value="${versionDetail.appSeq}"/>
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="80%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">버전 수정</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">OS</th>
					    	<td  >
					    		<select id="osType" name="osType">
					    			<option value="I" ${versionDetail.osType == 'I' ? 'selected':''}>IOS</option>
					    			<option value="A" ${versionDetail.osType == 'A' ? 'selected':''}>안드로이드</option>
					    		</select>
					    	</td>
						</tr>
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
					    	<td  >
								<input type="radio" name="useYn" value="Y" ${versionDetail.useYn == 'Y' ? 'checked':''}> 사용
		    					<input type="radio" name="useYn" value="N" ${versionDetail.useYn == 'N' ? 'checked':''}> 비사용
					    	</td>
						</tr>
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배포방식</th>
					    	<td  >
					    		<input type="radio" name="releaseType" value="A" ${versionDetail.releaseType == 'A' ? 'checked':''}> 앱스토어
					    		<input type="radio" name="releaseType" value="D" ${versionDetail.releaseType == 'D' ? 'checked':''}> 다운로드
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">첨부파일</th>
					    	<td  >
					    	<input name="appPath" id="appPath" value="" type="file" style="width:350px;"/><br/>
					    	<c:if test="${empty versionDetail.ipaPath}">
					    		${versionDetail.apkPath}
					    	</c:if>
					    	<c:if test="${empty versionDetail.apkPath}">
					    		${versionDetail.ipaPath}
					    	</c:if>
					    	</td>
						</tr>						
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">버전코드</th>
					    	<td  >
					    		<input name="versionCd" id="versionCd" type="text" style="width:350px;" value="${versionDetail.versionCd }"/> 예) 1.0.1(숫자와 .만 입력하세요)
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">업데이트일자</th>
					    	<td  width="35%" >
					    		<input type="text" name="updateDt" id="updateDt" size="10" class="date_timepicker_start" value="${versionDetail.updateDt }"/>
								<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					    	</td>
					    </tr>
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
					    	<td  >
					    		<textarea rows="5" cols="10" id="content" name="content" style="width:100%; height:100px;">${versionDetail.content }</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록자ID</th>
					    	<td class="line">
					    		${versionDetail.regId } 
					    	</td>
					    </tr>
						<tr align="left" height="30px">	
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록일</th>
					    	<td class="line">
					    		${versionDetail.regDt }
					    	</td>
						</tr>
						<c:if test="${not empty versionDetail.modiId}">
							<tr align="left" height="30px">
								<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정자ID</th>
						    	<td class="line">
						    		${versionDetail.modiId } 
						    	</td>
						    </tr>
							<tr align="left" height="30px">		
						    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정일</th>
						    	<td class="line">
						    		${versionDetail.modiDt }
						    	</td>
							</tr>
						</c:if>
					</table>
					<!-- 배너 정보 영역 종료 -->
				</td>
			</tr>
						
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
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

<form:form id="deleteVersion" modelAttribute="versionDto" action="/madm/mobile/version/modifyVersionDetail" method="DELETE">
	<input type="hidden" name="appSeq" value="${versionDetail.appSeq}">
</form:form>

<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

