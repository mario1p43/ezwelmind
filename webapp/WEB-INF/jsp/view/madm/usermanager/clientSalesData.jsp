<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사별 실적데이터</title>
<script src="${url:resource('/resources/js/plugin/jquery.number.min.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){
			
	});  // end ready
	
	var SALES = {
		init : function() {
			
		},
		reload : function() {
			var clientCd = $("#clientCd").val();
			var moveUrl = "/madm/userManager/getClientSalesData?clientCd="+clientCd;
			
			if(typeof $("#searchYear").val() !== 'undefined') {
				var searchYear = $("#searchYear").val();
				moveUrl += "&searchYear="+searchYear;
			}
			
			location.href = moveUrl;
		},
		addRow : function() { // 질문 줄 추가
			
			var $tr = $(".input_text_center tr:last");
			var $tbody = $(".input_text_center");
			
			var html = $tr.html();
			
			$tbody.append("<tr class='sales_data'  height='30px'>" + html + "</tr>");
			
			$(".input_text_center tr:last input[type=text]").val("");
		},
		removeRow : function(obj) { // 질문 줄 삭제
			var $tr = $(obj).parent().parent();
			var $trs = $tr.parent().find("tr");
			
			if($trs.length == 1) {
				alert("실적데이터의 최소 수는 1개입니다.");
				
				return false;
			}
			
			$tr.remove();
		},
		upArrow : function(obj) { // 질문 위로
		    var $prevTr = $(obj).parent().parent().prev();
		     
		    if($prevTr.attr("class") == undefined) {
		    	return false;
		    }
		    
		    var thisTr = $(obj).parent().parent().detach();
		    
		    $prevTr.before(thisTr);
		},
		downArrow : function(obj) { // 질문 아래로
		    var $nextTr = $(obj).parent().parent().next();
		    
		    if($nextTr.attr("class") == undefined) {
		    	return false;
		    }
		    
		    var thisTr = $(obj).parent().parent().detach();
		    
		    $nextTr.after(thisTr);
		},
		save : function() {
			
			if(!confirm("저장하시겠습니까?")) {
				return false;
			}
			
			// 인덱스 맞추어서 루프
			$(".input_text_center tr").each(function(i) {
				$(this).find("input[name=salesNm]").attr("name", "sales["+i+"].salesNm");
				$(this).find("input[name=unitPrice]").attr("name", "sales["+i+"].unitPrice");
				$(this).find("input[name=janUserCnt]").attr("name", "sales["+i+"].janUserCnt");
				$(this).find("input[name=febUserCnt]").attr("name", "sales["+i+"].febUserCnt");
				$(this).find("input[name=marUserCnt]").attr("name", "sales["+i+"].marUserCnt");
				$(this).find("input[name=aprUserCnt]").attr("name", "sales["+i+"].aprUserCnt");
				$(this).find("input[name=mayUserCnt]").attr("name", "sales["+i+"].mayUserCnt");
				$(this).find("input[name=junUserCnt]").attr("name", "sales["+i+"].junUserCnt");
				$(this).find("input[name=julUserCnt]").attr("name", "sales["+i+"].julUserCnt");
				$(this).find("input[name=augUserCnt]").attr("name", "sales["+i+"].augUserCnt");
				$(this).find("input[name=sepUserCnt]").attr("name", "sales["+i+"].sepUserCnt");
				$(this).find("input[name=octUserCnt]").attr("name", "sales["+i+"].octUserCnt");
				$(this).find("input[name=novUserCnt]").attr("name", "sales["+i+"].novUserCnt");
				$(this).find("input[name=decUserCnt]").attr("name", "sales["+i+"].decUserCnt");
				$(this).find("input[name=orderNo]").attr("name", "sales["+i+"].orderNo");
			});
			
			$("#saveForm").attr("action", "/madm/userManager/saveClientSalesData");
			$("#saveForm").attr("method", "post");
			$("#saveForm").submit();
		},
		download : function() {
			$("#saveForm").attr("action", "/madm/userManager/downloadClientSalesData");
			$("#saveForm").submit();
		},
		cannotModifyMsg : function() {
			alert("수정권한이 없습니다.");
		}
	};
