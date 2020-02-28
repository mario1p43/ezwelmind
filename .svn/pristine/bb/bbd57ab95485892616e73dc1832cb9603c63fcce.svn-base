<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너관리(화면관리)</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var num = 0;
var oEditors1 = [];
j$(document).ready(function(){
	String.prototype.trim = function()
	 {
	   return this.replace(/^\s+|\s+$/g, "");
	 }
	
	$.validate({
		form : '#regBannerForm',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			//alert('모든 필수 정보가 입력이 되었습니다.');
		}
		
	});
	
	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});	
	
	//등록하기
	j$("#insertBtn").click(function(){
		var checkVal = "<P>&nbsp;</P>";
		var tempVal1 = j$("#ir1").text().trim();
		var tempVal2 = j$("#ir2").text().trim();
		var tempVal3 = j$("#ir3").text().trim();
		
		if(checkVal == tempVal1){
			alert("강좌소개 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal2){
			alert("강사소개 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal3){
			alert("취소/환불 규정 내용을 입력하세요");
			return false;
		}
		
		
		/*
		//file check
		var f1 =   document.getElementById("file1").value;
		var f2 =   document.getElementById("file2").value;
		if(f1 != "" || f2 != ""){
			j$("#fnum").val("1");	
		}
		*/
		
		//select option check
		var status = $("select[name=goodsStatus]").val();
		if(status == ""){
			alert("승인유무 값을 선택하세요.");
			return
		}
		j$("#regBannerForm").submit();
	});
	
	//미리보기
	//2015.09.04 보류
	j$("#viewBtn").click(function(){
		alert("개발중입니다.");
		//j$("#regBannerForm").attr("target","view");
		//j$("#regBannerForm").attr("action","/madm/service/enrollment/onlinegoodsview");
		//j$("#regBannerForm").submit();
	});
	
	j$(".date_timepicker_from").each(function(i, e){
		$(e).datetimepicker({
			format:"Y/m/d",
			onShow:function( ct ){
				this.setOptions({
					maxDate:j$(".dtt" + (i + 1)).val()?j$(".dtt" + (i + 1)).val():false
				})
			},
			timepicker:false
		});
	});

	j$(".fromDt2").click(function(){
		//j$('.date_timepicker_from').datetimepicker('show');
		$(this).prev().datetimepicker('show');
	});
	
	j$(".date_timepicker_to").each(function(i, e){
		$(e).datetimepicker({
			format:"Y/m/d",
			onShow:function( ct ){
				this.setOptions({
					minDate:j$(".dtf" + (i + 1)).val()?j$(".dtf" + (i + 1)).val():false
				})
			},
			timepicker:false
		});
	});

	j$(".toDt2").click(function(){
		//j$('.date_timepicker_to').datetimepicker('show');
		$(this).prev().datetimepicker('show');
	});
	
	j$("#selectPageType").on("change", function(){
		//regBannerForm
		var str = j$("#selectPageType option:selected").val(); 
		
		if (str.length > 0) {
			j$("#pageTypeSeq").val(str);
			document.regBannerForm.action = "/madm/service/exposure/mhzDisplayManager";
			j$("#regBannerForm").submit();
		}		
	});
});

function autoCal(val){
	//정수만
	var num_check=/^[0-9]*$/;
	//소수점 한자리까지 만
	var num_check2 = /^\d+(?:[.]?[\d])?$/; 
	
	var buy = $('#goodsBuyPrice').val();
	if(num_check.test(buy)){
		buy = parseInt(buy,10);
		
		//할인율을 입력했을 경우
		if(val == "dis"){
			var dis = $('#goodsDisRate').val();
			if(num_check2.test(dis)){
				dis = parseFloat(dis);
				//alert(dis);
				if(dis > 100){
					$('#goodsDisRate').val("");
					alert("할인율은 100을 넘을 수 없습니다.");
				}else{
					sale = buy - ((buy * dis) / 100);
					$('#goodsBuyPrice').val(buy);
					$('#goodsDisRate').val(dis);
					$('#goodsSalePrice').val(sale);
				}
			}else{
				$('#goodsDisRate').val("");
				alert("할인율은 숫자만 입력해주세요.(소주점 한자리까지만 입력가능)");
			}
		}
		
		//매입가를 입력했을 경우
		if(val == "sale"){
			var sale = $('#goodsSalePrice').val();
			if(num_check.test(sale)){
				sale = parseInt(sale,10);
				if(sale > buy){
					$('#goodsSalePrice').val("");
					alert("입력하신 판매가가 매입가보다 큽니다.");
				}else{
					dis = (buy - sale) / buy * 100;
					dis = dis.toFixed(1);
					$('#goodsBuyPrice').val(buy);
					$('#goodsDisRate').val(dis);
					$('#goodsSalePrice').val(sale);
				}
			}else{
				$('#goodsSalePrice').val("");
				alert("판매가는 숫자만 입력해주세요.");
			}
		}
	}else{
		alert("매입가를 입력해주세요.");
	}
}

