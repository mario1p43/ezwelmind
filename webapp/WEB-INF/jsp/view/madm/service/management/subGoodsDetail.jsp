<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배송상품 주문 상세</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#okBtn").click(function(){
		$("#subGoodsForm").submit();
	});
	$("#saveBtn").click(function(){
		if(confirm("수정 하시겠습니까?")){
			$.ajax({
				url: '/madm/service/management/updateDlvr',
				type: 'post',
				data: $("[name=subGoodsForm]").serialize(),
				dataType: 'json',
				success: function(data){
					alert("수정되었습니다.");
					location.reload();
				}
			});
		}
	});
	
});
</script>
</head>
<body>
<form id="subGoodsForm" name="subGoodsForm" action="/madm/service/management/getSubGoodsList" method="POST">
<input type="hidden" name="orderNum" value="${subOrder.orderNum}">
<table cellpadding="0" cellspacing="0" border="0" width="100%" >
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">배송상품 주문 상세</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 주문정보</h3></td>
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">주문번호</th>
				    	<td class="line" colspan="3"  >
				    		${subOrder.orderNum}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">주문일시</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.orderDt}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">주문취소일시</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.cancelDt}
				    	</td>
				    </tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 주문자정보</h3></td>
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">고객사코드</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.clientCd}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">고객사명</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.clientNm}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">임직원 ID</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.userId}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">임직원 사번</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.empNum}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">주문자명</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.userNm}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">주민번호</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.rrn}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">휴대폰</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.sndMobile}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">전화번호</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.sndTelNum}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">이메일</th>
				    	<td class="line" colspan="3"  >
				    		${subOrder.sndEmail}
				    	</td>
				    </tr>
				</table>
				</td>
			</tr>
			
			<c:forEach var="list" items="${subOrderGoodsList}" varStatus="status">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td><h3>* 주문상품정보</h3></td>
				</tr>
				<tr>
					<td>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">상품코드</th>
					    	<td class="line" width="35%"  >
					    		<input type="hidden" name="goodsCdArr" value="${list.goodsCd}">
					    		${list.goodsCd}
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">상품명</th>
					    	<td class="line" width="35%"  >
					    		${list.goodsNm}
					    	</td>
					    </tr>
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">카테고리</th>
					    	<td class="line" colspan="3"  >
					    		${list.menuNm}
					    	</td>
					    </tr>
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">판매단가</th>
					    	<td class="line" width="35%"  >
					    		${list.salePrice}
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">매입단가</th>
					    	<td class="line" width="35%"  >
					    		${list.buyprice}
					    	</td>
					    </tr>
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">구매수량</th>
					    	<td class="line" width="35%"  >
					    		${list.orderQty}
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">배송비</th>
					    	<td class="line" width="35%"  >
					    		${list.dlvrPrice}
					    	</td>
					    </tr>
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">배송사</th>
					    	<td class="line" width="35%"  >
					    		<select name="dlvrCdArr">
					    			<c:forEach var="dlvrList" items="${dlvrList}" varStatus="status">
					    				<option value="${dlvrList.dlvrCd}" ${list.dlvrCd == dlvrList.dlvrCd ? ' selected' : ''}>${dlvrList.dlvrNm}</option>
					    			</c:forEach>
					    		</select>
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">송장번호</th>
					    	<td class="line" width="35%"  >
					    		<input type="text" name="dlvrNoArr" value="${list.dlvrNo}">
					    	</td>
					    </tr>
						<tr>
							<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">필수입력내용</th>
					    	<td class="line" colspan="3"  >
					    		${list.requiredInput}
					    	</td>
					    </tr>
					</table>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 수취인정보</h3></td>
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">수취인명</th>
				    	<td class="line" colspan="3"  >
				    		${subOrder.rcvrNm}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">휴대폰번호</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.rcvrMobile}
				    	</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">전화번호</th>
				    	<td class="line" width="35%"  >
				    		${subOrder.rcvrTelNum}
				    	</td>
				    </tr>
					<tr>
						<th class="line" width="15%"  align="left" bgcolor="#F5F5F5">주소</th>
				    	<td class="line" colspan="3"  >
				    		${subOrder.rcvrAddr1} ${subOrder.rcvrAddr2} (${subOrder.rcvrPost})
				    	</td>
				    </tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td>
								    		<button id="saveBtn" style="height:30px; width:100px;" type="button">수정</button>
								    		<button id="okBtn" style="height:30px; width:100px;" type="button">돌아가기</button>
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
	</td>
</tr>
</table>
</form>
</body>
</html>