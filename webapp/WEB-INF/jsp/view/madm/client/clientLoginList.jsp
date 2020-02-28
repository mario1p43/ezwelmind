<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 관리</title>
<script type="text/javascript">
	$(document).ready(function(){
		j$("#searchBtn").click(function(){
			if(j$("#clientCd").val() == ""){
				alert("고객사를 선택하세요.");
				return;
			}
			
			j$("#frm").submit();		
		});
	});  // end ready
	
	function goModify(clientCd) {
		location.href = "/madm/client/modifyClientLogin?clientCd="+clientCd;
		return false;
	}
	
	function viewlayoutHtml(strObj){
		var agent = navigator.userAgent.toLowerCase(); 
		
		if(strObj == "null"){
	    	return false;
		}

		var X = screen.width/2;
		var Y = screen.height/2 - 300;
		var viewObj;
		var viewDiv = document.getElementById("viewlayout");

		if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1){
			viewObj="<img src='"+strObj+"'>";
		} else {
			viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
		}
		
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

<form:form id="frm" modelAttribute="clientDto" action="/madm/client/clientLoginList" method="GET">

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">고객사 로그인 이미지/문구 관리</td>
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
								고객사 :
								<select id="clientCd" name="clientCd" style="height: 20px;">
						    		<option value="">---- 선택 ----</option>	
						    		<c:forEach var="list" items="${clientList}">
					    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq clientDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
					    			</c:forEach>
					    		</select> 
								<span style="margin-left: 20px;"></span>
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
			                  <th width="6%">순번</th>
			                  <th width="20%">고객사</th>
			                  <th width="20%">로그인이미지</th>
			                  <th width="auto;">로그인문구</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td>
									<a href="javascript:goModify('${list.clientCd }');" style="color:blue;">
										${list.clientNm} (${list.clientCd })
									</a>
								</td>
								<td>
									<c:choose>
										<c:when test="${not empty list.welcomeImg }">
											<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${list.welcomeImg}" style="width: 50px; height: 50px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${list.welcomeImg}')" onMouseOut="cutlayout()"></a>
										</c:when>
										<c:otherwise>이미지 없음</c:otherwise>
									</c:choose>
								</td>
								<td>${list.loginTxt }</td>
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
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

