<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사별 메뉴</title>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheetinfo.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheet.js"></script>
<script type="text/javascript">
j$(document).ready(function(){
	// IBSheet 로딩
	LoadPage();
	mySheet.FitColWidth();
	
	j$("#searchBtn").click(function(){
		var nullCheck =  $("#clientNmTxt").val()
		if(nullCheck == null || nullCheck == ""){
			alert("메뉴그룹 & 고객사는 필수 조건입니다.");
			return false;
		}
		doAction('search');
		return false;
	});
	j$("#excelDownBtn").click(function(){
		doAction('down2excel');
		return false;
	});
	j$("#saveBtn").click(function(){
		doAction('save');
		return false;
	});
	
	
	j$('#menuGroup').change(function() {
		
		var params = {};
		var strData = "";
		var menuGroup = $("#menuGroup").val()
		params.menuGroup  = menuGroup;
		j$('#subData').remove();
		if(menuGroup == ""){
			return false;
		}else{
		j$.ajax({
			url: '/madm/menu/ajaxMenuGroup',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				
				strData += "<span id='subData'>";
				strData += "<select id='clientNm' name='clientNm' onchange='changeNm()' data-validation='required' data-validation-error-msg-required='고객사를 선택해주세요.'>";
				strData += "<option value=''>고객사를 선택해주세요.</option>";

				j$.each(data.clientList, function(i, clientList){
					strData += "   <option value='"+clientList.clientNm+"'>"+clientList.clientNm+"</option>";
				});
				strData += "</select>";
				strData += "  <input type='text' name='clientNmTxt' id='clientNmTxt'>";
				strData += "</span>";
				j$('#client').show();
				j$('#client').after(strData);  
				
			}
		});
		}
		
	});
	
});

function changeNm(){
	if(document.clientMenu.clientNm.options[document.clientMenu.clientNm.selectedIndex].value != ""){
		$("#clientNmTxt").val(document.clientMenu.clientNm.options[document.clientMenu.clientNm.selectedIndex].value);
	}else{
		$("#clientNmTxt").val("");
	}
}	



