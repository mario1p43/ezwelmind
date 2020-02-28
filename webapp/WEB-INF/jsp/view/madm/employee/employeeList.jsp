<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>임직원관리</title>
<script type="text/javascript">
j$(document).ready(function(){
		setStatus();
   	
	j$('.detail').click(function() {
		var userKey  = j$(this).attr("userKey");
		var clientCd = j$(this).attr("clientCd");
		
		j$("#userKey").val(userKey);
		j$("#clientCd").val(clientCd);
		
		j$("#employeeListForm").attr("action","/madm/employeeManagement/detail");
		j$("#employeeListForm").submit();
	});
	
	j$('.searchbtn').click(function() {
		var frm = employeeListForm;
		frm.elements["searchType"].value = "list";
		search();
	});
	
	j$('.employeeAddBtn').click(function() {
		
		if ($("#searchClientNm").val() == "") {
			alert("고객사를 선택해주세요.");
			$("#searchClientNm").focus();
			return false;
		}
		
		//j$("#employeeListForm").attr("action", "/madm/employeeManagement/employeeAddDetail");
		//j$("#employeeListForm").submit();
		location.href = "/madm/employeeManagement/employeeAddDetail?clientCd=" + $("#searchClientCd").val();
	});
	
	j$('.exceldown').click(function() {
		var frm = employeeListForm;
		frm.elements["searchType"].value = "excel";
		search();
	});
	
	$(".modifyDisp").click(function(){
		var params = {};
		var userKey = $(this).attr("userKey");	
		var useYn   = $(this).attr("useYn");

		if(useYn == "Y"){
			useYn = "N";
		}else if(useYn == "N"){
			useYn = "Y";
		}

		params.userKey 	= userKey;
		params.useYn 	= useYn;

		if(confirm("변경 하시겠습니까?")){
			j$.ajax({
				url: '/madm/common/employeeManagement/ajaxModifyUseYn',
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
	
	//display on/off 
	if($('#searchClientCd').val()){
		rtbl.style.display = "";
	}else{
		rtbl.style.display = "none";
	} 
});

function getSelectValue()
{
	//$('#searchClientCd').val($('#searchClientNm option:selected').val());
	$('#searchClientCd').val($('#searchClientNm option:selected').attr('valuecd'));
	
	setStatus();
}

function getTextValue()
{	
	var cd = $('#searchClientCd').val();
	
	$.ajax({
		url: "/madm/employeeManagement/checkClientCd",
		data:"&searchClientCd="+ $('#searchClientCd').val(),
		dataType: 'json',
		success: function (response) {
			var cc = response.countCd;
	
			if(cc>0){
				$("#searchClientNm").val(cd).attr("selected", "selected");
				setStatus();			
			}else{
				alert("입력하신 고객사 코드가 존재하지 않습니다.");	
			}
		}
	});

}

function setStatus(){
	var frm =  employeeListForm;
	var chkCd1 = frm.elements["searchStatustmp"].value;
	var chkCd1 = chkCd1.split(',');
	var statusCd = document.getElementsByName("searchStatus");
	
		if($('#searchClientCd').val() != ""){
			$("[name='Statu']").empty();
			
			$.ajax({
				url: "/madm/employeeManagement/getStatus",
				data:"&clientCd="+ $('#searchClientCd').val(),
				dataType: 'json',
				success: function (response) {
					var iter = response.statuslist;
					var element = "";
					for (var i=0; i<iter.length; i++) {
						element += "<input type='checkbox' name='searchStatus' value='" + iter[i].commCd + "'></input>" + iter[i].commNm;	
					}
		
					if (element != "") {
						//alert(element);
						$("[name='Statu']").append(element);
					}
					
					for(var j=0; j<statusCd.length; j++){
						for(var x=0 ;x<chkCd1.length; x++){
							var a = statusCd[j].value;
							var b = chkCd1[x];
							if(a == b){
								statusCd[j].checked = true;
							}
						} 
					}
				}
			});
		}
	
		// 사용유무 검색값 설정
		var chkCd2 = frm.elements["searchUseYntmp"].value;
		var chkCd2 = chkCd2.split(',');
		var useYn = document.getElementsByName("searchUseYn");
		
		for(var j=0; j<useYn.length;j++){
			for(var x=0; x<chkCd2.length; x++){
				var a = useYn[j].value;
				var b = chkCd2[x].replace(/\'/gi, ""); 
				if(a == b){
					useYn[j].checked = true;
				}
			} 
		}
}

function search(){
	var frm = employeeListForm;
	var temp ="" ;
	var cnt = 0;
	
	if(frm.elements["searchClientCd"].value == ""){
		alert("고객사명을 선택하시거나 고객사코드를 입력해 주세요.");
		return;
	};
	
	//재직상태 checkbox 값 
	for(var i=0;i<frm.elements["searchStatus"].length;i++){
		if(frm.elements["searchStatus"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["searchStatus"][i].value;
			}else{
			   temp+= frm.elements["searchStatus"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["searchStatustmp"].value = temp;
	
	 temp ="" ;
	 cnt = 0;
		
	 //사용유무 checkbox 값
	for(var i=0;i<frm.elements["searchUseYn"].length;i++){
		if(frm.elements["searchUseYn"][i].checked > 0){
			if(cnt!=0){   
			   temp +=","+ frm.elements["searchUseYn"][i].value + '';
			}else{
			   temp += '' + frm.elements["searchUseYn"][i].value + '';
			}
			cnt++;
		    }
	    }
	 frm.elements["searchUseYntmp"].value = temp;
	 
	 //생년월일-성별 양식 체크
	 if($("[name='searchRrn']").val() != "" ){
		 	var regex = /^[0-9]{6}[-]{1}[0-9]{1}$/;
		 	if (!regex.test($("[name='searchRrn']").val())){
		 		alert("생년월일-성별로 조회시에는 생년월일(6자리)-성별(1자리) 순으로 입력해 주시기 바랍니다. ")
		 		return;
		 	}
		}
	 
	 if(frm.elements["searchType"].value == "list"){
		<c:choose>
			<c:when test="${orderFlag eq 'Y' }">
				j$("#employeeListForm").attr("action","/madm/counsel/counselOrder");
			</c:when>
			<c:otherwise>
		 		j$("#employeeListForm").attr("action","/madm/employeeManagement/list");
			</c:otherwise>
		</c:choose>
		 j$("#employeeListForm").submit(); 
	 }else if(frm.elements["searchType"].value == "excel"){
		 j$("#employeeListForm").attr("action","/madm/employeeManagement/excel");
		 j$("#employeeListForm").submit();
	 }
}

function modify(key){
	//성명
	//ajax 한글 깨짐 인코딩
	var NM = $("[name='Nm_"+key+"']").val();
	NM = escape(encodeURIComponent(NM));
	
	//생년월일 - 성별
	var regex = /^[0-9]{6}[-]{1}[0-9]{1}$/;
	var RN = $("[name='Rn_"+key+"']").val()
 	if (!regex.test(RN)){
 		alert("생년월일-성별값은 생년월일(6자리)-성별(1자리) 순으로 입력해 주시기 바랍니다. ")
		return false;
 	}
 	
 	//사번
 	var EN = $("[name='En_"+key+"']").val();
 	
	j$.alert('해당직원의 정보를 수정하시겠습니까?',function(){
		$.ajax({
				url: "/madm/employeeManagement/modify",
				data:"&userKey="+key+"&rrn="+RN+"&userNm="+NM+"&empNum="+EN,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				dataType: 'json',
				success: function (response) {
					alert('정보가 수정되었습니다');
				}
			});
		},function(){
		 	return false;
	});
	
}

function initpwd(key){
	j$.alert('비밀번호를 초기화 하시겠습니까?',function(){
		$.ajax({
				url: "/madm/employeeManagement/initpwd",
				data:"&userKey="+key+"&rrn="+$("[name='Rn_"+key+"']").val()+"&empNum="+$("[name='En_"+key+"']").val(),
				dataType: 'json',
				success: function (response) {
					alert('임직원 ID로 비밀번호가 초기화 되었습니다');
				}
			});
		},function(){
		 	return false;
	});
} 

function goCousnel(userKey) {
	location.href = "/madm/counsel/adminCounselMain?userKey=" + userKey; 
}

//고객사 검색하기
function clientReload(){
	var searchClientNm = $("#searchClientNmCheck").val();
	j$("[name='searchClientNm']").find("option").filter(function(index) {
		return $(this).text().indexOf(searchClientNm) !== -1
	}).prop("selected", "selected");
	getSelectValue();
}

</script>
</head>
<body>


<form id="employeeListForm" action="/madm/employeeManagement/list" method="POST">
<input type="hidden" name="searchStatustmp"  value="${param.searchStatustmp }"  />
<input type="hidden" name="searchUseYntmp"  value="${param.searchUseYntmp }"  />
<input type="hidden" name="searchType"  value="list"  />
<input type="hidden" name="clientCd" 	id="clientCd"  	value=""  />
<input type="hidden" name="userKey" 	id="userKey" 	value=""  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">임직원관리</td>
					<td align="right">
						<input type="button" class="exceldown" value="엑셀다운로드"" />
					</td>
				</tr>
			</table>
			<tr>
				<td height="10px"></td>
			</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center" width="15%"><strong>고객사명</strong></td>
						    	<td align="left" width="35%">
						    		<select id="searchClientNm" name="searchClientNm" onChange="getSelectValue();">
						    			<option value="">고객사를 선택하세요</option>
						    			<c:forEach var="list" items="${emplist}" varStatus="status">
						    				<option value="${list.clientNm}" valueCd="${list.clientCd}" ${param.searchClientCd == list.clientCd  ? 'selected':''}>${list.clientNm}</option>
										</c:forEach>
						    		</select>
						    		<input type="text" id="searchClientNmCheck" name="searchClientNmCheck" onkeyup="clientReload();" value="${param.searchClientNm}" placeholder="고객사명을 입력 또는 선택하세요." style="width: 200px;"/></td>
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center" width="15%"><strong>고객사코드</strong></td>
						    	<td width="35%"><input type="text" id="searchClientCd" name="searchClientCd" onkeyup="getTextValue();" value="${param.searchClientCd }" /></td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>재직상태</strong></td>
						    	<td align="left">
						    		<div name="Statu">
							    		<input type="checkbox" name="searchStatus" value="100007"></input>재직
							    		<input type='checkbox' name="searchStatus" value='100008'></input>휴직
							    		<input type="checkbox" name="searchStatus" value="100009"></input>퇴직 
						    		</div>
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center"><strong>사용유무</strong></td>
						    	<td>
						    		<input type="checkbox" name="searchUseYn" value="Y"></input>Y
						    		<input type="checkbox" name="searchUseYn" value="N"></input>N
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>생년월일-성별</strong></td>
						    	<td align="left">
					    			<input type="text" name="searchRrn" value="${param.searchRrn }" />
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center"><strong>임직원명</strong></td>
						    	<td><input type="text" name="searchUserNm" value="${param.searchUserNm }" /></td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>아이디사번</strong></td>
						    	<td align="left">
						    		<select name="selectEmp">
						    			<option value="">선택</option>
						    			<option value="id"  ${param.selectEmp == "id" ? ' selected' : ''}>아이디</option>
						    			<option value="empnum"  ${param.selectEmp == "empnum" ? ' selected' : ''}>사번</option>
						    		</select>
						    		<input type="text" name="searchEmp" value="${param.searchEmp }" />
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center"><strong>유저키</strong></td>
						    	<td><input type="text" name="searchUserKey" value="${param.searchUserKey }" /></td>
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
								    		<td id="btn01"><a href="#"><span class="searchbtn">검 색</span></a></td>
								    		<td id="btn01"><a href="#"><span class="employeeAddBtn">임직원 등록</span></a></td>
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
						<table id="rtbl" cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="left">
												<strong>총 ${paging.totalCount} 명 |</strong> 
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th >순번</th>
											<th >고객사코드</th>
											<th >고객사명</th>
											<th >유저키</th>
											<th >성명</th>
											<th >생년월일-성별</th>
											<th >ID</th>
											<th >사번</th>
											<th >사용유무</th>
											<th >재직상태</th>
											<th colspan="2">정보관리</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.clientCd }</td>
											<td >${list.clientNm }</td>
											<td ><a href="#" class="detail" userKey="${list.userKey }" clientCd="${list.clientCd }" style="font-weight: bold; color: blue;">${list.userKey}</a></td>
											<td ><input type="text" value="${list.userNm }" name="Nm_${list.userKey}" /></td>
											<td ><input type="text" maxlength="8" size="8" value="${list.rrn }" name="Rn_${list.userKey}"/></td>
											<td >${list.userId }</td>
											<td ><input type="text" maxlength="20" value="${list.empNum }" name="En_${list.userKey}"/></td>
											<td >
												<a href="#" class="modifyDisp" userKey="${list.userKey }"  useYn="${list.useYn }" style="font-weight: bold; color: blue;">
													${list.useYn }
												</a>
											</td>
											<td >${list.userStatusNm }</td>
											
											<c:choose>
												<c:when test="${orderFlag eq 'Y' }">
													<td colspan="2">
														<input type="button" value="상담신청" onclick="goCousnel(${list.userKey})"/>
													</td>
												</c:when>
												<c:otherwise>
													<td >
														<input type="button" value="수정" onclick="modify(${list.userKey})"/>
													</td>
													<td >
														<input type="button" value="비번초기화" onclick="initpwd(${list.userKey})"/>
													</td>
												</c:otherwise>
											</c:choose>
											
										</tr>
										</c:forEach>
									</table>
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
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>
