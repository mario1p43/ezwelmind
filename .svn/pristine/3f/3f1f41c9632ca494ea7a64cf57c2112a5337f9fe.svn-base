<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>진단 항목 설정</title>
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
	
	$(document).ready(function(){
		DIAGNOSER.init(); // init
	});
	
	var DIAGNOSER = {
		init : function() {
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors1,
			    elPlaceHolder: "contents",
			    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
			    htParams : {bUseToolbar : true,
		            fOnBeforeUnload : function(){},
		            fOnAppLoad : function(){}
		            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		  		 },
			    fCreator: "createSEditor2"
			});
		},
		addAnswerRow : function(obj) { // 답변 줄 추가
			var $td = $(obj).parent().next();
			
			var html = "";
			
			html += '<div style="margin-top:3px;">';
			html += '	<input type="text" style="width: 65%" name="answer" />';
			html += '	<input type="text" style="width: 27%" name="answerNum" />';
			html += '	<input type="hidden" name="qstItemNum" />';
			html += '	<input type="hidden" name="orderNo" />';
			html += '</div>';
			
			$td.append(html);
		},
		removeAnswerRow : function(obj) { // 답변 줄 삭제
			var $td = $(obj).parent().next();
			
			$td.find("div:last").remove();
		},
		addRow : function(obj) { // 질문 줄 추가
			var $tr = $(obj).parent().parent();
			var $tbody = $tr.parent();
			
			var html = $tr.html();
			
			$tbody.append("<tr class='question_data'>" + html + "</tr>");
			
			$("#questionTable tbody tr:last td:eq(2) div").remove();
			$("#questionTable tbody tr:last td:eq(0) input[name=question]").val("");
			
			DIAGNOSER.resetRowNumber();
		},
		removeRow : function(obj) { // 질문 줄 삭제
			var $tr = $(obj).parent().parent();
			var $trs = $tr.parent().find("tr");
			
			if($trs.length == 1) {
				alert("질문의 최소 개수는 1개입니다.");
				
				return false;
			}
			
			$tr.remove();
			
			DIAGNOSER.resetRowNumber();
		},
		upArrow : function(obj) { // 질문 위로
		    var $prevTr = $(obj).parent().parent().prev();
		     
		    if($prevTr.attr("class") == undefined) {
		    	return false;
		    }
		    
		    var thisTr = $(obj).parent().parent().detach();
		    
		    $prevTr.before(thisTr);
		    
			DIAGNOSER.resetRowNumber();
		},
		downArrow : function(obj) { // 질문 아래로
		    var $nextTr = $(obj).parent().parent().next();
		    
		    if($nextTr.attr("class") == undefined) {
		    	return false;
		    }
		    
		    var thisTr = $(obj).parent().parent().detach();
		    
		    $nextTr.after(thisTr);
		    
			DIAGNOSER.resetRowNumber();
		},
		resetRowNumber : function() { // 정렬번호 수정
			$("#questionTable tbody tr").each(function(i) {
				$(this).find("th").html((i+1));
			});
		},
		regist : function() {
			
			if(!confirm("저장하시겠습니까?\n저장을 하더라도 이미 진행중인 진단의 문항은 변경되지 않습니다.")) {
				return false;
			}
			
			if($("input[name=grpNm]").val() == "") {
				alert("진단 명을 입력해주세요.");
				
				return false;
			}
			
			$("#questionTable tbody tr").each(function(i) {
				$this = $(this);
				
				$this.find("[name=question]").attr("name", "questions["+i+"].question");
				
				$this.find("[name=qstNum]").val(i + 1);
				$this.find("[name=qstNum]").attr("name", "questions["+i+"].qstNum");
				
				$this.find("td:eq(2) div").each(function(i2) {
					$that = $(this);
					$that.find("[name=answer]").attr("name", "questions["+i+"].answers["+i2+"].answer");	
					$that.find("[name=answerNum]").attr("name", "questions["+i+"].answers["+i2+"].answerNum");
					
					$that.find("[name=qstItemNum]").val(i2 + 1)
					$that.find("[name=qstItemNum]").attr("name", "questions["+i+"].answers["+i2+"].qstItemNum");
					
					$that.find("[name=orderNo]").val(i2);
					$that.find("[name=orderNo]").attr("name", "questions["+i+"].answers["+i2+"].orderNo");	
				});
			});
			
			oEditors1.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			
			$("#saveForm").attr("action", "/madm/clientPoll/commPoll/save");
			$("#saveForm").attr("method", "post");
			$("#saveForm").submit();
		}
		
	};
