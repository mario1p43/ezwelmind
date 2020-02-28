<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>기준설정</title>
<script type="text/javascript">
var jedoList=[<c:forEach var="item" varStatus="status" items="${jedoList}">
				{periodSeq:"${item.periodSeq}",periodNo:"${item.periodNo}",startDd:"${item.startDd}",endDd:"${item.endDd}",ceilingPoint:"${item.ceilingPoint}",mentalPoint:"${item.mentalPoint}"}<c:if test="${status.last==false}">,</c:if>
				</c:forEach>
];
j$(document).ready(function(){
	//개인별 한도 설정
	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	
	j$("#insBtn").click(function(){
		var startDd 	= replaceAll($("#startDd").val(), "/", "");
		var endDd		= replaceAll($("#endDd").val(), "/", "");
		var minStartDd	= j$("#minStartDd").val();
		var	maxEndDd	= j$("#maxEndDd").val();
		var updateYn = j$("#updateYn").val();
		if(startDd == "" || endDd == ""){
			alert("시작/종료일을 입력하세요.");
			j$("#startDd").focus();
			return false;
		} 
		if(updateYn=='N'){
			if(startDd <= minStartDd || startDd <= maxEndDd){
				alert("제도 시작일을 확인해주세요.");
				j$("#startDd").focus();
				return false;
			}else if(endDd <= maxEndDd){
				alert("제도 종료일을 확인해주세요.");
				j$("#endDd").focus();
				return false;
			}
		}else{
			//제도기간을 중복으로 입력하는지 확인한다.
			var isOk = true;
			var periodSeqmind = $('#insertJedoForm input[name=periodSeq]').val();
			for(var i=0; i<jedoList.length; i++){
				var data = jedoList[i];
				if(periodSeqmind==data.periodSeq) continue;
				var dStartDd = replaceAll(data.startDd, "-", "");
				var dEndDd = replaceAll(data.endDd, "-", "");
				if(dStartDd<=endDd && dEndDd>=startDd){
					isOk = false;
					break;
				}
			}
			
			if(!isOk){
				alert('제도 기간을 중복하여 등록할 수 없습니다. 제도기간을 확인해주세요');
				j$("#startDd").focus();
				j$("#endDd").focus();
				return false;
			}
		}
		if(j$("#searchClientNm").val() == null){
			alert("고객사명/코드 정보가 올바르지 않습니다.");
			return;
		}
		
		if(j$("#maxpoint").val() == "" || j$("#maxpoint").val() == "0"){
			alert("사용한도 정보를 확인해주세요.");
			j$("#maxpoint").focus();
			return;
		}
		
		if(j$("#mentalSel").val() == ""){
			alert("멘탈헬스 ZONE 한도를 설정해주세요.");
			j$("#mentalSel").focus();
			return;
		}
		var msg = "";
		if(updateYn=="Y"){
			msg = "제도를 수정 하시겠습니까?";
		}else{
			msg = "신규제도를 등록 하시겠습니까?";
		}
		if(confirm(msg)){
			j$("#insertJedoForm").submit();		
		}
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

	<c:if test="${not empty jedoList }">
		var position = j$("#ShowJedoDetail").offset();
		j$('html, body').animate({scrollTop : position.top}, 0);
	</c:if>
});

function getSelectValue()
{
	//고객사 코드 입력
	$('#searchClientCd').val($('#searchClientNm option:selected').val());
	//일괄 입력값 비우기
	j$("#maxpoint").val("");
	j$("#standardForm").submit();
}

function getTextValue()
{	
	var cd = $('#searchClientCd').val();
	$("#searchClientNm").val(cd).attr("selected", "selected");
	
	$.ajax({
		url: "/madm/operations/checkClientCd",
		data:"&searchClientCd="+ $('#searchClientCd').val(),
		dataType: 'json',
		success: function (response) {
			var cc = response.countCd;
			if(cc>0){
				j$("#maxpoint").val("");
				j$("#standardForm").submit();
			}else{
				alert("입력하신 고객사 코드가 존재하지 않습니다.");	
			}
		}
	});
	
}

function jedoDetail(seq, no){
	j$("#periodSeq").val(seq);
	j$("#periodNo").val(no);
	j$("#standardForm").submit();
}

function setPoint(seq){
	j$.divPop('setPointPop', "포인트 배정", j$("#setPointPopup"));
	j$("#setValue").val(seq);
}

// 고객사에 배정한 포인트 삭제
function deletePoint(budgetSeq){
	
	if(confirm('해당 배정 포인트를 삭제하시겠습니까?')){
		var params = {};
		var cientCd			= $('#searchClientCd').val();
		params.budgetSeq 	= budgetSeq;
		
		$.ajax({
			url: "/madm/operations/deletePoint",
			data:params,
			dataType: 'json',
			success: function (response) {
				var resultCnt = response.resultCnt;
				if(resultCnt > 0){
					alert("배정 포인트를 삭제하였습니다.");
					location.href = "/madm/operations/standard?searchClientCd="+cientCd;
				}else{
					alert("배정 포인트 삭제에 실패하였습니다.");
				}
			}
		});
	}else{
		return false;
	}
	
}

function popInsertBtn(){
	var params = {};
	var periodSeq 		= $('#setValue').val();
	var reserveBudget	= $('#reserveBudget').val();
	var assignBudget 	= $('#assignBudget').val();
	var cientCd			= $('#searchClientCd').val();
	
	params.periodSeq 		= periodSeq;
	params.reserveBudget	= reserveBudget;
	params.assignBudget		= assignBudget;
	params.searchClientCd	= cientCd;
	
	$.ajax({
		url: "/madm/operations/insertPoint",
		data:params,
		dataType: 'json',
		success: function (response) {
			var resultCnt = response.resultCnt;
			if(resultCnt > 0){
				alert("포인트 배정이 완료되었습니다.");
				location.href = "/madm/operations/standard?searchClientCd="+cientCd;
			}else{
				alert("정상적으로 반영되지 않았습니다.");
			}
		}
	});
}

function newJedo(){
	j$("#jedoFormSubTitle").text('신규 제도 등록');
	j$("#insBtn").val('제도 등록');
	j$("#periodSeq").val('');
	j$("#periodNo").val('');
	j$("#ShowNewJedo").show();
	var position = j$("#ShowNewJedo").offset();
	j$('html, body').animate({scrollTop : position.top}, 0);
	j$("#updateYn").val('N');
}

function updateJedo(periodSeq,periodNo, startDd, endDd, ceilingPoint, mentalPoint){
	j$("#jedoFormSubTitle").text('제도 정보 수정');
	j$("#insBtn").val('제도 수정');
	j$("#ShowNewJedo").show();
	var position = j$("#ShowNewJedo").offset();
	j$('html, body').animate({scrollTop : position.top}, 0);
	j$("#updateYn").val('Y');
	j$("#startDd").val(String(startDd).replace(/-/g,'/'));
	j$("#endDd").val(String(endDd).replace(/-/g,'/'));
	j$("#maxpoint").val(ceilingPoint.replace(',',''));
	j$("#mentalSel").val(mentalPoint);
	$('#insertJedoForm input[name=periodSeq]').val(periodSeq);
	$('#insertJedoForm input[name=periodNo]').val(periodNo);
	$('#insertJedoForm input[name=searchClientNm]').val(j$("#searchClientNm").val());
	$('#insertJedoForm input[name=searchClientCd]').val(j$("#searchClientCd").val());
	
}
</script>
</head>
<body>

<form id="standardForm" action="/madm/operations/standard" method="POST">
<input type="hidden" id="periodNo" 	name="periodNo" 	value="${param.periodNo }" />
<input type="hidden" id="periodSeq" name="periodSeq" 	value="${param.periodSeq }" />
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-bottom: 1px solid silver">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">고객사 제도 기준 관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="30px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">기준설정</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>고객사명</strong></td>
			    	<td align="left">
			    		<select id="searchClientNm" name="searchClientNm" onChange="getSelectValue();">
			    			<option value="">고객사를 선택하세요</option>
			    			<c:forEach var="list" items="${emplist}" varStatus="status">
			    				<option value="${list.clientCd}" ${param.searchClientNm == list.clientCd  ? 'selected':''}>${list.clientNm}</option>
							</c:forEach>
			    		</select>
			    	</td>
			    	<td bgcolor="#F5F5F5" align="center"><strong>고객사코드</strong></td>
			    	<td><input type="text" id="searchClientCd" name="searchClientCd" onChange="getTextValue();" value="${param.searchClientCd }" /></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<c:if test="${showJedoYn eq 'Y'}">
	<tr>
		<td height="40px"></td>
	</tr>
	<tr>
		<td align="right"><input type="button" value="신규 제도" onclick="newJedo()"></td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr align="center" height="30px">
					<th width="5%">No.</th>
					<th width="20%">제도 기간</th>				
					<th width="25%">개인 사용한도</th>
					<th width="25%">포인트 현황</th>
					<th width="25%">바로가기</th>
				</tr>
				<c:forEach var="list" items="${jedoList}" varStatus="status">
					<tr align="center" height="30px">
						<td>${list.periodNo }</td>
						<td>${list.startDd } ~ ${list.endDd }</td>
						<td>${list.ceilingPoint } / 멘탈헬스 한도내 ${list.mentalPoint }%</td>
						<td>${list.point } / ${list.assignBudget }</td>
						<td>
							<input type="button" onclick="jedoDetail(${list.periodSeq}, ${list.periodNo})" value="상세보기"> &nbsp; 
							<input type="button" value="수정하기" onclick="updateJedo('${list.periodSeq}','${list.periodNo}','${list.startDd}' ,'${list.endDd}' ,'${list.ceilingPoint}' ,'${list.mentalPoint}')"> &nbsp; 
							<input type="button" value="포인트 배정" onclick="setPoint(${list.periodSeq})">
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:set var="index" value="${fn:length(jedoList)}"></c:set>
			<input type="hidden" id="minStartDd4u"  value="${jedoList[index-1].startDd}" />
     		<input type="hidden" id="maxEndDd4u" 	value="${jedoList[0].endDd}" />
		</td>
	</tr>
	</c:if>
</table>

<c:if test="${showPointYn eq 'Y'}">
<div id="ShowJedoDetail" >
	<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-bottom: 1px solid silver">
					<tr>
						<td height="50px" colspan="2"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">제도 상세보기</td>
						<td align="right"><strong>총 배정P : ${pointStatus.assignBudget } / 총 잔여P : ${pointStatus.rest }</strong></td>
					</tr>
					<tr>
						<td height="10px" colspan="2"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr align="center" height="30px">
						<th width="30%">배정 포인트</th>			
						<th width="30%">예비비</th>
						<th width="15%">등록자</th>
						<th width="15%">등록일</th>
						<th width="10%">삭제</th>
					</tr>
					<c:forEach var="list" items="${setPointList}" varStatus="status">
						<tr align="center" height="30px">
							<td>${list.assignBudget }</td>
							<td>${list.reserveBudget }</td>
							<td>${list.userNm}</td>
							<td>${list.regDt} </td>	
							<td><input type="button" value="삭제" onclick="deletePoint(${list.budgetSeq})"></td>	
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
	</table>
</div>
</c:if>
</form>

<div id="setPointPopup" style="display: none; overflow: scroll;" >
	<table cellpadding="0" align="left" cellspacing="0" border="0" width="800px" height="100px">
		<tr>
			<td height="10px">
				<input type="hidden" id="setValue" value="">
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr>
						<th width="15%">가용예산</th>
						<td width="35%"> <input type="text" id="assignBudget" > 원 </td>
						<th width="15%">예비비</th>
						<td width="35%"> <input type="text" id="reserveBudget" > 원 </td>
					</tr>
					<tr>
						<td colspan="4"><strong>＊ 가용예산 설정 : </strong>상담포유에서 사용하는 전체 회사포인트로 잔여 % 비율을 나타내기 위한 금액입니다.</td>
					</tr>
					<tr>
						<td colspan="4"><strong>＊ 예비비 설정 : </strong>전체 회사 포인트 이용이 끝난 상태에서 추가비용이 발생할 때 정산문제를 해결하기 위한 금액입니다.</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="center" width="100%">
				<input type="button" onclick="popInsertBtn()" value="저장">
			</td>
		</tr>
	</table>
</div>

<form id="insertJedoForm" action="/madm/operations/insertJedo" method="POST">
<input type="hidden" value="${param.searchClientCd }" name="clientCd">
<input type="hidden" value="${jedoDateInfo.minStartDd }" 	name="minStartDd" 	id="minStartDd">
<input type="hidden" value="${jedoDateInfo.maxEndDd }" 		name="maxEndDd" 	id="maxEndDd">
<input type="hidden" name="periodNo" />
<input type="hidden" name="periodSeq"/>
<input type="hidden" name="searchClientNm" />
<input type="hidden" name="searchClientCd"/>
<input type="hidden" id="updateYn" name="updateYn" 	value="N" />
<div id="ShowNewJedo" style="display: none;">
	<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-bottom: 1px solid silver">
					<tr>
						<td height="50px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle"><span id="jedoFormSubTitle">신규 제도 등록</span></td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr>
						<th width="15%">제도 기간</th>				
						<td colspan="3">
				    		<input type="text" name="startDd" id="startDd" size="10" class="date_timepicker_start" value="" style="width: 100px;"/>
							<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="endDd" id="endDd" size="10" class="date_timepicker_end" value="" style="width: 100px;"/>
							<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
							&nbsp;※ 등록된 제도들과 기간이 겹칠 수 없습니다. 
						</td>
					</tr>
					<tr>
						<th width="15%">사용 한도</th>				
						<td width="35%">
							<input type="text" id="maxpoint" name="maxpoint" size="35"> 원
						</td>
						<th width="15%">멘탈헬스 ZONE</th>				
						<td width="35%">
							한도 내 <select id="mentalSel" name="mentalSel" style="width: 70px;">
						    			<option value="">  선택  </option>
						    			<option value="0">0</option>
						    			<option value="5">5</option>
						    			<option value="10">10</option>
						    			<option value="15">15</option>
						    			<option value="20">20</option>
						    			<option value="25">25</option>
						    			<option value="30">30</option>
						    			<option value="35">35</option>
						    			<option value="40">40</option>
						    			<option value="45">45</option>
						    			<option value="50">50</option>
						    		</select> % 
						</td>
					</tr>
					<tr>
						<td colspan="4"><strong>* 사용한도 설정 : </strong>상담포유에서 개인 별 사용 가능한 포인트를 설정하기 위한 금액입니다.</td>
					</tr>
					<tr>
						<td colspan="4"><strong>* 멘탈헬스ZONE 설정 : </strong>개인 별 한도 내에서 멘탈헬스 ZOME 메뉴의 이용이 가능한 %입니다.</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="center" width="100%">
				<input type="button" id="insBtn" value="제도 등록">
			</td>
		</tr>
	</table>
</div>
</form>

</body>
</html>