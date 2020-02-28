<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>템플릿 등록/수정</title>
<script type="text/javascript">
var $activeTextArea;

j$(document).ready(function(){
	$("textarea").on("focusin", function() {
		$activeTextArea = $(this);
	});
	
	$("input[name=useYnCheck]").on("change", function() {
		var isChecked = $(this).prop("checked")
		var $textArea = $(this).parent().parent().find("textarea");
		
		
		if(isChecked) {
			$textArea.prop("readonly", false);
			$(this).parent().parent().find("input[name=useYn]").val("Y");
		} else {
			$textArea.prop("readonly", true);
			$(this).parent().parent().find("input[name=useYn]").val("N");
		}
	});
});



function fncFixWord(word) {
	
	if($activeTextArea != null) {
		var isReadOnly = $activeTextArea.prop("readonly")
		
		if(!isReadOnly) {
			word = "{" + word + "}";
			
			insertText($activeTextArea[0], word);	
		}
		
	} else {
		alert("선택되어 있는 텍스트 영역이 존재하지 않습니다.");
	}
}

function insertText(txtArea, word){
	 var txtValue = txtArea.value;
	 var selectPos = txtArea.selectionStart; // 커서 위치 지정
	 var beforeTxt = txtValue.substring(0, selectPos);  // 기존텍스트 ~ 커서시작점 까지의 문자
	 var afterTxt = txtValue.substring(txtArea.selectionEnd, txtValue.length);   // 커서끝지점 ~ 기존텍스트 까지의 문자

	 txtArea.value = beforeTxt + word  + afterTxt;

	 selectPos = selectPos + word.length;
	 txtArea.selectionStart = selectPos; // 커서 시작점을 추가 삽입된 텍스트 이후로 지정
	 txtArea.selectionEnd = selectPos; // 커서 끝지점을 추가 삽입된 텍스트 이후로 지정
	 txtArea.focus();
}

function fncChangeClientCd(clientCd) {
	location.href="/madm/template/registForm?clientCd=" + clientCd;
}

function fncSubmit() {
	
	if(!confirm("데이터를 저장하는 즉시 변경됩니다.\n저장하시겠습니까?")) {
		return false;
	}
	
	
	
	$("input[name=caseNo]").each(function(i) {
		$parent = $(this).parent();
		
		$parent.find("input[name=caseNo]").attr("name", "templates["+i+"].caseNo");
		$parent.find("input[name=counselNo]").attr("name", "templates["+i+"].counselNo");
		$parent.find("input[name=useYn]").attr("name", "templates["+i+"].useYn");
		$parent.find("textarea[name=smsMsg]").attr("name", "templates["+i+"].smsMsg");
	});
	
	
	$("#templateForm").attr("action", "/madm/template/save");
	$("#templateForm").attr("method", "POST");
	$("#templateForm").submit();
}
</script>
<style type="text/css">
       #layer_fixed
       {
           height:50%;
           width:80px;
           color: #bebebe;
           font-size:12px;
           position:fixed;
           z-index:999;
           top:25%;
           right:0px;
           -webkit-box-shadow: 0 1px 2px 0 #777;
           box-shadow: 0 1px 2px 0 #777;
           background-color:#ccc;
       }
       textarea:read-only {
       	   background-color: #e2e2e2;
       }
</style>
</head>
<body>
<form id="templateForm" name="templateForm">
<input type="hidden" name="clientCd" value="${clientCd }" />
<!-- 버튼 영역 시작 -->
<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">템플릿 등록/수정</td>
	</tr>
</table>
<br/>
<!-- 버튼 영역 종료 -->

<p class="description">
 	<select onchange="fncChangeClientCd(this.value);">
 		<option value="">선택해주세요.</option>
 		<c:forEach var="list" items="${ clientList }">
 			<option value="${list.clientCd }" <c:if test="${list.clientCd eq clientCd}">selected</c:if>>${list.clientNm}(${list.clientCd})</option>
 		</c:forEach>
 	</select>
</p>