function addRow(info){
	if(num >= $("select[name=lecCount]").val()){
		alert("설정된 회차수 이상의 회차정보는 등록하실 수 없습니다.");
		return
	}
	
	num++;
	
	var rowlen = info.rows.length;
	var row = info.insertRow(rowlen);
	
		
	row.insertCell(0).innerHTML = num;
	row.insertCell(1).innerHTML = "<input type='text' name='lecNmArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강의명을 확인 해주세요.'/>";
	
	//var cell = row.insertCell(2);
	//cell.innerHTML = "<input type='text' name='lecTimeArr' id='lecTimeArr' value='' style='width: 150px;' class='onlyNumber' data-validation='required' data-validation-error-msg='강의시간 확인 해주세요.'/>";
	//cell.className = "onlyNumber";
	
	row.insertCell(2).innerHTML = "<input type='text' name='lecTimeArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강의시간 확인 해주세요.'/>";
	row.insertCell(3).innerHTML = "<input type='text' name='lecPathArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강좌URL 확인 해주세요.'/>";
	row.insertCell(4).innerHTML = "<input type='checkbox' name='lecPayYnArr"+num+"' id='lecPayYnArr"+num+"' value='Y'>";

	}

function delRow(info){
	if(num == 0){
		return false;
	}
	var rowlen = info.rows.length;
	var row = info.deleteRow(rowlen - 1);
	num--;
}

function checkRow(){
	//select selected value
	var selcount = $("select[name=lecCount]").val();
	//현재 회창 정보 row수
	var rowlen = info.rows.length;
	
	if(selcount<rowlen){
		for(var j=rowlen-selcount; j>1; j--){
			delRow(info);
		}
	}
}

function getcspPopup() {
	window.open("/madm/service/enrollment/cspPopup?Oform=ogoods", "cspPopup", "width=600, height=400,  scrollbars=1");
}

 j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors1,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
}); 
 
function addLayout () {
	var layoutNm = prompt("레이아웃 이름을 입력하세요:");
	
	if (layoutNm.length > 0) {
		j$("#pageTypeNm").val(layoutNm);
		document.regBannerForm.action = "/madm/service/exposure/insertMhzLayout";
		j$("#regBannerForm").submit();
	}
}

function viewlayoutHtml(strObj){
	if(strObj == "null"){
    	return false;
	}

	var X = event.x;
	var Y = event.y;
	var viewObj;
	var viewDiv = document.getElementById("viewlayout");

	if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1 || strObj.indexOf(".png") > -1){
		viewObj="<img src='"+strObj+"'>";
	} else {
		viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
	}
	
	X -= 100;
	Y += 30;
	
	viewDiv.style.left = X+"px";
	viewDiv.style.top  = Y+"px";
	viewDiv.style.display = "block";
	viewDiv.innerHTML=viewObj; 
}

function cutlayout(){
	var viewDiv = document.getElementById("viewlayout");
		viewDiv.style.display = "none";
}
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr align="center">
		<td>
			메인
			<table cellpadding="0" cellspacing="0" border="1px" width="320px" height="240px">
				<tr align="center">
					<td colspan="3">
						페이지 타이틀  (0)<br/>
						대표 이미지 <br/>
						페이지 서브 타이틀 <br/>
						상세 문구 
					</td>
				</tr>
				<tr align="center">
					<td colspan="3">배너 (A)</td>
				</tr>
				<tr align="center">
					<td colspan="3">추천 타이틀 (B)</td>
				</tr>
				<tr align="center">
					<td colspan="2">추천 배너1<br/>(C - 1)</td>
					<td>추천 배너4<br/>(C - 4)</td>
				</tr>
				<tr align="center">
					<td>추천 배너2<br/>(C - 2)</td>
					<td>추천 배너3<br/>(C - 3)</td>
					<td>추천 배너5<br/>(C - 5)</td>
				</tr>		
			</table>
		</td>
		<td>
			THEME ZONE
			<table cellpadding="0" cellspacing="0" border="1px" width="320px" height="240px">
				<tr align="center" height="50px">
					<td>탭1<br/>(D-1)</td>
					<td>탭2<br/>(E-1)</td>
					<td>탭3<br/>(F-1)</td>
				</tr>
				<tr align="center" height="25px">
					<td colspan="3">각 탭 별 대표문구(*)</td>
				</tr>
				<tr align="center">
					<td>상품/배너<br/>(D-2)<br/>(E-2)<br/>(F-2)</td>
					<td>상품/배너<br/>(D-3)<br/>(E-3)<br/>(F-3)</td>
					<td>상품/배너<br/>(D-4)<br/>(E-4)<br/>(F-4)</td>
				</tr>
				<tr align="center">
					<td>상품/배너<br/>(D-5)<br/>(E-5)<br/>(F-5)</td>
					<td>상품/배너<br/>(D-6)<br/>(E-6)<br/>(F-6)</td>
					<td>더보기<br/>(D-7)<br/>(E-7)<br/>(F-7)</td>
				</tr>
			</table>
		</td>
		<td>
			ETC. 기타 아이템
			<table cellpadding="0" cellspacing="0" border="1px" width="320px" height="240px">
				<tr align="center">
					<td colspan="2">아이템1<br/>(G-1)</td>
					<td colspan="2">아이템1<br/>(G-2)</td>
					<td colspan="2">아이템1<br/>(G-3)</td>
				</tr>
				<tr align="center" height="25px">
					<td colspan="6">항목타이틀 (G-10)</td>
				</tr>
				<tr align="center">
					<td>배너1<br/>(G-4)</td>
					<td>배너2<br/>(G-5)</td>
					<td>배너3<br/>(G-6)</td>
					<td>배너4<br/>(G-7)</td>
					<td>배너5<br/>(G-8)</td>
					<td>배너6<br/>(G-9)</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form id="regBannerForm" name="regBannerForm" action="/madm/service/exposure/insertonMhzDisplay" method="POST" enctype="multipart/form-data">