</script>
<style>
	.input_text_center input[type=text]{text-align: center}
	.input_text_center input[type=text]:read-only{background-color: #cecece}

</style>
</head>
<body>

<form id="saveForm">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">고객사별 실적데이터</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객사 선택</strong></td>
		    	<td width="40%" align="left" colspan="3">
		    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="SALES.reload()">
		    			<option value="">---- 선택 ----</option>
		    			<c:forEach var="list" items="${clientList}">
		    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq userManagerDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
		    			</c:forEach>
		    		</select>
		    	</td>
			</tr>
			<c:if test="${!empty userManagerDto.clientCd }">
			<tr id="searchYears" align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>연도 선택</strong></td>
		    	<td width="40%" align="left" colspan="3">
		    		<select id="searchYear" name="searchYear" style="height: 20px;" onchange="SALES.reload()">
		    			<option value="">---- 선택 ----</option>
		    			<c:forEach begin="2015" end="${year }" var="y">
		    				<option value="${y }" ${userManagerDto.searchYear eq y ? 'selected' : '' }>${y }년도</option>
		    			</c:forEach>
		    		</select>
		    	</td>
			</tr>
			</c:if>
			<c:if test="${!empty compriseYearList }">
			<tr id="compriseYearList" align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>제도년차</strong></td>
		    	<td width="40%" align="left" colspan="3">
		    		<c:forEach var="compriseYear" items="${compriseYearList }">
		    			<b>${compriseYear.periodNo }회기 - 
		    			   ${fn:substring(compriseYear.startDd, 0, 4) }-${fn:substring(compriseYear.startDd, 4, 6) }-${fn:substring(compriseYear.startDd, 6, 8) }
		    			 ~ ${fn:substring(compriseYear.endDd, 0, 4) }-${fn:substring(compriseYear.endDd, 4, 6) }-${fn:substring(compriseYear.endDd, 6, 8) }</b><br/>
		    		</c:forEach>
		    	</td>
			</tr>
			</c:if>
		</table>
		<!-- 검색 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px"></td>
</tr>

<c:if test="${!empty userManagerDto.clientCd and !empty userManagerDto.searchYear }">
<tr>
	<td>
		<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<colgroup>
				<col style="width:15%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:13%"/>
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
					<th>총합</th>
				</tr>
			</thead>
			<tbody>
				<tr align="" height="50px">
					<th>대면</th>
					<td>${bean.JAN_433_CNT }</td>
					<td>${bean.FEB_433_CNT }</td>
					<td>${bean.MAR_433_CNT }</td>
					<td>${bean.APR_433_CNT }</td>
					<td>${bean.MAY_433_CNT }</td>
					<td>${bean.JUN_433_CNT }</td>
					<td>${bean.JUL_433_CNT }</td>
					<td>${bean.AUG_433_CNT }</td>
					<td>${bean.SEP_433_CNT }</td>
					<td>${bean.OCT_433_CNT }</td>
					<td>${bean.NOV_433_CNT }</td>
					<td>${bean.DEC_433_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_433_CNT + bean.FEB_433_CNT + bean.MAR_433_CNT
						 + bean.APR_433_CNT + bean.MAY_433_CNT + bean.JUN_433_CNT
						 + bean.JUL_433_CNT + bean.AUG_433_CNT + bean.SEP_433_CNT
						 + bean.OCT_433_CNT + bean.NOV_433_CNT + bean.DEC_433_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>전화</th>
					<td>${bean.JAN_434_CNT }</td>
					<td>${bean.FEB_434_CNT }</td>
					<td>${bean.MAR_434_CNT }</td>
					<td>${bean.APR_434_CNT }</td>
					<td>${bean.MAY_434_CNT }</td>
					<td>${bean.JUN_434_CNT }</td>
					<td>${bean.JUL_434_CNT }</td>
					<td>${bean.AUG_434_CNT }</td>
					<td>${bean.SEP_434_CNT }</td>
					<td>${bean.OCT_434_CNT }</td>
					<td>${bean.NOV_434_CNT }</td>
					<td>${bean.DEC_434_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_434_CNT + bean.FEB_434_CNT + bean.MAR_434_CNT
						 + bean.APR_434_CNT + bean.MAY_434_CNT + bean.JUN_434_CNT
						 + bean.JUL_434_CNT + bean.AUG_434_CNT + bean.SEP_434_CNT
						 + bean.OCT_434_CNT + bean.NOV_434_CNT + bean.DEC_434_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>게시판(텍스트)</th>
					<td>${bean.JAN_435_CNT }</td>
					<td>${bean.FEB_435_CNT }</td>
					<td>${bean.MAR_435_CNT }</td>
					<td>${bean.APR_435_CNT }</td>
					<td>${bean.MAY_435_CNT }</td>
					<td>${bean.JUN_435_CNT }</td>
					<td>${bean.JUL_435_CNT }</td>
					<td>${bean.AUG_435_CNT }</td>
					<td>${bean.SEP_435_CNT }</td>
					<td>${bean.OCT_435_CNT }</td>
					<td>${bean.NOV_435_CNT }</td>
					<td>${bean.DEC_435_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_435_CNT + bean.FEB_435_CNT + bean.MAR_435_CNT
						 + bean.APR_435_CNT + bean.MAY_435_CNT + bean.JUN_435_CNT
						 + bean.JUL_435_CNT + bean.AUG_435_CNT + bean.SEP_435_CNT
						 + bean.OCT_435_CNT + bean.NOV_435_CNT + bean.DEC_435_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>법률/세무</th>
					<td>${bean.JAN_001_CNT }</td>
					<td>${bean.FEB_001_CNT }</td>
					<td>${bean.MAR_001_CNT }</td>
					<td>${bean.APR_001_CNT }</td>
					<td>${bean.MAY_001_CNT }</td>
					<td>${bean.JUN_001_CNT }</td>
					<td>${bean.JUL_001_CNT }</td>
					<td>${bean.AUG_001_CNT }</td>
					<td>${bean.SEP_001_CNT }</td>
					<td>${bean.OCT_001_CNT }</td>
					<td>${bean.NOV_001_CNT }</td>
					<td>${bean.DEC_001_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_001_CNT + bean.FEB_001_CNT + bean.MAR_001_CNT
						 + bean.APR_001_CNT + bean.MAY_001_CNT + bean.JUN_001_CNT
						 + bean.JUL_001_CNT + bean.AUG_001_CNT + bean.SEP_001_CNT
						 + bean.OCT_001_CNT + bean.NOV_001_CNT + bean.DEC_001_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>재무</th>
					<td>${bean.JAN_002_CNT }</td>
					<td>${bean.FEB_002_CNT }</td>
					<td>${bean.MAR_002_CNT }</td>
					<td>${bean.APR_002_CNT }</td>
					<td>${bean.MAY_002_CNT }</td>
					<td>${bean.JUN_002_CNT }</td>
					<td>${bean.JUL_002_CNT }</td>
					<td>${bean.AUG_002_CNT }</td>
					<td>${bean.SEP_002_CNT }</td>
					<td>${bean.OCT_002_CNT }</td>
					<td>${bean.NOV_002_CNT }</td>
					<td>${bean.DEC_002_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_002_CNT + bean.FEB_002_CNT + bean.MAR_002_CNT
						 + bean.APR_002_CNT + bean.MAY_002_CNT + bean.JUN_002_CNT
						 + bean.JUL_002_CNT + bean.AUG_002_CNT + bean.SEP_002_CNT
						 + bean.OCT_002_CNT + bean.NOV_002_CNT + bean.DEC_002_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>심리</th>
					<td>${bean.JAN_003_CNT }</td>
					<td>${bean.FEB_003_CNT }</td>
					<td>${bean.MAR_003_CNT }</td>
					<td>${bean.APR_003_CNT }</td>
					<td>${bean.MAY_003_CNT }</td>
					<td>${bean.JUN_003_CNT }</td>
					<td>${bean.JUL_003_CNT }</td>
					<td>${bean.AUG_003_CNT }</td>
					<td>${bean.SEP_003_CNT }</td>
					<td>${bean.OCT_003_CNT }</td>
					<td>${bean.NOV_003_CNT }</td>
					<td>${bean.DEC_003_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_003_CNT + bean.FEB_003_CNT + bean.MAR_003_CNT
						 + bean.APR_003_CNT + bean.MAY_003_CNT + bean.JUN_003_CNT
						 + bean.JUL_003_CNT + bean.AUG_003_CNT + bean.SEP_003_CNT
						 + bean.OCT_003_CNT + bean.NOV_003_CNT + bean.DEC_003_CNT  }</td>
				</tr>
				<tr align="" height="50px">
					<th>N/S</th>
					<td>${bean.JAN_696_CNT }</td>
					<td>${bean.FEB_696_CNT }</td>
					<td>${bean.MAR_696_CNT }</td>
					<td>${bean.APR_696_CNT }</td>
					<td>${bean.MAY_696_CNT }</td>
					<td>${bean.JUN_696_CNT }</td>
					<td>${bean.JUL_696_CNT }</td>
					<td>${bean.AUG_696_CNT }</td>
					<td>${bean.SEP_696_CNT }</td>
					<td>${bean.OCT_696_CNT }</td>
					<td>${bean.NOV_696_CNT }</td>
					<td>${bean.DEC_696_CNT }</td>
					<td style="font-weight: bold">${bean.JAN_696_CNT + bean.FEB_696_CNT + bean.MAR_696_CNT
						 + bean.APR_696_CNT + bean.MAY_696_CNT + bean.JUN_696_CNT
						 + bean.JUL_696_CNT + bean.AUG_696_CNT + bean.SEP_696_CNT
						 + bean.OCT_696_CNT + bean.NOV_696_CNT + bean.DEC_696_CNT  }</td>
				</tr>
			</tbody>		
		</table>
	</td>
</tr>


<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td style="text-align: right; height: 30px">
		<input type="button" onclick="SALES.download()" value="엑셀 다운로드" />
		<input type="button" onclick="SALES.addRow()" value="추가" />
	</td>
</tr>

<tr>
	<td>
		<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:10%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:6%"/>
				<col style="width:8%"/>
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th>단가</th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody class="input_text_center">
				<c:forEach items="${list }" var="bean">
					<tr ${isModify ? 'class="sales_data"' : '' } height="30px">
						<th><input type="text" name="salesNm" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' } value="${bean.salesNm }" /></th>
						<td><input type="text" name="unitPrice" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.unitPrice }" /></td>
						<td><input type="text" name="janUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.janUserCnt }" /></td>
						<td><input type="text" name="febUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.febUserCnt }" /></td>
						<td><input type="text" name="marUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.marUserCnt }" /></td>
						<td><input type="text" name="aprUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.aprUserCnt }" /></td>
						<td><input type="text" name="mayUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.mayUserCnt }" /></td>
						<td><input type="text" name="junUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.junUserCnt }" /></td>
						<td><input type="text" name="julUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.julUserCnt }" /></td>
						<td><input type="text" name="augUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.augUserCnt }" /></td>
						<td><input type="text" name="sepUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.sepUserCnt }" /></td>
						<td><input type="text" name="octUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.octUserCnt }" /></td>
						<td><input type="text" name="novUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.novUserCnt }" /></td>
						<td><input type="text" name="decUserCnt" style="width:100%; height: 23px;" ${isModify ? '' : 'readonly' }  value="${bean.decUserCnt }" /></td>
						<td>
							<input type="button" onclick="${isModify ? 'SALES.upArrow(this);' : 'SALES.cannotModifyMsg();' }" value="↑" />&nbsp;<input type="button" onclick="${isModify ? 'SALES.downArrow(this);' : 'SALES.cannotModifyMsg();' }" value="↓" />&nbsp;
							&nbsp;<input type="button" onclick="${isModify ? 'SALES.removeRow(this);' : 'SALES.cannotModifyMsg();' }" value="삭제" />
							<input type="hidden" name="orderNo" />
						</td>
					</tr>
				</c:forEach>
				<tr class="sales_data" height="30px">
					<th><input type="text" name="salesNm" style="width:100%; height: 23px;" /></th>
					<td><input type="text" name="unitPrice" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="janUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="febUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="marUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="aprUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="mayUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="junUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="julUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="augUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="sepUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="octUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="novUserCnt" style="width:100%; height: 23px;" /></td>
					<td><input type="text" name="decUserCnt" style="width:100%; height: 23px;" /></td>
					<td>
						<input type="button" onclick="SALES.upArrow(this);" value="↑" />&nbsp;<input type="button" onclick="SALES.downArrow(this);" value="↓" />&nbsp;
						&nbsp;<input type="button" onclick="SALES.removeRow(this);" value="삭제" />
						<input type="hidden" name="orderNo" />
					</td>
				</tr>
			</tbody>		
		</table>
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td height="20px" style="color:red; font-weight: bold;">* 풀무원, BGF와 같이 하나의 고객사명에 여러 거래처가 묶여있는 경우 각 거래처별로 모든 항목을 구분해서 기재바람</td>
</tr>
<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-collapse:collapse;">
			<tr>
				<td class="" colspan="4" height="60px" align="center">
					<div class="webArea">
		    			<input type="button" onclick="SALES.save();" value="저장" style="height:30px;width:100px;"/>
		    		</div>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>
</c:if>
</table>
</form>
</body>
</html>

