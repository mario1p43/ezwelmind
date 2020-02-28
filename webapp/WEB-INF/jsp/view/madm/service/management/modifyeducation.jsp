<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>등록대기상품(집단교육)</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors1 = [];
var oEditors2 = [];
j$(document).ready(function(){
	String.prototype.trim = function()
	 {
	   return this.replace(/^\s+|\s+$/g, "");
	 }
	
	$.validate({
		form : '#educationform',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			//alert('모든 필수 정보가 입력이 되었습니다.');
		}
		
	});
	
	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});	
	
	j$('.date_timepicker_from1').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_to1').val()?j$('.date_timepicker_to1').val():false
			})
		},
		timepicker:false
	});

	j$("#fromDt1").click(function(){
		j$('.date_timepicker_from1').datetimepicker('show');
	});

	j$('.date_timepicker_to1').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_from1').val()?j$('.date_timepicker_from1').val():false
			})
		},
		timepicker:false
	});

	j$("#toDt1").click(function(){
		j$('.date_timepicker_to1').datetimepicker('show');
	});
	
	j$('.date_timepicker_from2').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_to2').val()?j$('.date_timepicker_to2').val():false
			})
		},
		timepicker:false
	});

	j$("#fromDt2").click(function(){
		j$('.date_timepicker_from2').datetimepicker('show');
	});

	j$('.date_timepicker_to2').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_from2').val()?j$('.date_timepicker_from2').val():false
			})
		},
		timepicker:false
	});

	j$("#toDt2").click(function(){
		j$('.date_timepicker_to2').datetimepicker('show');
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
			alert("교육내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal2){
			alert("취소/환불 규정 내용을 입력하세요");
			return false;
		}
		
		//file check
		var f1 =   document.getElementById("file1").value;
		var f2 =   document.getElementById("file2").value;
		if(f1 != "" && f2 != ""){
			j$("#fnum").val("1");	
		}
		
		//select option check
		var status = $("select[name=goodsStatus]").val();
		if(status == ""){
			alert("승인유무 값을 선택하세요.");
			return
		}
		j$("#educationform").submit();
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
	window.open("/madm/service/enrollment/cspPopup?Oform=edu", "cspPopup", "width=600, height=400,  scrollbars=1");
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
<form id="educationform" name="educationform" action="/madm/service/enrollment/updateeducation" method="POST" enctype="multipart/form-data">
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
					    	<td align="left" class="subtitle">등록대기상품(집단교육)</td>
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
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">현금영수증여부</th>
				    	<td class="line" width="35%" >
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
				<td>* 교육 정보</td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line"  width="15%" align="left" bgcolor="#F5F5F5">구분</th>
				    	<td class="line" colspan="3">
				    		<input  type="radio" name="goodsCate1" value="100749" ${vo.cate1 == '100749' ? 'checked':''} data-validation="required" data-validation-error-msg="구분을 선택 해주세요."> 특강
				    		<input  type="radio" name="goodsCate1" value="100750" ${vo.cate1 == '100750' ? 'checked':''} > 워크숍/캠프
				    		<input  type="radio" name="goodsCate1" value="100751" ${vo.cate1 == '100751' ? 'checked':''} > 공개강좌
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">제목</th>
				    	<td class="line" colspan="3">
				    		<input type="text" name="goodsNm" value="${vo.goodsNm }" style="width: 150px;" data-validation="required" data-validation-error-msg="제목을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">대상</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsTarget" value="${vo.target }" style="width: 150px;" data-validation="required" data-validation-error-msg="대상을 확인 해주세요."/>
						</td>
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">장소</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsRemark" value="${vo.remark }" style="width: 150px;" data-validation="required" data-validation-error-msg="장소를 확인 해주세요."/>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">교육일정</th>
						<td class="line" colspan="3">
							<input type="text" name="goodsSaleSt" size="10" class="date_timepicker_from1" value="${vo.saleSt }" data-validation="required" data-validation-error-msg="교육일정을 확인 해주세요." />
							<img id="fromDt1" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							<select name="saleStHour">
								<c:forEach var="time" begin="00" end="23">
									<c:choose>
										<c:when test="${time<10}" >
											<c:set var="ztime" value="0${time}"/>
											<option value="${ztime }" ${vo.saleStTime==ztime ? 'selected':'' } >${ztime}</option>
										</c:when>
										<c:otherwise>
											<option value="${time}" ${vo.saleStTime==time ? 'selected':'' } >${time}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select name="saleStMin">
								<c:forEach var="time" begin="00" end="50" step="10">
									<c:choose>
										<c:when test="${time<10}" >
											<c:set var="ztime" value="0${time}"/>
											<option value="${ztime}" ${vo.saleStMIN==ztime ? 'selected':'' } >${ztime}</option>
										</c:when>
										<c:otherwise>
											<option value="${time}" ${vo.saleStMIN==time ? 'selected':'' } >${time}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							&nbsp;~&nbsp;
							<input type="text" name="goodsSaleEd" size="10" class="date_timepicker_to1" value="${vo.saleEd }" data-validation="required" data-validation-error-msg="교육일정을 확인 해주세요." />
							<img id="toDt1" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							<select name="saleEdHour">
								<c:forEach var="time" begin="00" end="23">
									<c:choose>
										<c:when test="${time<10}" >
											<c:set var="ztime" value="0${time}"/>
											<option value="${ztime}" ${vo.saleEdTime==ztime ? 'selected':'' } >${ztime}</option>
										</c:when>
										<c:otherwise>
											<option value="${time}" ${vo.saleEdTime==time ? 'selected':'' } >${time}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select name="saleEdMin">
								<c:forEach var="time" begin="00" end="50" step="10">
									<c:choose>
										<c:when test="${time<10}" >
											<c:set var="ztime" value="0${time}"/>
											<option value="${ztime}" ${vo.saleEdMIN==ztime ? 'selected':'' } >${ztime}</option>
										</c:when>
										<c:otherwise>
											<option value="${time}" ${vo.saleEdMIN==time ? 'selected':'' } >${time}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">모집인원</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsStock" value="${vo.stock }" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="모집인원을 확인 해주세요."/>
							※  숫자만 입력하세요
						</td>
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">신청기간</th>
						<td class="line" width="35%" >
							<input type="text" name="goodsRegSt" size="10" class="date_timepicker_from2" value="${vo.regSt }" data-validation="required" data-validation-error-msg="신청기간을 확인 해주세요." />
							<img id="fromDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="goodsRegEd" size="10" class="date_timepicker_to2" value="${vo.regEd }" data-validation="required" data-validation-error-msg="신청기간을 확인 해주세요." />
							<img id="toDt2" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
						</td>
					</tr>					
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">강사</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsAuth" value="${vo.auth }" style="width: 150px;" data-validation="required" data-validation-error-msg="강사를 확인 해주세요."/>
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">교육기관</th>
				    	<td class="line" width="35%" >
				    		<input type="text" name="goodsIntroduce" value="${vo.introduce }" style="width: 150px;" data-validation="required" data-validation-error-msg="교육기관을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">교육내용</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir1" name="goodsContent" style="width:100%; height:100px;" >${vo.content }</textarea>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">썸네일(메인)</th>
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
				<td>* 취소/환불 규정</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5" width="120px" >취소/환불 규정</th>
				    	<td class="line" >
				    		<textarea rows="5" cols="10" id="ir2" name="goodsCancelRefund" style="width:100%; height:100px;" >${vo.cancelRefund }</textarea>
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