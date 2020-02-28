<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>진단자 정보 설정</title>
<style type="text/css">
.upload_table {border-top:solid 2px #838383;width:100%;border-spacing:0;}
.upload_table th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
.upload_table th:first-child{border-left:none;}
.upload_table td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;}
.upload_table td:first-child{border-left:none;}
#sampleFile {cursor:pointer;color: rgb(0,0,255);width:300px;text-align:left;padding-top:20px;padding-bottom: 20px;font-size: 23px;font-weight: bold;font-style: italic;}
</style>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors1 = [];
	var oEditors2 = [];
	var oEditors3 = [];
	var $field;
	$(document).ready(function(){
		DIAGNOSER.init(); // init
	});
	
	var DIAGNOSER = {
		init : function() {
			
			// editor loading
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors1,
			    elPlaceHolder: "topContents",
			    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
			    htParams : {bUseToolbar : true,
		            fOnBeforeUnload : function(){},
		            fOnAppLoad : function(){}
		            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		  		 },
			    fCreator: "createSEditor2"
			});
			
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors2,
			    elPlaceHolder: "cautionContents",
			    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
			    htParams : {bUseToolbar : true,
		            fOnBeforeUnload : function(){},
		            fOnAppLoad : function(){}
		            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		  		 },
			    fCreator: "createSEditor2"
			});
			
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors3,
			    elPlaceHolder: "agreeContents",
			    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
			    htParams : {bUseToolbar : true,
		            fOnBeforeUnload : function(){},
		            fOnAppLoad : function(){}
		            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		  		 },
			    fCreator: "createSEditor2"
			});
		},
		save : function() {
			
			// save confirm msg
			if(!confirm("저장하시겠습니까?\n저장하는 즉시 반영됩니다.")) {
				return false;
			}
			
			// loop of field size
			for(var i = 0; i < 9; i++) {
				$this = $(".field" + i);
				
				// arr name setting
				$this.find("[name=fieldSeq]").val((i + 1));
				$this.find("[name=fieldSeq]").attr("name", "fields["+i+"].fieldSeq");

				$this.find("[name=orderNo]").val(i);
				$this.find("[name=orderNo]").attr("name", "fields["+i+"].orderNo");
				
				$this.find("[name=useYn]").val($this.find("[name=customUseYn]").prop("checked") ? "Y" : "N");
				$this.find("[name=useYn]").attr("name", "fields["+i+"].useYn");
				
				$this.find("[name=infoType]").attr("name", "fields["+i+"].infoType");
				$this.find("[name=fieldType]").attr("name", "fields["+i+"].fieldType");
				$this.find("[name=fieldNm]").attr("name", "fields["+i+"].fieldNm");
				$this.find("[name=checkUseYn]").attr("name", "fields["+i+"].checkUseYn");
				$this.find("[name=branchUseYn]").attr("name", "fields["+i+"].branchUseYn");
				$this.find("[name=gradeUseYn]").attr("name", "fields["+i+"].gradeUseYn");
				$this.find("[name=fieldRequiredYn]").attr("name", "fields["+i+"].fieldRequiredYn");
				$this.find("[name=fieldRequiredMsg]").attr("name", "fields["+i+"].fieldRequiredMsg");
				$this.find("[name=fieldValue]").attr("name", "fields["+i+"].fieldValue");
				// arr name setting
			}
			
			// editor value to textarea
			oEditors1.getById["topContents"].exec("UPDATE_CONTENTS_FIELD", []);
			oEditors2.getById["cautionContents"].exec("UPDATE_CONTENTS_FIELD", []);
			oEditors3.getById["agreeContents"].exec("UPDATE_CONTENTS_FIELD", []);
			
			// submit
			$("#saveForm").attr("action", "/madm/clientPoll/diagnoser/save");
			$("#saveForm").attr("method", "post");
			$("#saveForm").submit();
		}, 
		selectValues : function(obj) {
			
			$field = $(obj);
			
			var fieldValue = $field.parent().find("[name=fieldValue]").val();
			
			// 새 창이 열릴때 기존 데이터는 일괄 삭제함
			$("#userSelectValueArea tr").remove();
			
			if(fieldValue != "") {
				var field = $.parseJSON(fieldValue);
				
				for(var i in field) {
					var disp = field[i].dispText;
					var save = field[i].saveText;
					
					DIAGNOSER.registValueRow(disp, save);
				}
			}
			
			$.divPop('userSelectPop', "값 설정", $("#userSelectValues"));
		},
		registValueRow : function(key, value) {
			
			key = key || '';
			value = value || '';
			 
			var html = "";
			
			html += '<tr>';
			html += '	<td style="border-right: 1px solid #bebebe; border-top: 1px solid #bebebe;"><input type="text" name="selectKey" style="width:100%" value="'+key+'" /></td>';
			html += '	<td style="border-right: 1px solid #bebebe; border-top: 1px solid #bebebe;"><input type="text" name="selectValue" style="width:100%" value="'+value+'" /></td>';
			html += '	<td style="border-top: 1px solid #bebebe; text-align: center"><input type="button" onclick="DIAGNOSER.removeValueRow(this);" value="삭제" /></td>';
			html += '</tr>';
			
			$("#userSelectValueArea").append(html);
		},
		removeValueRow : function(obj) {
			$(obj).parent().parent().remove();
		},
		saveValues : function() {
			
			var list = []; 
			
			// user input data to json
			$("#userSelectValueArea tr").each(function() {
				var data = {};
				
				var dispText = $(this).find("[name=selectKey]").val();
				var saveText = $(this).find("[name=selectValue]").val();
				
				if(dispText.trim() != "" && saveText.trim() != "") {
					data.dispText = dispText;
					data.saveText = saveText;
					
					list.push(data);	
				}
			});
			
			// json to string after setting field value
			var fieldValue = JSON.stringify(list);
			
			$field.parent().find("[name=fieldValue]").val(fieldValue);
			
			$(".btClose").click();
			//alert("반드시 저장버튼을 눌러야 필드 값도 저장됩니다.");
		}
	};
