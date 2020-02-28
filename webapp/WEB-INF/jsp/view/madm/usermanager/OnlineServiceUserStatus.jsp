<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>온라인진단 이용목록</title>
<script src="${url:resource('/resources/js/plugin/jquery.number.min.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){

		clientReload('sel');
		
		$("#searchBtn").click(function(){
			$("#searchForm").attr("action","/madm/userManager/getOnlineServiceUserStatus");
			$("#searchForm").submit();
			return false;
		});
		
		$("#excelUserBtn").click(function(){
			var clientCd = $("#clientCd").val();
			
			if(clientCd == ""){
				alert("고객사를 선택해주세요. ");
				return false;
			}
			
			$("#excelUserBtn").hide();
			$("#searchForm").attr("action","/madm/userManager/excelOnlineServiceUserStatus");
			$("#searchForm").submit();
		});
		
		$("#excelResultBtn").click(function(){
			$("#excelResultBtn").hide();
			$("#searchForm").attr("action","/madm/userManager/excelOnlineServiceUserList");
			$("#searchForm").submit();
		});
		
		$('.date_timepicker_startMonth').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
				this.setOptions({
					maxDate:j$('.date_timepicker_endMonth').val()?j$('.date_timepicker_endMonth').val():false
				})
			},
			timepicker:false
		});

		$('.date_timepicker_endMonth').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
				this.setOptions({
					minDate:j$('.date_timepicker_startMonth').val()?j$('.date_timepicker_startMonth').val():false
				})
			},
			timepicker:false
		});
		
		$("#startMonthImg").click(function(){
			$('.date_timepicker_startMonth').datetimepicker('show');
		});

		$("#endMonthImg").click(function(){
			$('.date_timepicker_endMonth').datetimepicker('show');
		});


		var clientCd = $("#clientCd").val();
		
		ajaxConnectionOnline(clientCd, '${year}', null);
		
	});  // end ready
	
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
	
	function doChangeOnlineMonth(move) {
		var year = parseInt($("#useOnlineYear").text());
		if (move == "n") {
			year = (year + 1);
		} else {
			year = (year - 1);
		}
		var clientCd = $("#clientCd").val();
		ajaxConnectionOnline(clientCd, year, null);
	}
	
	function ajaxConnectionOnline(clientCd, year, periodSeq) {
		$.ajax({
			url: '/madm/userManager/ajaxOnlineServiceUserList?clientCd=' + clientCd + '&year=' + year + "&periodSeq=" + periodSeq,
			dataType: 'json',
			success: function(data, textStatus) {
				
				$(".onlineMonthValue").text("0");
				
				$(".onlineNewMonth").each(function(index) {
					var v = eval("data.onlineNewEmpDetail.m" + (index + 1))
					$(this).text(v)
				});
				
				var reuseList = data.onlineReuseEmpList;
				var tempVal = parseInt(0);
				for (var i = 0; i < reuseList.length; i++) {
					var month = reuseList[i].regDt.substring(4, 6);
					$("#onlineReuse" + month).text(reuseList[i].cnt);
					tempVal += parseInt(reuseList[i].cnt);
				}
				
				$(".onlineCounselMonth").each(function(index) {
					var v = eval("data.onlineCounselNumber.m" + (index + 1))
					$(this).text(v)
				});
				

				$("#onlineNewTot").text(data.onlineNewEmpDetail.tot);
				$("#onlineReuseTot").text( $.number(tempVal) );
				$("#onlineCounselTot").text(data.onlineCounselNumber.tot);
				
				$("#useOnlineYear").text(year);
			}
		});
	}
</script>

</head>
<body>

