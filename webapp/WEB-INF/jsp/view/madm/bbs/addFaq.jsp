<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>FAQ 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){
	/* j$("#reqCd2").on("change", function() {
	    var str = "";
	    $( "select option:selected" ).each(function() {
		     str = j$(this).attr("id");
	    });
	    j$("#bbsCd").val(str);
	}); */

	j$("#insertBtn").click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		oEditors[1].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.

		j$("#addFaq").submit();
		return false;
	});

	j$("#cancleBtn").click(function(){
		var url =  "/madm/bbsFaq/list?serviceType=" + j$("#serviceType").val() + "&bbsCd=faq";
		location.href = url;
		return false;
	});
	
	j$("#checkAll").click(function(){
		if ( $("#checkAll").prop('checked') ) {
			j$("input[id^=check_]").prop('checked',true);
		}else if( $("#checkAll").prop('checked') == false ){
			j$("input[id^=check_]").prop('checked',false);
		}
	});
});


j$(function(){

	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
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
	    oAppRef: oEditors,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
    	},
	    fCreator: "createSEditor2"
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
</head>
<body>
<form:form id="addFaq" modelAttribute="bbsAddDto" action="/madm/bbsFaq/addFaq" method="POST">
<input type="hidden" id="serviceType" name="serviceType" value="${serviceType }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr><td height="20px"><td><tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
			    	FAQ 등록
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
		        <tr>
		            <td class="line" width="12%" height="40px" align="center" bgcolor="#F5F5F5">
		            	구분
		            	<input type="hidden" name="bbsCd" id="bbsCd" value="faq"/>
		            </td>
		            <td width="38%">
		            	<c:choose>
							<c:when test="${serviceType eq 'SANGDAM4U' }">
								<table>
									<tr>
										<td>
											FAQ :
											<select id="sel01" onchange="codeChange();">
												<option value="100704">유형별</option>
												<option value="100705">서비스별</option>
											</select>
										</td>
										<td>
											&nbsp;구분1 : <comm:select name="reqCd1" id="sel02" onchange="codeChangeSel();" code="100704"  basicValue="------선택------" selectValue="${bbsAddDto.reqCd1}"/>
										</td>
										<td>
											<div id="serviceFaqView" style="display: none;">
												&nbsp;구분2 : <comm:select name="reqCd2" id="sel03" code=""  basicValue="------선택------" selectValue="${bbsAddDto.reqCd2}"/>
											</div>
										</td>
									</tr>
								</table>
							</c:when>
							<c:when test="${serviceType eq 'HOME' }">
								<comm:select name="reqCd1" code="100286"  basicValue="------선택------" selectValue="${bbsAddDto.reqCd1}"/>
							</c:when>
						</c:choose>
					</td>
					<td class="line" width="12%" align="center" bgcolor="#F5F5F5">등록자</td>
		            <td width="38%" align="left">
		            	<sec:authentication property="principal.user.userNm"/>
					</td>
		        </tr>
		        <tr>
		            <td class="line" width="" align="center" bgcolor="#F5F5F5">질문</td>
		            <td colspan="3">
		            	<textarea rows="5" cols="30" id="ir2" name="subject" style="width:100%; height:200px;"></textarea>
		            </td>
		        </tr>
		        <tr>
		            <td class="line" width="" align="center" bgcolor="#F5F5F5">답변</td>
		            <td colspan="3">
		                <textarea rows="10" cols="30" id="ir1" name="content" style="width:100%; height:200px;"></textarea>
		            </td>
		        </tr>
		        <tr>
		            <td class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출</td>
		            <td colspan="3">
						<input type="radio" name="dispYn" value="Y" checked> 노출
						<input type="radio" name="dispYn" value="N"> 비노출
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
		<!-- 배너 정보 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사선택</th>
		    	<td class="line">
    				<table>
						<tr>
    						<td style="color: #2E64FE;">
    							<input type="checkbox" name="allClientYn" id="checkAll" value="Y">
    							<label for="checkAll"><strong>전체선택</strong></label>
    						</td>
    					</tr>
		    			<c:forEach var="list" items="${clientList}" varStatus="idx">
	    					<c:if test="${(idx.index mod 4) eq 0 }"><tr></c:if>
			    				<td width="200px">
			    					<input type="checkbox" name="clientCdArr" id="check_${list.clientCd }" value="${list.clientCd }">
			    					<label for="check_${list.clientCd }">${list.clientNm }</label>
			    				</td>
	    					<c:if test="${(idx.index mod 4) eq 3 }"></tr></c:if>
						</c:forEach>
    				</table>
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
		    		<input type="button" id="insertBtn" value="저장" style="height:30px; width:100px;">
		    		<span style="margin-left: 20px;"></span>
		    		<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
		    	</td>
			</tr>
		</table>
	</td>
</tr>
</table>

</form:form>

</body>
</html>