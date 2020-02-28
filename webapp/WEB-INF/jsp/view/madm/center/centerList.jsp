<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>센터관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	//달력
	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#btendDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});	
	
	j$("#searchBtn").click(function(){
		var frm = centerList;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		for(var i=0;i<frm.elements["centerType"].length;i++){
			if(frm.elements["centerType"][i].checked > 0){
				if(cnt!=0){   
				   temp+=","+ frm.elements["centerType"][i].value;
				}else{
				   temp+= frm.elements["centerType"][i].value;
				}
				cnt++;
			    }
		    }
		 frm.elements["searchType"].value = temp;
		j$("#centerList").submit();
		return false;
	});
	
	j$(".centerDetail").click(function(){
		var centerSeq = j$(this).attr("value");
		location.href = "/madm/centerInfo/getCenterModify?centerSeq="+centerSeq;
		return false;
	});
	
	j$(".addBtn").click(function(){
		location.href = "/madm/centerInfo/getCenterAdd";
		return false;
	});
	
	j$(".priceBtn").click(function(){
		var centerSeq = j$(this).attr("value");
		location.href = "/madm/centerInfo/getCenterPrice?centerSeq="+centerSeq;
		return false;
	});
	
	
	j$('#area1').change(function(){
			var params = {};
			var strData = "";
			var area1 = this.value
			params.area1  = area1;
			
			j$('#subData').remove();	
			
			if(area1 == 100016){
				
			}else{
			
			
				j$.ajax({
					url: '/madm/centerInfo/ajaxArea',
					data: params,
					dataType: 'json',
					type: 'GET',
					cache:true,
					success: function(data, textStatus){
						strData += "<span id='subData'>";
						strData += "<select id='area2' name='area2' data-validation='required' data-validation-error-msg-required='군/구을 확인 해주세요.'>";
						strData += "<option value=''>군/구 선택</option>";
						
						j$.each(data.serviceList, function(i, serviceList){
							strData += "   <option value='"+serviceList.commCd+"'>"+serviceList.commNm+"</option>";
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
	 
		 j$(".downBtn").click(function(){
			var searchNm = j$("#searchNm").val();
			var searchCd = j$("#searchCd").val();
			var searchSi = j$("#searchSi").val();
			var searchGu = j$("#searchGu").val();
			var searchType = j$("#searchType").val();
			location.href = "/madm/centerInfo/getCenterListExcel?searchNm="+searchNm+"&amp;searchCd="+searchCd+"&amp;searchSi="+searchSi+"&amp;searchGu="+searchGu+"&amp;searchType="+searchType;
		}); 
		 
		 <c:if test='${not empty param.searchType}'>
			var chkValue = '${param.searchType}';
			var chkArr = chkValue.split(',');
			for (var i = 0; i < chkArr.length; i++) {
				if(chkArr[i] != ""){
				$('[name=centerType][value=' + chkArr[i] + ']').attr('checked',true);
				}
			}
			</c:if>
});

document.onkeypress = enter;
function enter(e) {
  if (e.which == 13) { 
	  j$("#searchBtn").click();
  }
}

function centerReload(type){
	if(type=='select'){
		var tempCenterCd = j$("#centerSeq").val();
		var tempCenterNm = j$("#centerSeq option:selected").text();
		$("[name='centerNm']").val(tempCenterNm);
		$("[name='searchCenterSeq']").val(tempCenterCd);
	}else if(type=='input'){
		var tempCenterNm = $("[name='centerNm']").val();
		j$("#centerSeq").find("option").filter(function(index) {
			return $(this).text().indexOf(tempCenterNm) !== -1
		}).prop("selected", "selected");
		var tempCenterCd = j$("#centerSeq").val();
		$("[name='searchCenterSeq']").val(tempCenterCd);
	}
	var inputValue = $("[name='centerNm']").val();
	if(inputValue==null || inputValue==""){
		$("[name='searchCenterSeq']").val('');
		j$("#centerSeq").val('');
	}
	
}
</script>

</head>
<body>

<form:form name="centerList" id="centerList" modelAttribute="centerInfo" action="/madm/centerInfo/getCenterList">
<input type="hidden" id="searchNm" name="searchNm" value="${param.centerNm}" />
<input type="hidden" id="searchCd" name="searchCd" value="${param.searchCenterSeq}" />
<input type="hidden" id="searchSi" name="searchSi" value="${param.area1}" />
<input type="hidden" id="searchGu" name="searchGu" value="${param.area2}" />
<input type="hidden" id="searchType" name="searchType" value="${param.centerType}" />
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
	
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">센터관리</td>
		    	<td align="right">
					<input type="button" class="addBtn" value="신규등록">		<input type="button" class="downBtn" value="엑셀다운로드"" />
				</td>
			</tr>
		</table>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">센터명</th>
						    	<td colspan="2" width="35%" align="left">
							    	<select id="centerSeq" style="height: 20px;" onchange="centerReload('select');">
										<option value="">상담센터를 선택하세요</option>
										<c:forEach var="centerList" items="${centerList}" varStatus="centerListCnt">
											<option value="${centerList.centerSeq }" <c:if test="${centerList.centerSeq eq param.searchCenterSeq}"> selected </c:if>>${centerList.centerNm }</option>
										</c:forEach>
									</select>
						    		<input name="centerNm" type="text" style="width:200px;" value="${param.centerNm }" onchange="centerReload('input')" onkeyup="centerReload('input')" placeholder="상담센터명을 입력하거나 선택하세요"/>
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">센터코드</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input name="searchCenterSeq"  type="text" style="width:100px;" value="${param.searchCenterSeq }"/>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">지역구분</th>
						    	<td colspan="2" width="35%" align="left">
						    		<span id="area2" >
								<select id="area1" name="area1" >
												<option value="">시/도 선택</option>
							    			<option value="100007" ${param.area1 == "100007" ? 'selected':''}>강원도</option>
							    			<option value="100008" ${param.area1 == "100008" ? 'selected':''}>경기도</option>
							    			<option value="100009" ${param.area1 == "100009" ? 'selected':''}>경상남도</option>
							    			<option value="100010" ${param.area1 == "100010" ? 'selected':''}>경상북도</option>
							    			<option value="100011" ${param.area1 == "100011" ? 'selected':''}>광주광역시</option>
							    			<option value="100012" ${param.area1 == "100012" ? 'selected':''}>대구광역시</option>
							    			<option value="100013" ${param.area1 == "100013" ? 'selected':''}>대전광역시</option>
							    			<option value="100014" ${param.area1 == "100014" ? 'selected':''}>부산광역시</option>
							    			<option value="100015" ${param.area1 == "100015" ? 'selected':''}>서울특별시</option>
							    			<option value="100016" ${param.area1 == "100016" ? 'selected':''}>세종특별자치시</option>
							    			<option value="100017" ${param.area1 == "100017" ? 'selected':''}>울산광역시</option>
							    			<option value="100018" ${param.area1 == "100018" ? 'selected':''}>인천광역시</option>
							    			<option value="100019" ${param.area1 == "100019" ? 'selected':''}>전라남도</option>
							    			<option value="100020" ${param.area1 == "100020" ? 'selected':''}>전라북도</option>
							    			<option value="100021" ${param.area1 == "100021" ? 'selected':''}>제주특별자치도</option>
							    			<option value="100022" ${param.area1 == "100022" ? 'selected':''}>충청남도</option>
							    			<option value="100023" ${param.area1 == "100023" ? 'selected':''}>충천북도</option>
			    				</select>
			    				<c:choose>
			    					<c:when test="${param.area1 eq 100016}">
			    						<span id='subData'></span></span>
			    					</c:when>
			    					<c:when test="${param.area2 eq null}">
			    						<span id='subData'><select><option>군/구 선택 </select> </span></span>
			    					</c:when>
			    					<c:otherwise>
						    	  <span id='subData'><comm:select name="area2"  code='${param.area1}'  basicValue="군/구 선택" selectValue="${param.area2}" /></span></span>  
						    	  </c:otherwise>
						    	</c:choose>  
			    				
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">센터구분</th>
						    	<td colspan="2" width="35%" align="left">
									<input type="checkbox" name="centerType" id="centerType1" value="100471" ${param.centerType == "100471" ? 'checked':''}><label for="centerType1">상담</label>
									<input type="checkbox" name="centerType" id="centerType2" value="100472" ${param.centerType == "100472" ? 'checked':''}><label for="centerType2">파견상담</label>
									<input type="checkbox" name="centerType" id="centerType3" value="100473" ${param.centerType == "100473" ? 'checked':''}><label for="centerType3">집단상담</label> 
									<input type="checkbox" name="centerType" id="centerType4" value="100474" ${param.centerType == "100474" ? 'checked':''}><label for="centerType4">강의</label>
						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">인근 대중교통</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input name="publicTraffic" type="text" style="width:95%;" value="${param.publicTraffic }"/>
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">메모</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input name="mgrMemo"  type="text" style="width:95%;" value="${param.mgrMemo }"/>
						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">노출여부</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input type="radio" name="dispYn" id="dispYn1" value="" ${param.dispYn == "" ? 'checked':''}><label for="dispYn1">전체</label>
						    		<input type="radio" name="dispYn" id="dispYn2" value="Y" ${param.dispYn == "Y" ? 'checked':''}><label for="dispYn2">노출</label>
									<input type="radio" name="dispYn" id="dispYn3" value="N" ${param.dispYn == "N" ? 'checked':''}><label for="dispYn3">비노출</label>
						    	</td>
						    	<th width="15%" bgcolor="#F5F5F5" align="center">정산유형</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input type="radio" name="calcType" id="calcType1" value="" ${param.calcType == "" ? 'checked':''}><label for="calcType1">전체</label>
						    		<input type="radio" name="calcType" id="calcType2" value="100753" ${param.calcType == "100753" ? 'checked':''}><label for="calcType2">소득공제</label>
									<input type="radio" name="calcType" id="calcType3" value="100754" ${param.calcType == "100754" ? 'checked':''}><label for="calcType3">과세</label>
									<input type="radio" name="calcType" id="calcType4" value="100755" ${param.calcType == "100755" ? 'checked':''}><label for="calcType4">면세</label>
						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">등록기간</th>
						    	<td colspan="5" width="35%" align="left">
									<input type="text" id="startDt" name="startDt" size="10" style="width:150px;" class="date_timepicker_start" value="${param.startDt}">
									<img id="btstartDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg" border="0">
									&nbsp;~&nbsp;
									<input type="text" id="endDt" name="endDt" size="10" style="width:150px;" class="date_timepicker_end" value="${param.endDt}">
									<img id="btendDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg" border="0">
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
	
	
		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%" align="left">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건 | 페이지 : ${paging.currentPage}/${paging.getPageCount()}
								</strong>
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr >
			                  <th width="8%" >순번</th>
			                  <!-- <th rowspan="2" width="">센터코드</th> -->
			                  <th width="">센터명</th>
			                  <!-- <th colspan="4" width="">센터구분</th> -->
			                 
			                  <th width="">지역구분</th>
			                  <th width="">인원</th>
			                  <th width="">노출여부</th>
			                  
			                  <th width="">정산유형</th>
			                  <th width="">등록일자</th>
			                  
			                  <th width="">인근 대중교통</th>
			                  <th width="">메모</th>
			                  
			                  <th width="">금액설정</th>
			                </tr>
			                <!-- <tr>
			                 <th>상담</th><th>파견</th><th>집단</th><th>강의</th>
			                </tr> -->
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<%-- <td>${list.centerSeq}</td> --%>
								<td><a href="#" class="centerDetail" value="${list.centerSeq}"><strong>${list.centerNm}</strong></a></td>
								<%-- <td>${list.typeCounsel}</td>
								<td>${list.typeDispatch}</td>
								<td>${list.typeGroup}</td>
								<td>${list.typeLecture}</td> --%>
								<td><comm:commNmOut code="${list.area1 }"  option="commCd"/> 
								<c:choose>
									<c:when test="${list.area2 eq null}"></c:when>
									<c:otherwise> / <comm:commNmOut code="${list.area2 }"  option="commCd"/></td></c:otherwise>
								</c:choose>
								<td>${list.employ}</td>
								<td>${list.dispYn}</td>
								<td><comm:commNmOut code="${list.calcType }"  option="commCd"/>
								<td>
									<fmt:parseDate value="${list.regDt}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
							    	<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td> 
								</td>
								<td>${list.publicTraffic}</td>
								<td>${list.mgrMemo}</td>
								
								<td><button class="priceBtn" value="${list.centerSeq}" type="button">공급가설정</button></td>
							</tr>
						</c:forEach>
						</tbody>
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
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->
	</td>
</tr>
</table>
</form:form>

</body>
</html>