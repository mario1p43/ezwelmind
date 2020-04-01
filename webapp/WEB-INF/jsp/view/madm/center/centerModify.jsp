<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title>센터정보관리</title>
<script type="text/javascript"
	src="https://ezutil.ezwel.com/resources/js/address/ez-addr.js"></script>
<script type="text/javascript">
	var fulPath = "";
	
	function getRealPath(obj) {
		obj.select();
		fulPath = document.selection.createRangeCollection()[0].text.toString();
		var params = {};
		var strData = "";
		params.area1 = fulPath;
		j$('#subPath').remove();
		j$.ajax({
			url : '/partner/centerInfo/ajaxPath',
			data : params,
			dataType : 'json',
			type : 'GET',
			cache : true,
			success : function(data, textStatus) {
				strData += "<span id='subPath'>";
				strData += "size = <labael>" + data.width
						+ "px</label>       <labael>" + data.height
						+ "px</label>";
				strData += "</span>";
				j$('#path1').show();
				j$('#path1').after(strData);
			}
		});
	}
	function showModify() {
		$("td input").removeAttr("readonly");
		$("td input").removeClass("border_zero");
		$("td select").removeClass("border_zero");
		$('td select').attr('disabled', false);
		$('td input:checkbox').attr('disabled', false);
		$('td input:radio').attr('disabled', false);
		$('td input:file').css("display", "block");
		$('td button.addrPopUp').attr('disabled', false);
	}
	function closeModify() {
		$("td input").attr("readonly", true);
		$("td input").addClass("border_zero");
		$("td select").addClass("border_zero");
		$('td select').attr('disabled', true);
		$('td input:checkbox').attr('disabled', true);
		$('td input:radio').attr('disabled', true);
		$('td input:file').css("display", "none");
		$('td button.addrPopUp').attr('disabled', true);
	}
	
	j$(document).ready(function() {
						// 텍스트 박스 readonly 처리
						closeModify();
						$.validate({
							form : '#modifyCenter',
							validateOnBlur : false,
							validateOnAlert : true,
							onSuccess : function() {
								$('[name=telNum]').val(
										$('#telNum1').val() + "-"
												+ $('#telNum2').val() + "-"
												+ $('#telNum3').val());
								$('[name=faxNum]').val(
										$('#faxNum1').val() + "-"
												+ $('#faxNum2').val() + "-"
												+ $('#faxNum3').val());
							}
						});
						j$("#openModifyBtn").click(function() {
							$("#modifyBtn").removeClass("display_none");
							$("#cancelBtn").removeClass("display_none");
							$("#openModifyBtn").addClass("display_none");
							
							$(".plus").removeClass("display_none");
							$(".minus").removeClass("display_none");
							$(".deleteExtra").removeClass("display_none");
							
							showModify();
							return false;
						});
						// 수정 완료
						j$("#modifyBtn").click(function() {
							updateExtra();
							updateExtraExam();
							j$("#modifyCenter").submit();
							
							return false;
						});
						j$("#cancelBtn").click(function() {
							window.location.reload();
							return false;
						});
						<c:if test='${not empty centerInfo.centerType}'>
						var chkValue = '${centerInfo.centerType}';
						var chkArr = chkValue.split(',');
						for (var i = 0; i < chkArr.length; i++) {
							if (chkArr[i] != "") {
								$('[name=centerType][value=' + chkArr[i] + ']').attr('checked', true);
							}
						}
						</c:if>
						
						<c:if test='${not empty centerInfo.mentalPsy}'>
						var chkValue = '${centerInfo.mentalPsy}';
						var chkArr = chkValue.split(',');
						for (var i = 0; i < chkArr.length; i++) {
							if (chkArr[i] != "") {
								$('[name=mentalPsy][value=' + chkArr[i] + ']').attr('checked', true);
							}
						}
						</c:if>
						<c:if test='${not empty centerInfo.post}'>
						var setPost = '${centerInfo.post}';
						var setArr = setPost.split('-');
						for (var i = 0; i < setArr.length; i++) {
							$('[id=zip' + [ i + 1 ] + ']').val(setArr[i]);
						}
						</c:if>
						$('.addrPopUp').click(function() {
							var siteUrl = '<spring:eval expression="@global['site.url.partner']" />'+ '/resources/jsp/addrSubmit.jsp';
							NEW2015_pZip(siteUrl);
							return false;
						});
						j$('#area1').change(function() {
							var params = {};
							var strData = "";
							var area1 = this.value
							params.area1 = area1;
	
							j$('#subData').remove();
	
							if (area1 == 100016) {
	
							} else if (area1 == "") {
								strData += "<span id='subData'>";
								strData += "<select id='area2' name='area2' data-validation='required' data-validation-error-msg-required='구/군을 확인 해주세요.'>";
								strData += "<option value=''>구/군 선택</option>";
								strData += "</select>";
								strData += "</span>";
								j$('#area2').show();
								j$('#area2').after(strData);
							} else {
	
								j$.ajax({
											url : '/partner/centerInfo/ajaxArea',
											data : params,
											dataType : 'json',
											type : 'GET',
											cache : true,
											success : function(
													data,
													textStatus) {
												strData += "<span id='subData'>";
												strData += "<select id='area2' name='area2' data-validation='required' data-validation-error-msg-required='구/군을 확인 해주세요.'>";
												strData += "<option value=''>구/군 선택</option>";
	
												j$.each(data.serviceList,function(i,serviceList) {
													strData += "<option value='"+serviceList.commCd+"'>"+ serviceList.commNm+ "</option>";
												});
	
												strData += "</select>";
												strData += "</span>";
												j$('#area2').show();
												j$('#area2').after(strData);
											}
										});
							}
	
							return false;
						});
	});
	
	
	function NEW2015_fSetAddr(post1, addr1, addr2) {
		document.modifyCenter.elements["post"].value = post1;
		document.modifyCenter.elements["addr1"].value = addr1;
		document.modifyCenter.elements["addr2"].value = addr2;
	}
	
	function updateExtra(){
		console.log("updateExtra 타고 있음");
		var extraIdxAll = document.getElementsByName("extraIdx");
		var extraInfoAll1 = document.getElementsByName("extraInfo1");
		var extraInfoAll2 = document.getElementsByName("extraInfo2");
		var extraInfoAll3 = document.getElementsByName("extraInfo3");
		var centerSeq = $("#centerSeq").val();
		
		for(var i=0; i<extraIdxAll.length;i++){
				var extraIdx = extraIdxAll[i].value;
				var extraInfo1 = extraInfoAll1[i].value;
				var extraInfo2 = extraInfoAll2[i].value;
				var extraInfo3 = extraInfoAll3[i].value;	
				
				var params = {};
				
				if(extraIdx != '9999999'){
					params.extraIdx = extraIdx;
				}
				
				params.centerSeq = centerSeq;
				params.extraNm = extraInfo1;
				params.extraTarget  = extraInfo2;
				params.extraCost  = extraInfo3;
				params.highCommCd = '102001';
				
				j$.ajax({
					url: '/partner/centerInfo/updateExtraExam',
					data: params,
					dataType: 'json',
					type: 'GET',
					cache:true,
					success: function(data, textStatus){
						//window.location.reload();
					}
				});   
				
			}
		return false;
		
	}
	
	
	
	function updateExtraExam(){
		var extraExamIdxAll = document.getElementsByName("extraExamIdx");
		var extraExamInfoAll1 = document.getElementsByName("extraExamInfo1");
		var extraExamInfoAll2 = document.getElementsByName("extraExamInfo2");
		var extraExamInfoAll3 = document.getElementsByName("extraExamInfo3");
		var centerSeq = $("#centerSeq").val();
		
		for(var i=0; i<extraExamIdxAll.length;i++){
			
			var extraExamIdx = extraExamIdxAll[i].value;
			var extraExamInfo1 = extraExamInfoAll1[i].value;
			var extraExamInfo2 = extraExamInfoAll2[i].value;
			var extraExamInfo3 = extraExamInfoAll3[i].value;	
			var params = {};
			
			if(extraExamIdx != '9999999'){
				params.extraIdx = extraExamIdx;
			}
			
			params.centerSeq = centerSeq;
			params.extraNm = extraExamInfo1;
			params.extraTarget  = extraExamInfo2;
			params.extraCost  = extraExamInfo3;
			params.highCommCd = '102005';
			console.log(params);
			j$.ajax({
				url: '/partner/centerInfo/updateExtraExam',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					//window.location.reload();
				}
			});  
				
		} 
		
		return false;
		
	}
	var numExtra = 0;
	var numExam = 0;
	var de ="";
	var count = 0;
	var delCnt = 1;
	
	
	//기타 검사 추가
	function addRowEtc(){
		 if(numExtra >= 10){
			alert("10개 이상 등록할 수 없습니다.");
			return false;
		 }
		numExtra++;
		var strData = "";
		strData += "<div id='extraSub"+numExtra+"'>";
		strData += " <input type='hidden' name='extraIdx' value='9999999' />";
		strData += " 검사명 : <input type='text' name='extraInfo1' value=''	 /> ";
		strData += " 대상 : <input type='text'	name='extraInfo2' value=''	 /> ";
		strData += " 센터내 시행비용(해석상담 포함가) :<input type='text' name='extraInfo3' value=''	 />";
		strData += " <input type='button' class='deleteExtra' value='삭제' onclick='deleteRowExtra("+numExtra+");'> ";
		strData += " <br/>";
		strData += "</div>";
		$( '#etcExtra' ).append(strData);
		
		
	}
	
	function deleteRowExtra(numExamEtc){
		$("#extraSub"+numExamEtc).remove();
	}
	
	
	function delExtraRow(idx,high_cd){
		if(confirm("정말 삭제 하시겠습니까?")){
			var params = {};
			params.extraIdx = idx;
			params.highCommCd = high_cd;
			j$.ajax({
				url: '/partner/centerInfo/deleteExtraExam',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});  
		}
		
	}
	
	//기타 검사 삭제
	function delRowEtc(){
		if(numExtra == 0){
			alert("최소1개 이상 등록 하셔야 합니다.");
			return false;
		}
		
		$("#extraSub"+numExtra).remove();
		numExtra--;
	}
	
	//상담 외 프로그램(집단, 특강 등) 추가
	function addRowExam(){
 		if(numExam >= 10){
			alert("10개 이상 등록할 수 없습니다.");
			return false;
		} 
		
		numExam++;
		var strData = "";
		strData += "<div id='examSub"+numExam+"'>";
		strData += " <input type='hidden' name='extraExamIdx' value='9999999' />";
		strData += " 프로그램명 : <input type='text' name='extraExamInfo1' value=''	 /> ";
		strData += " 대상 : <input type='text'	name='extraExamInfo2' value=''	 /> ";
		strData += " 센터 내 시행비용(인당) :<input type='text' name='extraExamInfo3' value=''	 />";
		strData += " <input type='button' class='deleteExtra' value='삭제' onclick='deleteRowExam("+numExam+");'> ";
		strData += " <br/>";
		strData += "</div>";
		$( '#etcExamExtra' ).append(strData);
	}
	
	function deleteRowExam(numExamEtc){
		$("#examSub"+numExamEtc).remove();
	}
	
	//상담 외 프로그램(집단, 특강 등) 삭제
	function delRowExam(){
		if(numExam == 0){
			alert("최소1개 이상 등록 하셔야 합니다.");
			return false;
		}
		$("#examSub"+numExam).remove();
		numExam--;
	}
