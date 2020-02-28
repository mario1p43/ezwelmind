<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상담 네비게이터관리</title>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript">
	var urlNum = 0;
	var depth = '${depth}';
	var hSeq ="";
	var hTitle ="";
j$(document).ready(function(){
	
	
	j$("#insertBtn").click(function(){
		var nowSeq = j$("#naviSeq").val();
		j$("#type").val("insert");
		var preTitle;
		var params = {};
		params.naviSeq = nowSeq;
		
		if(depth != 1){
			j$.ajax({
				url: '/madm/navigator/navigatorStepAjax',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				async: false,
				success: function(data, textStatus){
					preTitle = data.stepAjax.title;
				}
			}); 
			
			
		}
		
		
		$("#layerPop").show();
		if(preTitle != null){
			$('#upTitle').text(preTitle);
		}else{
			$('#upTitle').text("-");
		}
		
		return false;
	}); 
	
	
	
	j$("#closeBtn").click(function(){
		$("#layerPop").hide();
		for(var i=urlNum; i>0; i--){
			delUrl(url);
		}
		j$('[name=naviTitle]').val("");
		j$('[name=naviSort]').val("");
		j$("#naviStatusY").attr("checked", true);
		j$('[name=targetNm0]').val("");
		j$('[name=targetUrl0]').val("");
		return false;
	});
	
	j$("#saveBtn").click(function(){
		var nowSeq = j$('[name=highNaviSeq]').val();
		var seq = j$('#naviSeq').val();
		if(depth == 1){
			j$('[name=nowNaviSeq]').val("");
		}else{
			if(nowSeq != null){
		 		j$('[name=nowNaviSeq]').val(nowSeq);
			}
			else{
				j$('[name=nowNaviSeq]').val(seq);
			}
		}
			j$('[name=naviSeq]').val(seq);
		
		
		j$('[name=depth]').val(depth);
		j$("#naviForm").attr("action","/madm/navigator/modifyCounselNavigatorList"); 
		
		$.validate({
			form : '#naviForm',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
			 
			}
		});
		
		j$("#naviForm").submit();
		return false;
	});
	
	j$("#saveBtn2").click(function(){
		var text = j$('[name=naviTitle]').val();
		var textL = text.length;
		if(textL >= 500){
			alert("저장가능한 사이즈를 초과 하였습니다.");
			return false;
		}
		var nowSeq = j$('[name=highNaviSeq]').val();
		var seq = j$('#naviSeq').val();
		if(depth == 1){
			j$('[name=nowNaviSeq]').val("");
		}else{
			if(nowSeq != null){
		 		j$('[name=nowNaviSeq]').val(nowSeq);
			}
			else{
				j$('[name=nowNaviSeq]').val(seq);
			}
		}
			j$('[name=naviSeq]').val(seq);
		j$('[name=depth]').val(depth);
		j$("#urlNum").val(urlNum);
		
		
		$.validate({
			form : '#addForm',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
			 
			}
		});
		j$("#addForm").submit(); 
		return false;
	});
	
	
	j$(".moveBtn").click(function(){
		
		depth++
		j$('[name=depth]').val(depth);
		
		var naviSeq = j$(this).attr("value");
		j$('[name=naviSeq]').val(naviSeq);
		
		var preTitle  =j$(this).attr("disp");
		
		j$('[name=preTitle]').val(preTitle);
		
  		j$("#naviForm").attr("action","/madm/navigator/counselNavigator"); 
		j$("#naviForm").submit(); 
		return false;
	});	
	
	j$(".modifyNavigator").click(function(){
		j$("#type").val("update");
		var naviSeq = j$(this).attr("value");
		var params = {};
		params.naviSeq = naviSeq;
		j$("#naviSeq").val(naviSeq);
		var n = urlNum;
		for(var i =0; i<n; i++){
		delUrl(url);
		}
		
		j$.ajax({
			url: '/madm/navigator/navigatorAjax',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				var cnt = 0;
				j$('[name=naviTitle]').val(data.detailNavigator.naviTitle);
				j$('[name=naviSort]').val(data.detailNavigator.naviSort);
				if(data.detailNavigator.naviStatus == 100001){
					j$("#naviStatusY").prop("checked", true);
				}else{
					j$("#naviStatusN").prop("checked", true);
				}
				if(data.detailNavigator.upTitle == null){
					$('#upTitle').text("-");
				}else{
					$('#upTitle').text(data.detailNavigator.upTitle);
				}
				
				if(data.detailTarget.length == 0){
				}else{
					j$.each(data.detailTarget, function(i, detailTarget){
						if(cnt != 0){
							addUrl(url);
						}
						j$('[name=targetNm'+cnt+']').val(detailTarget.targetNm);
						j$('[name=targetUrl'+cnt+']').val(detailTarget.targetUrl);
						cnt++;
						
					});

				}
				
				$("#layerPop").show();
			}
		}); 
		
	});
	
	
	
});


