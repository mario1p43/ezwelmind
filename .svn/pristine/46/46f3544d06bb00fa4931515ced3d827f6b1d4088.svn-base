<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>등록대기상품(온라인심리검사)</title>
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
	j$("#updateBtn").click(function(){
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
	
	j$("#cancelBtn").click(function(){
		location.href = "/madm/service/management/adddelaygoods";
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
	window.open("/madm/service/enrollment/cspPopup?Oform=omental", "cspPopup", "width=600, height=400,  scrollbars=1");
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
<form id="onlinementalform" name="onlinementalform" action="/madm/service/enrollment/updateonlinemental" method="POST" enctype="multipart/form-data">
<input type="hidden" name="fnum" id="fnum" value="0" >
<input type="hidden" name="cspCd" id="cspCd" value="${vo.cspCd }">
<input type="hidden" name="goodsCd" id="goodsCd" value="${vo.goodsCd }">

<table cellpadding="0" cellspacing="0" border="0" width="100%"  >
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="95%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">등록대기상품(온라인심리검사)</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 판매유형</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">현금영수증여부</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="receiptYn" value="Y" ${vo.receiptYn == 'Y' ? 'checked':''} data-validation="required" data-validation-error-msg="현금영수증여부를 선택 해주세요."> 발행
				    		<input  type="radio" name="receiptYn" value="N" ${vo.receiptYn == 'N' ? 'checked':''} > 미발행(현장발행)
				    	</td>
				    	<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">면세유무</th>
				    	<td class="line" width="35%"  >
				    		<input  type="radio" name="dutyYn" value="Y" ${vo.dutyYn == 'Y' ? 'checked':''} data-validation="required" data-validation-error-msg="면세유무를 선택 해주세요." > 과세
				    		<input  type="radio" name="dutyYn" value="N" ${vo.dutyYn == 'N' ? 'checked':''} > 면세
				    	</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 검사 기본정보</td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">검사분류</th>
				    	<td class="line" colspan="3">
				    		<comm:select name="goodsCate1" code="100784"  basicValue="전체" selectValue="${vo.cate1 }" />
				    		<select name="goodsCate2" >
				    			<option>분류2</option>
				    			<c:if test="${vo.cate1 ne null}">
									<c:forEach var="list" items="${ catelist }">
										<option value="${list.commCd }" ${list.commCd == vo.cate2 ? 'selected':''}>${list.commNm}</option>
									</c:forEach>
								</c:if>
				    		</select>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">검사명</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsNm" value="${vo.goodsNm }" style="width: 150px;" data-validation="required" data-validation-error-msg="검사명을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">요약설명</th>
						<td class="line" colspan="3">
							<textarea rows="5" cols="10" name="goodsDes" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="요약설명을 확인 해주세요.">${vo.des }</textarea>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">추천대상</th>
						<td class="line" colspan="3">
							<textarea rows="5" cols="10" name="goodsIntroduce" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="추천대상을 확인 해주세요.">${vo.introduce }</textarea>
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">검사문항 수</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsTotItem" value="${vo.totItem }" style="width: 70px;" class="onlyNumber" data-validation="required" data-validation-error-msg="검사문항 수를 확인 해주세요."/>
							※ 숫자만 입력하세요
						</td>
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">예상 검사시간</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsTotEdu" value="${vo.totEdu }" style="width: 70px;" class="onlyNumber" data-validation="required" data-validation-error-msg="예상 검사시간을 확인 해주세요."/>
							※ 분 단위로 숫자만 입력하세요
						</td>
					</tr>					
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">검사소개</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir1" name="goodsContent" style="width:100%; height:100px;" >${vo.content }</textarea>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">결과표(샘플)</th>
				    	<td class="line" colspan="3">
				    		<input type="file" name="file1" id="file1" />
				    		<br><br><img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${vo.mainFilePath}" style="width: 500px; height: 500px;"	>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">썸네일(상세)</th>
				    	<td class="line" colspan="3">
				    		<input type="file" name="file2" id="file2" />
				    		<br><br><img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${vo.detailFilePath}" style="width: 500px; height: 500px;"	>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">승인유무</th>
				    	<td class="line" colspan="3">
				    		<comm:select name="goodsStatus" code="100800"  basicValue="전체" selectValue="${vo.goodsStatus }" />
				    	</td>
					</tr>
				</table>		
				</td>
			</tr>



			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 검사 추가 정보</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">저자</th>
				    	<td class="line" width="35%">
				    		<input type="text" name="goodsAuth" value="${vo.auth }" style="width: 150px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
				    	<th class="line" align="left" bgcolor="#F5F5F5">검사대상</th>
				    	<td class="line">
				    		<input type="text" name="goodsTarget" value="${vo.target }" style="width: 150px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">실시방법</th>
				    	<td class="line" width="35%">
				    		<input type="text" name="goodsAddInfo1" value="${vo.info1 }" style="width: 150px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
				    	<th class="line" align="left" bgcolor="#F5F5F5">검사기간</th>
				    	<td class="line">
				    		결제 후
				    		<input type="text" name="goodsUsePeriod" value="${vo.usePeriod }" style="width: 150px;" class="onlyNumber"  data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    		일 까지 가능
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">강사소개</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsAddInfo2" value="${vo.info2 }" style="width: 150px;" data-validation="required" data-validation-error-msg="내용을 확인 해주세요."/>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 취소/환불 규정</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5" width="120px" >취소/환불 규정</th>
				    	<td class="line" > 
				    		<textarea rows="5" cols="10" id="ir2" name="goodsCancelRefund" style="width:100%; height:100px;">${vo.cancelRefund }</textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 가격정보</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">가격</th>
				    	<td class="line" colspan="3">
				    		정상가
				    		<input type="text" name="goodsNormalPrice" value="${vo.normalPrice }" maxlength="10" style="width: 80px;" class="onlyNumber" data-validation="required" data-validation-error-msg="정상가를 확인 해주세요."/>
				    		매입가
				    		<input type="text" id="goodsBuyPrice" name="goodsBuyPrice" value="${vo.buyPrice }" maxlength="10" style="width: 80px;" class="onlyNumber" data-validation="required" data-validation-error-msg="매입가를 확인 해주세요."/>
				    		*<input type="text" id="goodsDisRate" name="goodsDisRate" value="${vo.disRate }" onchange="autoCal('dis');" maxlength="4" style="width: 30px;" data-validation="required" data-validation-error-msg="매입가를  확인 해주세요."/>
				    		%
				    		판매가
				    		<input type="text" id="goodsSalePrice" name="goodsSalePrice" value="${vo.salePrice }" onchange="autoCal('sale');" maxlength="10" style="width: 80px;" data-validation="required" data-validation-error-msg="판매가를 확인 해주세요."/>
				    		<input type="checkbox" name="goodsPayYn" value='Y' ${vo.payYn == 'Y' ? 'checked':''}>신청형
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<!-- <tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 가격 변동사항</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">1차 가격 변동</th>
				    	<td class="line" colspan="3">
				    		매입가
				    		<input type="text">
				    		판매가
				    		<input type="text">
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">2차 가격 변동</th>
				    	<td class="line" colspan="3">
				    		매입가
				    		<input type="text">
				    		판매가
				    		<input type="text">
				    	</td>
					</tr>
				</table>
				</td>
			</tr> -->


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* CP업체</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">업체명</th>
						<td>
				    		<input type="text" name="cspNm" value="${vo.cspNm }" style="width: 150px;" data-validation="required" data-validation-error-msg="업체명을 확인 해주세요."/>
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
												<c:when test="${vo.goodsStatus eq '100803'}">
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