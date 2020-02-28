<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>서비스 이용목록</title>
<script type="text/javascript">
	$(document).ready(function(){
		clientReload('sel');
		
		$("#searchBtn").click(function(){
			var year = j$("#year").val();
			var startMonth = j$("#startMonth").val();
			if(year != "") {
				if(startMonth == "") {
					alert("시작월을 선택해주세요.");
					j$("#startMonth").focus();
					return false;
				}
			}
			
			j$("#searchBnr").attr("action","/madm/userManager/getServiceUserList");
			j$("#searchBnr").submit();
			return false;
		});
		
		
		$(".pCounselorDateModify").click(function(){
			var counselUser = $(this).attr("value");
			var paramArr = counselUser.split('&');
			location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
			return false;
		});
		
		j$(".downBtn").click(function(){
			j$(".downBtn").hide();
			j$("#searchBnr").attr("action","/madm/userManager/excelDownload");
			j$("#searchBnr").submit();
		});
		
		var jbOffset = $( '.jbMenu' ).offset();
			$( window ).scroll( function() {
			  if ( $( document ).scrollTop() > jbOffset.top ) {
			    $( '.jbMenu' ).addClass( 'jbFixed' );
			  }
			  else {
			    $( '.jbMenu' ).removeClass( 'jbFixed' );
			  }
		});
		
		j$(".memoView").click(function(){
			var intakeCd = $(this).attr("val");
			window.open("/madm/layerPopup/memoView?intakeCd="+intakeCd, "내용 더보기", "width=1000, height=600,  scrollbars=1");
			return false;
		});

		j$("input").keypress(function(e) {
			if (e.which == 13){
				j$("#searchBnr").submit();
				return false;
			};
		});
		
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
	
</script>

<style>
	.jbFixed {
	  position: fixed;
	  top: 0px;
	  weidth: 2300px;
	}
</style>

</head>
<body>

<form:form id="searchBnr" modelAttribute="userManagerDto" action="/madm/userManager/getServiceUserList" method="GET">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">서비스 이용목록</td>
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
						    	<td width="40%" align="left">
							    	<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
							    		<option value="">---- 선택 ----</option>	
							    		<c:forEach var="list" items="${clientList}">
						    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq userManagerDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
						    			</c:forEach>
						    		</select> 
						    		<input type="text" id="chkClientCd" value="" onkeyup="clientReload('txt');" style="width:200px;" placeholder="고객사명을 입력 또는 선택하세요.">
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>신청자</strong></td>
						    	<td width="40%" align="left">
						    		<input type="text" name="userNm" placeholder="신청자 이름을 입력하세요." value="${userManagerDto.userNm }" style="width:350px;">
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담일자 검색</strong></td>
						    	<td width="40%" align="left">
						    		<select id="year" name="year" style="height: 20px;">
							    		<option value="">---- 연도선택 ----</option>	
							    		<option value="2015" <c:if test="${userManagerDto.year eq 2015 }"> selected </c:if>>2015년</option>	
							    		<option value="2016" <c:if test="${userManagerDto.year eq 2016 }"> selected </c:if>>2016년</option>	
							    		<option value="2017" <c:if test="${userManagerDto.year eq 2017 }"> selected </c:if>>2017년</option>	
							    	</select>
							    	<select id="startMonth" name="startMonth" style="height: 20px;">
							    		<option value="">---- 시작월 ----</option>	
					    				<option value="0100000000" <c:if test="${userManagerDto.startMonth eq 0100000000 }"> selected </c:if> >1월</option>
					    				<option value="0200000000" <c:if test="${userManagerDto.startMonth eq 0200000000 }"> selected </c:if> >2월</option>
					    				<option value="0300000000" <c:if test="${userManagerDto.startMonth eq 0300000000 }"> selected </c:if> >3월</option>
					    				<option value="0400000000" <c:if test="${userManagerDto.startMonth eq 0400000000 }"> selected </c:if> >4월</option>
					    				<option value="0500000000" <c:if test="${userManagerDto.startMonth eq 0500000000 }"> selected </c:if> >5월</option>
					    				<option value="0600000000" <c:if test="${userManagerDto.startMonth eq 0600000000 }"> selected </c:if> >6월</option>
					    				<option value="0700000000" <c:if test="${userManagerDto.startMonth eq 0700000000 }"> selected </c:if> >7월</option>
					    				<option value="0800000000" <c:if test="${userManagerDto.startMonth eq 0800000000 }"> selected </c:if> >8월</option>
					    				<option value="0900000000" <c:if test="${userManagerDto.startMonth eq 0900000000 }"> selected </c:if> >9월</option>
					    				<option value="1000000000" <c:if test="${userManagerDto.startMonth eq 1000000000 }"> selected </c:if> >10월</option>
					    				<option value="1100000000" <c:if test="${userManagerDto.startMonth eq 1100000000 }"> selected </c:if> >11월</option>
					    				<option value="1200000000" <c:if test="${userManagerDto.startMonth eq 1200000000 }"> selected </c:if> >12월</option>
						    		</select> 
						    		~ 
						    		<select id="endMonth" name="endMonth" style="height: 20px;">
							    		<option value="">---- 종료월 ----</option>	
					    				<option value="0131235959" <c:if test="${userManagerDto.endMonth eq 0131235959 }"> selected </c:if> >1월</option>
					    				<option value="0229235959" <c:if test="${userManagerDto.endMonth eq 0229235959 }"> selected </c:if> >2월</option>
					    				<option value="0331235959" <c:if test="${userManagerDto.endMonth eq 0331235959 }"> selected </c:if> >3월</option>
					    				<option value="0430235959" <c:if test="${userManagerDto.endMonth eq 0430235959 }"> selected </c:if> >4월</option>
					    				<option value="0531235959" <c:if test="${userManagerDto.endMonth eq 0531235959 }"> selected </c:if> >5월</option>
					    				<option value="0630235959" <c:if test="${userManagerDto.endMonth eq 0630235959 }"> selected </c:if> >6월</option>
					    				<option value="0731235959" <c:if test="${userManagerDto.endMonth eq 0731235959 }"> selected </c:if> >7월</option>
					    				<option value="0831235959" <c:if test="${userManagerDto.endMonth eq 0831235959 }"> selected </c:if> >8월</option>
					    				<option value="0930235959" <c:if test="${userManagerDto.endMonth eq 0930235959 }"> selected </c:if> >9월</option>
					    				<option value="1031235959" <c:if test="${userManagerDto.endMonth eq 1031235959 }"> selected </c:if> >10월</option>
					    				<option value="1130235959" <c:if test="${userManagerDto.endMonth eq 1130235959 }"> selected </c:if> >11월</option>
					    				<option value="1231235959" <c:if test="${userManagerDto.endMonth eq 1231235959 }"> selected </c:if> >12월</option>
						    		</select> 
						    	</td>
						    	
						    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>아이디/사번</strong></td>
						    	<td width="40%" align="left">
						    		<input type="text" name="userId" value="${param.userId }" style="width:350px;">
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>주문채널 타입</strong></td>
						    	<td width="40%" align="left" colspan="3">
							    	<comm:select name="siteType" id="siteType" code="101004" basicValue="선택해주세요." selectValue="${param.siteType }"  />
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
									<table cellpadding="0" cellspacing="0" border="0" width="100%" style="padding-bottom: 10px;">
										<tr>
											<td align="right" style="padding-right: 10px;">
												<strong>조회건 : ${paging.totalCount} </strong>
												<span style="margin-left: 20px;"></span>
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
											<td align="right" id="btn02" class="hideBtn" width="60px">
												<a href="#">
													<span class="downBtn"> 엑셀다운 </span>
												</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="position:relative;">
								<div style="width:1300px; max-height:800px;">
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="2580px;" style="border-collapse:collapse; position:absolute; left:0; top:0;">	
										<colgroup>
											<col style="width:50px">
											<col style="width:80px">
											<col style="width:150px">
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:90px">
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:120px">
											<col style="width:80px">
											
											<col style="width:50px">
											<col style="width:140px">
											<col style="width:110px">
											<col style="width:120px">
											<col style="width:120px">
											<col style="width:300px">
											<col style="width:80px">
											<col style="width:150px">
											<col style="width:80px">
											<col style="width:70px">
											
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:120px">
											<col style="width:80px">
										</colgroup>
										
										<tr align="center" height="50px">
											<th>순번</th>
											<th>주문번호</th>
											<th>고객사명</th>
											<th>사번/ID</th>
											<th>신청코드</th>
											<th>주문날짜</th>
											<th>상담날자</th>
											<th>신청자</th>
											<th>상담대상</th>
											<th>생년월일</th>
											<th>성별</th>
											<th>직업</th>
											<th>모바일</th>
											<th>상담유형</th>
											<th>상담주제</th>
											<th>메모</th>
											<th>상담방법</th>
											<th>센터명</th>
											<th>상담사</th>
											<th>상담회차</th>
											<th>상담일지</th>
											<th>결제방법</th>
											<th>주문채널</th>
											<th>상태값</th>
											<th>상담현황</th>
										</tr>
									</table>
									<!-- 채널 정보 시작 -->
									<div style="overflow-y:scroll; overflow-x:hidden; width:2580px; max-height:800px;">
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="2580px;" style="margin-top: 50px; border-collapse:collapse;">
										<colgroup>
											<col style="width:50px">
											<col style="width:80px">
											<col style="width:150px">
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:90px">
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:120px">
											<col style="width:80px">
											
											<col style="width:50px">
											<col style="width:140px">
											<col style="width:110px">
											<col style="width:120px">
											<col style="width:120px">
											<col style="width:300px">
											<col style="width:80px">
											<col style="width:150px">
											<col style="width:80px">
											<col style="width:70px">
											
											<col style="width:80px">
											<col style="width:80px">
											<col style="width:120px">
											<col style="width:80px">
										</colgroup>
										
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px" >
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td  >
												<span <c:if test="${list.orderStatus eq '주문취소' }"> style="color:red; " </c:if>>
												${list.orderNum }
												</span>
											</td>
											<td >${list.clientNm}(${list.clientCd })</td>
											<td >${list.userId }</td>
											<td >
												<span <c:if test="${list.orderStatus eq '주문취소' }"> style="color:red; " </c:if>>
												${list.counselCd }
												</span>
											</td>
											<td >${list.orderDt }</td>
											<td >${list.scheduleDt }</td>
											<td >${list.counselNm }</td>
											<td >${list.relation }</td>
											<td >${list.rrn }</td>
											<td >${list.gender }</td>
											<td >${list.job }</td>
											<td >${list.mobile }</td>
											<td >${list.counselDiv }</td>
											<td >${list.cause }</td>
											<td  id="btn02" >
												   <c:choose>
												   	<c:when test="${fn:length(list.memo) > 60}">
												   		${fn:substring(list.memo, 0, 59)} <br>
												   		<a href="javascript:void(0);" >
															<span class="memoView" val="${list.intakeCd }">더보기</span>
														</a>
												   	</c:when>
												   	<c:otherwise>${list.memo }</c:otherwise>
												   </c:choose> 
											</td>
											<td >${list.counselType }</td>
											<td >${list.centerSeq }</td>
											<td >${list.counselorNm} (${list.counselorId })</td>
											<td >${list.extensionNum }</td>
											<td><a href="javascript:void(0);" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}">일지조회</a></td>
											<td >${list.payType }</td>
											<td >${list.siteType }(${list.orderId })</td>
											<td >
												<span <c:if test="${list.orderStatus eq '주문취소' }"> style="color:red; " </c:if>>
												${list.orderStatus }
												<c:if test="${list.orderStatus eq '주문취소' }">(${list.cancelDt })</c:if>
												</span>
											</td>
											<td >${list.statusNm }</td>
										</tr>
										</c:forEach>
									</table>
									</div>
									<br>
									<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
										<tr>
											<td align="center">
			  								<ui:paging value="${paging}"
			  									btnFirst="${url:img('/images/btn_first.jpg')}"
			  									btnPrev="${url:img('/images/btn_prev.jpg')}"
			  									btnNext="${url:img('/images/btn_next.jpg')}"
			  									btnLast="${url:img('/images/btn_last.jpg')}" />
  											</td>
										</tr>
									</table>
									<!-- 채널 정보 종료 -->
								</div>
								</td>
							</tr>
							<tr>
								<td height="20px"></td>
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
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