function addUrl(e){
	if(urlNum == 3){
		alert("최대4개 등록 가능합니다.");
		return false;
	}
	urlNum++;
	var strData = "";
	var oRow = e.insertRow(urlNum);
	var oCel = oRow.insertCell();
	
	strData +=	"제목 : <input type='text' name='targetNm"+urlNum+"' /> 링크 URL : <input type='text' name='targetUrl"+urlNum+"' size='100'/>";
	oCel.innerHTML = strData;
	
}

function delUrl(e){
	if(urlNum == 0){
		return false;
	}
	var oTr = e.deleteRow(urlNum);
	urlNum--;
}

function moveStep(cnt){
	var params = {};
	var seq = j$('#naviSeq').val();
	var cap = depth - cnt;
	if(cap == 0){
		return false;
	}else{
		for(var i=cap; i > 0; i--){
			
			if(hSeq != ""){
				seq = hSeq;
			}

		params.naviSeq = seq;
	
			j$.ajax({
				url: '/madm/navigator/navigatorStepAjax',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				async: false,
				success: function(data, textStatus){
					hSeq =  data.stepAjax.highNaviSeq;
					hTitle =  data.stepAjax.naviTitle;
				}
			});  
		}
	}
	
	
	var moveDepth = depth - cap
	var moveSeq = (hSeq == 0 ? "" :hSeq);
	
	j$('[name=naviSeq]').val(moveSeq);
	j$('[name=depth]').val(moveDepth);
	j$('[name=preTitle]').val(hTitle);
	j$("#naviForm").attr("action","/madm/navigator/counselNavigator"); 
	j$("#naviForm").submit();
	
	
	
	return false;
}



</script>
</head>
<body>

