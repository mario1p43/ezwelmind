<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상품등록(온라인심리검사)</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors1 = [];
var oEditors2 = [];
j$(document).ready(function(){
	String.prototype.trim = function()
	 {
	   return this.replace(/^\s+|\s+$/g, "");
	 }
	
	$("[name='goodsCate1']").change(function() {
		//초기화 시작
		$("select[name='goodsCate2'] option").remove();
		
		$("[name='goodsCate2']").append("<option value=''>분류2</option>");
		
		//초기화 완료
		if ($(this).val() != "" && $(this).val() != null) {
			$.ajax({
				url: "/madm/service/enrollment/getCate2?highCommCd=" + $(this).val(),
				dataType: 'json',
				success: function (response) {
					var iter = response.list;
					var element = "";
					for (var i = 0; i < iter.length; i++) {
						element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
					}

					if (element != "") {
						$("[name='goodsCate2']").append(element);
					}
				}
			});
		}
	});
	
	$.validate({
		form : '#onlinementalform',
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
		//nhn smart editor check
		oEditors1.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var checkVal = "<P>&nbsp;</P>";
		var tempVal1 = j$("#ir1").text().trim();
		var tempVal2 = j$("#ir2").text().trim();
		
		if(checkVal == tempVal1){
			alert("검사소개 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal2){
			alert("취소/환불 규정 내용을 입력하세요");
			return false;
		}
		
		//file check		
		var f1 =   document.getElementById("file1").value;
		var f2 =   document.getElementById("file2").value;
		if(f1 != "" || f2 != ""){
			j$("#fnum").val("1");	
		}
		
		//select option check
		var cate1 = $("select[name=goodsCate1]").val();
		if(cate1 == ""){
			alert("검사분류 값을 선택하세요.");
			return
		}
		
		var cate2 = $("select[name=goodsCate2]").val();
		if(cate2 == ""){
			alert("검사분류 값을 선택하세요.");
			return
		}
		
		var status = $("select[name=goodsStatus]").val();
		if(status == ""){
			alert("승인유무 값을 선택하세요.");
			return
		}
		
		j$("#onlinementalform").submit();
	});
	
	//미리보기
	//2015.09.04 보류
	j$("#viewBtn").click(function(){
		alert("개발중입니다.");
		//j$("#onlinementalform").attr("target","view");
		//j$("#onlinementalform").attr("action","/madm/service/enrollment/onlinementalview");
		//j$("#onlinementalform").submit();
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
					sale = buy + ((buy * dis) / 100);
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
				if(sale < buy){
					$('#goodsSalePrice').val("");
					alert("입력하신 판매가가 매입가보다 작습니다.");
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
	window.open("/madm/service/enrollment/cspPopup?Oform=omental", "cspPopup", "width=600, height=400,  scrollbars=1");
}

function getDiagnosisPopup() {
	window.open("/madm/service/enrollment/diagnosisPopup", "diagnosisPopup", "width=600, height=400,  scrollbars=1");
}

function changeLink(val) {
	if (val == "1")	 {
		$("#goodsLinkBtn").show();
		$("[name=goodsLink]").val("");
		$("[name=goodsLink]").attr("readonly", true);
	} else if (val == "2") {
		$("#goodsLinkBtn").hide();
		$("[name=goodsLink]").val("");
		$("[name=goodsLink]").removeAttr("readonly");
	}
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
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors2,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
});
</script>
</head>
<body>
<form id="onlinementalform" name="onlinementalform" action="/madm/service/enrollment/insertonlinemental" method="POST" enctype="multipart/form-data">
<input type="hidden" name="fnum" id="fnum" value="0" >
<input type="hidden" name="cspCd" id="cspCd" >

<table cellpadding="0" cellspacing="0" border="0" width="95%"  >
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">상품등록(온라인심리검사)</td>
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
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">현금영수증여부</th>
				    	<td class="line" width="35%">
				    		<input  type="radio" name="receiptYn" value="Y" data-validation="required" data-validation-error-msg="현금영수증여부를 선택 해주세요."> 발행
				    		<input  type="radio" name="receiptYn" value="N" > 미발행(현장발행)
				    	</td>
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">면세유무</th>
				    	<td class="line" width="35%" >
				    		<input  type="radio" name="dutyYn" value="Y" data-validation="required" data-validation-error-msg="면세유무를 선택 해주세요." > 과세
				    		<input  type="radio" name="dutyYn" value="N" > 면세
				    	</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 검사 기본정보</h3></td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">검사분류</th>
				    	<td class="line" width="85%" colspan="3">
				    		<comm:select name="goodsCate1" code="100784"  basicValue="전체" selectValue="" />
				    		<select name="goodsCate2" >
				    			<option>분류2</option>
				    		</select>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">검사명</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsNm" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="검사명을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">요약설명</th>
						<td class="line" colspan="3">
							<textarea rows="5" cols="10" name="goodsDes" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="요약설명을 확인 해주세요."></textarea>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">추천대상</th>
						<td class="line" colspan="3">
							<textarea rows="5" cols="10" name="goodsIntroduce" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="추천대상을 확인 해주세요."></textarea>
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">검사문항 수</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsTotItem" value="" style="width: 70px;" class="onlyNumber" data-validation="required" data-validation-error-msg="검사문항 수를 확인 해주세요."/>
							※ 숫자만 입력하세요
						</td>
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">예상 검사시간</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsTotEdu" value="" style="width: 70px;" class="onlyNumber" data-validation="required" data-validation-error-msg="예상 검사시간을 확인 해주세요."/>
							※ 분 단위로 숫자만 입력하세요
						</td>
					</tr>					
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">검사소개</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir1" name="goodsContent" style="width:100%; height:100px;" ></textarea>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">결과표(샘플)</th>
				    	<td class="line" colspan="3">
				    		<input type="file" name="file1" id="file1" style="width: 400px;" data-validation="required" data-validation-error-msg="결과표(샘플)을 추가 해주세요."/>&nbsp;
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">썸네일(상세)</th>
				    	<td class="line" colspan="3">
				    		<input type="file" name="file2" id="file2" style="width: 400px;" data-validation="required" data-validation-error-msg="썸네일(상세)를 추가 해주세요."/>&nbsp;
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">승인유무</th>
				    	<td class="line" colspan="3">
				    		<comm:select name="goodsStatus" code="100800"  basicValue="전체" selectValue="" />
				    	</td>
					</tr>
				</table>		
				</td>
			</tr>



			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 검사 추가 정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">저자</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsAuth" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">검사대상</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsTarget" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">실시방법</th>
				    	<td class="line">
				    		<input type="text" name="goodsAddInfo1" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
				    	<th class="line" align="center" bgcolor="#F5F5F5">검사기간</th>
				    	<td class="line">
				    		결제 후
				    		<input type="text" name="goodsUsePeriod" value="" style="width: 150px;" class="onlyNumber"  data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    		일 까지 가능
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">강사소개</th>
				    	<td class="line">
				    		<input type="text" name="goodsAddInfo2" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
				    	<th class="line" align="center" bgcolor="#F5F5F5">검사URL</th>
				    	<td class="line">
				    		<select onChange="changeLink(this.value);">
				    			<option value="1">자체</option>
				    			<option value="2">외부</option>
				    		</select>
				    		<input type="text" name="goodsLink" readonly value="" style="width: 200px;" data-validation="required" data-validation-error-msg="검사URL을 입력해주세요."/>
				    		<input type="button" id="goodsLinkBtn" value="찾아보기" onclick="javascript:getDiagnosisPopup();" >
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 취소/환불 규정</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5" width="120px" >취소/환불 규정</th>
				    	<td class="line" width="85%" > 
				    		<textarea rows="5" cols="10" id="ir2" name="goodsCancelRefund" style="width:100%; height:100px;"></textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 가격정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">가격</th>
				    	<td class="line" width="85%" colspan="3">
				    		정상가
				    		<input type="text" name="goodsNormalPrice" value="" maxlength="10" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="정상가를 확인 해주세요."/>
				    		매입가
				    		<input type="text" id="goodsBuyPrice" name="goodsBuyPrice" value="" maxlength="10" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="매입가를 확인 해주세요."/>
				    		*<input type="text" id="goodsDisRate" name="goodsDisRate" value="" onchange="autoCal('dis');" maxlength="4" style="width: 100px;" data-validation="required" data-validation-error-msg="매입가를  확인 해주세요."/>
				    		%
				    		판매가
				    		<input type="text" id="goodsSalePrice" name="goodsSalePrice" value="" onchange="autoCal('sale');" maxlength="10" style="width: 150px;" data-validation="required" data-validation-error-msg="판매가를 확인 해주세요."/>
				    		<input type="checkbox" name="goodsPayYn" value='Y'>신청형
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
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">업체명</th>
						<td width="85%" >
				    		<input type="text" name="cspNm" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="업체명을 확인 해주세요."/>
				    		<input type="button" value="찾아보기" onclick="javascript:getcspPopup();" >
				    	</td>
					</tr>
				</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
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
</form>


</body>
</html>