</script>
</head>
<body>
	<form id="saveForm">
	<input type="hidden" name="pollSeq" value="${bean.pollSeq }" />
	<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">진단자 정보 설정</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">프로그램 명</th>
						<td align="left"><input type="text" style="width:50%;" name="programNm" value="${bean.programNm }" /> <b style="color:red">* 미입력시 "멘탈헬스 자가진단 설문" 노출</b></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">상단 이미지 경로<br/>(모바일 X)</th>
						<td align="left"><input type="text" style="width:50%;" name="topImgPath" value="${bean.topImgPath }" /> <b style="color:red">* 미입력시 기본 상단 이미지 노출 </b></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">좌측 로고 경로<br/>(모바일 상단)</th>
						<td align="left"><input type="text" style="width:50%;" name="leftLogoPath" value="${bean.leftLogoPath }" /> <b style="color:red">* 미입력시 고객사 코드에 따라서 로고 이미지 노출 </b></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">우측 로고 경로<br/>(모바일 X)</th>
						<td align="left"><input type="text" style="width:50%;" name="rightLogoPath" value="${bean.rightLogoPath }" /> <b style="color:red">* 미입력시 이지웰니스 로고 이미지 노출 </b></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">상단 내용</th>
						<td align="left"><textarea id="topContents" name="topContents" style="width:100%; height: 300px;">${bean.topContents }</textarea></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">주의 내용</th>
						<td align="left"><textarea id="cautionContents" name="cautionContents" style="width:100%; height: 200px;">${bean.cautionContents }</textarea></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">개인정보 취급방침 사용여부</th>
						<td align="left">
							<select name="agreeUseYn">
								<option value="Y" ${bean.agreeUseYn eq 'Y' ? 'selected' : '' }>Y</option>
								<option value="N" ${bean.agreeUseYn eq 'N' ? 'selected' : '' }>N</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">개인정보 취급방침 내용</th>
						<td align="left"><textarea id="agreeContents" name="agreeContents" style="width:100%; height: 200px;">${bean.agreeContents }</textarea></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">진단자 정보</th>
						<td align="left">
							* <b style="color:red">붉은</b> 글씨는 다시보기 사용시 기준점이 되는 필드입니다.
							<table id="userInfoTable" cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
								
								<%-- 사번 begin --%>
								<tr class="field field0">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="2"><b style="color:red">사번</b><input type="checkbox" name="customUseYn" ${fields['0'][0].useYn eq 'Y' ? 'checked' : '' } /> </th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left">
										<input type="hidden" name="fieldSeq" value="${fields['0'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['0'][0].infoType : '0' }" /> 
										<input type="hidden" name="fieldType" value="${!empty fields ? fields['0'][0].fieldType : 'text' }" /> 
										<input type="hidden" name="orderNo" value="${fields['0'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['0'][0].useYn }" />
										<input type="text" value="${!empty fields ? fields['0'][0].fieldNm : '사번' }" name="fieldNm" /> 
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">확인 사용 여부</th>
									<td align="left">
										<select name="checkUseYn">
											<option value="Y" ${fields['0'][0].checkUseYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['0'][0].checkUseYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
								</tr>
								<tr class="field field0">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['0'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['0'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['0'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 사번 end --%>
								
								<%-- 성명 begin --%>
								<tr class="field field1">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3"><b style="color:red">성명</b> <input type="checkbox" name="customUseYn" ${fields['1'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['1'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['1'][0].infoType : '1' }" /> 
										<input type="hidden" name="orderNo" value="${fields['1'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['1'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['1'][0].fieldNm : '성명' }" /> 
									</td>
								</tr>
								<tr class="field field1">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['1'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['1'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['1'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['1'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field1">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['1'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['1'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['1'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 성명 end --%>
								
								<%-- 성별 begin --%>
								<tr class="field field2">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">성별 <input type="checkbox" name="customUseYn" ${fields['2'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['2'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['2'][0].infoType : '2' }" /> 
										<input type="hidden" name="orderNo" value="${fields['2'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['2'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['2'][0].fieldNm : '성별' }" /> 
									</td>
								</tr>
								<tr class="field field2">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['2'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['2'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['2'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['2'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field2">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['2'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['2'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['2'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 성별 end --%>
								
								<%-- 연령 begin --%>
								<tr class="field field3">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">연령 <input type="checkbox" name="customUseYn" ${fields['3'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['3'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['3'][0].infoType : '3' }" /> 
										<input type="hidden" name="orderNo" value="${fields['3'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['3'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['3'][0].fieldNm : '연령' }" /> 
									</td>
								</tr>
								<tr class="field field3">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['3'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['3'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['3'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['3'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field3">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['3'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['3'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['3'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 연령 end --%>
								
								<%-- 소속 begin --%>
								<tr class="field field4">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">소속 <input type="checkbox" name="customUseYn" ${fields['4'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left">
										<input type="hidden" name="fieldSeq" value="${fields['4'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['4'][0].infoType : '4' }" /> 
										<input type="hidden" name="orderNo" value="${fields['4'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['4'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['4'][0].fieldNm : '소속' }" /> 
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">상담포유 소속 사용</th>
									<td align="left">
										<select name="branchUseYn">
											<option value="Y" ${fields['4'][0].branchUseYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['4'][0].branchUseYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
								</tr>
								<tr class="field field4">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['4'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['4'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['4'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['4'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field4">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['4'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['4'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['4'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 소속 end --%>
								
								<%-- 직급 begin --%>
								<tr class="field field5">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">직급 <input type="checkbox" name="customUseYn" ${fields['5'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left">
										<input type="hidden" name="fieldSeq" value="${fields['5'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['5'][0].infoType : '5' }" /> 
										<input type="hidden" name="orderNo" value="${fields['5'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['5'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['5'][0].fieldNm : '직급' }" /> 
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">상담포유 직급 사용</th>
									<td align="left">
										<select name="gradeUseYn">
											<option value="Y" ${fields['5'][0].gradeUseYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['5'][0].gradeUseYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
								</tr>
								<tr class="field field5">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['5'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['5'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['5'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['5'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field5">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['5'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['5'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['5'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 직급 end --%>
								
								<%-- 직군 begin --%>
								<tr class="field field6">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">직군 <input type="checkbox" name="customUseYn" ${fields['6'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['6'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['6'][0].infoType : '6' }" /> 
										<input type="hidden" name="orderNo" value="${fields['6'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['6'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['6'][0].fieldNm : '직군' }" /> 
									</td>
								</tr>
								<tr class="field field6">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['6'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['6'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['6'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['6'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field6">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['6'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['6'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['6'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 직군 end --%>
								
								<%-- 근속년수 begin --%>
								<tr class="field field7">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="3">근속년수 <input type="checkbox" name="customUseYn" ${fields['7'][0].useYn eq 'Y' ? 'checked' : '' } /></th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['7'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['7'][0].infoType : '7' }" /> 
										<input type="hidden" name="orderNo" value="${fields['7'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['7'][0].useYn }" />
										<input type="text" name="fieldNm" value="${!empty fields ? fields['7'][0].fieldNm : '근속년수' }" /> 
									</td>
								</tr>
								<tr class="field field7">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 타입</th>
									<td align="left">
										<select name="fieldType">
											<option value="text" ${fields['7'][0].fieldType eq 'text' ? 'selected' : '' }>텍스트</option>
											<option value="radio" ${fields['7'][0].fieldType eq 'radio' ? 'selected' : '' }>라디오</option>
											<option value="select" ${fields['7'][0].fieldType eq 'select' ? 'selected' : '' }>선택박스</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드 값</th>
									<td align="left">
										<input type="button" value="설정하기" onclick="DIAGNOSER.selectValues(this)" /><b> * 라디오나 선택박스 이용 시 설정이 가능합니다.</b> 
										<input type="hidden" name="fieldValue" value="${fields['7'][0].fieldValue }" />
									</td>
								</tr>
								<tr class="field field7">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['7'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['7'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['7'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 근속년수 end --%>
								
								<%-- 비밀번호 begin --%>
								<tr class="field field8">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;" rowspan="2"><b style="color:red">비밀번호</b><input type="checkbox" name="customUseYn" ${fields['8'][0].useYn eq 'Y' ? 'checked' : '' } /> </th>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필드명</th>
									<td align="left" colspan="3">
										<input type="hidden" name="fieldSeq" value="${fields['8'][0].fieldSeq }" /> 
										<input type="hidden" name="infoType" value="${!empty fields ? fields['8'][0].infoType : '8' }" /> 
										<input type="hidden" name="orderNo" value="${fields['8'][0].orderNo }" /> 
										<input type="hidden" name="useYn" value="${fields['8'][0].useYn }" />
										<input type="hidden" name="fieldType" value="password" /> 
										<input type="text" name="fieldNm" value="${!empty fields ? fields['8'][0].fieldNm : '비밀번호' }"  /> 
									</td>
								</tr>
								<tr class="field field8">
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">필수</th>
									<td align="left">
										<select name="fieldRequiredYn">
											<option value="Y" ${fields['8'][0].fieldRequiredYn eq 'Y' ? 'selected' : '' }>Y</option>
											<option value="N" ${fields['8'][0].fieldRequiredYn eq 'N' ? 'selected' : '' }>N</option>
										</select>
									</td>
									<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">미 입력시 메시지</th>
									<td align="left">
										<input type="text" name="fieldRequiredMsg" placeholder="미 입력시 오류 메시지" value="${fields['8'][0].fieldRequiredMsg }" style="width: 70%;" />
									</td>
								</tr>
								<%-- 사번 end --%>
								
							</table>
						</td>
					</tr>
					
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">다시보기 사용 여부</th>
						<td align="left">
							<select name="replayUseYn">
								<option value="Y" ${bean.replayUseYn eq 'Y' ? 'selected' : '' }>Y</option>
								<option value="N" ${bean.replayUseYn eq 'N' ? 'selected' : '' }>N</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">진단 검사 항목</th>
						<td align="left">
							<b style="color:red">* 데이터의 일관성 유지를 위해 진단 검사 항목은 최초 설정 이후 변경할 수 없습니다.</b><br/>
							<select style="width:25%" name="tmpltSeq" ${!empty bean.tmpltSeq ? 'readonly' : '' }>
								<c:forEach items="${tmpltList }" var="tmplt">
									<option value="${tmplt.tmpltSeq }" ${bean.tmpltSeq == tmplt.tmpltSeq ? 'selected' : '' }>${tmplt.tmpltNm }</option>
								</c:forEach>
							</select>
							
							<input type="number" min="1" max="4" name="stepCnt" value="${bean.stepCnt }" style="width:30px;" /> 단계까지 검사 
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
				<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-collapse:collapse;">
					<tr>
						<td class="" colspan="4" height="60px" align="center">
							<div class="webArea">
				    			<input type="button" value="저장" onclick="DIAGNOSER.save()" style="height:30px;width:100px;"/>
				    		</div>
				    	</td>
					</tr>
				</table>
				<!-- 버튼 영역 종료 -->
			</td>
		</tr>
	</table>
	</form>
	
	<div id="userSelectValues" style="display: none">
   	<table cellpadding="0" cellspacing="0" border="0" width="650px">
   		<tr>
   			<td align="center" style="font-weight:bold; font-family: dotum, 돋움, NanumGothic, 나눔고딕, 'Malgun Gothic', '맑은 고딕', Tahoma, Geneva, sans-serif; font-size: 11pt; ">
   				* <b style="color: red">라디오</b>나 <b style="color: red">선택박스</b> 이용 시 설정이 가능합니다. <br/>일반 텍스트를 사용시에는 해당 항목이 노출되지 않습니다.
   				<br/>
   			</td>
   		</tr>
   		<tr>
   			<td align="center">
   				<input type="button" onclick="DIAGNOSER.registValueRow();" value="추가" style="margin-bottom: 8px; float: right;" />
   				<table style="border: 1px solid #bebebe; width:100%">
   					<colgroup>
   						<col style="width:45%" />
   						<col style="width:45%" />
   						<col />
   					</colgroup>
   					<thead>
   						<tr>
   							<th style="border-right: 1px solid #bebebe"> 노출 명 </th>
   							<th style="border-right: 1px solid #bebebe"> 저장 값 </th>
   							<th> 기능 </th>
   						</tr>
   					</thead>
   					<tbody id="userSelectValueArea">
   						
   					</tbody>
   				</table>
   			</td>
   		</tr>
   		<tr>
   			<td height="20px"></td>
   		</tr>
   		<tr>
   			<td align="center">
   				<table cellpadding="0" cellspacing="0" border="0">
   					<tr>
   						<td id="btn01">
   							<a href="#none" onclick="DIAGNOSER.saveValues()" style="color: #111111;background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg);">
   								<span style="background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg) right 0;">저 장</span>
   							</a>
   						</td>
   						<td width="40px"></td>
   						<td id="btn01">
   							<a class="btClose" href="#"style="color: #111111;background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg);">
   								<span style="background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg) right 0;">취 소</span>
   							</a>
   						</td>
   					</tr>
   				</table>
   			</td>
   		</tr>
   	</table>
   </div>
</body>
</html>