<c:if test="${!empty clientCd }">
<div id="layer_fixed">
    <table cellspacing="0" cellpadding="0" style="width:100%; height:100%;">
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="신청코드" onclick="fncFixWord('신청코드')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="사이트명" onclick="fncFixWord('사이트명')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="내담자명" onclick="fncFixWord('내담자명')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="전화번호" onclick="fncFixWord('전화번호')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="상담일시" onclick="fncFixWord('상담일시')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="센터명" onclick="fncFixWord('센터명')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="상담사명" onclick="fncFixWord('상담사명')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="센터번호" onclick="fncFixWord('센터번호')" style="height:30px; width:100%;">
       </td>
    </tr>
    <tr style="height: 30px;">
       <td style="vertical-align:middle;">
            <input type="button" value="센터주소" onclick="fncFixWord('센터주소')" style="height:30px; width:100%;">
       </td>
    </tr>
    </table>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;" rowspan="2">발송 대상</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;" rowspan="2">발송 케이스</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;" rowspan="2">발송 시점</th>
				<th class="line" align="center" bgcolor="#F5F5F5" colspan="5">문자내용(전문)</th>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">대면상담</th>
				<th class="line" align="center" bgcolor="#F5F5F5">전화상담</th>
				<th class="line" align="center" bgcolor="#F5F5F5">게시판상담</th>
				<th class="line" align="center" bgcolor="#F5F5F5">텍스트상담</th>
				<th class="line" align="center" bgcolor="#F5F5F5">오프라인진단</th>
			</tr>
		
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" rowspan="6">내담자</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담신청 <br/> 완료 후</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="1" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['1']['1'] ? bean['1']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['1']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['1']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['1']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="1" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['1']['2'] ? bean['1']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['1']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['1']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['1']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="1" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['1']['3'] ? bean['1']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['1']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['1']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['1']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="1" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['1']['4'] ? bean['1']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['1']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['1']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['1']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="1" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['1']['5'] ? bean['1']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['1']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['1']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['1']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담일 <br/> 1일전 알림</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">오전 9시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="2" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['2']['1'] ? bean['2']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['2']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['2']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['2']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="2" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['2']['2'] ? bean['2']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['2']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['2']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['2']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="2" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['2']['3'] ? bean['2']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['2']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['2']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['2']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="2" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['2']['4'] ? bean['2']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['2']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['2']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['2']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="2" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['2']['5'] ? bean['2']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['2']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['2']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['2']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담완료 후</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">9~22시<br/>매시간<br/>40분 간격</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="3" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['3']['1'] ? bean['3']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['3']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['3']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['3']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="3" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['3']['2'] ? bean['3']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['3']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['3']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['3']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="3" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['3']['3'] ? bean['3']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['3']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['3']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['3']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="3" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['3']['4'] ? bean['3']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['3']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['3']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['3']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="3" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['3']['5'] ? bean['3']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['3']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['3']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['3']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">연장예약후 <br/>2일 전까지<br/>미 결제 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담시간 기준<br/>48시간 전부터<br/>8~22시까지<br/>3시간 간격 알림</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="4" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['4']['1'] ? bean['4']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['4']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['4']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['4']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="4" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['4']['2'] ? bean['4']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['4']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['4']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['4']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="4" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['4']['3'] ? bean['4']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['4']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['4']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['4']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="4" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['4']['4'] ? bean['4']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['4']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['4']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['4']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="4" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['4']['5'] ? bean['4']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['4']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['4']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['4']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<%-- <tr style="display:none">
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">관리자 또는<br/>상담센터에서<br/>연장결제 진행 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="5" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['5']['1'] ? bean['5']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['5']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['5']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['5']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="5" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['5']['2'] ? bean['5']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['5']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['5']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['5']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="5" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['5']['3'] ? bean['5']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['5']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['5']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['5']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="5" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['5']['4'] ? bean['5']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['5']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['5']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['5']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="5" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['5']['5'] ? bean['5']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['5']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['5']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['5']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr> --%>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담사 및 관리자가<br/>일정변경 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="6" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['6']['1'] ? bean['6']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['6']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['6']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['6']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">	
					<input type="hidden" name="caseNo" value="6" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['6']['2'] ? bean['6']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['6']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['6']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['6']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="6" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['6']['3'] ? bean['6']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['6']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['6']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['6']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="6" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['6']['4'] ? bean['6']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['6']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['6']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['6']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="6" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['6']['5'] ? bean['6']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['6']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['6']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['6']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담<br/>주문취소 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="7" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['7']['1'] ? bean['7']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['7']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['7']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['7']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="7" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['7']['2'] ? bean['7']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['7']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['7']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['7']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="7" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['7']['3'] ? bean['7']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['7']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['7']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['7']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="7" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['7']['4'] ? bean['7']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['7']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['7']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['7']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="7" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['7']['5'] ? bean['7']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['7']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['7']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['7']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			
			
			
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" rowspan="4">상담사</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">내담자가<br/>상담신청<br/>완료 후</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="8" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['8']['1'] ? bean['8']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['8']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['8']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['8']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="8" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['8']['2'] ? bean['8']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['8']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['8']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['8']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="8" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['8']['3'] ? bean['8']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['8']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['8']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['8']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="8" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['8']['4'] ? bean['8']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['8']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['8']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['8']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="8" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['8']['5'] ? bean['8']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['8']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['8']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['8']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<%-- <tr style="display:none">
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담일<br/>상담시간 5분 전</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담시간 5분 전</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="9" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['9']['1'] ? bean['9']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['9']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['9']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['9']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="9" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['9']['2'] ? bean['9']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['9']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['9']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['9']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="9" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['9']['3'] ? bean['9']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['9']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['9']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['9']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="9" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['9']['4'] ? bean['9']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['9']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['9']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['9']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="9" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['9']['5'] ? bean['9']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['9']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['9']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['9']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr> --%>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담일<br/>1일전 알림</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">오전 9시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="10" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['10']['1'] ? bean['10']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['10']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['10']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['10']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="10" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['10']['2'] ? bean['10']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['10']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['10']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['10']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="10" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['10']['3'] ? bean['10']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['10']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['10']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['10']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="10" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['10']['4'] ? bean['10']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['10']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['10']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['10']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="10" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['10']['5'] ? bean['10']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['10']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['10']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['10']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">내담자가<br/>상담 주문취소 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="11" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['11']['1'] ? bean['11']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['11']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['11']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['11']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="11" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['11']['2'] ? bean['11']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['11']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['11']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['11']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="11" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['11']['3'] ? bean['11']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['11']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['11']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['11']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="11" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['11']['4'] ? bean['11']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['11']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['11']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['11']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="11" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['11']['5'] ? bean['11']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['11']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['11']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['11']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr>
			<%-- <tr style="display:none">
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담사 및 관리자가<br/>연장결제 진행 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="12" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['12']['1'] ? bean['12']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['12']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['12']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['12']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="12" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['12']['2'] ? bean['12']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['12']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['12']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['12']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="12" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['12']['3'] ? bean['12']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['12']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['12']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['12']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="12" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['12']['4'] ? bean['12']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['12']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['12']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['12']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="12" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['12']['5'] ? bean['12']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['12']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['12']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['12']['5'].get(0).smsMsg }</textarea>
				</td>
			</tr> --%>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">상담사 및 관리자가<br/>일정 변경 시</th>
				<th class="line" align="center" bgcolor="#F5F5F5" style="width:106px;">즉시</th>
				<td align="left">
					<input type="hidden" name="caseNo" value="13" />
					<input type="hidden" name="counselNo" value="1" />
					<input type="hidden" name="useYn" value="${!empty bean['13']['1'] ? bean['13']['1'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['13']['1'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['13']['1'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['13']['1'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="13" />
					<input type="hidden" name="counselNo" value="2" />
					<input type="hidden" name="useYn" value="${!empty bean['13']['2'] ? bean['13']['2'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['13']['2'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['13']['2'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['13']['2'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="13" />
					<input type="hidden" name="counselNo" value="3" />
					<input type="hidden" name="useYn" value="${!empty bean['13']['3'] ? bean['13']['3'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['13']['3'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['13']['3'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['13']['3'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="13" />
					<input type="hidden" name="counselNo" value="4" />
					<input type="hidden" name="useYn" value="${!empty bean['13']['4'] ? bean['13']['4'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['13']['4'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['13']['4'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['13']['4'].get(0).smsMsg }</textarea>
				</td>
				<td align="left">
					<input type="hidden" name="caseNo" value="13" />
					<input type="hidden" name="counselNo" value="5" />
					<input type="hidden" name="useYn" value="${!empty bean['13']['5'] ? bean['13']['5'].get(0).useYn : 'N' }" />
					<span>사용여부 : <input type="checkbox" name="useYnCheck" value="Y" ${bean['13']['5'].get(0).useYn eq 'Y' ? 'checked' : ''} /></span>
					<textarea style="width: 97%; height: 400px;" name="smsMsg" ${bean['13']['5'].get(0).useYn eq 'Y' ? '' : 'readonly'}>${bean['13']['5'].get(0).smsMsg }</textarea>
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
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" value="등록" onclick="fncSubmit()" style="height:30px; width:100px;">
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</c:if>
<c:if test="${empty clientCd }">
	<h1>고객사를 먼저 선택해주세요.</h1>
</c:if>
</form>

</body>
</html>

