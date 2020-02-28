<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인상담일지</title>

<script type="text/javascript">

	<c:if test="${!empty alertYn}">
		if(confirm(" 답변저장이 완료 되었습니다.\n상담일지 리스트에서 '작성'를 눌러주세요.\n\n확인 버튼을 누르시면 리스트로 이동합니다.")){
			location.href = "/partner/pCounselorMgr/pCounselorDateList";
		}
	</c:if>

function checkLength(textId){
	var textLength = j$("#"+textId).val().length;
	if(textLength < 300){
		alert("답변은 최소 300자 이상을 입력해주세요.");
		j$("#"+textId).focus();
		return "N";
	}
}

function saveCounsel(target){
	var infoMsg = "";
	var checkText = "";
	
	if(target == "result"){
		var answer1 = j$("#answer1").val();
		if(answer1 == ""){
			alert("1번 답변을 입력해주세요.");
			j$("#answer1").focus();
			return false;
		}else{
			checkText = checkLength("answer1");
			if(checkText == "N"){
				return false;
			}
		}
	
		var answer2 = j$("#answer2").val();
		if(answer2 == ""){
			alert("2번 답변을 입력해주세요.");
			j$("#answer2").focus();
			return false;
		}else{
			checkText = checkLength("answer2");
			if(checkText == "N"){
				return false;
			}
		}
	
		var answer3 = j$("#answer3").val();
		if(answer3 == ""){
			alert("3번 답변을 입력해주세요.");
			j$("#answer3").focus();
			return false;
		}else{
			checkText = checkLength("answer3");
			if(checkText == "N"){
				return false;
			}
		}
	
		var answer4 = j$("#answer4").val();
		if(answer4 == ""){
			alert("4번 답변을 입력해주세요.");
			j$("#answer4").focus();
			return false;
		}else{
			checkText = checkLength("answer4");
			if(checkText == "N"){
				return false;
			}
		}
	
		var answer5 = j$("#answer5").val();
		if(answer5 == ""){
			alert("5번 답변을 입력해주세요.");
			j$("#answer5").focus();
			return false;
		}else{
			checkText = checkLength("answer5");
			if(checkText == "N"){
				return false;
			}
		}
		
		infoMsg = " 답변은 제출하시면 수정이 불가능합니다.\n최종제출 하시겠습니까?";
		j$("#answerYn").val("Y");
	}else{
		infoMsg = " 입력하신 내용을 임시 저장 하시겠습니까?";
	}
	
	if(confirm(infoMsg)){
		j$("#saveFrm").submit();
	}else{
		j$("#answerYn").val("");
	}
}
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; font-weight: bold; }
</style>
</head>
<body>

<form id="saveFrm" name="saveFrm" modelAttribute="mindCounselIntakeDto" action="/partner/pCounselorMgr/pCounselBbsAdd" method="POST">
<input type="hidden" name="answerYn" id="answerYn" value=""> 
<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">개인상담일지</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="10px"></td></tr>
<tr>
	<td><h3>* 내담자 작성 질문지</h3></td>	
</tr>
<tr>
	<td>
		<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<c:forEach var="list" items="${counselInfo }" varStatus="idx">
				<tr>
					<th class="line" width="20%"  align="left" bgcolor="#F5F5F5">
						<c:choose>
							<c:when test="${idx.index eq 0 }">1. 지금 어떤 도움을 받고 싶으신가요?</c:when>
							<c:when test="${idx.index eq 1 }">2. 조금 더 구체적인 상황이나 정황을 설명해주세요.</c:when>
							<c:when test="${idx.index eq 2 }">3. 문제가 계속되게 하는 혹은 더 악화시키는 요인들은 무엇인가요?</c:when>
							<c:when test="${idx.index eq 3 }">4. 가장 많이 드는 생각은 어떤 것인가요?</c:when>
							<c:when test="${idx.index eq 4 }">5. 기분, 감정, 정서가 어떠신가요? 잘 느껴지지 않으면 눈을 감고 마음을 잠시 들여다 보세요.</c:when>
							<c:when test="${idx.index eq 5 }">6. 글을 쓰던 중에 혹시 문득 떠오르는 생각이나 과거의 경험들이 있다면 표현해주세요.</c:when>
							<c:when test="${idx.index eq 6 }">7. 대인관계는 어떤가요? 가족, 친구, 윗사람들, 동생들과 (옛)연인과의 관계는 어떤가요?</c:when>
							<c:when test="${idx.index eq 7 }">8. 내가 생각하기에 나는 어떤 사람인가요?</c:when>
							<c:when test="${idx.index eq 8 }">9. 나를 버티게 해주는 것과 좌절 하게 하는 것은 무엇인가요?</c:when>
							<c:otherwise>10. 마지막으로 하고 싶은 이야기를 마음껏 해주세요.</c:otherwise>
						</c:choose>
						<c:if test="${idx.index eq 0 }">
							<input type="hidden" name="intakeCd" id="intakeCd" value="${list.intakeCd }"> 
							<input type="hidden" name="clientCd" id="clientCd" value="${list.clientCd }"> 
						</c:if>
					</th>
			    	<td class="line" width="75%"  >
			    		<textarea rows="5" cols="5" readonly="readonly" style="width:95%; height:100px;">${list.answer }</textarea>
			    	</td>
			    </tr>
			</c:forEach>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>
