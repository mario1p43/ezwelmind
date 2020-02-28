<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수상세</title>
<script type="text/javascript">
j$(document).ready(function(){

	
	j$("#editBtn").click(function(){
		j$("#eduInfo").attr("action","/madm/edu/insertpage");
		j$("#eduInfo").submit();
	});
	
	j$("#listBtn").click(function(){
		location.href = "/madm/edu/archivestatus";
	});
	
	j$("#deleteBtn").click(function(){
		if(confirm("정말 삭제 하시겠습니까?")){
			j$("#eduInfo").attr("action","/madm/edu/deleteEduInfo");
			j$("#eduInfo").submit();
		}
	});
	
})
</script>
</head>
<body>
<form id="eduInfo" name="eduInfo" method="POST">
	<input type="hidden" name="eduId" value="${eduDetail.eduId}"/>
	<input type="hidden" name="centerSeq" value="${eduDetail.centerSeq}"/>
	<input type="hidden" name="centerNm" value="${eduDetail.centerNm}"/>
	<input type="hidden" name="userNm" value="${eduDetail.userNm}"/>
	<input type="hidden" name="eduDiv" value="${eduDetail.eduDiv}"/>
	<input type="hidden" name="eduType" value="${eduDetail.eduType}"/>
	<input type="hidden" name="eduNm" value="${eduDetail.eduNm}"/>
	<input type="hidden" name="eduHour" value="${eduDetail.eduHour}"/>
	<input type="hidden" name="eduDtFm" value="${eduDetail.eduDtFm}"/>
	<input type="hidden" name="eduDtTo" value="${eduDetail.eduDtTo}"/>
	<input type="hidden" name="eduPlace" value="${eduDetail.eduPlace}"/>
	<input type="hidden" name="eduEtc" value="${eduDetail.eduEtc}"/>
</form>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">교육이수현황 등록</td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" >
				<tr>
			    	<td align="left" class="subtitle">기본정보</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="" cellspacing="0" border="1" width="100%" height="35px" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<th width="15%" bgcolor="#F5F5F5" align="center">센터명</th>
						    	<td colspan="2" width="35%" align="left">${eduDetail.centerNm}</td>
								<th width="15%" bgcolor="#F5F5F5" align="center">상담사</th>
						    	<td colspan="2" width="35%" align="left">${eduDetail.userNm}</td>
						    </tr>
				    	</table>
			    	</td>
				</tr>
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
			    	<td align="left" class="subtitle">교육정보</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr height="35px" >
								<th width="15%" bgcolor="#F5F5F5" align="center">교육구분</th>
								<td width="15%">${eduDetail.eduDiv}</td>
								<th width="15%" bgcolor="#F5F5F5" align="center">교육형태</th>
								<td width="15%">${eduDetail.eduType}</td>
								<th width="15%" bgcolor="#F5F5F5" align="center">교육명</th>
								<td width="25%">${eduDetail.eduNm}</td>
							</tr>
							<tr height="35px" >
								<th bgcolor="#F5F5F5" align="center">이수시간</th>
								<td>${eduDetail.eduHour}</td>
								<th bgcolor="#F5F5F5" align="center">등록기간</th>
						    	<td colspan="3" align="left">${eduDetail.eduDtFm}
									&nbsp;~&nbsp;${eduDetail.eduDtTo}
						    	</td>						
							</tr>
							<tr height="35px" >
								<th bgcolor="#F5F5F5" align="center">교육장소</th>
								<td>${eduDetail.eduPlace}</td>
								<th bgcolor="#F5F5F5" align="center">비고</th>
								<td colspan="3">${eduDetail.eduEtc}</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
						    			<tr>
								    		</td><td id="btn01"><a href="#"><span id="editBtn">수정</span></a></td>
								    		<td width="20px"></td>
								    		<td id="btn01"><a href="#"><span id="deleteBtn">삭제</span></a></td>
								    	</tr>
								    	<tr><td style="height: 150px;"></td></tr>
								    	<tr>
								    	
								    	<td id="btn01" colspan="3"><a href="#"><span id="listBtn">목록</span></a></td>
								    	</tr>
								    	
						    		</table>
						    	</td>
							</tr>
							<tr>
					    		
			    			</tr>
						</table>
					</td>
				</tr>
													    	
			</table>
		</td>
	</tr>

</table>
</body>
</html>