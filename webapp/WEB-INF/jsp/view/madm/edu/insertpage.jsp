<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수신규등록</title>
<script type="text/javascript">

function centerReload(type){
	if(type=='select'){
		var tempCenterNm = j$("#centerSeq option:selected").text();
		$("[name='centerNm']").val(tempCenterNm);
		var centerSeq = j$("#centerSeq").val();
		changeCounselor(centerSeq);
	}else if(type=='input'){
		var tempCenterNm = $("[name='centerNm']").val();
		j$("#centerSeq").find("option").filter(function(index) {
			return $(this).text().indexOf(tempCenterNm) !== -1
		}).prop("selected", "selected");
		var centerSeq = j$("#centerSeq").val();
		changeCounselor(centerSeq);
	}
	var inputValue = $("[name='centerNm']").val();
	if(inputValue==null || inputValue==""){
		j$("#centerSeq").val('');
	}
}

function checkHourValue(){
	var eduHour = j$("#eduHour").val();
	var floadEduHour = parseFloat(eduHour);

	if(isNaN(floadEduHour)){
		j$("#eduHour").val('');
	}else{
		j$("#eduHour").val(floadEduHour.toFixed(1));
	}
}

function changeCounselor(centerSeq){
	var params = {};
	params.centerSeq = centerSeq;
	var strData = "";
	j$.ajax({
		url: '/madm/edu/ajaxCounselor',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			strData += "<select id='userNm' name='userNm' data-validation='required' data-validation-error-msg-required='상담사를 선택하세요.'>";
			strData += "<option value=''>상담사를 선택하세요</option>";
			
			j$.each(data.counselorList, function(i, counselorList){
				if(counselorList.userNm == "${param.userNm}"){
					strData += "<option value='"+counselorList.userId+"' selected>"+counselorList.userNm+"</option>";
				}else{
					strData += "<option value='"+counselorList.userId+"'>"+counselorList.userNm+"</option>";
				}
			});
			
			strData += "</select>";
			j$('#userNm').show();
			j$('#userNm').replaceWith(strData);  
		}
	});
}

j$(document).ready(function(){

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
	
	j$("#listBtn").click(function(){
		location.href = "/madm/edu/archivestatus";
	});
	
	j$("#addBtn").click(function(){
		var userNm = j$("#userNm").val();
		var centerSeq = j$("#centerSeq").val();
		if(centerSeq == null || centerSeq == ''){
			j$.alert("상담센터를 선택해 주세요.");
		}else if(userNm == null || userNm == ''){
			j$.alert("상담사를 선택해 주세요.");
		} else{
			if ( confirm('저장하시겠습니까?') ) {
				var userNm = j$("#userNm").val();
				j$("#userId").val(userNm);
				var replacedDtFm = j$("#eduDtFm").val().replace(/\//g,'');
				var replacedDtTo = j$("#eduDtTo").val().replace(/\//g,'');
				j$("#eduDtFm").val(replacedDtFm)
				j$("#eduDtTo").val(replacedDtTo)
				var eduDtTo = j$("#eduDtTo").val();
				if(j$("#eduId").val() == ""){
					j$("#eduInfo").attr("action","/madm/edu/addEduInfo");
				} else{
					j$("#eduInfo").attr("action","/madm/edu/updateEduInfo");
				}
				j$("#eduInfo").submit();
			};
		}
	});
	

	j$("#centerSeq").val("${param.centerSeq}").prop("selected", "selected");
	j$("#centerNm").val("${param.centerNm}").prop("selected", "selected");
	changeCounselor("${param.centerSeq}");
	j$("#eduDiv").val("${param.eduDiv}").prop("selected", "selected");
	j$("#eduType").val("${param.eduType}").prop("selected", "selected");
});
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">교육이수현황 등록</td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<form id="eduInfo" name="eduInfo" method="POST">	
			<table cellpadding="0" align="center" cellspacing="0" border="0" width="100%" height="100%">
				<tr>
			    	<td align="left" class="subtitle">기본정보</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<th width="15%" bgcolor="#F5F5F5" align="center">센터명</th>
						    	<td colspan="2" width="35%" align="left">
							    	<select id="centerSeq" name="centerSeq" style="height: 20px;" onchange="centerReload('select');">
										<option value="">상담센터를 선택하세요</option>
										<c:forEach var="centerList" items="${centerList}" varStatus="centerListCnt">
											<option value="${centerList.centerSeq }">${centerList.centerNm }</option>
										</c:forEach>
									</select>
						    		<input id="centerNm" name="centerNm"type="text" style="width:200px;height: 20px;" value="${param.centerNm }" onchange="centerReload('input')" onkeyup="centerReload('input')" placeholder="상담센터명을 입력하거나 선택하세요"/>
						    	</td>
								<th width="15%" bgcolor="#F5F5F5" align="center">상담사</th>
						    	<td colspan="2" width="35%" align="left">
							    	<select id="userNm" name="userNm" style="height: 20px;width:95%;">
										<option value="">상담사를 선택하세요</option>
									</select>
						    		<input type="hidden" id="userId" name="userId"/>
						    		<input type="hidden" id="eduId" name="eduId" value="${param.eduId}"/>
						    	</td>
						    </tr>
				    	</table>
			    	</td>
				</tr>
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
			    	<td align="left" class="subtitle">교육정보</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="1" cellspacing="1" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<th width="15%" bgcolor="#F5F5F5" align="center">교육구분</th>
								<td width="15%">
									<select id="eduDiv" name="eduDiv" style="height: 20px;width:95%;">
										<option value="" selected disabled hidden >선택해주세요.</option>
										<option value="필수" >필수</option>
										<option value="선택">선택</option>
									</select>
								</td>
								<th width="15%" bgcolor="#F5F5F5" align="center">교육형태</th>
								<td width="15%">
									<select id="eduType" name="eduType" style="height: 20px;width:95%;">
										<option value="" selected disabled hidden >선택해주세요.</option>
										<option value="집체" >집체</option>
										<option value="온라인">온라인</option>
									</select>
								</td>
							</tr>
							<tr>
								<th width="15%" bgcolor="#F5F5F5" align="center">교육명</th>
								<td width="25%" colspan="3">
									<input id="eduNm" name="eduNm" type="text" style="height: 20px;width:95%;" value="${param.eduNm}"/>
								</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">이수시간</th>
								<td>
									<input id="eduHour" name="eduHour" type="text" style="height: 20px;width:95%;" onchange="checkHourValue()" value="${param.eduHour}"/>
								</td>
								<th bgcolor="#F5F5F5" align="center">교육기간</th>
						    	<td colspan="3" align="left">
									<input type="text" id="eduDtFm" name="eduDtFm" size="10" style="height: 20px;width:150px;" class="date_timepicker_start" value="${param.eduDtFm}">
									<img id="btstartDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg" border="0">
									&nbsp;~&nbsp;
									<input type="text" id="eduDtTo" name="eduDtTo" size="10" style="height: 20px;width:150px;" class="date_timepicker_end" value="${param.eduDtTo}">
									<img id="btendDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg" border="0">
						    	</td>						
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">교육장소</th>
								<td colspan="3">
									<input name="eduPlace" type="text" style="height: 20px;width:95%;" value="${param.eduPlace}"/>
								</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">비고</th>
								<td colspan="3">
									<input name="eduEtc" type="text" style="height: 20px;width:95%;" value="${param.eduEtc}"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
								    		<td id="btn01"><a href="#"><span id="addBtn">저장</span></a></td>
								    		<td width="20px"></td>
								    		<td id="btn01"><a href="#"><span id="listBtn">목록</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
</body>
</html>