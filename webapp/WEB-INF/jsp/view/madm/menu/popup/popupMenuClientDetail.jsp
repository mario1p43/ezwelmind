<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>
$(document).ready(function() {
	
	$(".clientAddModifyBtn").click(function() {
		
		var pays = "";
		$("input:checkbox[name='payCheck']:checked").each(function() {
			pays += $(this).val() + "|";
		});
		pays = pays.substring(0, pays.length - 1);
		
		
		var params = {};
		params.clientCd = j$(".popupClientCd").val();
		params.payType = pays;
		params.useYn = j$("#useYn").val();
		params.dispYn = j$("#dispYn").val();
		params.menuSeq = '${param.menuSeq}';
		params.menuGroup = '${param.menuGroup}';
		
		if (params.clientCd == "") {
			alert("고객사를 선택해주세요.");
			return;
		}
		
		if ($(this).attr("id") == "update"){
			params.clientUpdate = true;
		} else {
			// add
			params.clientUpdate = false;
		}

		
		$.ajax({
			url: "/madm/menu/addClient",
			data: params,
			dataType: "json",
			type: 'POST',
			success: function(data, textStatus) {
				if (data.err == 1) {
					alert("이미 등록되어 있는 고객사입니다.");
					return 0;
				}
				alert("등록되었습니다.");
				
				$('body').css({overflow:'visible'});
				$("#clientDetail").parent().fadeOut();
				$("#clientDetail").parent().remove();
				
				getClientList(params); // 부모 함수 호출하여서 새로고침
				return false;

			}
		});
	});
	
	$("#clientDetailSearch").click(function() {
		$.divPop("mindClientList", "고객사", "/madm/layerPopup/clientListPopup" );
	});

	
	<c:if test='${not empty clientDetail.payType}'>
		var chkValue = '${clientDetail.payType}';
		var chkArr = chkValue.split("|");
		for (var i = 0; i < chkArr.length; i++) {
			$('[name=payCheck][value=' + chkArr[i] + ']').attr('checked',true);
		}
	</c:if>
	
}); // end ready;

</script>

<input class="popupClientCd"  type="hidden" value="${clientDetail.clientCd}"  />

<table id="partnerCodePopupTable2" cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:583px;" >
	<tr>
		<td>고객사명</td>
		<td><input class="popupClientInfo" type="text" value="${clientDetail.clientNm}" readonly />
			<c:if test="${empty clientDetail.clientCd}">
				<input id="clientDetailSearch" type="button" value="검색"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>결제수단</td>
		<td>
			<c:forEach var="list"  items="${ payList }" varStatus="status">
				<input type="checkbox" name="payCheck" value="${list.commCd}">${list.commNm} 
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>사용여부</td>
		<td>
			<select id="useYn">
				<option value="Y" <c:if test="${clientDetail.useYn eq 'Y'}">selected</c:if> >Y</option>
				<option value="N" <c:if test="${clientDetail.useYn eq 'N'}">selected</c:if> >N</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>노출여부</td>
		<td>
			<select id="dispYn">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select>
		</td>
	</tr>
</table>

<br>

<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left">
			<c:if test="${not empty clientDetail.clientCd}">
				<input id="update"  class="clientAddModifyBtn" type="button" style="height:30px;width:50px;" value="수정"/>
			</c:if>
			<c:if test="${empty clientDetail.clientCd}">
				<input id="add"  class="clientAddModifyBtn" type="button" style="height:30px;width:50px;" value="등록"/>
			</c:if>
		</td>
	</tr>
</table>

