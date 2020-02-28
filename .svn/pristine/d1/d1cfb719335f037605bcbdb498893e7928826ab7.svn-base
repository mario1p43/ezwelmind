<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>FAQ 관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchFaq").submit();
			return false;
	    };
	});

	j$("#insertBtn").click(function(){
		var serviceType = j$("#serviceType").val();
		location.href = "/madm/bbsFaq/addFaq?serviceType="+serviceType;
		return false;
	});

	j$("#searchBtn").click(function(){
		j$("#searchFaq").submit();
		return false;
	});

	j$(".faqDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		var serviceType = j$("#serviceType").val();
		location.href = "/madm/bbsFaq/modifyFaqDetail?dataSeq="+dataSeq+"&serviceType="+serviceType;
		return false;
	});

	j$(".modifyDisp").click(function(){
		var params = {};
		var dataSeq = j$(this).attr("value");
		var dispYn  = j$(this).attr("disp");

		if(dispYn == "Y"){
			dispYn = "N";
		}else if(dispYn == "N"){
			dispYn = "Y";
		}

		params.dataSeq = dataSeq;
		params.dispYn  = dispYn;

		if(confirm("노출여부를 변경 하시겠습니까?")){
			j$.ajax({
				url: '/madm/common/bbs/ajaxModifyBbsDisp',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});
		}

		return false;
	});
});

function codeChange(){
	j$("select[id='sel02'] option").remove();
	j$("select[id='sel03'] option").remove();
	j$("#sel02").append("<option value=''>------선택------</option>");
	j$("#sel03").append("<option value=''>------선택------</option>");
	
	getCommonList("sel01", "sel02");
	
	if(j$("#sel01").val() == '100705'){
		j$("#serviceFaqView").show();
	}else if(j$("#sel01").val() == '100704'){
		j$("#serviceFaqView").hide();
	}
}

function codeChangeSel(){
	var tempVal = j$("#sel02").val();
	
	j$("select[id='sel03'] option").remove();
	j$("#sel03").append("<option value=''>------선택------</option>");
	
	if(j$("#sel01").val() == '100705'){
		if(tempVal != ""){
			getCommonList("sel02", "sel03");
		}
	}
}

function getCommonList(id, setId){
	j$.ajax({
		url: "/madm/bbsFaq/getCommList?highCommCd=" + j$("#"+id).val(),
		dataType: 'json',
		success: function (response) {
			var iter = response.list;
			var element = "";
			for (var i = 0; i < iter.length; i++) {
				element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
			}
			if (element != "") {
				j$("#"+setId).append(element);
			}
		}
	});
}
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>
<form:form id="searchFaq" modelAttribute="bbsAddDto" action="/madm/bbsFaq/list" method="GET">
<input type="hidden" id="serviceType" name="serviceType" value="${serviceType }">
<input type="hidden" name="bbsCd" value="faq">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">FAQ 등록 관리</td>
		    	<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<!-- 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<td align="right">
								구분 :
								<c:choose>
									<c:when test="${serviceType eq 'SANGDAM4U' }">
										<select id="sel01" name="sel01" onchange="codeChange();">
											<option value="100704" <c:if test="${param.sel01 eq '100704' }"> selected </c:if> >유형별</option>
											<option value="100705" <c:if test="${param.sel01 eq '100705' }"> selected </c:if> >서비스별</option>
										</select>
											&nbsp;2Dept : <comm:select name="reqCd1" id="sel02" onchange="codeChangeSel();" code="100704"  basicValue="------선택------" selectValue="${param.reqCd1}"/>
										<div id="serviceFaqView" style="display: none;">
											&nbsp;3Dept : <comm:select name="reqCd2" id="sel03" code=""  basicValue="------선택------" selectValue="${param.reqCd2}"/>
										</div>
									</c:when>
									<c:when test="${serviceType eq 'HOME' }">
										<comm:select name="reqCd1" code="100286"  basicValue="------선택------" selectValue="${param.reqCd1}"/>
									</c:when>
								</c:choose>
								<span style="margin-left: 20px;"></span>
							</td>
							<td width="120px" align="right">
								<input type="text" id="searchNm" name="searchNm" placeholder="검색어를 입력 하세요." value="${param.searchNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="8%" >순번</th>
			                  <th width="12%">구분</th>
			                  <c:if test="${serviceType eq 'SANGDAM4U' }">
								<th>구분2</th>
							  </c:if>
			                  <th width="40%">제목</th>
			                  <th width="12%">등록/<span class="fontBlue">수정일</span></th>
			                  <th width="12%">등록/<span class="fontBlue">수정자</span></th>
			                  <th width="8%" >노출</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td>
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.reqCd1Nm}</td>
								<c:if test="${serviceType eq 'SANGDAM4U' }">
									<td>${list.reqCd2Nm}</td>
								</c:if>
								<td>
									<a href="#" class="faqDetail" value="${list.dataSeq}">
										<strong>${list.subject}</strong>
									</a>
								</td>
								<c:choose>
									<c:when test="${not empty list.modiNm}">
										<td><span class="fontBlue">${list.modiDt}</span></td>
										<td><span class="fontBlue">${list.modiNm}</span></td>
									</c:when>
									<c:otherwise>
										<td>${list.regDt}</td>
										<td>${list.regNm}</td>
									</c:otherwise>
								</c:choose>
								<td>
									<a href="#" class="modifyDisp" value="${list.dataSeq}" disp="${list.dispYn}">
										${list.dispYn}
									</a>
								</td>
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
					<!-- 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 영역 종료 -->
	</td>
</tr>
</table>
</form:form>
</body>
</html>