<form:form id="naviForm" name="naviForm" modelAttribute="NavigatorDto" action="/madm/navigator/counselNavigator" method="GET">
<input type="hidden" name="preTitle" value="${preTitle }"> 
<input type="hidden" name="depth" value="${depth }">
<input type="hidden" name="naviSeq">
<input type="hidden" name="nowNaviSeq">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">상담 네비게이터관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td width="85%" >
												<%-- <strong> ${dep } </strong> --%>
												<strong> 
													<c:forEach var="list" items="${depText}" varStatus="status">
														<a href="#" onclick="moveStep(${status.count});">
															${list}
														</a>
													</c:forEach>
												</strong>
											</td>
											<td id="btn01" ><a href="#"><span id="insertBtn">신규 생성</span></a></td>
								    		<td id="btn01" ><a href="#"><span id="saveBtn">설정 저장</span></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="5px"></td>
							</tr>
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<td bgcolor="#F5F5F5" width="7%"><strong>번호</strong></td>
											<td bgcolor="#F5F5F5" width="60%"><strong>상담 네비게이터 명칭</strong></td>
											<td bgcolor="#F5F5F5" width="6%"><strong>노출순위</strong></td>
											<td bgcolor="#F5F5F5" width="7%"><strong>사용여부</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상품링크여부</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>하위여부</strong></td>
										</tr>

										<c:forEach var="list" items="${navigatorList}" varStatus="status">
										<tr align="center" height="30px">
											<td >${list.naviSeq}<input type="hidden" name="listNaviSeq" value="${list.naviSeq}"> </td>
											<td ><a href="javascript:void(0);" class="modifyNavigator" value="${list.naviSeq}">${list.naviTitle }</a></td>
											<td ><input size="8" type="number" name="listNaviSort" value="${list.naviSort }" data-validation="required number" data-validation-error-msg-required="노출순위를 확인해주세요" ><input type="hidden" name="highNaviSeq" value="${list.highNaviSeq }">  </td>
											<td ><select name="listNaviStatus">
												<option value="100001"  ${list.naviStatus == "100001" ? 'selected':''}>Y</option>
												<option value="100002"  ${list.naviStatus == "100002" ? 'selected':''}>N</option>
											</select>  </td>
											<td >${list.naviCheck }</td>
											<td>
												<c:choose>
													<c:when test="${list.naviCheck eq 'Y' || list.naviStatus == '100002'}">
														<table cellpadding="0" cellspacing="0" border="0">
															<tr><td id="btn02" ><a href="javascript:void(0)"><span>이동</span></a></td></tr>		
											    		</table>
													</c:when>
													<c:otherwise>
														<table cellpadding="0" cellspacing="0" border="0">
															<tr><td id="btn02" style=""><a href="javascript:void(0)" class="moveBtn" value="${list.naviSeq}" disp="${list.naviTitle}"><span>이동</span></a></td></tr>
											    		</table>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										</c:forEach>
									</table>
									
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

<form:form name="addForm" id="addForm" modelAttribute="NavigatorDto" action="/madm/navigator/counselNavigatorAdd" method="GET">
<input type="hidden" name="urlNum" id="urlNum">
<input type="hidden" name="type" id="type">
<input type="hidden" name="naviSeq" id="naviSeq" value="${naviSeq }">
<input type="hidden" name="depth">
<input type="hidden" name="nowNaviSeq">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%" id="layerPop" style="display: none;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<th width="10%">상위단계</th><td colspan="3"><span id="upTitle" > </span></td>
				</tr>
				<tr>
					<th>명칭</th><td colspan="3"><input type="text" name="naviTitle" size="150" data-validation="required" data-validation-error-msg-required="명칭을 입력해주세요."> </td>
				</tr>
				<tr>
					<th>노출순위</th><td><input type="number" name="naviSort" data-validation="required" data-validation-error-msg-required="노출순위를 입력해주세요"> </td><th width="10%">사용유뮤</th><td><input type="radio" value="100001" name="naviStatus" id="naviStatusY" checked="checked" >사용<input type="radio" name="naviStatus" id="naviStatusN" value="100002">비사용 </td>
				</tr>
				<tr>
					<th>맞춤서비스추천</th>
					<td colspan="3"> 제목 :  <input type="text" name="targetNm0"> 링크 URL : <input type="text" name="targetUrl0" size="100"> <input type="button" onclick="addUrl(url);" value="+"><input type="button" onclick="delUrl(url);" value="-"><br>※ 입력 예시 - 제목 : faq 링크 Url : /communication/faq/faqList
						<table id="url">
							<tr>
								<td>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
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
					    		<td id="btn01"><a href="#"><span id="saveBtn2">설정 저장</span></a></td>
					    		<td id="btn01"><a href="#"><span id="closeBtn">닫기</span></a></td>
			    			</tr>
			    		</table>
			    	</td>
				</tr>
			</table>
			<!-- 버튼 영역 종료 -->
		</td>
	</tr>

</table>
</form:form>




</body>
</html>