<tr>
	<td><h3>* 상담자 답변 작성</h3></td>	
</tr>
<tr>
	<td>
		<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" width="20%" rowspan="2" align="left" bgcolor="#F5F5F5">1. 내담자의 상태에 대한 반영 및 요약</th>
				<td class="line" width="75%" align="center" >
					<span class="fontBlue">
						위의 글을 바탕으로 내담자의 상태를 요약하여 반영함
					</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="line" width="75%"  >
		    		<textarea rows="5" cols="5" name="answer1" id="answer1" style="width:95%; height:100px;">${replyInfo.answer1 }</textarea> <br><br>
		    		* 같은 내용을 반복하기보다는 최대한 내담자가 공감 받는다는 것을 알 수 있도록 <br>
		    		* 내담자가 적지 않은 부분까지도, 공감하고 이해할 수 있는 점을 표현해주기 <br>
		    		* 애매하고 모호한 부분은 if-의 단서를 달아서 작성된 내용을 단정적으로 표현하지 않을 것 <br><br>
		    	</td>
		    </tr>
		    
			<tr>
				<th class="line" width="20%" rowspan="2" align="left" bgcolor="#F5F5F5">2. 내담자의 상태에 대해서 심도있는 시각으로 다시 요약 및 해석</th>
				<td class="line" width="75%" align="center" >
					<span class="fontBlue">
						내담자의 상태에 대해서 한단계 더 깊이 들어가, 내담자가 생각하지 못했던 시각으로 해석 및 요약
					</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="line" width="75%"  >
		    		<textarea rows="5" cols="5" name="answer2" id="answer2" style="width:95%; height:100px;">${replyInfo.answer2 }</textarea> <br><br>
		    		* 다시 한번 내담자를 공감해주면서도, 그에 대해서 보다 깊은 차원으로 접근 <br>
		    		* 새로운 시각 적용 <br>
		    		* 애매하고 모호한 부분은 질문형태로 가능성을 제시 <br><br>
		    	</td>
		    </tr>
		    
			<tr>
				<th class="line" width="20%" rowspan="2" align="left" bgcolor="#F5F5F5">3. 내담자에게 해줘야 할 상담적으로 가장 핵심이 되는 답변</th>
				<td class="line" width="75%" align="center" >
					<span class="fontBlue">
						내담자에게 가장 필요한 핵심이 되는 답변
					</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="line" width="75%"  >
		    		<textarea rows="5" cols="5" name="answer3" id="answer3" style="width:95%; height:100px;">${replyInfo.answer3 }</textarea> <br><br>
		    		* 내담자의 상황, 주호소문제, 자원, 대처방법 등을 고려하여 현재 가장 필요한 핵심이 되는 답변 제공<br>
		    		* 지나치게 분석적이거나 핵심적인 내용을 쏟아내기 보다는, 내담자가 받아들일 수 있을 정도의 한두가지의 이야기에 집중 <br>
		    		* 현재 당장은 아니나 이후에 필요한 것이나 조언해줄 부분에 대해서도 간접적으로 제언 <br><br>
		    	</td>
		    </tr>
		    
			<tr>
				<th class="line" width="20%" rowspan="2" align="left" bgcolor="#F5F5F5">4. 도움이 될 만한 현실적인 해결책 및 조언, 상담독려</th>
				<td class="line" width="75%" align="center" >
					<span class="fontBlue">
						단회기 상담임을 고려하여, 도움이 될만한 해결책 및 실질적으로 도움이 될만한 조언
					</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="line" width="75%"  >
		    		<textarea rows="5" cols="5" name="answer4" id="answer4" style="width:95%; height:100px;">${replyInfo.answer4 }</textarea> <br><br>
		    		* 상담연계나 필요하다면 병원연계를 독려 <br>
		    		* 도움이 될만한 책, 영화, 요가, 운동 등을 추천 <br>
		    		* 실질적으로 필요한 팁 제공 <br><br>
		    	</td>
		    </tr>
		    
			<tr>
				<th class="line" width="20%" rowspan="2" align="left" bgcolor="#F5F5F5">5. 종합 및 정리</th>
				<td class="line" width="75%" align="center" >
					<span class="fontBlue">
						마무리하면서 종합적으로 내담자에게 하고 싶은 이야기
					</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="line" width="75%"  ><br>
		    		<textarea rows="5" cols="5" name="answer5" id="answer5" style="width:95%; height:100px;">${replyInfo.answer5 }</textarea> <br><br>
		    		* 내담자에게 마지막으로 전하고 싶은 이야기 <br>
		    		* 미래에 대한 기원과 축복 <br>
		    		* 고마움 표시 <br><br>
		    	</td>
		    </tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>
<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr>
				<td colspan="4">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tr>
							<td align="center">
					    		<button onclick="saveCounsel('result')" style="height:30px; width:100px;" type="button">최종저장</button>
					    		<span style="padding-left: 30px;"></span>
					    		<button onclick="saveCounsel('temp')" style="height:30px; width:100px;" type="button">임시저장</button>
				    		</td>
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr><td height="20px"></td></tr>

</table>
</form>
</body>
</html>

