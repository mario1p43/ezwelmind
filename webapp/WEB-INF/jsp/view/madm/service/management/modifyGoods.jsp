<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>등록상품(배송상품)</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var FORM_ID = "goodsform";
var numTable = 0;
var numRow = 0;
var oEditors1 = [];
var oEditors2 = [];
var oEditors3 = [];
var goodsCd = ${goods.goodsCd};
j$(document).ready(function(){
	j$("#extraOp").hide();
	
	
	
	
	var optionCh = '${goodsOptionGrp[0].grpNm}';
	if(optionCh == ""){
		$('#extraOption1').attr("checked", false);
		$('#extraOption2').attr("checked", true);
		j$("#extraOp").hide();
	}else{
		$('#extraOption1').attr("checked", true);
		$('#extraOption2').attr("checked", false);
		j$("#extraOp").show();
	}
	
	//공정위 카테고리
	var cdSet = ${goodsGrpInfo[0].cdSet};
	selMngLayout(cdSet);
	
	if('N' == '${goodsSub.dlvrPriceYn}'){
		$('#dlvrPrice').attr("data-validation", "required");
		$('#dlvrPrice').attr("data-validation-error-msg", "배송비를 확인해주세요.");
	}

	/////////////////////////
	var params = {};
	params.goodsCd = ${goods.goodsCd};
	
	
	j$.ajax({
		url: '/madm/service/management/ajaxOptionGrp',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		async : true,
		success: function(data, textStatus){
			
			j$.each(data.aOptionGrp, function(i, aOptionGrp){
				addOptionRow(addOption);
				var is = i+1;
				$('[name=grpNm_'+is+']').val(aOptionGrp.grpNm);
				if(aOptionGrp.useYn == 'Y'){
					$('[name=useYn_'+is+']').attr('checked',true);
				}
				if(aOptionGrp.selectYn == 'Y'){
					$('[name=selectYn_'+is+']').attr('checked',true);
				}
				
				
				var ch = 1;
				j$.each(data.aItemCount, function(j, aItemCount){
					
					if(aOptionGrp.grpCd == aItemCount.grpCd){
						var c = j+1;
						if(ch == 1){
							$('#rItemNm_'+c).val(aItemCount.itemNm);
							$('#rItemBuyPrice_'+c).val(aItemCount.itemBuyPrice);
							$('#rItemSalePrice_'+c).val(aItemCount.itemSalePrice);
						}
						else{
							addDetailRowBegin("addDetail"+numTable,numTable);
							$('#rItemNm_'+c).val(aItemCount.itemNm);
							$('#rItemBuyPrice_'+c).val(aItemCount.itemBuyPrice);
							$('#rItemSalePrice_'+c).val(aItemCount.itemSalePrice);
						}	
						ch++;
					}
						
				});
			
				
			});
		}
	});
	
	
	
	
///////////////////////////////////////////////

	//등록하기
	j$("#updateBtn").click(function(){
		$('#goodsCd').val(goodsCd);
		size1 = document.getElementsByName("requiredCheckYn").length;
		for(var i = 0; i < size1; i++) {
			if(document.getElementsByName("requiredCheckYn")[i].checked) {
				if(document.getElementsByName("requiredCheckYn")[i].value == 'N'){
					$('#requiredCheckContent').val(null);
					 $('#requiredCheckContent').removeAttr("data-validation");
				}else{
					$('#requiredCheckContent').attr("data-validation", "required");
				}
			}
		}
		size2 = document.getElementsByName("requiredInputYn").length;
		for(var i = 0; i < size2; i++) {
			if(document.getElementsByName("requiredInputYn")[i].checked) {
				if(document.getElementsByName("requiredInputYn")[i].value == 'N'){
					$('#requiredInputContent').val(null);
					$('#requiredInputContent').removeAttr("data-validation");
				}else{
					$('#requiredInputContent').attr("data-validation", "required");
				}
			}
		}
		
		size3 = document.getElementsByName("optionType").length;
		for(var i = 0; i < size3; i++) {
			if(document.getElementsByName("optionType")[i].checked) {
				var optionYn = document.getElementsByName("optionType")[i].value;
				$('#optionYn').val(optionYn);
			}
		}
		
		
		
		$.validate({
			form : '#goodsform',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
				//alert('모든 필수 정보가 입력이 되었습니다.');
			}
			
		});
		
		
		oEditors1.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);
		oEditors3.getById["ir3"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var checkVal = "<P>&nbsp;</P>";
		var tempVal1 = j$("#ir1").text().trim();
		var tempVal2 = j$("#ir2").text().trim();
		var tempVal3 = j$("#ir3").text().trim();
		
		if(checkVal == tempVal1){
			alert("상품 상세설명 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal2){
			alert("배송 안내 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal3){
			alert("교환/환불/반품/취소 규정 내용을 입력하세요");
			return false;
		}
		
		
		var f1 =   document.getElementById("file1").value;
		var f2 =   document.getElementById("file2").value;
		var f3 =   document.getElementById("file3").value;
		if(f1 != "" || f2 != "" || f3 != ""){
			j$("#fnum").val("1");	
		}
		
		var status = $("select[name=goodsStatus]").val();
		if(status == ""){
			alert("승인유무 값을 선택하세요.");
			return
		}
		var goodsPayYn = ( $("input[name=goodsPayYn]").is(":checked")?"Y":"N") ;
		$('#payYn').val(goodsPayYn);
		var grpNm ="";
		var fullGrpNm ="";
		var itemNm= "";
		var fullItemNm = "";
		var itemSalePrice ="";
		var fullItemSalePrice ="";
		var itemBuyPrice = "";
		var fullItemBuyPrice = "";
		var useYn = "";
		var fullUseYn = "";
		var selectYn = "";
		var fullSelectYn = "";
		for(var i = 1; i<= numTable; i++){

			useYn = ( $("input[name=useYn_"+i+"]").is(":checked")?"Y":"N") ;
			selectYn = ( $("input[name=selectYn_"+i+"]").is(":checked")?"Y":"N") ; 
			
			grpNm += document.goodsform.elements["grpNm_"+i].value;
			//var len = (document.goodsform.elements["itemNm_"+i].length == undefined ? 1 :document.goodsform.elements["itemNm_"+i].length);
			if(document.goodsform.elements["itemNm_"+i].length > 0){
				for(var j=0; j < document.goodsform.elements["itemNm_"+i].length; j++ ){
					itemNm += document.goodsform.elements["itemNm_"+i][j].value+",";
					itemSalePrice += document.goodsform.elements["itemSalePrice_"+i][j].value+",";
					itemBuyPrice += document.goodsform.elements["itemBuyPrice_"+i][j].value+",";
				}
			}else{
				itemNm += document.goodsform.elements["itemNm_"+i].value+",";
				itemSalePrice += document.goodsform.elements["itemSalePrice_"+i].value+",";
				itemBuyPrice += document.goodsform.elements["itemBuyPrice_"+i].value+",";
			}
			
			
			fullItemNm += itemNm+":";
			fullItemSalePrice += itemSalePrice+":";
			fullItemBuyPrice += itemBuyPrice+":";
			fullGrpNm += grpNm+":";
			fullUseYn += useYn+":";
			fullSelectYn += selectYn+":";
			grpNm = "";
			useYn = "";
			selectYn = "";
			itemNm = "";
			itemSalePrice = "";
			itemBuyPrice = "";
		}
		$('#fullItemNm').val(fullItemNm);
		$('#fullItemSalePrice').val(fullItemSalePrice);
		$('#fullItemBuyPrice').val(fullItemBuyPrice);
		$('#fullGrpNm').val(fullGrpNm);
		$('#fullUseYn').val(fullUseYn);
		$('#fullSelectYn').val(fullSelectYn);
		
		
		


		
		j$("#goodsform").submit();
	});
	
	j$("#cancelBtn").click(function(){
		location.href = "/madm/service/management/adddelaygoods";
	});
	
	//미리보기
	//2015.09.04 보류
	j$("#viewBtn").click(function(){
		alert("개발중입니다");
		//j$("#goodsform").attr("target","view");
		//j$("#goodsform").attr("action","/madm/service/enrollment/onlinegoodsview");
		//j$("#goodsform").submit();
	});
	
	
	
	j$(".extraOption").change(function() {
		 var tempVal = j$(this).val();
		 if(tempVal == 'Y'){
			 j$("#extraOp").show();
		 }else{
			 j$("#extraOp").hide();
			 
			 for(var i = numTable; i>0; i--){
			 addOption.deleteRow(i)
			 }
			 
			 numTable = 0;
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

function getcspPopup() {
	window.open("/madm/service/enrollment/cspPopup?Oform=goods", "cspPopup", "width=600, height=400,  scrollbars=1");
}

function addDetailRowBegin(e, n){
	//table ID를 객체로 받기
	var temp = document.getElementById(e);
	var num  = $("#addDetail"+n+" tr").size();
	numRow++;
	var strData = "";
	var nameValue = document.getElementById("grpNm_"+numTable).value;
	var oRow =  temp.insertRow(num);
	var oCel = oRow.insertCell();
	
	strData = "&nbsp;<input type='hidden' name='grpNm' valus='"+nameValue+"'> <input type='text' name='itemNm_"+n+"' id='rItemNm_"+numRow+"' style='width: 15%; margin-left: 20%;' data-validation='required' data-validation-error-msg='상세옵션을 확인해 주세요'>&nbsp;<input type='number' name='itemSalePrice_"+n+"' id='rItemSalePrice_"+numRow+"' style='width: 15%; margin-left: 4%;' data-validation='required' data-validation-error-msg='옵션판매가를 확인해 주세요'> 원&nbsp;<input type='number' name='itemBuyPrice_"+n+"' id='rItemBuyPrice_"+numRow+"' style='width: 15%; margin-left: 4%;' data-validation='required' data-validation-error-msg='옵션매입가를 확인해 주세요'> 원";
	
	oCel.innerHTML = strData;
}

function addDetailRow(e, n){
	//table ID를 객체로 받기
	var num  = $("#addDetail"+n+" tr").size();
	numRow++;
	var strData = "";
	var nameValue = document.getElementById("grpNm_"+numTable).value;
	var oRow =  e.insertRow(num);
	var oCel = oRow.insertCell();
	
	strData = "&nbsp;<input type='hidden' name='grpNm' valus='"+nameValue+"'> <input type='text' name='itemNm_"+n+"' id='rItemNm_"+numRow+"' style='width: 15%; margin-left: 20%;' data-validation='required' data-validation-error-msg='상세옵션을 확인해 주세요'>&nbsp;<input type='number' name='itemSalePrice_"+n+"' id='rItemSalePrice_"+numRow+"' style='width: 15%; margin-left: 4%;' data-validation='required' data-validation-error-msg='옵션판매가를 확인해 주세요'> 원&nbsp;<input type='number' name='itemBuyPrice_"+n+"' id='rItemBuyPrice_"+numRow+"' style='width: 15%; margin-left: 4%;' data-validation='required' data-validation-error-msg='옵션매입가를 확인해 주세요'> 원";
	
	oCel.innerHTML = strData;
}


 
function addOptionRow(e){

	var strData = "";

	numTable++;
	numRow++;
	var oRow = e.insertRow(numTable);
	var oCel = oRow.insertCell();
	
	strData = "<table id='addDetail"+numTable+"'  width='100%'><tr><td>";
	strData += "<input type='text' style='width: 15%' name='grpNm_"+numTable+"' id='grpNm_"+numTable+"' data-validation='required' data-validation-error-msg='옵션사항명을 확인해 주세요' >";
	strData += "&nbsp;<input type='text' style='width: 15%; margin-left: 5%;' name='itemNm_"+numTable+"' id='rItemNm_"+numRow+"' data-validation='required' data-validation-error-msg='상세옵션을 확인해 주세요'     >";
	strData += "&nbsp;<input type='number' style='width: 15%; margin-left: 4%;' name='itemSalePrice_"+numTable+"' id='rItemSalePrice_"+numRow+"' data-validation='required' data-validation-error-msg='옵션판매가를 확인해 주세요'> 원";
	strData += "&nbsp;<input type='number' style='width: 15%; margin-left: 4%;' name='itemBuyPrice_"+numTable+"' id='rItemBuyPrice_"+numRow+"' data-validation='required' data-validation-error-msg='옵션매입가를 확인해 주세요'> 원";
	strData += "&nbsp;<input type='button' value='+ 추가' onclick='addDetailRow(addDetail"+numTable+","+numTable+");' style='width: 15%; margin-left: 4%;'><br> <input name='selectYn_"+numTable+"' type='checkbox' valus ='Y' >선택필수 <input name='useYn_"+numTable+"' type='checkbox' valus='Y'> 사용여부"; 
	strData +=	"</td></tr></table>";
	
	
	
	oCel.innerHTML = strData;
}

j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors1,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
  		 },
	    fCreator: "createSEditor2"
	});
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors2,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
  		 },
	    fCreator: "createSEditor2"
	});
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors3,
	    elPlaceHolder: "ir3",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
  		 },
	    fCreator: "createSEditor2"
	});
}); 


