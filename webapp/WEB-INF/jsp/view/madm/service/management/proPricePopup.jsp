<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>프로모션 가격관리 팝업</title>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('.modify').click(function() {
		
		if($("input[id=check]:checked").length == 0 ) {
			alert("선택된 값이 없습니다.");
			return;
		}
	
		if(confirm("변경 하시겠습니까?")){
			$('input:checkbox[name="prmCdArr"]').each(function(){
				console.log($(this).is(":checked"));
				if(!$(this).is(":checked")){
					$(this).parent().parent().remove();
				}
			});
	
			$.ajax({
				url: '/madm/service/management/updateProPrice',
				type: 'post',
				data: $("[name=proPriceForm]").serialize(),
				dataType: 'json',
				success: function(data){
					alert("수정되었습니다.");
					self.close();
				}
			});

			//$("#proPriceForm").submit();
		}
	});

	$('input:checkbox[name="prmCdArr"]').click(function() {
		if (this.checked) {
			$(this).parent().parent().find("td").eq(4).children("input").attr("readonly",false);
			$(this).parent().parent().find("td").eq(5).children("input").attr("readonly",false);
			$(this).parent().parent().find("td").eq(6).children("select").attr("disabled",false);
		} else {
			$(this).parent().parent().find("td").eq(4).children("input").attr("readonly",true);
			$(this).parent().parent().find("td").eq(5).children("input").attr("readonly",true);
			$(this).parent().parent().find("td").eq(6).children("select").attr("disabled",true);
		}
	});

});

</script>
</head>
<body>
<form id="proPriceForm" name="proPriceForm" action="/madm/service/management/updateProPrice" method="POST">
<input type="hidden" name="goodsCd" value="${goodsCd}">
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">
						프로모션 리스트
					</td>
				</tr>
			</table>

	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
				<tr>
					<td>
						<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
							<tr align="center" height="50px">
								<th>선택</th>
								<th>프로모션 코드</th>
								<th>프로모션 제목</th>
								<th>진행상태</th>
								<th>판매가</th>
								<th>매입가</th>
								<th>사용여부</th>
							</tr>
							<c:forEach var="list" items="${proPriceList}" varStatus="status">
								<tr align="center" height="30px">
									<td><input type="checkbox" id="check" name="prmCdArr" value="${list.prmCd}" /></td>
									<td>${list.prmCd }</td>
									<td>${list.prmNm }</td>
									<td>${list.prmStatusNm }</td>
									<td>
										<input type="text" name="saleArr" value="${list.prmSalePrice }" size="10" readonly />
									</td>
									<td>
										<input type="text" name="buyArr" value="${list.prmBuyPrice }" size="10" readonly />
									</td>
									<td>
							    		<select name="statusArr" disabled>
							    			<c:if test="${list.prmGoodsStatus eq null || list.prmGoodsStatus eq ''}">
							    				<option value="">미선택</option>
							    			</c:if>
							    			<option value="100820" ${list.prmGoodsStatus == "100820" ? ' selected' : ''}>사용</option>
							    			<option value="100821" ${list.prmGoodsStatus == "100821" ? ' selected' : ''}>미사용</option>
							    		</select>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
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
					    		<td id="btn01">
					    			<input type="button" class="modify" value="수정하기" />
					    		</td>
			    			</tr>
			    		</table>
			    	</td>
				</tr>
			</table>
			<!-- 버튼 영역 종료 -->
		</td>
	</tr>

</table>
</form>
</body>
</html>
