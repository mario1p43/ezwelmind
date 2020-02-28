<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 관리</title>
<script language="Javascript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheetinfo.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheet.js"></script>
<script type="text/javascript">
j$(document).ready(function(){

	// IBSheet 로딩
	LoadPage();

	j$("input").keypress(function(e) {
		if (e.which == 13){
			j$("#searchClient").submit();
			return false;
		};
	});

	j$("#searchBtn").click(function(){
		var start = j$('[name=startEmploy]').val()
		var end = j$('[name=endEmploy]').val()
		if((start == "" && end != "")||(start != "" && end == "") ){
			alert("인원수를 양쪽 다 체워주세요.");
			return false;
		}
		
		doAction('search');
		return false;
	});

	j$("#insertBtn").click(function(){
		location.href = "/madm/client/addClient";
		return false;
	});

	j$("#excelDownBtn").click(function(){
		doAction('down2excel');
		return false;
	});

	j$(".clientDetail").click(function(){
		var clientCd = bEnco(j$(this).attr("value"));
		location.href = "/madm/client/modifyClient?clientCd="+clientCd;
		return false;
	});
	
	j$("#goMemberPrivate").click(function () {
		var clientCd = $("#clientCd").val();
		if (clientCd == "") {
			alert("고객사를 선택해주세요.");
			return;
		}
		location.href = "/madm/client/memberPrivate?clientCd=" + clientCd; 
	});
	
	j$("#goIntakeSetting").click(function() {
		var clientCd = $("#clientCd").val();
		if (clientCd == "") {
			alert("고객사를 선택해주세요.");
			return;
		}
		location.href = "/madm/client/intakeSetting?clientCd=" + clientCd; 
	});

	if ("${param.insertCnt}" == "1") {
		j$.alert("정상적으로 등록 되었습니다.");
	} else if ("${param.insertCnt}" == "0") {
		j$.alert("동일한 ID가 이미 존재합니다.");
	}
});
</script>