function selMngLayout(tValue) {
	var layoutNum = 0;
    var params = {};
    var strData = "";
    var goodsGrpCd = "";
    var count = 0;
    params.tValue = tValue;
    params.goodsCd = goodsCd;
    j$.ajax({
		url: '/madm/service/enrollment/ajaxGrpInfo',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			j$.each(data.grpList, function(i, grpList){
				layoutNum++;
				if(tValue ==  ${goodsGrpInfo[0].cdSet}){
					strData += "<tr>"
					strData += "<th class='line' width='15%' align='left' bgcolor='#F5F5F5'>"+grpList.title+"</th><input type='hidden' name='layoutSeqArr' value='"+grpList.layoutSeq+"'>";
					strData += "<td class='line' colspan='3'><textarea rows='5' cols='10' name='grpInfoGoodsDescArr' id='desc_"+i+"' style='width:100%; height:100px;' data-validation='required' data-validation-error-msg='공정위 카테고리를 확인해 주세요'></textarea></td>";
					strData += "</tr>"
				}else{
					strData += "<tr>"
					strData += "<th class='line' width='15%' align='left' bgcolor='#F5F5F5'>"+grpList.title+"</th><input type='hidden' name='layoutSeqArr' value='"+grpList.layoutSeq+"'>";
					strData += "<td class='line' colspan='3'><textarea rows='5' cols='10' name='grpInfoGoodsDescArr'  style='width:100%; height:100px;' data-validation='required' data-validation-error-msg='공정위 카테고리를 확인해 주세요'></textarea></td>";
					strData += "</tr>"
				}
				
			$("#categoryContent").empty();
			$("#categoryContent").append(strData);
				goodsGrpCd = grpList.goodsGrpCd;
				
			
				
			});
			//grpInfo
			j$.each(data.grpInfo, function(i, grpInfo){
				$('#desc_'+i).val(grpInfo.goodsDesc);
			});
			$('#goodsGrpCd').val(goodsGrpCd);
			$('#layoutNum').val(layoutNum);
		}
	});

}