<input type="hidden" name="fnum" id="fnum" value="0" >
<input type="hidden" name="cspCd" id="cspCd" >
<input type="hidden" name="pageTypeSeq" id="pageTypeSeq" value="${pageTypeSeq}">
<input type="hidden" name="pageTypeNm" id="pageTypeNm" value="">
<c:choose>
	<c:when test="${not empty pageTypeSeq}">
<c:choose>
<c:when test="${empty itemMap}">
<table cellpadding="0" cellspacing="0" border="0" width="100%"  >
<tr>
	<td height="30px"></td>
</tr>
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">배너및 화면관리(멘탈헬스존)</td>
						</tr>
					</table>
				</td>
			</tr><c:if test="${idx > 2}"><span style="color:RED">* </span></c:if>
			<tr>
				<td><h3>필수항목 <span style="color:RED">* </span></h3></td>	
			</tr>
			<tr>
				<td><h3>* 페이지 타이틀 영역 (0)</h3></td>	
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageTitle" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="페이지 타이틀을 입력 해주세요."/>
					    		<input type="hidden" name="pageTitleArea" value="0-1">
					    		<input type="hidden" name="pageTitleType" value="S">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">페이지 타이틀 이미지 <span style="color:RED">* </span></th>
							<td class="line" colspan="3">
								<input type="text" name="pageTitleImgUrl"  value="" style="width: 650px;" data-validation="required" data-validation-error-msg="페이지 타이틀 이미지 입력 해주세요."/>
								<input type="hidden" name="pageTitleImgArea" value="0-2">
					    		<input type="hidden" name="pageTitleImgType" value="B">
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 서브 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageSubTitle" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="페이지 서브 타이틀 입력 해주세요."/>
					    		<input type="hidden" name="pageSubTitleArea" value="0-3">
					    		<input type="hidden" name="pageSubTitleType" value="S">
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 성세 문구 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageDetail" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="페이지 상세문구 입력 해주세요."/>
					    		<input type="hidden" name="pageDetailArea" value="0-4">
					    		<input type="hidden" name="pageDetailType" value="S">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>				
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 배너관리 (A)</h3></td>	
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach begin="0" end="4">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (A-${idx + 1})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="rollingBannerTitle[${idx}]" value="" style="width: 650px;"/>
					    		<input type="hidden" name="rollingBannerArea[${idx}]" value="A-${idx + 1}">
					    		<input type="hidden" name="rollingBannerType[${idx}]" value="B">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">배너 이미지<br/>(787 x 105px)</th>
							<td class="line" colspan="3">
								<input type="file" name="rollingBannerImg[${idx}]" id="bannerImg1" style="width: 400px;"/>
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="rollingBannerLink[${idx}]" value="" style="width: 650px;"/>
					    	</td>
						</tr>
						<!-- 
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
						    <td class="line" width="35%" >
								<input type="text" name="rollingBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1}" value=""/>
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="rollingBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1}" value=""/>
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="rollingBannerExposure[${idx}]" value="on"/>노출&nbsp;&nbsp;
					    		<input type="radio" name="rollingBannerExposure[${idx}]" value="off" checked="checked"/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="rollingBannerPriority[${idx}]" value="">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 추천 할목 타이틀 (B)</h3></td>	
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">추천 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendTitle" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="추천 타이틀 입력 해주세요."/>
					    		<input type="hidden" name="recommendTitleArea" value="B-1">
					    		<input type="hidden" name="recommendTitleType" value="S">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 추천항목 배너 (C)</h3></td>	
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach begin="0" end="4">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (C-${idx + 1})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendBannerTitle[${idx}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 타이틀을 입력 해주세요."/>
					    		<input type="hidden" name="recommendBannerArea[${idx}]" value="C-${idx + 1}">
					    		<input type="hidden" name="recommendBannerType[${idx}]" value="B">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">
								배너 이미지 <br/>
								<c:choose>
					    			<c:when test="${idx eq 0}">
					    				(523 x 158 px) <span style="color:RED">* </span>
					    			</c:when>
					    			<c:otherwise>
					    				(263 x 185px) <span style="color:RED">* </span>
					    			</c:otherwise>
					    		</c:choose> 
					    	</th>
							<td class="line" colspan="3">
								<input type="file" name="recommendBannerImg[${idx}]" id="recommendBannerImg1" style="width: 400px;" data-validation="required" data-validation-error-msg="배너 이미지 파일을 추가 해주세요."/>&nbsp;
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendBannerLink[${idx}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 링크 입력 해주세요."/>
					    	</td>
						</tr>
						<!--
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
					    	<td class="line" width="35%" >
								<input type="text" name="recommendBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1 + 3}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="recommendBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1 + 3}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="recommendBannerExposure[${idx}]" value="on" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>노출&nbsp;&nbsp;
					    		<input type="radio" name="recommendBannerExposure[${idx}]" value="off" checked="checked" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="recommendBannerPriority[${idx}]" value="" data-validation="required" data-validation-error-msg="우선순의를 선택 해주세요.">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    			<option value="3">4</option>
					    			<option value="4">5</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* THEME ZONE</h3></td>
			</tr>
			<c:set value="0" var="i"/>
			<c:set var="arrAlpa" value="D,E,F"/>
			<c:forTokens var="alpa" items="${arrAlpa}" delims="," varStatus="status">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>상단 메뉴 탭 (${alpa}-1)</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">탭${alpa} 제목 (${alpa}-1)<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmTabTitle[${status.index}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="탭 제목을 입력 해주세요."/>
					    		<input type="hidden" name="thmTabArea[${status.index}]" value="${alpa}-1">
					    		<input type="hidden" name="thmTabType[${status.index}]" value="T">
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">탭${alpa} 대표문구 (*)<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmTabDetail[${status.index}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="탭 대표문구 입력 해주세요."/>
					    		<input type="hidden" name="thmTabDetailArea[${status.index}]" value="${alpa}-1">
					    		<input type="hidden" name="thmTabDetailType[${status.index}]" value="S">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>
				<c:set value="0" var="j"/>
				<c:forEach begin="0" end="4">
					<tr>
						<td><h4>상품/배너${j + 1} (${alpa}-${j + 2})</h4></td>
					</tr>
					<tr>
						<td>
							<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerTitle[${i}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 타이틀을 입력 해주세요."/>
							    		<input type="hidden" name="thmBannerArea[${i}]" value="${alpa}-${j + 2}">
							    		<input type="hidden" name="thmBannerType[${i}]" value="B">
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<th class="line" align="center" bgcolor="#F5F5F5">배너 이미지<br/>(150 x 150px)<span style="color:RED">* </span></th>
									<td class="line" colspan="3">
										<input type="file" name="thmBannerImg[${i}]" id="thmBannerImg1" style="width: 400px;" data-validation="required" data-validation-error-msg="배너 이미지 파일을 추가 해주세요."/>&nbsp;
									</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerLink[${i}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 링크 입력 해주세요."/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">가격<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerPrice[${i}]" value="" style="width: 650px;"/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">할인가격<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerDcPrice[${i}]" value="" style="width: 650px;"/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">할인율 표시<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="checkbox" name="thmBannerShowDc[${i}]"/>
							    	</td>
								</tr>
								<!-- 
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
							    	<td class="line" width="35%" >
										<input type="text" name="thmBannerRegSt[${i}]" size="10" class="date_timepicker_from dtf${i + 1 + 3 + 5}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
										<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
										&nbsp;~&nbsp;
										<input type="text" name="thmBannerRegEd[${i}]" size="10" class="date_timepicker_to dtt${i + 1 + 3 + 5}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
										<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
									</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="radio" name="thmBannerExposure[${i}]" value="on" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>노출&nbsp;&nbsp;
							    		<input type="radio" name="thmBannerExposure[${i}]" value="off" checked="checked" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>비노출
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
							    	<td class="line" width="85%" colspan="3">
							    		<select name="thmBannerPriority[${i}]" value="" data-validation="required" data-validation-error-msg="우선순의를 선택 해주세요.">
							    			<option value="0">1</option>
							    			<option value="1">2</option>
							    			<option value="2">3</option>
							    			<option value="3">4</option>
							    			<option value="4">5</option>
							    		</select>
							    	</td>
								</tr>
								-->
							</table>
						</td>
					</tr>
				<c:set value="${i + 1}" var="i"/>
				<c:set value="${j + 1 }" var="j"/>
				</c:forEach>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td><h4>더보기 (${alpa}-7)</h4></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
							<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmMoreLink[${status.index}]" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="더보기 링크 입력 해주세요."/>
					    		<input type="hidden" name="thmMoreArea[${status.index}]" value="${alpa}-7">
					    		<input type="hidden" name="thmMoreType[${status.index}]" value="S">
					    	</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
			</c:forTokens>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* ETC. 기타 아이템</h3></td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>기타 아이템 (G)</h4></td>
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach begin="0" end="8">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (G-${idx + 1})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀<c:if test="${idx > 2}"><span style="color:RED">* </span></c:if></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="etcBannerTitle[${idx}]" value="" style="width: 650px;" <c:if test="${idx > 2}">data-validation="required" data-validation-error-msg="배너 타이틀을 입력 해주세요."</c:if>/>
					    		<input type="hidden" name="etcBannerArea[${idx}]" value="G-${idx + 1}">
					    		<input type="hidden" name="etcBannerType[${idx}]" value="B">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">
								배너 이미지 <br/>
								<c:choose>
									<c:when test="${(idx eq 0) or  (idx eq 1) or (idx eq 2)}">
										(200 x 200px)
									</c:when>
									<c:otherwise>
										(124 x 121px)<span style="color:RED">* </span>
									</c:otherwise>
								</c:choose>
							</th>
							<td class="line" colspan="3">
								<input type="file" name="etcBannerImg[${idx}]" id="bannerImg1" style="width: 400px;" <c:if test="${idx > 2}">data-validation="required" data-validation-error-msg="배너 이미지를 입력 해주세요."</c:if>/>&nbsp;
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="etcBannerLink[${idx}]" value="" style="width: 650px;" <c:if test="${idx > 2}">data-validation="required" data-validation-error-msg="배너 링크를 입력 해주세요."</c:if>/>
					    	</td>
						</tr>
						<!-- 
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
						    <td class="line" width="35%" >
								<input type="text" name="etcBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1 + 3 + 5 +3}" value="" />
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="etcBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1 + 3 + 5 + 3}" value="" />
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="etcBannerExposure[${idx}]" value="on" data-validation="required"/>노출&nbsp;&nbsp;
					    		<input type="radio" name="etcBannerExposure[${idx}]" value="off" checked="checked"/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="etcBannerPriority[${idx}]" value="">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    			<option value="3">4</option>
					    			<option value="4">5</option>
					    			<option value="5">6</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">항목타이틀<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="etcContentsTitle" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="항목 타이틀을 입력 해주세요."/>
					    		<input type="hidden" name="etcContentsArea" value="G-10">
					    		<input type="hidden" name="etcContentsType" value="S">
					    	</td>
						</tr>
					</table>
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
								    		<button id="viewBtn" style="height:30px; width:100px;" type="button">미리보기</button>
								    		<button id="insertBtn" style="height:30px; width:100px; margin-left: 50px;" type="button">등록완료</button>
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
</table>
</c:when>
<c:otherwise>
<table cellpadding="0" cellspacing="0" border="0" width="100%"  >
<tr>
	<td height="30px"></td>
</tr>
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">배너및 화면관리(멘탈헬스존)</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>필수항목 <span style="color:RED">* </span></h3></td>	
			</tr>
			<tr>
				<td><h3>* 페이지 타이틀 영역 (0)</h3></td>	
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageTitle" value="${itemMap.grp0[0].areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="pageTitleArea" value="${itemMap.grp0[0].areaNm}">
					    		<input type="hidden" name="pageTitleType" value="${itemMap.grp0[0].areaType}">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">페이지 타이틀 이미지 링크 <span style="color:RED">* </span></th>
							<td class="line" colspan="3">
								<input type="text" name="pageTitleImgUrl"  value="${itemMap.grp0[1].areaImgUrl}" style="width: 650px;"/><c:if test="${not empty itemMap.grp0[1].areaImgUrl}">&nbsp;&nbsp;&nbsp;<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${itemMap.grp0[1].areaImgUrl}" style="width: 25px; height: 25px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${itemMap.grp0[1].areaImgUrl}')" onMouseOut="cutlayout()"></c:if>
								<input type="hidden" name="pageTitleImgArea" value="${itemMap.grp0[1].areaNm}">
					    		<input type="hidden" name="pageTitleImgType" value="${itemMap.grp0[1].areaType}">
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 서브 타이틀 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageSubTitle" value="${itemMap.grp0[2].areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="pageSubTitleArea" value="${itemMap.grp0[2].areaNm}">
					    		<input type="hidden" name="pageSubTitleType" value="${itemMap.grp0[2].areaType}">
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">페이지 성세 문구 <span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="pageDetail" value="${itemMap.grp0[3].areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="pageDetailArea" value="${itemMap.grp0[3].areaNm}">
					    		<input type="hidden" name="pageDetailType" value="${itemMap.grp0[3].areaType}">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>	
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 배너관리 (A)</h3></td>	
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach var="item" items="${itemMap.grpA}">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (${item.areaNm})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="rollingBannerTitle[${idx}]" value="${item.areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="rollingBannerArea[${idx}]" value="${item.areaNm}">
					    		<input type="hidden" name="rollingBannerType[${idx}]" value="${item.areaType}">
					    		<input type="hidden" name="rollingExistingImg[${idx}]" <c:if test="${not empty item.areaImgUrl}">value="${item.areaImgUrl}|${item.fileSeq}"</c:if>/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">배너 이미지<br/>(787 x 105px)</th>
							<td class="line" colspan="3">
								<input type="file" name="rollingBannerImg[${idx}]" id="bannerImg1" style="width: 400px;"/><c:if test="${not empty item.areaImgUrl}">&nbsp;&nbsp;&nbsp;<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}" style="width: 25px; height: 25px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}')" onMouseOut="cutlayout()"></c:if>
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="rollingBannerLink[${idx}]" value="${item.areaLinkUrl}" style="width: 650px;"/>
					    	</td>
						</tr>
						<!-- 
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
						    <td class="line" width="35%" >
								<input type="text" name="rollingBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1}" value=""/>
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="rollingBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1}" value=""/>
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="rollingBannerExposure[${idx}]" value="on" data-validation="required"/>노출&nbsp;&nbsp;
					    		<input type="radio" name="rollingBannerExposure[${idx}]" value="off" checked="checked"/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="rollingBannerPriority[${idx}]" value="">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>			
			<tr>
				<td height="20px"></td>
			</tr>
			<c:forEach var="item" items="${itemMap.grpB}">
			<tr>
				<td><h3>* 추천 할목 타이틀 (B)</h3></td>	
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">추천 타이틀<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendTitle" value="${item.areaText}" style="width: 650px;" data-validation="required" data-validation-error-msg="추천 타이틀 입력 해주세요."/>
					    		<input type="hidden" name="recommendTitleArea" value="${item.areaNm}">
					    		<input type="hidden" name="recommendTitleType" value="${item.areaType}">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 추천항목 배너 (C)</h3></td>	
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach var="item" items="${itemMap.grpC}">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (${item.areaNm})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendBannerTitle[${idx}]" value="${item.areaText}" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 타이틀을 입력 해주세요."/>
					    		<input type="hidden" name="recommendBannerArea[${idx}]" value="${item.areaNm}">
					    		<input type="hidden" name="recommendBannerType[${idx}]" value="${item.areaType}">
					    		<input type="hidden" name="recommendExistingImg[${idx}]" <c:if test="${not empty item.areaImgUrl}">value="${item.areaImgUrl}|${item.fileSeq}"</c:if>/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">
								배너 이미지<br/>
								<c:choose>
					    			<c:when test="${idx eq 0}">
					    				(523 x 158 px)<span style="color:RED">* </span>
					    			</c:when>
					    			<c:otherwise>
					    				(263 x 185px)<span style="color:RED">* </span>
					    			</c:otherwise>
					    		</c:choose>
					    	</th>
							<td class="line" colspan="3">
								<input type="file" name="recommendBannerImg[${idx}]" id="recommendBannerImg1" style="width: 400px;" <c:if test="${empty item.areaImgUrl}">data-validation="required" data-validation-error-msg="배너 이미지 파일을 추가 해주세요."</c:if>/><c:if test="${not empty item.areaImgUrl}">&nbsp;&nbsp;&nbsp;<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}" style="width: 25px; height: 25px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}')" onMouseOut="cutlayout()"></c:if>
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="recommendBannerLink[${idx}]" value="${item.areaLinkUrl}" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 링크 입력 해주세요."/>
					    	</td>
						</tr>
						<!-- 
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
					    	<td class="line" width="35%" >
								<input type="text" name="recommendBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1 + fn:length(itemMap.grpA)}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="recommendBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1 + fn:length(itemMap.grpA)}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="recommendBannerExposure[${idx}]" value="on" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>노출&nbsp;&nbsp;
					    		<input type="radio" name="recommendBannerExposure[${idx}]" value="off" checked="checked" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="recommendBannerPriority[${idx}]" value="" data-validation="required" data-validation-error-msg="우선순의를 선택 해주세요.">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    			<option value="3">4</option>
					    			<option value="4">5</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* THEME ZONE</h3></td>
			</tr>
			<c:set value="0" var="idx"/>
			<c:set var="arrAlpa" value="D,E,F"/>
			<c:forTokens var="alpa" items="${arrAlpa}" delims="," varStatus="status">
			<c:choose>
				<c:when test="${alpa eq 'D'}">
					<c:set var="objVar" value="${itemMap.grpD}"/>
				</c:when>
				<c:when test="${alpa eq 'E'}">
					<c:set var="objVar" value="${itemMap.grpE}"/>
				</c:when>
				<c:when test="${alpa eq 'F'}">
					<c:set var="objVar" value="${itemMap.grpF}"/>
				</c:when>
			</c:choose>			
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>상단 메뉴 탭 (${alpa}-1)</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">탭${alpa} 제목 (${alpa}-1)<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmTabTitle[${status.index}]" value="${objVar[0].areaText}" style="width: 650px;" data-validation="required" data-validation-error-msg="탭 제목을 입력 해주세요."/>
					    		<input type="hidden" name="thmTabArea[${status.index}]" value="${objVar[0].areaNm}">
					    		<input type="hidden" name="thmTabType[${status.index}]" value="${objVar[0].areaType}">
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">탭${alpa} 대표문구 (*)<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmTabDetail[${status.index}]" value="${objVar[1].areaText}" style="width: 650px;" data-validation="required" data-validation-error-msg="탭 대표문구 입력 해주세요."/>
					    		<input type="hidden" name="thmTabDetailArea[${status.index}]" value="${objVar[1].areaNm}">
					    		<input type="hidden" name="thmTabDetailType[${status.index}]" value="${objVar[1].areaType}">
					    	</td>
						</tr>
					</table>
				</td>
			</tr>
				<c:set value="0" var="j"/>
				<c:forEach var="item" items="${objVar}" begin="2" end="6">
					<tr>
						<td><h4>상품/배너${j + 1} (${alpa}-${j + 2})</h4></td>
					</tr>
					<tr>
						<td>
							<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerTitle[${idx}]" value="${item.areaText}" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 타이틀을 입력 해주세요."/>
							    		<input type="hidden" name="thmBannerArea[${idx}]" value="${item.areaNm}">
							    		<input type="hidden" name="thmBannerType[${idx}]" value="${item.areaType}">
							    		<input type="hidden" name="thmExistingImg[${idx}]" <c:if test="${not empty item.areaImgUrl}">value="${item.areaImgUrl}|${item.fileSeq}"</c:if>/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<th class="line" align="center" bgcolor="#F5F5F5">배너 이미지<br/>(150 x 150px)<span style="color:RED">* </span></th>
									<td class="line" colspan="3">
										<input type="file" name="thmBannerImg[${idx}]" id="thmBannerImg1" style="width: 400px;" <c:if test="${empty item.areaImgUrl}">data-validation="required" data-validation-error-msg="배너 이미지 파일을 추가 해주세요."</c:if>/><c:if test="${not empty item.areaImgUrl}">&nbsp;&nbsp;&nbsp;<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}" style="width: 25px; height: 25px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}')" onMouseOut="cutlayout()"></c:if>
									</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerLink[${idx}]" value="${item.areaLinkUrl}" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 링크 입력 해주세요."/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">가격<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerPrice[${idx}]" value="${item.price}" style="width: 650px;"/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">할인가격<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="text" name="thmBannerDcPrice[${idx}]" value="${item.dcPrice}" style="width: 650px;"/>
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">할인율 표시<span style="color:RED">* </span></th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="checkbox" name="thmBannerShowDc[${idx}]"
							    		<c:choose>
							    			<c:when test="${item.showDc eq 'Y'}">
							    				checked="true"
							    			</c:when>
							    		</c:choose>
							    		/>
							    	</td>
								</tr>
								<!-- 
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
							    	<td class="line" width="35%" >
										<input type="text" name="thmBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1 + 3 + 5}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
										<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
										&nbsp;~&nbsp;
										<input type="text" name="thmBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1 + 3 + 5}" value="" data-validation="required" data-validation-error-msg="노출 기간을 확인 해주세요." />
										<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
									</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
							    	<td class="line" width="85%" colspan="3">
							    		<input type="radio" name="thmBannerExposure[${idx}]" value="on" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>노출&nbsp;&nbsp;
							    		<input type="radio" name="thmBannerExposure[${idx}]" value="off" checked="checked" data-validation="required" data-validation-error-msg="노출여부를 선택 해주세요."/>비노출
							    	</td>
								</tr>
								<tr align="left" height="30px">
							    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
							    	<td class="line" width="85%" colspan="3">
							    		<select name="thmBannerPriority[${idx}]" value="" data-validation="required" data-validation-error-msg="우선순의를 선택 해주세요.">
							    			<option value="0">1</option>
							    			<option value="1">2</option>
							    			<option value="2">3</option>
							    			<option value="3">4</option>
							    			<option value="4">5</option>
							    		</select>
							    	</td>
								</tr>
								-->
							</table>
						</td>
					</tr>
				<c:set value="${j + 1}" var="j"/>
				<c:set value="${idx + 1}" var="idx"/>
				</c:forEach>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td><h4>더보기 (${alpa}-7)</h4></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
							<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="thmMoreLink[${status.index}]" value="${objVar[7].areaLinkUrl}" style="width: 650px;" data-validation="required" data-validation-error-msg="더보기 링크 입력 해주세요."/>
					    		<input type="hidden" name="thmMoreArea[${status.index}]" value="${objVar[7].areaNm}">
					    		<input type="hidden" name="thmMoreType[${status.index}]" value="${objVar[7].areaType}">
					    	</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
			</c:forTokens>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* ETC. 기타 아이템</h3></td>
			</tr>
			<tr>
				<td><h4>기타 아이템 (G)</h4></td>
			</tr>
			<c:set value="0" var="idx"/>
			<c:forEach var="item" items="${itemMap.grpG}" end="8">
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td><h4>배너${idx + 1} (${item.areaNm})</h4></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너 타이틀<c:if test="${idx > 2}"><span style="color:RED">* </span></c:if></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="etcBannerTitle[${idx}]" value="${item.areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="etcBannerArea[${idx}]" value="${item.areaNm}">
					    		<input type="hidden" name="etcBannerType[${idx}]" value="${item.areaType}">
					    		<input type="hidden" name="etcExistingImg[${idx}]" <c:if test="${not empty item.areaImgUrl}">value="${item.areaImgUrl}|${item.fileSeq}"</c:if>/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">
								배너 이미지 <br/>
								<c:choose>
									<c:when test="${idx <= 2}">
										(200 x 200px)
									</c:when>
									<c:otherwise>
										(124 x 121px)<span style="color:RED">* </span>
									</c:otherwise>
								</c:choose>
							</th>
							<td class="line" colspan="3">
								<c:choose>
									<c:when test="${(idx >= 0 and idx <= 2)}">
										<input type="file" name="etcBannerImg[${idx}]" id="bannerImg${idx + 1}" style="width: 400px;"/>
									</c:when>
									<c:otherwise>
										<input type="file" name="etcBannerImg[${idx}]" id="bannerImg${idx + 1}" style="width: 400px;" <c:if test="${empty item.areaImgUrl}">data-validation="required" data-validation-error-msg="배너 이미지 파일을 추가 해주세요."</c:if>/>
									</c:otherwise>
								</c:choose>
								<c:if test="${not empty item.areaImgUrl}">&nbsp;&nbsp;&nbsp;<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}" style="width: 25px; height: 25px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${item.areaImgUrl}')" onMouseOut="cutlayout()"></c:if>
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크<c:if test="${idx > 2}"><span style="color:RED">* </span></c:if></th>
					    	<td class="line" width="85%" colspan="3">
					    		<c:choose>
									<c:when test="${(idx >= 0 and idx <= 2)}">
										<input type="text" name="etcBannerLink[${idx}]" value="${item.areaLinkUrl}" style="width: 650px;"/>
									</c:when>
									<c:otherwise>
										<input type="text" name="etcBannerLink[${idx}]" value="${item.areaLinkUrl}" style="width: 650px;" data-validation="required" data-validation-error-msg="배너 링크 입력 해주세요."/>
									</c:otherwise>
								</c:choose>
					    	</td>
						</tr>
						<!-- 
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">게재기간</th>
						    <td class="line" width="35%" >
								<input type="text" name="etcBannerRegSt[${idx}]" size="10" class="date_timepicker_from dtf${idx + 1 + fn:length(itemMap.grpA) + fn:length(itemMap.grpC) + fn:length(itemMap.grpE)}" value=""/>
								<img class="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="etcBannerRegEd[${idx}]" size="10" class="date_timepicker_to dtt${idx + 1 + fn:length(itemMap.grpA) + fn:length(itemMap.grpC) + fn:length(itemMap.grpE)}" value=""/>
								<img class="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출여부</th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="radio" name="etcBannerExposure[${idx}]" value="on" data-validation="required"/>노출&nbsp;&nbsp;
					    		<input type="radio" name="etcBannerExposure[${idx}]" value="off" checked="checked"/>비노출
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
					    	<td class="line" width="85%" colspan="3">
					    		<select name="etcBannerPriority[${idx}]" value="">
					    			<option value="0">1</option>
					    			<option value="1">2</option>
					    			<option value="2">3</option>
					    			<option value="3">4</option>
					    			<option value="4">5</option>
					    			<option value="5">6</option>
					    		</select>
					    	</td>
						</tr>
						-->
					</table>
				</td>
			</tr>
			<c:set value="${idx + 1}" var="idx"/>
			</c:forEach>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">항목타이틀<span style="color:RED">* </span></th>
					    	<td class="line" width="85%" colspan="3">
					    		<input type="text" name="etcContentsTitle" value="${itemMap.grpG[9].areaText}" style="width: 650px;"/>
					    		<input type="hidden" name="etcContentsArea" value="G-10">
					    		<input type="hidden" name="etcContentsType" value="S">
					    	</td>
						</tr>
					</table>
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
								    		<button id="viewBtn" style="height:30px; width:100px;" type="button">미리보기</button>
								    		<button id="insertBtn" style="height:30px; width:100px; margin-left: 50px;" type="button">등록완료</button>
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
</table>
		</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
<table cellpadding="0" cellspacing="0" border="0" width="95%"  >
<tr>
	<td height="30px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr align="left" height="30px">
		    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">레이아웃을 선택해주세요.</th>
		    	<td class="line" width="85%" colspan="3">
					<select name="selectPageType" id="selectPageType" value="">
						<option value="">선택해주세요</option>
						<c:forEach var="pageType" items="${pageTypeList}">
			   			<option value="${pageType.pageTypeSeq}">${pageType.pageTypeNm}(${pageType.pageTypeSeq})</option>
			   			</c:forEach>
			   		</select>&nbsp;&nbsp;
			   		<input type="button" value="레이아웃 추가" onclick="javascript:addLayout();">
		    	</td>
			</tr>
		</table>
	</td>
</tr>
</table>
	</c:otherwise>
</c:choose>
</form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>