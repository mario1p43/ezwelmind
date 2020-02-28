<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>센터 매입가관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	$.validate({
		form : '#centerPrice',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			 
		}
	});
	
	j$("#saveBtn").click(function(){
		j$("#centerPrice").submit();
		return false;
	});
	
	j$("#allBtn").click(function(){
		var price =  j$("#price").val();
		j$(".all").val(price);		
		
		return false;
	});
	
	j$(".all").attr("data-validation", "required");
	j$(".all").attr("data-validation-error-msg-required", "비용을 확인 해주세요.");

	
});
</script>
</head>
<body>

<form:form name="centerPrice" id="centerPrice"  action="/madm/centerInfo/getCenterPriceUpdate">
<input type="hidden" name="centerSeq" value="${centerInfo.centerSeq }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td  colspan="3">
	
		<table cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td  align="left" class="subtitle">센터관리</td>
			</tr>
		</table>

	<tr>
		<td height="20px"></td>
	</tr>
	<tr><td> 상담센터</td></tr>
	<tr>
					<td colspan="3">
						<!-- 검색 영역 시작 -->
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">센터코드</th>
						    	<td width="35%" align="left">
									${centerInfo.centerSeq }
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">센터구분</th>
						    	<td width="35%" align="left">
						    	<comm:commNmOut code="${centerInfo.centerType }"  option="commCd"/>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">센터명</th>
						    	<td width="35%" align="left">
						    		${centerInfo.centerNm }
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">등록자</th>
						    	<td width="35%" align="left">
									${centerInfo.regId }
						    	</td>
							</tr>
							
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				
				<tr>
					<td colspan="3" height="10px"></td>
				</tr>

				<tr>
					<td>상담/검사 비용 설정</td>
					<td align="right"><input type="text" id="price"> </td>
					<td align="right" width="5%" style="padding-right: 100px"><input type="button" id="allBtn" value="일괄입력"> </td>
				</tr>
				<tr>
					<td colspan="3" height="10px"></td>
				</tr>
	
		<table cellpadding="0" cellspacing="0" border="0" width="95%" align="left">

			<tr>
				<td>
					<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr >
			                  <th  width="">상담유형</th>
			                  <th  width="">상담분야</th>
			                  <th  width="">대면상담</th>
			                  <th  width="">전화상담</th>
			                  <th  width="">1:1 게시판 상담</th>
			                </tr>
			                
			            </thead>

						<tbody>
								<tr><td rowspan="7">심리</td><td>개인상담</td><td><input type="text" class="all" name="face1" value="${priceList[0].price01}"> 원</td><td><input type="text" class="all" name="call1" value="${priceList[0].price02}"> 원</td><td><input type="text" class="all" name="board1" value="${priceList[0].price03}"> 원</td></tr>
								<tr><td>부부/가족상담</td><td><input type="text" class="all" name="face2" value="${priceList[1].price01}"> 원</td><td><input type="text" class="all" name="call2" value="${priceList[1].price02}"> 원</td><td><input type="text" class="all" name="board2" value="${priceList[1].price03}"> 원</td></tr>
								<tr><td>놀이치료</td><td><input type="text" class="all" name="face3" value="${priceList[2].price01}"> 원</td><td><input type="text" class="all" name="call3" value="${priceList[2].price02}"> 원</td><td><input type="text" class="all" name="board3" value="${priceList[2].price03}"> 원</td></tr>
								<tr><td>미술치료</td><td><input type="text" class="all" name="face4" value="${priceList[3].price01}"> 원</td><td><input type="text" class="all" name="call4" value="${priceList[3].price02}"> 원</td><td><input type="text" class="all" name="board4" value="${priceList[3].price03}"> 원</td></tr>
								<tr><td>언어치료</td><td><input type="text" class="all" name="face5" value="${priceList[4].price01}"> 원</td><td><input type="text" class="all" name="call5" value="${priceList[4].price02}"> 원</td><td><input type="text" class="all" name="board5" value="${priceList[4].price03}"> 원</td></tr>
								<tr><td>특수재활치료</td><td><input type="text" class="all" name="face6" value="${priceList[5].price01}"> 원</td><td><input type="text" class="all" name="call6" value="${priceList[5].price02}"> 원</td><td><input type="text" class="all" name="board6" value="${priceList[5].price03}"> 원</td></tr>
								<tr><td>기타</td><td><input type="text" class="all" name="face7" value="${priceList[6].price01}"> 원</td><td><input type="text" class="all" name="call7" value="${priceList[6].price02}"> 원</td><td><input type="text" class="all" name="board7" value="${priceList[6].price03}"> 원</td></tr>
								<tr><td rowspan="3">법률</td><td>일반법률</td><td><input type="text" class="all" name="face8" value="${priceList[7].price01}"> 원</td><td><input type="text" class="all" name="call8" value="${priceList[7].price02}"> 원</td><td><input type="text" class="all" name="board8" value="${priceList[7].price03}"> 원</td></tr>
								<tr><td>부동산법률</td><td><input type="text" class="all" name="face9" value="${priceList[8].price01}"> 원</td><td><input type="text" class="all" name="call9" value="${priceList[8].price02}"> 원</td><td><input type="text" class="all" name="board9" value="${priceList[8].price03}"> 원</td></tr>
								<tr><td>세무</td><td><input type="text" class="all" name="face10" value="${priceList[9].price01}"> 원</td><td><input type="text" class="all" name="call10" value="${priceList[9].price02}"> 원</td><td><input type="text" class="all" name="board10" value="${priceList[9].price03}"> 원</td></tr>
								<tr><td>재무</td><td>재무</td><td><input type="text" class="all" name="face11" value="${priceList[10].price01}"> 원</td><td><input type="text" class="all" name="call11" value="${priceList[10].price02}"> 원</td><td><input type="text" class="all" name="board11" value="${priceList[10].price03}"> 원</td></tr>
								
								<tr><td rowspan="5">심리검사</td><td>종합심리검사</td><td><input type="text" class="all" name="face12" value="${priceList[11].price01}"> 원</td><td><input type="text" class="all" name="call12" value="${priceList[11].price02}"> 원</td><td><input type="text" class="all" name="board12" value="${priceList[11].price03}"> 원</td></tr>
								<tr><td>정서 및 성격검사</td><td><input type="text" class="all" name="face13" value="${priceList[12].price01}"> 원</td><td><input type="text" class="all" name="call13" value="${priceList[12].price02}"> 원</td><td><input type="text" class="all" name="board13" value="${priceList[12].price03}"> 원</td></tr>
								<tr><td>진로 및 적성검사</td><td><input type="text" class="all" name="face14" value="${priceList[13].price01}"> 원</td><td><input type="text" class="all" name="call14" value="${priceList[13].price02}"> 원</td><td><input type="text" class="all" name="board14" value="${priceList[13].price03}"> 원</td></tr>
								<tr><td>신경심리검사</td><td><input type="text" class="all" name="face15" value="${priceList[14].price01}"> 원</td><td><input type="text" class="all" name="call15" value="${priceList[14].price02}"> 원</td><td><input type="text" class="all" name="board15" value="${priceList[14].price03}"> 원</td></tr>
								<tr><td>기타</td><td><input type="text" class="all" name="face16" value="${priceList[15].price01}"> 원</td><td><input type="text" class="all" name="call16" value="${priceList[15].price02}"> 원</td><td><input type="text" class="all" name="board16" value="${priceList[15].price03}"> 원</td></tr>
								<tr><td colspan="2">첫 상담후 결정</td><td><input type="text" class="all" name="face17" value="${priceList[16].price01}"> 원</td><td><input type="text" class="all" name="call17" value="${priceList[16].price02}"> 원</td><td><input type="text" class="all" name="board17" value="${priceList[16].price03}"> 원</td></tr>
						</tbody>
					</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
							    		<button id="saveBtn" style="height:30px; width:100px;" type="button">저장</button>
					    			</tr>
					    		</table>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${not empty priceList}">
				<tr><td><input type="hidden" name="choice" value="update"> </td></tr>
			</c:when>
			<c:otherwise>
				<tr><td><input type="hidden" name="choice" value="insert"> </td></tr>
			</c:otherwise>
		
		</c:choose>
		
		
	</td>
</tr>
</table>
</form:form>



</body>
</html>