function priceYn(pValue){
	if("Y" == pValue){
		$('#dlvrPrice').removeAttr("data-validation");
		$('#dlvrPrice').val(null);
	}else if("N" == pValue){
		$('#dlvrPrice').attr("data-validation", "required");
		$('#dlvrPrice').attr("data-validation-error-msg", "배송비를 확인해주세요.");
	}
}

function proPricePopup(){
	window.open("/madm/service/management/proPricePopup?goodsCd="+goodsCd, "cspPopup", "width=600, height=400,  scrollbars=1");
}

</script>
</head>
<body>
<form id="goodsform" name="goodsform" action="/madm/service/enrollment/updateGoods" method="POST" enctype="multipart/form-data">
<input type="hidden" name="fnum" id="fnum" value="0" >
<input type="hidden" name="cspCd" id="cspCd"  value="${goods.cspCd}">
<input type="hidden" name="layoutNum" id="layoutNum" >
<input type="hidden" name="goodsGrpCd" id="goodsGrpCd" >
<input type="hidden" name="fullUseYn" id="fullUseYn">
<input type="hidden" name="fullSelectYn" id="fullSelectYn">
<input type="hidden" name="fullItemNm" id="fullItemNm">
<input type="hidden" name="fullItemSalePrice" id="fullItemSalePrice">
<input type="hidden" name="fullItemBuyPrice" id="fullItemBuyPrice">
<input type="hidden" name="fullGrpNm" id="fullGrpNm">
<input type="hidden" name="optionYn" id="optionYn">
<input type="hidden" name="goodsCd" id="goodsCd">
<input type="hidden" name="payYn" id="payYn">



