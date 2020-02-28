<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>프로모션설정</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	//리스트이동
	j$("#cancelBtn").click(function(){
		location.href = "/madm/service/exposure/promotion";
	});
	
	j$('.modify').click(function() {
		var key = j$(this).attr("value");
		j$("#modifytype").val(key);
		
		if( j$("input[id=check]:checked").length == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}

		j$.alert("변경 하시겠습니까?", function() {
			j$('input:checkbox[name="goodsCdArr"]:unchecked').each(function(){
				j$(this).parent().parent().remove();
			});

			 j$("#priceForm").submit();
		}, function() {
		}); // end alert
	});
	
	
	//프로모션 정보
	j$("#modifypromotion").click(function(){
		j$("#priceForm").attr("action","/madm/service/exposure/modifypromotion");
		j$("#priceForm").submit();
	});
	
	//상품등록
	j$("#addpoods").click(function(){
		j$("#priceForm").attr("action","/madm/service/exposure/addpgoods");
		j$("#priceForm").submit();
	});
	
	
	$('input:checkbox[name="goodsCdArr"]').click(function() {
		if (this.checked) {
			$(this).parent().parent().find("td").eq(7).children("input").attr("readonly",false);
			$(this).parent().parent().find("td").eq(8).children("input").attr("readonly",false);
			$(this).parent().parent().find("td").eq(9).children("select").attr("disabled",false);
			$(this).parent().parent().find("td").eq(10).children("input").attr("readonly",false);
		} else {
			$(this).parent().parent().find("td").eq(7).children("input").attr("readonly",true);
			$(this).parent().parent().find("td").eq(8).children("input").attr("readonly",true);
			$(this).parent().parent().find("td").eq(9).children("select").attr("disabled",true);
			$(this).parent().parent().find("td").eq(10).children("input").attr("readonly",true);
		}
	});

});


</script>
</head>
<body>


<form id="priceForm" name="priceForm" action="/madm/service/exposure/modifyprice" method="POST">
<input type="hidden" name="prmCd" id="prmCd" value="${param.prmCd }">
<input type="hidden" id="modifytype" name="modifytype"  value=""  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">프로모션설정</td>
				</tr>
			</table>
			<tr>
				<td height="10px"></td>
			</tr>

			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
				    	<td class="line" align="center" bgcolor="#F5F5F5" ><a href="#" id="modifypromotion">프로모션 정보</a></td>
				    	<td class="line" align="center" bgcolor="#F5F5F5" ><a href="#" id="addpoods">판매상품 등록</a></td>
				    	<td class="line" align="center" bgcolor="#ababab" >판매 정보 관리</td>
				</table>
				</td>
			</tr>
			<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="left">
												<strong>총 ${paging.totalCount} 건 </strong> 
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th rowspan="2">선택</th>
											<th rowspan="2">상품코드</th>
											<th rowspan="2">상품유형</th>
											<th rowspan="2">CSP업체명</th>
											<th rowspan="2">상품명</th>
											<th colspan="2">현재상품긍액</th>
											<th colspan="2">프로모션금액</th>
											<th rowspan="2">사용여부</th>
											<th rowspan="2">정렬순서</th>
										</tr>
										<tr>
											<th>판매가</th>
											<th>매입가</th>
											<th>판매가</th>
											<th>매입가</th>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td ><input type="checkbox" id="check" name="goodsCdArr" value="${list.goodsCd}" /></td>
											<td >${list.goodsCd }</td>
											<td >${list.goodsTypeNm }</td>
											<td >${list.cspNm }</td>
											<%-- <td ><input type="text" name="goodsNmArr" value="${list.prmGoods }">  </td> --%>
											<td >${list.prmGoods }<input type="hidden" name="goodsNmArr" value="${list.prmGoods }" /></td>
											<td >${list.salePrice }</td>
											<td >${list.buyPrice }</td>
											<td >
												<input type="text" name="saleArr" value="${list.prmSalePrice }" size="10" readonly />
											</td>
											<td >
												<input type="text" name="buyArr" value="${list.prmBuyPrice }" size="10" readonly />
											</td>
											<td >
									    		<select name="statusArr" disabled>
									    			<c:if test="${list.statusCd eq null || list.statusCd eq ''}">
									    				<option value="">미선택</option>
									    			</c:if>
									    			<option value="100820" ${list.statusCd == "100820" ? ' selected' : ''}>사용</option>
									    			<option value="100821" ${list.statusCd == "100821" ? ' selected' : ''}>미사용</option>
									    		</select>
											</td>
											<td >
												<input type="text" name="sortArr" value="${list.sort }" size="10" readonly />
											</td>
										</tr>
										</c:forEach>
									</table>
									<br>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td align="center">
						<ui:paging value="${paging}"
							btnFirst="${url:img('/images/btn_first.jpg')}"
							btnPrev="${url:img('/images/btn_prev.jpg')}"
							btnNext="${url:img('/images/btn_next.jpg')}"
							btnLast="${url:img('/images/btn_last.jpg')}" />
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
											<td id="btn01"><a href="#" class="modify" value="update" ><span>저장하기</span></a></td>
								    		<td id="btn01"><a href="#" class="modify" value="del" ><span>상품삭제</span></a></td>
											<td id="btn01"><a href="#" id="cancelBtn" value="cancel" ><span>리스트이동</span></a></td>
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
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>
