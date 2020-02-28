<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>개인상담일지</title>
</head>
<body>
<form:form id="counselReport" modelAttribute="" action="/partner/pCounselorMgr/counselReport" method="POST">
<table cellpadding="0" cellspacing="0" border="0" width="80%" height="100%">

<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">개인상담일지</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>
<tr><td>인테이크</td></tr>

<tr>
	<td>
		<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담 받을 분</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">생년월일</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">성별</th>
	            <td width="18%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">성명</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">학력/학년</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">직업</th>
	            <td width="18%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">휴대전화</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">이메일</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담분야</th>
	            <td width="18%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담방법</th>
	            <td width="18%"></td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담 세부주제</th>
	            <td colspan="3" width="52%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">자유기술</th>
	            <td colspan="5" width="85%"></td>
	        </tr>
	        
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>
<tr><td>기본정보</td></tr>

<tr>
	<td>
		<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">상담일자</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">전화상담시간</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">일지 작성일자</th>
	            <td width="22%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">내담자명</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">상담코드</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">상담사명</th>
	            <td width="22%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">고객명</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">직원과의관계</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">고객사</th>
	            <td width="22%"></td>
	        </tr>
	        <tr>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">연락처</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">사례위험도</th>
	            <td width="22%"></td>
	            <th class="line" width="11%" align="center" bgcolor="#F5F5F5">회기정보</th>
	            <td width="22%"></td>
	        </tr>
	        
		</table>
	</td>
</tr>


	        
<tr><td height="20px"></td></tr>
<tr><td>상담의 목표 및 계획</td></tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" width="11%" align="center" bgcolor="#F5F5F5">최종목표(장기목표)</th>
				<td><textarea rows="15" cols="" style="width:95%; height:100px;"></textarea></td>
			</tr>
			<tr>
				<th class="line" width="11%" align="center" bgcolor="#F5F5F5">과정목표(단기목표)<br>- 단기 상담의 경우 장기<br>목표와 동일가능</th>
				<td><textarea rows="15" cols="" style="width:95%; height:100px;"></textarea></td>
			</tr>
			<tr>
				<th class="line" width="11%" align="center" bgcolor="#F5F5F5">상담 계획</th>
				<td><textarea rows="15" cols="" style="width:95%; height:100px;"></textarea></td>
			</tr>
			
		</table>
	</td>
</tr>

</table>

</form:form>

<form:form>

<table cellpadding="0" cellspacing="0" border="0" width="80%" height="100%">
<tr><td height="20px"></td></tr>
<tr>
	<td align="left" width="">상담일지</td>
	<td align="right">※ 회기 이동 시 임시저장은 하셨는지 확인하세요. </td>
	<td align="right">
		<select id="sessionCo" name="sessionCo" >
			<option >회기</option>		
			<option value="1회기">1</option>
			<option value="2회기">2</option>
			<option value="3회기">3</option>
			<option value="4회기">4</option>
			<option value="5회기">5</option>
			<option value="6회기">6</option>
			<option value="7회기">7</option>
			<option value="8회기">8</option>
		</select> 
	</td>
	<td  align="right"><input type="button" value="이동"> </td>
</tr>
</table>

<table cellpadding="6" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
       <tr>
           <th class="line" colspan="1" align="center">대주제</th>
           <th class="line" colspan="1" align="center">소주제</th>
           <th class="line" colspan="4" align="center">내용</th>
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">상담의 주제</th>
           	
           <td colspan="5">
           	<table cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
           		<tr >
           		<th width="25%">회기 주제<br>본 회기의 핵심적 내용함축</th>
           		<td><textarea rows="15" cols=""style="width:100%; height:100px;"></textarea></td>
           		</tr>
           		<tr>
           		<th width="25%">회기 내<br>내담자의 주호소 문제</th>
           		<td><textarea rows="15" cols=""style="width:100%; height:100px;"></textarea></td>
           		</tr>
           	</table>
           </td>
           
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">상담과정</th>
           <td colspan="5">
           	<table cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
           		<tr >
           		<th width="25%">상담목표</th>
           		<td><textarea rows="15" cols=""style="width:100%; height:100px;"></textarea></td>
           		</tr>
           		<tr>
           		<th width="25%">주요 개입</th>
           		<td><textarea rows="15" cols=""style="width:100%; height:100px;"></textarea></td>
           		</tr>
           		<tr>
           		<th width="25%">내담자 주요 반응</th>
           		<td><textarea rows="15" cols=""style="width:100%; height:100px;"></textarea></td>
           		</tr>
           	</table>
           	
           </td>
           
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">상담에 대한<br>분석 및 소견<br>(사례개념화 방식)</th>
           <td colspan="5"></td>
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">기타</th>
           <td colspan="5"></td>
       </tr>
              <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">상담시간</th>
           <td colspan="5"></td>
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">파일첨부</th>
           <td colspan="5"></td>
       </tr>
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">사례위험도<br><기준></th>
           <td colspan="5"></td>
       </tr>
        <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">소명사유</th>
           <td colspan="5"></td>
       </tr>      
       <tr>
           <th class="line" colspan="1" align="center" bgcolor="#F5F5F5">계획</th>
           <td colspan="5"></td>
       </tr>

</table>
<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr>
				<td align="center" colspan="4">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
				    		<td id="btn01"><a href="#"><span id="searchBtn">임시저장</span></a></td>
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>



</table>

</form:form>



</body>
</html>