</script>
</head>
<body>
	<form id="saveForm">
	<input type="hidden" name="grpSeq" value="${bean.grpSeq }" />
	<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">진단 설정</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">진단 명</th>
						<td align="left"><input type="text" style="width:50%;" name="grpNm" value="${bean.grpNm }" /></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">진단 내용</th>
						<td align="left"><textarea id="contents" name="contents" style="width:100%; height: 300px;">${bean.contents }</textarea></td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">결과 타입</th>
						<td align="left">
							<select name="resultType">
								<option value="stress" ${bean.resultType eq 'stress' ? 'selected' : '' }>스트레스</option>
								<option value="depress" ${bean.resultType eq 'depress' ? 'selected' : '' }>우울</option>
								<option value="work" ${bean.resultType eq 'work' ? 'selected' : '' }>직무스트레스</option>
								<option value="insomnia" ${bean.resultType eq 'insomnia' ? 'selected' : '' }>불면증</option>
								<option value="exhaust" ${bean.resultType eq 'exhaust' ? 'selected' : '' }>소진</option>
								<option value="anxiety" ${bean.resultType eq 'anxiety' ? 'selected' : '' }>상태불안</option>
								<option value="emotion" ${bean.resultType eq 'emotion' ? 'selected' : '' }>감정노동</option>
								<option value="impact" ${bean.resultType eq 'impact' ? 'selected' : '' }>사건충격</option>
								<option value="kels" ${bean.resultType eq 'kels' ? 'selected' : '' }>감정노동스트레스</option>
								<option value="mhaco" ${bean.resultType eq 'mhaco' ? 'selected' : '' }>교정공무원 정신건강 평가</option>
								<option value="phq9" ${bean.resultType eq 'phq9' ? 'selected' : '' }>우울감(PHQ-9)</option>
								<option value="gad7" ${bean.resultType eq 'gad7' ? 'selected' : '' }>불안감(GAD-7)</option>
							</select>
							<b style="color:red">* 신규 척도 생성시에는 요청이 필요합니다.</b>
						</td>
					</tr>
					<tr>
						<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">진단 항목</th>
						<td align="left">
							<table id="questionTable" cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
								<thead>
									<tr>
										<th class="line" align="center" bgcolor="#F5F5F5" style="width: 5%;">순번</th>
										<th class="line" align="center" bgcolor="#F5F5F5" style="width: 55%;">질문</th>
										<th class="line" align="center" bgcolor="#F5F5F5" style="width: 5%;"></th>
										<th class="line" align="center" bgcolor="#F5F5F5" style="width: 20%;">답변</th>
										<th class="line" align="center" bgcolor="#F5F5F5" style="width: 15%;">기능</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty bean }">
											<c:forEach var="question" items="${bean.questions }">
												<tr class="question_data">
													<th class="line" align="center" bgcolor="#F5F5F5" style="width: 5%;">${question.qstNum }</th>
													<td align="left" style="width:55%;">
														<input type="text" style="width: 100%" name="question" value="${question.question }" /> 
														<input type="hidden" name="qstNum" value="${question.qstNum }" />
													</td>
													<td align="center" style="width:5%;">
														<input type="button" onclick="DIAGNOSER.addAnswerRow(this);" value="+" />&nbsp;<input type="button" onclick="DIAGNOSER.removeAnswerRow(this);" value="-" />  
													</td>
													<td align="center" style="width:20%;">
														<c:forEach var="answer" items="${question.answers }">
															<div style="margin-top:3px;">
																<input type="text" style="width: 65%" name="answer" value="${answer.answer }" />
																<input type="text" style="width: 27%" name="answerNum" value="${answer.answerNum }" />
																<input type="hidden" name="qstItemNum" value="${answer.qstItemNum }" />
																<input type="hidden" name="orderNo" value="${answer.orderNo }" />
															</div>
														</c:forEach>
													</td>
													<td align="center" style="width:15%;">
														<input type="button" onclick="DIAGNOSER.upArrow(this);" value="↑" />&nbsp;<input type="button" onclick="DIAGNOSER.downArrow(this);" value="↓" />&nbsp;
														<input type="button" onclick="DIAGNOSER.addRow(this);" value="+" />&nbsp;<input type="button" onclick="DIAGNOSER.removeRow(this);" value="-" /> 
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="question_data">
												<th class="line" align="center" bgcolor="#F5F5F5" style="width: 5%;">1</th>
												<td align="left" style="width:55%;">
													<input type="text" style="width: 100%" name="question" /> 
													<input type="hidden" name="qstNum" value="" />
												</td>
												<td align="center" style="width:5%;">
													<input type="button" onclick="DIAGNOSER.addAnswerRow(this);" value="+" />&nbsp;<input type="button" onclick="DIAGNOSER.removeAnswerRow(this);" value="-" />  
												</td>
												<td align="center" style="width:20%;">
													<div style="margin-top:3px;">
														<input type="text" style="width: 65%" name="answer" />
														<input type="text" style="width: 27%" name="answerNum" />
														<input type="hidden" name="qstItemNum" />
														<input type="hidden" name="orderNo" />
													</div>
												</td>
												<td align="center" style="width:15%;">
													<input type="button" onclick="DIAGNOSER.upArrow(this);" value="↑" />&nbsp;<input type="button" onclick="DIAGNOSER.downArrow(this);" value="↓" />&nbsp;
													<input type="button" onclick="DIAGNOSER.addRow(this);" value="+" />&nbsp;<input type="button" onclick="DIAGNOSER.removeRow(this);" value="-" /> 
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
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
				<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-collapse:collapse;">
					<tr>
						<td class="" colspan="4" height="60px" align="center">
							<div class="webArea">
				    			<input type="button" onclick="DIAGNOSER.regist();" value="저장" style="height:30px;width:100px;"/>
				    		</div>
				    	</td>
					</tr>
				</table>
				<!-- 버튼 영역 종료 -->
			</td>
		</tr>
	</table>
	</form>
</body>
</html>