</script>
<script language="javascript">
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {


			
			var cfg = {DataRowMerge:1,MergeSheet:msHeaderOnly};

			  mySheet.SetConfig(cfg);


			var headers = [
			               {Text:"||||메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|메뉴그룹|고객사|고객사|고객사|고객사|고객사|고객사|고객사|고객사",Align:"Center"},
			               {Text:"체크박스|메뉴일련번호|메뉴그룹|고객사코드|1Depth|2Depth|3Depth|4Depth|정렬순서|img_url1|img_url2|AD문구|노출여부|사용여부|결제수단|결제수단|결제수단|결제수단|결제수단|결제수단|사용여부|노출여부",Align:"Center"}
			               ];

			var info = {Sort:1, ColMove:1, ColResize:1, HeaderCheck:0};
			mySheet.InitHeaders(headers,info);

			
			var cols = [
					{Type:"CheckBox", Width:50, Align:"Center" , SaveName:"CheckBox"},
					{ 	Type: "Text", Width:70,SaveName:"menuSeq", Hidden: 1, Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:70,SaveName:"menuGroup", Hidden: 1, Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:70,SaveName:"clientCd", Hidden: 1, Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:70,SaveName:"1Depth", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:50,SaveName:"2Depth", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:50,SaveName:"3Depth", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:50,SaveName:"4Depth", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:50,SaveName:"orderNo", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:50,SaveName:"imgUrl", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ Type: "Text", Width:50,SaveName:"imgUrl2", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:50,SaveName:"menuTxt", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:50,SaveName:"dispYn", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type: "Text", Width:50,SaveName:"useYn", Edit: 0, Align: "Center",FontColor:"#777777"},
					{ 	Type:"CheckBox", Width:10, Align:"Center" , SaveName:"payType1", ColMerge:1, },
					{ 	Type:"Text", Width:20, Align:"Center" , SaveName:"payNm1", ColMerge:1,FontColor:"#777777"},
					{ 	Type:"CheckBox", Width:10, Align:"Center" , SaveName:"payType2", ColMerge:1},
					{ 	Type:"Text", Width:20, Align:"Center" , SaveName:"payNm2", ColMerge:1,FontColor:"#777777"},
					{ 	Type:"CheckBox", Width:10, Align:"Center" , SaveName:"payType3", ColMerge:1},
					{ 	Type:"Text", Width:20, Align:"Center" , SaveName:"payNm3", ColMerge:1,FontColor:"#777777"},
					{ 	Type: "Combo", Width:70,SaveName:"clientUseYn", Edit: 1, Align: "Center",FontColor:"#777777",ComboText:"사용함|사용안함",ComboCode:"Y|N"},
					{ 	Type: "Combo", Width:70,SaveName:"clientDispYn", Edit: 1, Align: "Center",FontColor:"#777777",ComboText:"사용함|사용안함",ComboCode:"Y|N"}
				];

					mySheet.InitColumns(cols);
			
			
			
			
			mySheet.SetEditableColorDiff (0);

			//총 건수 정보 표시
			mySheet.SetCountPosition (3);
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {

		switch(sAction) {

			case "search":	  //조회
				var searchType = $("#searchType").val();
				var searchTxt = $("#searchTxt").val();
				if(searchType == "menuNm"){
					clientMenu.elements["clientMenuNm"].value = searchTxt;
				}else if(searchType == "menuCd"){
					clientMenu.elements["clientMenuCd"].value = searchTxt;
				}else if(searchType == "menuUrl"){
					clientMenu.elements["clientMenuUrl"].value = searchTxt;
				} 
				mySheet.DoSearch("/madm/menu/clientJsonList",FormQueryStringEnc(document.clientMenu));
				break;
			case "reload":
				mySheet.RemoveAll();
				mySheet.FitColWidth();
				break;
			case "down2excel":
				mySheet.Down2Excel({"FileName":"clientMenuList.xlsx",DownCols:'4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21',CheckBoxOnValue:'Y',CheckBoxOffValue:'N',Merge:1,HiddenColumn:1,SheetDesign:1});
				break;
			case "save":
				mySheet.DoSave("/madm/menu/saveClientMenu" ,{ Col : 0 });
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
</script>


</head>
<body>

<form:form name="clientMenu" id="clientMenu" modelAttribute="" action="/madm/menu/clientMenu" >
<input type="hidden" name="clientMenuNm" value="${param.clientMenuNm }">
<input type="hidden" name="clientMenuCd" value="${param.clientMenuCd }">
<input type="hidden" name="clientMenuUrl" value="${param.clientMenuUrl }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">고객사별 메뉴</td>
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
								<th width="15%" bgcolor="#F5F5F5" align="left">&nbsp;&nbsp;메뉴그룹</th>
						    	<td colspan="2" width="35%" align="left">
						    		<select id="menuGroup">
								 		<option value="">메뉴그룹을 선택해주세요.</option>
								 			<c:forEach var="list" items="${ menuGroupList }">
								 			<option value="${list.menuGroup }" <c:if test="${list.menuGroup eq menuGroup}">selected</c:if> >${list.menuGroup}</option>
								 		</c:forEach>
								 	</select>
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="left">&nbsp;&nbsp;고객사</th>
						    	<td colspan="2" width="35%" align="left">
						    	<span id="client" >
										
 										<span id='subData'><select id="clientNm"  ><option>고객사를 선택해주세요.</option></select>  <input type="text"> </span></span>
									
								</span>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="left">&nbsp;&nbsp;메뉴명</th>
						    	<td colspan="2" width="35%" align="left">
			    					<input type="text" name="menuNm" id="menuNm" value="${param.menuNm }">
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="left">&nbsp;&nbsp;검색조건</th>
						    	<td colspan="2" width="35%" align="left">
						    		<select id="searchType">
						    			<option value="menuNm">프로그램명
						    			<option value="menuCd">메뉴CD
						    			<option value="menuUrl">메뉴URL
						    		</select>
						    		<input type="text" id="searchTxt" name="searchTxt">
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
								    		<td><input type="button" id="searchBtn" value="검 색">
								    		<input type="button" id="excelDownBtn" value="엑셀다운로드"></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
	<tr>
				<td valign="top" height="400">
					<div class="ib_product" style="height:450px">
					<script type="text/javascript"> createIBSheet("mySheet", "100%", "100%"); </script>
					</div>
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
								    			<input type="button" id="saveBtn" value="저 장">
								    		</td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
	</td>
</tr>
</table>
</form:form>

</body>
</html>