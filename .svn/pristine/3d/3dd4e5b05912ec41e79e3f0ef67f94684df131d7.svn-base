<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴사계정</title>
<script type="text/javascript">

j$(document).ready(function(){
	
	j$(".cspDetail").click(function(){
		var userId = j$(this).attr("value");
		location.href = "/madm/service/csp/cspAccountModify?userId="+userId;
		return false;
	});
	
	j$(".addBtn").click(function(){
		location.href = "/madm/service/csp/cspAccountAdd";
 		return false;
	});
	
	j$("#excelBtn").click(function(){
		j$("#cspList").attr("action","/madm/service/csp/cspAccountExcel");
		j$("#cspList").submit();
 		return false;
	});
	
	
	//달력
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
	
	j$("#searchBtn").click(function(){
		j$("#cspList").attr("action","/madm/service/csp/cspAccountList");
		var temp ="" ;
		var cnt = 0;

		//업체유형 checkbox 값 
		for(var i=0;i<cspList.elements["sMgrStatue"].length;i++){
			if(cspList.elements["sMgrStatue"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ cspList.elements["sMgrStatue"][i].value;
				}else{
				   temp += cspList.elements["sMgrStatue"][i].value;
				}
				cnt++;
			    }
		    }
		cspList.elements["mgrStatue"].value = temp;
		
		j$("#cspList").submit();
		return false;
	});
	
	
	
	
	<c:if test='${not empty param.mgrStatue}'>
	var chkValue = '${param.mgrStatue}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sMgrStatue][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	
});


function jssearchcspClear() {
	j$("#searchcsp").val("");
	j$("#searchcspCd").val("");
}

function getcspPopup() {
	window.open("/madm/service/csp/cspPopup?Oform=csp", "cspPopup", "width=800, height=600,  scrollbars=1");
}
</script>
</head>
<body>

<form:form name="cspList" id="cspList" modelAttribute="cspDto"  method="POST" action="/madm/service/csp/cspAccountList">
<input type="hidden" name="mgrStatue" value="${param.mgrStatue }">

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="6" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">제휴사계정</td>
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
						<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>제휴사명</strong></td>
								<td colspan="3">
									<input type="text" id="searchcsp" name="searchcsp" value="${param.cspNm }" disabled="disabled">
									<input type="hidden" id="searchcspNm" name="cspNm" value="${param.cspNm }">
									<input type="hidden" id="searchcspCd" name="cspCd" value="${param.cspCd }">
									<input type="button" value="찾아보기" onclick="javascript:getcspPopup();" >
									<input type="button" value="초기화" onclick="javascript:jssearchcspClear();" >
								</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">담당자명</th>
						    	<td width="35%" align="left">
						    		<input type="text" name="userNm" value="${param.userNm }">
						    	</td>
 								<th width="15%" bgcolor="#F5F5F5" align="center">승인상태</th>
						    	<td width="35%" align="left">
						    		<input type="checkbox" name="sMgrStatue" value="Y">승인
						    		<input type="checkbox" name="sMgrStatue" value="N">정지
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">업체유형</th>
						    	<td colspan="3" width="35%" align="left">
						    		<input type="text" id="startDt" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" id="endDt" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
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
			                  <th  width="8%" >순번</th>
			                  <th  width="">제휴사명</th>
			                  <th  width="">담당자</th>
			                  <th  width="">아이디</th>
			                  <th  width="">휴대전화</th>
			                  <th  width="">전화번호</th>
			                  <th  width="">등록일</th>
			                  <th  width="">상태</th>
			                </tr>
			            </thead>

						<tbody>
 						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.cspNm }</td>
								<td><a href="#" class="cspDetail" value="${list.userId }"><strong>${list.userNm }</strong></a></td>
								<td><a href="#" class="cspDetail" value="${list.userId }"><strong>${list.userId }</strong></a></td>
								<td>${list.mobile }</td>
								<td>${list.telNum }</td>
								<td>${list.regDt }</td>
								<td>${list.mgrStatus }</td>
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