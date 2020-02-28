<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴사정보</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$(".addBtn").click(function(){
		location.href = "/madm/service/csp/cspInfoAdd";
 		return false;
	});
	
	j$("#excelBtn").click(function(){
		j$("#cspList").attr("action","/madm/service/csp/cspInfoExcel");
		j$("#cspList").submit();
 		return false;
	});
	
	j$(".cspDetail").click(function(){
		var cspCd = j$(this).attr("value");
		location.href = "/madm/service/csp/cspInfoModify?cspCd="+cspCd;
		return false;
	});
	
	
	j$("#searchBtn").click(function(){
		j$("#cspList").attr("action","/madm/service/csp/cspInfoList");
		var temp ="" ;
		var cnt = 0;

		//업체유형 checkbox 값 
		for(var i=0;i<cspList.elements["sCspDiv"].length;i++){
			if(cspList.elements["sCspDiv"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ cspList.elements["sCspDiv"][i].value;
				}else{
				   temp += cspList.elements["sCspDiv"][i].value;
				}
				cnt++;
			    }
		    }
		cspList.elements["cspDiv"].value = temp;

		temp = "";
		cnt = 0;
		
		//업체구분 checkbox 값 
		for(var i=0;i<cspList.elements["sCspType"].length;i++){
			if(cspList.elements["sCspType"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ cspList.elements["sCspType"][i].value;
				}else{
				   temp += cspList.elements["sCspType"][i].value;
				}
				cnt++;
			    }
		    }
		cspList.elements["cspType"].value = temp;

		temp = "";
		cnt = 0;
		
		//업체상태 checkbox 값 
		for(var i=0;i<cspList.elements["sCspStatus"].length;i++){
			if(cspList.elements["sCspStatus"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ cspList.elements["sCspStatus"][i].value;
				}else{
				   temp += cspList.elements["sCspStatus"][i].value;
				}
				cnt++;
			    }
		    }
		cspList.elements["cspStatus"].value = temp;

		
		j$("#cspList").submit();
		return false;
	});
	
	
	
	
	<c:if test='${not empty param.cspDiv}'>
	var chkValue = '${param.cspDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sCspDiv][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	<c:if test='${not empty param.cspType}'>
	var chkValue = '${param.cspType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sCspType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	<c:if test='${not empty param.cspStatus}'>
	var chkValue = '${param.cspStatus}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sCspStatus][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	
});
</script>	
</head>
<body>

<form:form name="cspList" id="cspList" modelAttribute="cspDto" action="/madm/service/csp/cspInfoList">
<input type="hidden" name="cspDiv" value="${param.cspDiv }">
<input type="hidden" name="cspType" value="${param.cspType }">
<input type="hidden" name="cspStatus" value="${param.cspStatus }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="6" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">제휴사 목록</td>
		    	<td align="right">
					<input type="button" class="addBtn" value="신규등록">		<input type="button" id="excelBtn" value="엑셀다운로드"" />
				</td>
			</tr>
		</table>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">업체검색</th>
								<td colspan="5" width="35%" align="left">
									<select id="selectBox" name="selectBox" >
										<option value="">선택</option>
						    			<option value="cspCd" ${param.selectBox == "cspCd" ? 'selected':''}>업체코드</option>
						    			<option value="cspNm" ${param.selectBox == "cspNm" ? 'selected':''}>업체명</option>
			    					</select>
			    					<input name="searchTxt" id="searchTxt" type="text" value="${param.searchTxt }"/>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">업체구분</th>
						    	<td colspan="5" width="35%" align="left">
						    		<input type="checkbox" name="sCspType" value="100718" >온라인강좌
									<input type="checkbox" name="sCspType" value="100720" >온라인심리검사
									<input type="checkbox" name="sCspType" value="100721" >집단교육
									<input type="checkbox" name="sCspType" value="100722" >배송상품
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">업체유형</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input type="checkbox" name="sCspDiv" value="100831" >자체메뉴
									<input type="checkbox" name="sCspDiv" value="100832" >ASP
									<input type="checkbox" name="sCspDiv" value="100833" >API
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">업체상태</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input type="checkbox" name="sCspStatus" value="100845" >대기
									<input type="checkbox" name="sCspStatus" value="100846" >승인
									<input type="checkbox" name="sCspStatus" value="100847" >정지
						    	</td>
							</tr>
							
							
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				
				<tr>
					<td height="10px"></td>
				</tr>

				<tr>
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01"><a href="#"><span id="searchBtn">검 색</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
	
	
		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%" align="left">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									 총 ${paging.totalCount}건 | 페이지 : ${paging.currentPage}/${paging.getPageCount()} 
								</strong>
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr >
			                  <th rowspan="2" width="8%" >순번</th>
			                  <th rowspan="2" width="">업체코드</th>
			                  <th rowspan="2" width="">업체명</th>
			                  <th rowspan="2" width="">업체유형</th>
			                  <th colspan="4" width="">업체구분</th>
			                 
			                  <th rowspan="2" width="">담당자</th>
			                  <th rowspan="2" width="">전화번호</th>
			                  <th rowspan="2" width="">상태</th>
			                </tr>
			                <tr>
			                 <th>강좌</th><th>검사</th><th>교육</th><th>배송</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#" class="cspDetail" value="${list.cspCd }"><strong>${list.cspCd }</strong></a></td>
								<td><a href="#" class="cspDetail" value="${list.cspCd }"><strong>${list.cspNm }</strong></a></td>
								<td>${list.cspDiv }</td>
								<td>${list.typeLecture }</td>
								<td>${list.typeTest }</td>
								<td>${list.typeEducation }</td>
								<td>${list.typeDelivery }</td>
								<td>${list.mainMgrId }</td>
								<td>${list.telNum }</td>
								<td>${list.cspStatus }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
					<br>
					<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
						<tr>
							<td align="center">
  								<ui:paging value="${paging}"
  									btnFirst="${url:img('/images/btn_first.jpg')}"
  									btnPrev="${url:img('/images/btn_prev.jpg')}"
  									btnNext="${url:img('/images/btn_next.jpg')}"
  									btnLast="${url:img('/images/btn_last.jpg')}" /> 
							</td>
						</tr>
					</table>
					<!-- 채널 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->
	</td>
</tr>
</table>
</form:form>


</body>
</html>