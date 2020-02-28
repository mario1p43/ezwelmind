<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script language="Javascript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheetinfo.js"></script>
<script language="javascript" type="text/javascript" src="/resources/IBSheet/ibsheet.js"></script>

<script type="text/javascript">
var pageheightoffset = 180;
/*Sheet 기본 설정 */
function LoadPage() {
	  var cfg = {FrozenCol:3,SearchMode:2,Page:100};

	  mySheet.SetConfig(cfg);

	  var header = [{Text:"고객사코드|고객사명",Align:"Center"}];

	  var info = {Sort:0,ColMove:1,ColResize:1};

	  mySheet.InitHeaders(header,info);

	  var cols = [
	              {Type:"Text",Width:100,SaveName:"CLIENT_CD", Edit:"false", Align:"center"},
	              {Type:"Text",Width:100,SaveName:"CLIENT_NM", Align:"Center"}
	  ];
		
	  	mySheet.SetConfig(cfg);
		mySheet.InitHeaders(header,info);
		mySheet.InitColumns(cols);

		mySheet.SetCountPosition(4);
		mySheet.SetPagingPosition(1)
		mySheet.FitColWidth();
}

/*Sheet 각종 처리*/
function doAction(sAction) {
	switch(sAction) {
		case "search":      //조회
			var param =  {"Param":"onepagerow=100&clientCd=mind"};
			//조회하기 (페이지명, 조회조건);
			alert(11);
			mySheet.DoSearchPaging("/bbsInfo/ibsheetTest", param);
			resizeIBSheetRows(mySheet);
			break;
			
		case "save":
			alert(mySheet.GetSaveString());
			break;
			
		case "test":
			alert(mySheet.GetCellValue( mySheet.GetSelectRow(), "CLIENT_CD") + mySheet.GetCellValue( mySheet.GetSelectRow(), "CLIENT_NM"));
	}
}

function mySheet_OnSearchEnd() {
	total = mySheet.GetTotalRows();
	alert("조회가 완료되었습니다.   totalRow : " + total);
	mySheet.FitColWidth();
}

</script>
</head>
<body onload="LoadPage()">

	<div class="main_content">
		<div class="exp_product">
			<b>IBSheet 샘플</b>
		</div>

		<div class="ib_function float_right">
			<input type="button" value="조회" onclick="doAction('search');">
			<input type="button" value="테스트"
				onclick="javascript:doAction('test');">
		</div>

		<div class="ib_product">
			<script type="text/javascript"> createIBSheet("mySheet", "100%", "100px"); </script>
		</div>
	</div>

</body>

</html>