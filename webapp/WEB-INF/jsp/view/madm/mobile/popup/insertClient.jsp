<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>팝업 고객사 등록</title>

<script language="Javascript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheetinfo.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheet.js"></script>
<script type="text/javascript">
j$(document).ready(function(){

	// IBSheet 로딩
	LoadPage();
	mySheet.FitColWidth();
	
	j$("input[id=insertNum]").keypress(function(e) {
	    if (e.which == 13){
	    	doAction('insert');
			return false;
	    };
	}); 

});
</script>


<script language="javascript">
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {
			var ibsheet = {};

			ibsheet.Cfg={ SearchMode:smLazyLoad };

			ibsheet.Header = {Sort:true};

			ibsheet.Cols = [
			        { Header: "No", 		Type: "Seq",		SaveName:"seq",			Width:45,	Align: "Center"},	
					{ Header: "상태", 		Type: "Status",		SaveName:"status", 		Width:50, 	Align: "Center"},
					{ Header: "고객사코드", Type: "Text",		SaveName:"clientCd", 	Width:100, 	Align: "Center",	FontColor:"#777777"}
			];

			IBS_InitSheet(mySheet, ibsheet);
			mySheet.SetEditableColorDiff (0);
			doAction('search');
	}

	function mySheet_OnValidation(Row, Col, Value) {
	    switch(Col) {
	        case 1:
	           if (Value == "" ) {
	                alert("11");
	                mySheet.ValidateFail(1);
	                mySheet.SetSelectCell(Row, 1);
	           }
	           break;
	    }
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "reload":
				mySheet.RemoveAll();
				mySheet.FitColWidth();
				break;
			case "insert":
				
				var idx = j$("#insertNum").val();
				
				for (var i = 0; i < idx; i++) {
					mySheet.DataInsert();
				}
				
				break;
			case "delete":
				var a = mySheet.FindCheckedRow("CHK");
				mySheet.RowDelete(a);
				break;
			case "down2excel":
				mySheet.Down2Excel({"FileName":"text.xlsx",Merge:1,SheetDesign:1});
				break;
			case "save":
				var param = "menuUrl=" + j$("#menuUrl").val() + "&popupSeq=" + $("#popupSeq").val();
				mySheet.DoSave("/madm/mobile/popupManage/insertClientCd", param);
			    //저장 실행 됐을때만
			    if( resultSave == true) {
				    alert('저장이 완료되었습니다.');
			    	/* location.href = "/popupManage/popupMain"; */
			    }
				break;
		}
	}

	/* IB Sheet 7 Event */
	function mySheet_OnSearchEnd() {
		mySheet.FitColWidth();
	}

</script> 
</head>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr><td height="20px"></td></tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">팝업 고객사 등록</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 Seq</th>
	            <td colspan="3" width="">
	           		${popupDetail.popupSeq }
	            	<input type="hidden" name="popupSeq" id="popupSeq" value="${popupDetail.popupSeq }"/>
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 적용 URL</th>
	            <td colspan="3" width="">
	            	${popupDetail.menuUrl }
	            	<input type="hidden" name="menuUrl" value="${popupDetail.menuUrl }"/>
	            </td>
	        </tr>
		</table>
	</td>
</tr>

<tr><td height="20px"><td><tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr>
				<td align="right">
					<strong><a href="javascript:doAction('reload')" >초기화</a></strong>
					<span style="margin-left: 20px;"></span>
					<strong><a href="javascript:doAction('insert')" >신규</a></strong>(<input type="text" id="insertNum" value="1" style="width:30px; text-align: center;">개)
					<span style="margin-left: 20px;"></span>
					<strong><a href="javascript:doAction('save')" >저장</a></strong>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; min-height: 200px;">
			<tr align="center" >
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사 선택</th>
	            <td colspan="3" style="min-height: 400px;">
					<script type="text/javascript"> createIBSheet("mySheet", "75%", "95%"); </script>
	            </td>
			</tr>
		</table>
	</td>
</tr> 
</table>
</body>
</html>