<form:form id="searchForm" modelAttribute="userManagerDto" action="/madm/userManager/getOnlineServiceUserStatus" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">온라인진단 이용목록</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객사 선택</strong></td>
						    	<td width="auto;" align="left">
						    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${clientList}">
						    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq userManagerDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
						    			</c:forEach>
						    		</select>
						    		<input type="text" id="chkClientCd" value="" onkeyup="clientReload('txt');" style="width:200px;" placeholder="고객사명을 입력 또는 선택하세요.">
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="" bgcolor="#F5F5F5" align="center"><strong>기간</strong></td>
						    	<td width="" align="left" colspan="3">
									<input type="text" name="startMonth" id="startMonth" size="10" class="date_timepicker_startMonth" value="${userManagerDto.startMonth}"/>
									<img id="startMonthImg" src="//img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endMonth" id="endMonth" size="10" class="date_timepicker_endMonth" value="${userManagerDto.endMonth}"/>
									<img id="endMonthImg" src="//img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
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
					<td height="10px">
						<p><b>
						<span style="color: blue;">※ 상담포유 온라인심리검사 '직장인마음건강검진세트' 통계입니다. 3가지 심리검사를 모두 완료한 임직원만 통계 결과에 적용됩니다. </span><br>
						  1. 한국인 직무스트레스검사(KOSS)<br>
						  2. 우울검사(CES-D)<br>
						  3. 스트레스 자각척도(PSS)<br>
						</b></p>
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
								    		<td id="btn01"><a href="#"><span id="searchBtn">검 색</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td>
						<!-- 채널 영역 시작 -->	
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
										<tr>
											<td id="btn02" width="auto;" >
												<a href="javascript:void(0);">
													<span id="excelUserBtn">임직원 이용현황 다운로드</span>
												</a>
												<a href="javascript:void(0);" >
													<span id="excelResultBtn">결과 값 다운로드</span>
												</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
				
				<tr>
					<td height="5px"></td>
				</tr>
				
				
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
							
							<tr>
								<td align="left" >
									<strong>▷ 월별 온라인검사 이용추이</strong>
								</td>
								<td align="right" height="30px;" style="margin-right:20px;">
									<a href="javascript:void(0);" onclick="doChangeOnlineMonth('p');">◀</a>&nbsp;&nbsp;<strong id="useOnlineYear">${year	}</strong>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="doChangeOnlineMonth('n');">▶</a>
								</td>
							</tr>	
								
							<tr>
								<td colspan="2">
									<!-- 정보 시작 -->
									<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
										<colgroup>
											<col style="width:5%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>
											<col style="width:3%"/>			
										</colgroup>
										<thead>
											<tr>
												<th>구분</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
												<th>총합</th>
											</tr>
										</thead>
										<tbody>
											<tr align="" height="50px">
												<th>신규이용<br>임직원(명)</th>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td class="onlineNewMonth onlineMonthValue">0</td>
												<td id="onlineNewTot" class="onlineMonthValue">0</td>
											</tr>
											<tr align="" height="50px">
												<th>재이용<br>임직원(명)</th>
												<td id="onlineReuse01" class="onlineMonthValue">0</td>
												<td id="onlineReuse02" class="onlineMonthValue">0</td>
												<td id="onlineReuse03" class="onlineMonthValue">0</td>
												<td id="onlineReuse04" class="onlineMonthValue">0</td>
												<td id="onlineReuse05" class="onlineMonthValue">0</td>
												<td id="onlineReuse06" class="onlineMonthValue">0</td>
												<td id="onlineReuse07" class="onlineMonthValue">0</td>
												<td id="onlineReuse08" class="onlineMonthValue">0</td>
												<td id="onlineReuse09" class="onlineMonthValue">0</td>
												<td id="onlineReuse10" class="onlineMonthValue">0</td>
												<td id="onlineReuse11" class="onlineMonthValue">0</td>
												<td id="onlineReuse12" class="onlineMonthValue">0</td>
												<td id="onlineReuseTot" class="onlineMonthValue">0</td>
											</tr>
											<tr align="" height="50px">
												<th>이용횟수(회)</th>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td class="onlineCounselMonth onlineMonthValue">0</td>
												<td id="onlineCounselTot" class="onlineMonthValue">0</td>
											</tr>
										</tbody>
									</table>
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
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
										<thead>
							                <tr>
							                  <th width="auto;" colspan="5">[남성] 한국인 직무스트레스검사(KOSS) 요인별 평균점수</th>
							                </tr>
							                <tr>
							                  <th width="15%">영역</th>
							                  <th width="22%">안전</th>
							                  <th width="22%">경고</th>
							                  <th width="22%">위험</th>
							                  <th width="auto;">심각</th>
							                </tr>
							            </thead>
				
										<tbody>
								
										<c:forEach var="list" items="${kossStandM }" varStatus="status">
											<c:if test="${(status.count % 4) eq 1 }">
												<tr>
													<th>${list.areaNm }</th>
											</c:if>
												
												<c:set var="tdYn" value="N" />
												<!-- 2017.11.10 설계가 String으로 되어있는 관계로 소숫점까지 비교가 재대로 되지않아 형변환하여 비교하는것으로 수정.-->
												<c:forEach var="detailList" items="${kossDetailM}" varStatus="idx">
												<fmt:formatNumber value="${list.standStPoint}" type="number" var="standStPoint"/>
												<fmt:formatNumber value="${detailList.resultPoint}" type="number" var="resultPoint"/>
												<fmt:formatNumber value="${list.standEndPoint}" type="number" var="standEndPoint"/>
													<c:choose>
														<c:when test="${detailList.areaSeq eq list.areaSeq && ( standStPoint le resultPoint &&  resultPoint  le standEndPoint ) }">
															<c:choose>
																<c:when test="${list.standRiskLevel eq 1 }"> <td style="background-color: #a6cb6c;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:when test="${list.standRiskLevel eq 2 }"> <td style="background-color: #ddbe41;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td> </c:when>
																<c:when test="${list.standRiskLevel eq 3 }"> <td style="background-color: #d4854c;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:when test="${list.standRiskLevel eq 4 }"> <td style="background-color: #d24242;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:otherwise></c:otherwise>
															</c:choose>
															<c:set var="tdYn" value="Y" />
														</c:when>
														<c:otherwise>
															<c:if test="${idx.last && tdYn eq 'N'}"><td>${list.standStPoint } ~ ${list.standEndPoint }</td></c:if>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
											<c:if test="${(status.count % 4) eq 0 }">
												</tr>
											</c:if>
										</c:forEach>
										
										</tbody>
									</table>
									<br>
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
				
				<tr>
					<td height="5px"></td>
				</tr>
				
				<tr>
					<td>
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
										<thead>
							                <tr>
							                  <th width="auto;" colspan="5">[여성] 한국인 직무스트레스검사(KOSS) 요인별 평균점수</th>
							                </tr>
							                <tr>
							                  <th width="15%">영역</th>
							                  <th width="22%">안전</th>
							                  <th width="22%">경고</th>
							                  <th width="22%">위험</th>
							                  <th width="auto;">심각</th>
							                </tr>
							            </thead>
				
										<tbody>
								
										<c:forEach var="list" items="${kossStandF }" varStatus="status">
											<c:if test="${(status.count % 4) == 1 }">
												<tr>
													<th>${list.areaNm }</th>
											</c:if>
												
												<c:set var="tdYn" value="N" />
												<!-- 2017.11.10 설계가 String으로 되어있는 관계로 소숫점까지 비교가 재대로 되지않아 형변환하여 비교하는것으로 수정.-->
												<c:forEach var="detailList" items="${kossDetailF}" varStatus="idx">
												<fmt:formatNumber value="${list.standStPoint}" type="number" var="standStPoint"/>
												<fmt:formatNumber value="${detailList.resultPoint}" type="number" var="resultPoint"/>
												<fmt:formatNumber value="${list.standEndPoint}" type="number" var="standEndPoint"/>
													<c:choose>
														<c:when test="${detailList.areaSeq eq list.areaSeq && ( standStPoint le resultPoint &&  resultPoint  le standEndPoint ) }">
															<c:choose>
																<c:when test="${list.standRiskLevel == 1 }"> <td style="background-color: #a6cb6c;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:when test="${list.standRiskLevel == 2 }"> <td style="background-color: #ddbe41;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td> </c:when>
																<c:when test="${list.standRiskLevel == 3 }"> <td style="background-color: #d4854c;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:when test="${list.standRiskLevel == 4 }"> <td style="background-color: #d24242;"> <b> ${list.standStPoint } ~ ${list.standEndPoint } (${detailList.resultPoint })</b> </td></c:when>
																<c:otherwise></c:otherwise>
															</c:choose>
															<c:set var="tdYn" value="Y" />
														</c:when>
														<c:otherwise>
															<c:if test="${idx.last && tdYn == 'N'}"><td>${list.standStPoint } ~ ${list.standEndPoint }</td></c:if>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
											<c:if test="${(status.count % 4) == 0 }">
												</tr>
											</c:if>
										</c:forEach>
										
										</tbody>
									</table>
									<br>
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
				
				<tr>
					<td height="15px"></td>
				</tr>
				
				<tr>
					<td>
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
										<thead>
							                <tr>
							                  <th width="">순번</th>
							                  <th width="">임직원명</th>
							                  <th width="">이용일시</th>
							                  <th width="">이용횟수</th>
							                </tr>
							            </thead>
				
										<tbody>
										
										<c:choose>
											<c:when test="${not empty userList}">
												<c:set var = "sum" value = "0" />
												<c:forEach var="list" items="${userList}" varStatus="status">
													<c:set var= "sum" value="${sum + list.count}"/>
													<tr>
														<td>${status.count }</td>
														<td>${list.userNm }</td>
														<td>${list.userRegDt }</td>
														<td>${list.count }</td>
													</tr>
													<c:if test="${status.last }">
														<tr>
															<th colspan="3">합계</th>
															<td>${sum }</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4">이용 내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
										
										</tbody>
									</table>
									<br>
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
</table>
</form:form>

</body>
</html>