<script language="javascript">
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {
//			mySheet.SetTheme("MA","Main");

			var ibsheet = {};

			ibsheet.Cfg={ SearchMode:smLazyLoad, SizeMode:0 };

			ibsheet.Header = {Sort:true};

			ibsheet.Cols = [
					{ Header: "NO", Type:"Seq", Width:30, Align:"Center" , SaveName:"seq"},
					{ Header: "고객사코드", Type: "Text", Width:100,SaveName:"clientCd", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "고객사명", Type: "Text", Width:100,SaveName:"clientNm", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "지역구분", Type: "Text", Width:60,SaveName:"areaCdNm", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "인원수", Type: "Text", Width:50,SaveName:"totEmploy", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "계약방식", Type: "Text", Width:50,SaveName:"contractTypeNm", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "가입방식", Type: "Combo", Width:70,SaveName:"joinType", Edit: 0, Align: "Center",FontColor:"#777777",ComboText:"관리자등록|회원가입",ComboCode:"I|J"},
					{ Header: "로그인방식", Type: "Combo", Width:70,SaveName:"loginType", Edit: 0, Align: "Center",FontColor:"#777777",ComboText:"아이디|사번",ComboCode:"I|E"},
					{ Header: "메뉴그룹", Type: "Text", Width:70,SaveName:"menuGroup", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "사용여부", Type: "Text", Width:50,SaveName:"useYn", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "오픈여부", Type: "Text", Width:50,SaveName:"openYn", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Header: "등록일시", Type: "Date", Width:100, Format:"YmdHms",SaveName:"regDt", Edit: 0, Align: "Center",FontColor:"#777777"}
			];

			IBS_InitSheet(mySheet, ibsheet);
			mySheet.SetEditableColorDiff (0);

			//총 건수 정보 표시
			mySheet.SetCountPosition (3);
			doAction('search');

			//IBSheet DebugMode On
//			mySheet.ShowDebugMsg(-1);
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {

		switch(sAction) {

			case "search":	  //조회
				mySheet.DoSearch("/madm/client/clientJsonList",FormQueryStringEnc(document.searchClient));
				break;
			case "reload":
				mySheet.RemoveAll();
				mySheet.FitColWidth();
				break;
			case "insert":
				mySheet.DataInsert();
				break;
			case "delete":
				var a = mySheet.FindCheckedRow("CHK");
				mySheet.RowDelete(a);
				break;
			case "down2excel":
				mySheet.Down2Excel({"FileName":"clientList.xlsx",SheetDesign:1});
				break;
			case "save":

//				var a = mySheet.GetSaveJson();
//				alert(JSON.stringify(a));
				break;

		}

	}

	/* IB Sheet 7 Event */
	function mySheet_OnSearchEnd() {
		mySheet.FitColWidth();
	}

	function mySheet_OnResize() {
		mySheet.FitColWidth();
	}

	function mySheet_OnClick(Row,Col,Value){

		var clientCd= bEnco(mySheet.GetCellValue(Row,'clientCd'));
		if(clientCd != ''){
			location.href = "/madm/client/modifyClient?clientCd="+clientCd;
		}
	}
	
	function clientReload(setType){
		if(setType == "sel"){
			var tempClientCd = $("#clientCd option:selected").val();
			if(tempClientCd == "") return;
			var tempClientNm = $("#clientCd option:selected").text();
			$("#chkClientCd").val(tempClientNm);
		}else if(setType == "txt"){
			var tempClientCd = $("#chkClientCd").val();
			if(tempClientCd == "") return;
			
			var clientList = new Array();
			<c:forEach var="list" items="${clientList}">
			var arr = { nm : "${list.clientNm}", cd : "${list.clientCd}"};
			clientList.push(arr);
			</c:forEach>
			
			for(var i=0 ; i < clientList.length ; i++){
				var checkClientArr = clientList[i];
				if(checkClientArr.nm.indexOf(tempClientCd) != -1) {
					$("#clientCd").val(checkClientArr.cd);
					break;
				}	
			}
		}
	}

</script>

</head>


<body>

<form id="searchClient" name="searchClient" modelAttribute="clientDto" action="/madm/client/clientList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">고객사 등록 관리</td>
				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
					<input type="button" id="excelDownBtn" value="엑셀다운로드">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<%-- <td align="right">
								<input type="text" id="clientNm" name="clientNm" placeholder="검색어를 입력 하세요." value="${param.clientNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
							</td> --%>
							<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">고객사코드/명</th>
						    	<td width="40%" align="left"  style="padding-left: 5px;">
						    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${clientList}">
						    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq ecrmTaskDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
						    			</c:forEach>
						    		</select>
						    		<input type="text" id="chkClientCd" value="" onkeyup="clientReload('txt');" style="width:350px;" placeholder="고객사명을 입력 또는 선택하세요.">
						    	</td>
						    	<th width="10%" bgcolor="#F5F5F5" align="center">지역구분</th>
						    	<td width="40%" align="left" style="padding-left: 5px;"> 
						    		<comm:select name="areaCd"   code="100006"  basicValue="---- 선택 ----" selectValue="" />
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">인원수</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						    		<input type="number" name="startEmploy"> ~ <input type="number" name="endEmploy">
						    	</td>
						    	<th width="10%" bgcolor="#F5F5F5" align="center">계약방식</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						    		<comm:select name="contractType"   code="100648"  basicValue="---- 선택 ----" selectValue="" />
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">가입방식</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						    		<select id="joinType" name="joinType" style="height: 20px;">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${joinType}">
						    				<option value="${list.optionCd }"  >${list.commNm }</option>
						    			</c:forEach>
						    		</select>
						    		
						    	</td>
						    	<th width="10%" bgcolor="#F5F5F5" align="center">로그인방식</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						   		 	<select name="loginType">
						   		 		<option value="" >---- 선택 ----</option>
						   		 		<option value="I">아이디</option>
						   		 		<option value="E">사번</option>
						   		 	</select>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">사용여부</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						    	<select name="useYn">
						   		 		<option value="" >---- 선택 ----</option>
						   		 		<option value="Y">Y</option>
						   		 		<option value="N">N</option>
						   		 	</select>
						    	</td>
						    	<th width="10%" bgcolor="#F5F5F5" align="center">오픈여부</th>
						    	<td width="40%" align="left" style="padding-left: 5px;">
						    	<select name="openYn">
						   		 		<option value="" >---- 선택 ----</option>
						   		 		<option value="Y">Y</option>
						   		 		<option value="N">N</option>
						   		 	</select>
						    	</td>
							</tr>
							
							
						</table>
						<!-- 검색 영역 종료 -->
					</td>
							
							
							
							
						</tr>
						
						<tr>
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td>
								    			<input type="button" id="searchBtn" value="검 색">
								    			<input type="button" id="goMemberPrivate" value="회원 개인정보관리" style="margin-left : 20px;">
								    			<input type="button" id="goIntakeSetting" value="고객사별 상담설정" style="margin-left : 20px;">
								    		</td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
						
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top" height="400">
					<div class="ib_product" style="height:450px">
					<script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); </script>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>