<table cellpadding="0" cellspacing="0" border="0" width="100%" >
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
					    	<td align="left" class="subtitle">등록<c:if test="${goods.goodsStatus ne '100804'}">대기</c:if>상품(배송상품)</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 판매유형</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">현금영수증여부</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="receiptYn" value="Y" ${goods.receiptYn == 'Y'  ? 'checked':''} data-validation="required" data-validation-error-msg="현금영수증여부를 선택 해주세요."> 발행
				    		<input  type="radio" name="receiptYn" value="N" ${goods.receiptYn == 'N'  ? 'checked':''}> 미발행(현장발행)
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">면세유무</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="dutyYn" value="Y"  ${goods.dutyYn == 'Y'  ? 'checked':''} data-validation="required" data-validation-error-msg="면세유무를 선택 해주세요." > 과세
				    		<input  type="radio" name="dutyYn" value="N"  ${goods.dutyYn == 'N'  ? 'checked':''}> 면세
				    	</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 상품 정보</h3></td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left"  bgcolor="#F5F5F5">상품명</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsNm" value="${goods.goodsNm}" style="width: 650px;" data-validation="required" data-validation-error-msg="상품명을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">검색키워드</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsSearch" value="${goodsSub.goodsSearch}" style="width: 650px;" data-validation="required" data-validation-error-msg="검색키워드를 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">브랜드명</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsBrand"  style="width: 250px;" value="${goodsSub.goodsBrand}" />
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">모델명</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsModel" style="width: 250px;" value="${goodsSub.goodsModel}" />
				    	</td>
					</tr>
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">제조사</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsManu" style="width: 250px;" value="${goodsSub.goodsManu}" />
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">원산지</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsOrigin" style="width: 250px;" value="${goodsSub.goodsOrigin}" />
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">연동상품키</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsLinkKey" style="width: 250px;" value="${goodsSub.goodsLinkKey}" />
				    	</td>
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">승인유무</th>
				    	<td class="line" width="35%" >
				    		<comm:select name="goodsStatus" code="100800" selectValue="${goods.goodsStatus}"/>
				    	</td>
					</tr>
				</table>		
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td><h3>* 공정위 카테고리 선택</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">카테고리 설정</th>
				    	<td class="line" colspan="3">
				    		<comm:select name="goodsGrpCdSet" code="100891" basicValue="-- 카테고리 선택 --" selectValue="${goodsGrpInfo[0].cdSet}" onchange="selMngLayout(this.value);"/>
				    	</td>
				    </tr>
				    <tbody id="categoryContent">
				    </tbody>
				</table>
				</td>
				
				
			</tr>
			
			<tr>
				<td height="20px">
				</td>
			</tr>
			
			<tr>
				<td><h3>* 가격정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">가격</th>
				    	<td class="line" colspan="3">
				    		정상가
				    		<input type="text" name="goodsNormalPrice" value="${goods.goodsNormalPrice}" style="width: 150px;" data-validation="required" data-validation-error-msg="정상가를 확인 해주세요."/>
				    		매입가
				    		<input type="text" id="goodsBuyPrice" name="goodsBuyPrice" value="${goods.goodsBuyPrice}" style="width: 150px;" data-validation="required" data-validation-error-msg="매입가를 확인 해주세요."/>
				    		* <input type="text" id="goodsDisRate" name="goodsDisRate" value="${goods.goodsDisRate}" style="width: 100px;" onchange="autoCal('dis');" data-validation="required" data-validation-error-msg="매입가를  확인 해주세요."/>
				    		%
				    		판매가
				    		<input type="text" id="goodsSalePrice" name="goodsSalePrice" value=" ${goods.goodsSalePrice}" style="width: 150px;" data-validation="required" data-validation-error-msg="판매가를 확인 해주세요."/>
				    		<input type="checkbox" name="goodsPayYn" value='Y'  ${goods.goodsPayYn == 'Y'  ? 'checked':''}>신청형
				    		<input type="button" onclick="javascript:proPricePopup();"  value="프로모션 가격 관리">
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td><h3>* 할인정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">할인액 공개 여부</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="dcAmtYn" value="Y" ${goodsSub.dcAmtYn == 'Y'  ? 'checked':''} data-validation="required"> 공개
				    		<input  type="radio" name="dcAmtYn" value="N" > 비공개
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">할인율 공개 여부</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="dcRateYn" value="Y" ${goodsSub.dcRateYn == 'Y'  ? 'checked':''} data-validation="required"> 공개
				    		<input  type="radio" name="dcRateYn" value="N" > 비공개
				    	</td>
				    </tr>
				</table>
				</td>
			</tr>
	
			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td><h3>* 추가옵션</h3></td>	
			</tr>
			<tr>
				<td>
				<table  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">추가옵션 선택</th>
				    	<td class="line" >
				    		<input  type="radio" name="optionType" class="extraOption" id="extraOption1" value="Y" > 추가옵션 사용함
				    		<input  type="radio" name="optionType" class="extraOption" id="extraOption2" value="N" > 추가옵션 사용 안함
				    		<br><br>* 같은 상품이라도 소비자가 고를 수 있는 여러 가지 추가 옵션을 사용할 수 있습니다.
				    		<br>* 추가적인 상품으로 판매할 수 있도록 합니다.
				    		<br><strong>* 미 기입 시 해당 값 무효처리</strong>
				    	</td>
				    </tr>
				    <tr id="extraOp">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">옵션상품</th>
				    	<td>
				    		<table cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
								<tr>
									<td width="20%">옵션사항명</td><td width="20%">상세옵션</td><td width="20%">옵션판매가</td><td width="20%">옵션매입가</td><td width="20%">상세추가</td>
								</tr>				    		
				    			<tr height="30px" >
				    				<td colspan="5">
				    					<table id="addOption" width="100%">
				    					<tr>
				    					<td>
				    					</td>
				    					</tr>
				    					</table>
				    				</td>
				    				
				    			</tr>
				    		
				    		</table>
				    		<input type="button" onclick="addOptionRow(addOption);"  value="+ 추가">
				    	</td>
				    </tr>
				    
				</table>
				</td>
			</tr>
			
			
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 희망배송일(이용일)</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">희망배송일 설정</th>
				    	<td class="line" colspan="3">
				    		<input  type="radio" name="goodsHopeDlvrYn" value="Y" ${goodsSub.goodsHopeDlvrYn == 'Y'  ? 'checked':''}> 사용
				    		<input  type="radio" name="goodsHopeDlvrYn" value="N" ${goodsSub.goodsHopeDlvrYn == 'N'  ? 'checked':''}> 미사용
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 상품 이미지 등록</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
				    <tr>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">확대 이미지(500X500)</th>
				    	<td class="line" >
				    		<input type="file" style="width: 400px;" name="file_1" id="file1"   />
				    		<br><br><img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${goods.filePath500}" style="width: 500px; height: 500px;"	>
				    	</td>
				    </tr>
				    <tr>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">상세 이미지(300X300)</th>
				    	<td class="line" >
				    		<input type="file" style="width: 400px;" name="file_2" id="file2"  />
				    		<br><br><img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${goods.filePath300}" style="width: 300px; height: 300px;"	>
				    	</td>
				    </tr>
				    <tr>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">리스트 이미지(125X125)</th>
				    	<td class="line" >
				    		<input type="file" style="width: 400px;" name="file_3" id="file3"  />
				    		<br><br><img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${goods.filePath125}" style="width: 125px; height: 125px;"	>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 필수확인사항</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">사용여부</th>
				    	<td class="line" >
				    		<input  type="radio" name="requiredCheckYn" value="Y" ${goodsSub.requiredCheckYn == 'Y'  ? 'checked':''}> 사용
				    		<input  type="radio" name="requiredCheckYn" value="N" ${goodsSub.requiredCheckYn == 'N'  ? 'checked':''}> 미사용
				    	</td>
				    </tr>
				    <tr>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">내용</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" id="requiredCheckContent" name="requiredCheckContent" style="width:100%; height:100px;">${goodsSub.requiredCheckContent }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 필수입력사항</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">사용여부</th>
				    	<td class="line" >
				    		<input  type="radio" name="requiredInputYn" value="Y" ${goodsSub.requiredInputYn == 'Y'  ? 'checked':''}> 사용
				    		<input  type="radio" name="requiredInputYn" value="N" ${goodsSub.requiredInputYn == 'N'  ? 'checked':''}> 미사용
				    	</td>
				    </tr>
				    <tr>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">내용</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" name="requiredInputContent" id="requiredInputContent" style="width:100%; height:100px;">${goodsSub.requiredInputContent }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 상품 상세설명</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">상품 상세설명</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" id="ir1" name="goodsDesc" style="width:100%; height:100px;" >${goodsSub.goodsDesc }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 배송 안내</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">배송 안내</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" id="ir2" name="goodsDlvr" style="width:100%; height:100px;" >${goodsSub.goodsDlvr }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 교환/환불/반품/취소 규정</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">교환/환불/반품/취소 규정</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" id="ir3" name="goodsSubGoodsCancelRefund" style="width:100%; height:100px;" >${goodsSub.goodsCancelRefund }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 배송 정보 [배송비 별도로 적용 시 입력]</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">배송정보 설정[배송비 별도로 적용 시 입력]</th>
				    	<td class="line" >
				    		<input  type="radio" name="dlvrPriceYn"  onclick="priceYn(this.value);" value="Y" ${goodsSub.dlvrPriceYn == 'Y'  ? 'checked':''}> 판매처부담
				    		<input  type="radio" name="dlvrPriceYn"  onclick="priceYn(this.value);" value="N" ${goodsSub.dlvrPriceYn == 'N'  ? 'checked':''}> 소비자부담
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">배송비</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="dlvrPrice" id="dlvrPrice" value="${goodsSub.dlvrPrice }" style="width: 150px;"  /> 원을 별도 적용
				    	</td>
					</tr>
				</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* CP업체</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">업체명</th>
						<td>
				    		<input type="text" name="cspNm" value="${goods.cspNm }" style="width: 150px;" readonly="readonly" data-validation="required" data-validation-error-msg="업체명을 확인 해주세요."/>
				    		<input type="button" value="찾아보기" onclick="javascript:getcspPopup();" >
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td>
											<c:choose>
												<c:when test="${goods.goodsStatus ne '100804'}">
										    		<button id="cancelBtn" style="height:30px; width:100px;" type="button">수정취소</button>
										    		<button id="updateBtn" style="height:30px; width:100px;" type="button">수정완료</button>
												</c:when>
												<c:otherwise>
										    		<button id="cancelBtn" style="height:30px; width:100px;" type="button">확인</button>
												</c:otherwise>
											</c:choose>
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
</form>




</body>
</html>