</script>

</head>
<body>

	<form name="modifyCenter" id="modifyCenter" action="/madm/centerInfo/update" method="POST" enctype="multipart/form-data">
		<table cellpadding="0" cellspacing="0" border="0" width="100%"
			height="100%">
			<tr>
				<td valign="top" align="left">
					<!-- 컨텐츠 시작 영역 start -->
					<table cellpadding="0" cellspacing="0" border="0" width="95%">
						<tr>
							<td height="20px"></td>
						</tr>
						<tr>
							<td>
								<table cellpadding="5" cellspacing="0" border="0" width="100%"
									align="left" style="border-bottom: 1px solid silver;">
									<tr>
										<td align="left" class="subtitle">센터정보관리</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="20px"></td>
						</tr>
						<tr>
							<td>
								<ul>
									<li>상담센터</li>
								</ul> <!-- 배너 정보 영역 시작 -->
								<table cellpadding="5" cellspacing="0" border="1" width="100%"
									style="border-collapse: collapse;">
									<tr align="left" height="30px">
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*센터코드</th>
										<td class="line" colspan="2">
										<input type="hidden" id="centerSeq"  name="centerSeq" value="${centerInfo.centerSeq }" />
											${centerInfo.centerSeq }</td>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 센터구분</th>
										<td class="line" colspan="2"><input type="checkbox" name="centerType" value="100471" disabled="disabled">상담
											<input type="checkbox" name="centerType" value="100472" disabled="disabled">파견상담 
											<input type="checkbox" name="centerType" value="100473" disabled="disabled">집단상담
											<input type="checkbox" name="centerType" value="100474" disabled="disabled">강의
										</td>
									</tr>
									<tr align="left" height="30px">
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*센터명<br><span style="color:#ff4249">(임직원 공개 정보)</span></th>
										<td class="line" colspan="2">${centerInfo.centerNm}</td>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*홈페이지<br><span style="color:#ff4249">(임직원 공개 정보)</span></th>
										<td class="line" colspan="2"><input type="text"	name="homepage" value="${centerInfo.homepage }" style="width: 300px;" /></td>
									</tr>
									<tr align="left" height="30px">
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											센터소개<br><span style="color:#ff4249">(임직원 공개 정보)</span></th>
										<td class="line" colspan="4"><input type="text"
											name="centerIntro" style="width: 95%;"
											value="${centerInfo.centerIntro }" data-validation="required"
											data-validation-error-msg-required="센터소개를 확인 해주세요." /></td>
									</tr>
									<tr align="left" height="30px">
										<th rowspan="3" class="line" colspan="1" align="left"
											bgcolor="#F5F5F5">* 보유시설</th>
										<th class="line" align="left" bgcolor="#F5F5F5">개인상담실</th>
										<td class="line"><select name="infraPersonalCnt">
												<option value="0"
													${centerInfo.infraPersonalCnt == "0" ? 'selected':''}>00</option>
												<option value="1"
													${centerInfo.infraPersonalCnt == "1" ? 'selected':''}>01</option>
												<option value="2"
													${centerInfo.infraPersonalCnt == "2" ? 'selected':''}>02</option>
												<option value="3"
													${centerInfo.infraPersonalCnt == "3" ? 'selected':''}>03</option>
												<option value="4"
													${centerInfo.infraPersonalCnt == "4" ? 'selected':''}>04</option>
												<option value="5"
													${centerInfo.infraPersonalCnt == "5" ? 'selected':''}>05</option>
												<option value="6"
													${centerInfo.infraPersonalCnt == "6" ? 'selected':''}>06</option>
												<option value="7"
													${centerInfo.infraPersonalCnt == "7" ? 'selected':''}>07</option>
												<option value="8"
													${centerInfo.infraPersonalCnt == "8" ? 'selected':''}>08</option>
												<option value="9"
													${centerInfo.infraPersonalCnt == "9" ? 'selected':''}>09</option>
												<option value="10"
													${centerInfo.infraPersonalCnt == "10" ? 'selected':''}>10</option>
										</select></td>
										<th class="line" align="left" bgcolor="#F5F5F5">대기실</th>
										<td class="line">
											<input type="radio" name="infraWaitRoomYn" value="Y" ${centerInfo.infraWaitRoomYn == 'Y' ? 'checked':''}>유
											<input type="radio" name="infraWaitRoomYn" value="N" ${centerInfo.infraWaitRoomYn == 'N' ? 'checked':''}>무
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">놀이치료실</th>
										<td class="line" width="35%"><select
											name="infraPlayRoomCnt">
												<option value="0"
													${centerInfo.infraPlayRoomCnt == "0" ? 'selected':''}>00</option>
												<option value="1"
													${centerInfo.infraPlayRoomCnt == "1" ? 'selected':''}>01</option>
												<option value="2"
													${centerInfo.infraPlayRoomCnt == "2" ? 'selected':''}>02</option>
												<option value="3"
													${centerInfo.infraPlayRoomCnt == "3" ? 'selected':''}>03</option>
												<option value="4"
													${centerInfo.infraPlayRoomCnt == "4" ? 'selected':''}>04</option>
												<option value="5"
													${centerInfo.infraPlayRoomCnt == "5" ? 'selected':''}>05</option>
												<option value="6"
													${centerInfo.infraPlayRoomCnt == "6" ? 'selected':''}>06</option>
												<option value="7"
													${centerInfo.infraPlayRoomCnt == "7" ? 'selected':''}>07</option>
												<option value="8"
													${centerInfo.infraPlayRoomCnt == "8" ? 'selected':''}>08</option>
												<option value="9"
													${centerInfo.infraPlayRoomCnt == "9" ? 'selected':''}>09</option>
												<option value="10"
													${centerInfo.infraPlayRoomCnt == "10" ? 'selected':''}>10</option>
										</select></td>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">집단(교육)실</th>
										<td class="line" width="35%">
											<input type="radio"	name="infraEduRoomYn" value="Y"	${centerInfo.infraEduRoomYn == 'Y' ? 'checked':''}>유
											<input type="radio" name="infraEduRoomYn" value="N"	${centerInfo.infraEduRoomYn == 'N' ? 'checked':''}>무
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">기타시설</th>
										<td class="line" width="35%">
											<input type="text" name="infraEtc" value="${centerInfo.infraEtc }" style="width: 300px;" />
										</td>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">주차장</th>
										<td class="line" width="35%">
											<input type="radio" name="parkingLotYn" value="Y" ${centerInfo.parkingLotYn == 'Y' ? 'checked':''}>유
											<input type="radio" name="parkingLotYn" value="N" ${centerInfo.parkingLotYn == 'N' ? 'checked':''}>무
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											센터주소 <br><span style="color:#ff4249">(임직원 공개 정보)</span></th>
										<td class="line" colspan="2"><input type="text"
											name="post" id="zip" value="${centerInfo.post }"
											class="input_ty center addrPopUp" title="우편번호"
											style="width: 50px;" readonly> <!--   - 
								<input type="text" name="post" id="zip2"  class="input_ty center addrPopUp" title="우편번호" style="width:50px;" readonly > -->
											<button class="btn_ty btn_s ml addrPopUp" type="button">우편번호
												검색</button> <span id="area2"> <select id="area1" name="area1"
												data-validation="required"
												data-validation-error-msg-required="시/도를 확인 해주세요.">
													<option value="">시/도 선택</option>
													<option value="100007"
														${centerInfo.area1 == "100007" ? 'selected':''}>강원도</option>
													<option value="100008"
														${centerInfo.area1 == "100008" ? 'selected':''}>경기도</option>
													<option value="100009"
														${centerInfo.area1 == "100009" ? 'selected':''}>경상남도</option>
													<option value="100010"
														${centerInfo.area1 == "100010" ? 'selected':''}>경상북도</option>
													<option value="100011"
														${centerInfo.area1 == "100011" ? 'selected':''}>광주광역시</option>
													<option value="100012"
														${centerInfo.area1 == "100012" ? 'selected':''}>대구광역시</option>
													<option value="100013"
														${centerInfo.area1 == "100013" ? 'selected':''}>대전광역시</option>
													<option value="100014"
														${centerInfo.area1 == "100014" ? 'selected':''}>부산광역시</option>
													<option value="100015"
														${centerInfo.area1 == "100015" ? 'selected':''}>서울특별시</option>
													<option value="100016"
														${centerInfo.area1 == "100016" ? 'selected':''}>세종특별자치시</option>
													<option value="100017"
														${centerInfo.area1 == "100017" ? 'selected':''}>울산광역시</option>
													<option value="100018"
														${centerInfo.area1 == "100018" ? 'selected':''}>인천광역시</option>
													<option value="100019"
														${centerInfo.area1 == "100019" ? 'selected':''}>전라남도</option>
													<option value="100020"
														${centerInfo.area1 == "100020" ? 'selected':''}>전라북도</option>
													<option value="100021"
														${centerInfo.area1 == "100021" ? 'selected':''}>제주특별자치도</option>
													<option value="100022"
														${centerInfo.area1 == "100022" ? 'selected':''}>충청남도</option>
													<option value="100023"
														${centerInfo.area1 == "100023" ? 'selected':''}>충천북도</option>
											</select> <c:choose>
													<c:when test="${centerInfo.area1 eq 100016}">
														<span id='subData'></span></span> </c:when> <c:otherwise>
												<span id='subData'><comm:select name="area2"
														code='${centerInfo.area1}' basicValue="군/구 선택"
														selectValue="${centerInfo.area2}" /></span>
												</span>
											</c:otherwise> </c:choose> <br/> 
											<input type="text" name="addr1" id="addr1" value="${centerInfo.addr1 }" style="width: 300px;" data-validation="required" data-validation-error-msg-required="센터주소를 확인 해주세요." /> 
											<input type="text" name="addr2" id="addr2" value="${centerInfo.addr2 }" style="width: 300px;" data-validation="required" data-validation-error-msg-required="센터주소를 확인 해주세요." /></td>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">인근정보</br>(인근역, 주요 건물, 렌드마크)</th>
										<td class="line" width="35%">
										<input type="text" name="aroundInfo" value="${centerInfo.aroundInfo }" style="width: 300px;" data-validation="required"/>

										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">방문자
											주의사항 공지 <br><span style="color:#ff4249">(임직원 공개 정보)</span>
										</th>
										<td class="line" colspan="5">
											<input type="text" name="carefulInfo" value="${centerInfo.carefulInfo }" style="width: 1000px;" data-validation="required"/>
										</td>


									</tr>
									
									<tr>
										<th rowspan="6" class="line" width="15%" align="left"
											bgcolor="#F5F5F5">* 센터사진<br><span style="color:#ff4249">(임직원 공개 정보)</span></th>
										<td rowspan="6" colspan="2"><input type="file"
											name="file1" id="file1" value="찾아보기"
											onchange="javascript:getRealPath(this);" /><br> <%-- <img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${centerInfo.filePath1}" style="width: 50%; height: 50%;"> --%>
											<img src="<spring:eval expression="@global['upload.http.img']" />${centerInfo.filePath1}" style="width: 280px;height: 150px;">${centerInfo.fileNm1}
											<span id="path1"></span> <input type="hidden" name="fileNm1"
											value="${centerInfo.fileNm1 }" /> <input type="hidden"
											name="filePath1" value="${centerInfo.filePath1}" /></td>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											대표자명</th>
										<td class="line" colspan="2"><input type="text"
											name="ownerNm" value="${centerInfo.ownerNm }"
											style="width: 300px;" data-validation="required"
											data-validation-error-msg-required="대표자명을 확인 해주세요." /></td>
									</tr>
									<tr>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											사업자등록번호</th>
										<td class="line" colspan="2"><input type="text"
											name="bsnsNum" value="${centerInfo.bsnsNum }"
											style="width: 300px;" maxlength="12"
											data-validation="required"
											data-validation-error-msg-required="사업자등록번호를 확인 해주세요." /></td>
									</tr>
									<tr>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											업태</th>
										<td class="line" colspan="2"><input type="text"
											name="bcond" value="${centerInfo.bcond }"
											style="width: 300px;" data-validation="required"
											data-validation-error-msg-required="업태를 확인 해주세요." /></td>
									</tr>
									<tr>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											종목</th>
										<td class="line" colspan="2"><input type="text"
											name="bitem" value="${centerInfo.bitem }"
											style="width: 300px;" data-validation="required"
											data-validation-error-msg-required="종목을 확인 해주세요." /></td>
									</tr>
									<tr>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">*
											대표전화번호</th>
										<td class="line" colspan="2"><input type="text"
											id="telNum1" value="${centerInfo.telNum1 }"
											style="width: 10%;" maxlength="3"
											data-validation="length number" data-validation-length="2-3"
											data-validation-error-msg="대표전화번호를 확인 해주세요." />- <input
											type="text" id="telNum2" value="${centerInfo.telNum2 }"
											style="width: 10%;" maxlength="4"
											data-validation="length number" data-validation-length="3-4"
											data-validation-error-msg="대표전화번호를 확인 해주세요." />- <input
											type="text" id="telNum3" value="${centerInfo.telNum3 }"
											style="width: 10%;" maxlength="4"
											data-validation="length number" data-validation-length="4-4"
											data-validation-error-msg="대표전화번호를 확인 해주세요." /> <input
											type="hidden" name="telNum"></td>
									</tr>
									<tr>
										<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">
											팩스번호</th>
										<td class="line" colspan="2"><input type="text"
											id="faxNum1" value="${centerInfo.faxNum1 }"
											style="width: 10%;" />- <input type="text" id="faxNum2"
											value="${centerInfo.faxNum2 }" style="width: 10%;" />- <input
											type="text" id="faxNum3" value="${centerInfo.faxNum3 }"
											style="width: 10%;" /> <input type="hidden" name="faxNum">
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5"
											rowspan="2">* 계좌</th>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											은행</th>
										<td class="line" colspan="5">
										<comm:select name="bankCd" code="100475" selectValue="${centerInfo.bankCd}" /> 
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											예금주</th>
										<td class="line" width="35%">
											<input type="text" name="bankOrder" value="${centerInfo.bankOrder }" style="width: 150px;" data-validation="required"
											data-validation-error-msg-required="은행/예금주를 확인 해주세요." />
										</td>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											계좌번호</th>
										<td class="line" width="35%">
											<input type="text" name="bankNum" value="${centerInfo.bankNum }" style="width: 300px;" data-validation="required custom"
											data-validation-regexp="^([0-9\-]+)$" data-validation-error-msg="계좌번호를 확인 해주세요." />
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											통장사본등록</th>
										<td class="line" colspan="5"><input type="file"
											name="file2" size="50" /> <img src="<spring:eval expression="@global['upload.http.img']" />${centerInfo.filePath2}" style="width: 280px;height: 150px;">
											${centerInfo.fileNm2}
											<input type="hidden" name="fileNm2"
											value="${centerInfo.fileNm2 }" /> <input type="hidden"
											name="filePath2" value="${centerInfo.filePath2}" /></td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											사업자등록증</th>
										<td class="line" colspan="5"><input type="file"
											name="file3" size="50" /> <img src="<spring:eval expression="@global['upload.http.img']" />${centerInfo.filePath3}" style="width: 280px;height: 150px;">
											${centerInfo.fileNm3}
											<input type="hidden" name="fileNm3"
											value="${centerInfo.fileNm3 }" /> <input type="hidden"
											name="filePath3" value="${url:img('centerInfo.filePath3')}" /></td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											정산유형</th>
										<td class="line" colspan="2"><input type="radio"
											name="calcType" value="100753"
											${centerInfo.calcType == 100753 ? 'checked':''}
											data-validation="required"
											data-validation-error-msg="정산유형을 확인 해주세요.">소득공제 <input
											type="radio" name="calcType" value="100754"
											${centerInfo.calcType == 100754 ? 'checked':''}>과세 <input
											type="radio" name="calcType" value="100755"
											${centerInfo.calcType == 100755 ? 'checked':''}>면세</td>
									<!-- <th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 정산주기</th>
							<td class="line" colspan="2">
								<input type="hidden" name="calcDd1" value="15" data-validation="required" data-validation-error-msg-required="정산주기를 확인해주세요."><input type="hidden" name="calcDd2" value="15">15일 [세금계산서 발행시 사용]
							</td>  -->
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">*
											노출여부</th>
										<td class="line" colspan="5"><input type="radio"
											name="dispYn" value="Y"
											${centerInfo.dispYn == 'Y' ? 'checked':''}> 노출함 <input
											type="radio" name="dispYn" value="N"
											${centerInfo.dispYn == 'N' ? 'checked':''}> 노출안함</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">위치(지도보기)</th>
										<td class="line" colspan="5"><input type="text"
											name="mapUrl" value="${centerInfo.mapUrl}"
											style="width: 700px;" /></td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" rowspan="26" bgcolor="#F5F5F5">시행가능
											심리검사</th>
										<th class="line">검사종류</th><th  colspan="4">검사설명</th>
									</tr>
									<tr>
										<th>종합심리검사</th>
										<td colspan="4">
										<input type="checkbox" name="mentalPsy" value="101049" disabled="disabled">Rorschach,HTP,SCT,BGT,MMPI-2,지능검사
										</td>
									</tr>
									<tr>
										<th>발달검사</th>
										<td  colspan="4"><input type="checkbox"
											name="mentalPsy" value="101050" disabled="disabled">베일리 영유아 발달검사 +SMS(K-Vineland) + VMI
										</td>
									</tr>

									<tr>
										<th>놀이평가</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101051" disabled="disabled">발달검사 제외 놀이치료 상황에서 관찰평가
										
										</td>
									</tr>
									<tr>
										<th>정서평가</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101052" disabled="disabled">MMPI-2, SCT, Rorschach, HTP, BGT
										</td>
									</tr>

									<tr>
										<th>언어종합평가</th>
										<td colspan="4"><input type="checkbox"
											name="mentalPsy" value="101053" disabled="disabled">SELSI/PRES + REVT + 의사소통평가 + (피검자 연령 및 목적에 따라) 이해력/문제해결력 + 조음/유창성 검사 포함
										</td>
									</tr>
									<tr>
										<th>인지 / 주의력검사1</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101054" disabled="disabled">K-WAIS(K-WISC)
										</td>
									</tr>
									<tr>
										<th>인지 / 주의력검사2</th>
										<td colspan="4"><input type="checkbox"name="mentalPsy" value="101055" disabled="disabled">ATA(ADS) / CAT 
										</td>
									</tr>
									<tr>
										<th>성격진단검사1</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101056" disabled="disabled">MMPI-2 + TCI + SCT
										</td>
									</tr>
									<tr>
										<th>성격진단검사2</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101057" disabled="disabled">MMPI-2 + LCSI + SCT
										</td>
									</tr>
									<tr>
										<th>성격진단검사3</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101058" disabled="disabled">MMPI-2 + SCT
										</td>
									</tr>
									<tr>
										<th>성격진단검사4</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101059" disabled="disabled">PAI 
										</td>
									</tr>
									<tr>
										<th>성격진단검사5</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101060" disabled="disabled">TCI
										</td>
									</tr>
									<tr>
										<th>성격진단검사6</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101061" disabled="disabled">LCSI
										</td>
									</tr>
									<tr>
										<th>성격유형검사1</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101062" disabled="disabled">MBTI(MMTIC/CATi)
										</td>
									</tr>
									<tr>
										<th>성격유형검사2</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101063" disabled="disabled">에니어그램
										</td>
									</tr>
			
									<tr>
										<th>성격유형검사3</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101064" disabled="disabled">에고그램(이고그램)
										</td>
									</tr>
									<tr>
										<th>부부 / 부모검사1</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101065" disabled="disabled">결혼만족도검사(K-MSI)
										</td>
									</tr>
									<tr>
										<th>부부 / 부모검사2</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101066" disabled="disabled">양육스트레스검사(K-PSI)
										</td>
									</tr>
									<tr>
										<th>부부 / 부모검사3</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101067" disabled="disabled">부모양육태도검사(PAT)
										</td>
									</tr>
									<tr>
										<th>부부 / 부모검사4</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101068" disabled="disabled">한국아동인성평정척도(K-PRC)
										</td>
									</tr>
									<tr>
										<th>부부 / 부모검사5</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101069" disabled="disabled">아동행동평가척도(CBCL)
										</td>
									</tr>
									<tr>
										<th>학습 / 진로검사1</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101070" disabled="disabled">Holland
										</td>
									</tr>
									<tr>
										<th>학습 / 진로검사2</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101071" disabled="disabled">STRONG
										</td>
									</tr>
									<tr>
										<th>학습 / 진로검사3</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101072" disabled="disabled">MLST
										</td>
									</tr>
									<tr>
										<th>학습 / 진로검사4</th>
										<td colspan="4"><input type="checkbox" name="mentalPsy" value="101073" disabled="disabled">U&I
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5"  colspan="2">센터
											주요 강점 및 핵심역량</th>
										<td class="line" colspan="5"><input type="text" name="etcTest3" value="${centerInfo.etcTest3 }"
											style="width: 700px;" /></td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5" colspan="2">기타 검사
										

										<!-- <input type="button" class="plus display_none" onclick="addRowEtc();" value="+" />&nbsp;<input class="minus display_none" type="button" onclick="delRowEtc();" value="-" /> -->
										</th>
										<td colspan="4">
											<div id="etcExtra">
 												<c:forEach var="list" items="${extraInfo}" varStatus="listCnt">
  													<input type="hidden" name="extraIdx" value="${list.extraIdx }" />
													검사명 : <input type="text" name="extraInfo1" value="${list.extraNm }"	 />
													대상 : <input type="text"	name="extraInfo2" value="${list.extraTarget }"	 />
													센터내 시행비용(해석상담 포함가) :<input type="text" name="extraInfo3" value="${list.extraCost }"	 />
													<input type="button" class="deleteExtra display_none" value="삭제" onclick="delExtraRow('${list.extraIdx }','102001');">
													<br/>
												</c:forEach> 
											</div>
											<div>
												<input type="button" class="plus display_none" onclick="addRowEtc();" value="추가" style="margin: 5px 350px;">
											</div>
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5" colspan="2">상담	외 프로그램(집단, 특강 등)
										<!-- <input type="button" class="plus display_none" onclick="addRowExam();" value="+"  />&nbsp;<input class="minus display_none" type="button" onclick="delRowExam();" value="-" /> -->
										</th>
										<td class="line" colspan="4">
											<div id="etcExamExtra">
 												<c:forEach var="list" items="${extraExamInfo}" varStatus="listCnt">
 													<input type="hidden" name="extraExamIdx" value="${list.extraIdx }" />
													프로그램명 : <input type="text" name="extraExamInfo1" value="${list.extraNm }"	 />
													대상 : <input type="text"	name="extraExamInfo2" value="${list.extraTarget }"	 />
													센터 내 시행비용(인당) :<input type="text" name="extraExamInfo3" value="${list.extraCost }"	 />
													<input type="button" class="deleteExtra display_none" value="삭제" onclick="delExtraRow('${list.extraIdx }','102005');">
													<br/>
												</c:forEach> 
											</div>
											<div>
												<input type="button" class="plus display_none" onclick="addRowExam();" value="추가" style="margin: 5px 350px;">
											</div>
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">등록자</th>
										<td class="line" colspan="2">${centerInfo.regId }
										</td>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">등록일시</th>
										<td class="line" colspan="2">${centerInfo.regDt }
										</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">인근 대중교통</th>
										<td class="line" colspan="5">
											<input type="text" name="publicTraffic" value="${centerInfo.publicTraffic}" style="width: 95%;" />
							    		</td>
									</tr>
									<tr>
										<th class="line" width="15%" align="left" bgcolor="#F5F5F5">관리자 메모(센터평가 등)</th>
										<td class="line" colspan="5">
											<input type="text" name="mgrMemo" value="${centerInfo.mgrMemo}" style="width: 95%;" />
							    		</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td>
								<!-- 버튼 영역 시작 -->
								<table cellpadding="5" cellspacing="0" border="0" width="80%"
									style="border-collapse: collapse;" bordercolor="#DDDDDD">
									<tr>
										<td align="center" colspan="4">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="pr10">
														<button id="openModifyBtn" style="height: 30px; width: 100px;" type="button">수정</button>
													</td>
													<td class="pr10">
														<button class="display_none" id="modifyBtn" style="height: 30px; width: 100px;" type="button">수정완료</button>
													</td>
													<td class="pr10">
														<button class="display_none" id="cancelBtn" style="height: 30px; width: 100px;" type="button">취소</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table> <!-- 버튼 영역 종료 -->
							</td>
						</tr>


					</table>
				</td>
			</tr>

		</table>
	</form>

</body>
</html>