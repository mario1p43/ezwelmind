<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date ct = new Date();
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM/dd");
	
	//today
	String today = fmt.format(ct);
	
	//today-7
	ct.setDate(ct.getDate()-7);
	String owa = fmt.format(ct);
	
	//today -15(7+8)
	ct.setDate(ct.getDate()-8);
	String hma = fmt.format(ct);
	
	//today -30(7+8+15)
	ct.setDate(ct.getDate()-15);
	String oma = fmt.format(ct);

	//today -60(7+8+15+30)
	ct.setDate(ct.getDate()-30);
	String tma = fmt.format(ct);
	
%>
<html>
<head>
<title>배송상품 주문 리스트</title>
<script type="text/javascript">
j$(document).ready(function(){
	j$('.date_timepicker_orderFromDt').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_orderToDt').val()?j$('.date_timepicker_orderToDt').val():false
			})
		},
		timepicker:false
	});

	j$('.date_timepicker_orderToDt').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_orderFromDt').val()?j$('.date_timepicker_orderFromDt').val():false
			})
		},
		timepicker:false
	});

	j$('.date_timepicker_modFromDt').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_modToDt').val()?j$('.date_timepicker_modToDt').val():false
			})
		},
		timepicker:false
	});

	j$('.date_timepicker_modToDt').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_modFromDt').val()?j$('.date_timepicker_modFromDt').val():false
			})
		},
		timepicker:false
	});

	j$("#orderFromDtImg").click(function(){
		j$('.date_timepicker_orderFromDt').datetimepicker('show');
	});

	j$("#orderToDtImg").click(function(){
		j$('.date_timepicker_orderToDt').datetimepicker('show');
	});
	
	j$("#modFromDtImg").click(function(){
		j$('.date_timepicker_modFromDt').datetimepicker('show');
	});

	j$("#modToDtImg").click(function(){
		j$('.date_timepicker_modToDt').datetimepicker('show');
	});
	
	j$('.searchbtn').click(function() {
		 j$("#subGoodsForm").submit();
	});
	
	$('.modify').click(function() {
		
		if( $("input[id=check]:checked").length == 0 ) {
			 $.alert("선택된 값이 없습니다.");
			 return;
		}
		if($("#modifyOrderStatus").val() == ""){
			$.alert("변경하실 처리 상태를 선택해주세요.");
			return;
		}

		if(confirm("변경 하시겠습니까?")){
			j$('input:checkbox[name="orderNumArr"]:unchecked').each(function(){
				j$(this).parent().parent().remove();
			});

		
			 j$("#subGoodsForm").attr("action","/partner/service/management/modifySubOrderStatus");
			 j$("#subGoodsForm").submit();
		}
	});
	
});

function goOrderCancel(orderNum, counselCd, orderType) {
	var returnValue = confirm("주문을 취소하시겠습니까?");
	if (returnValue) {
		j$("input[name=orderNum]").val(orderNum);
		j$("input[name=counselCd]").val(counselCd);
		j$("input[name=orderType]").val(orderType);
		
		var formData = j$("form[name=subGoodsForm]").serialize();
		j$.ajax({
		    type: "POST",
		    data: formData,
		    dataType: 'json',
			url: "/cancel/cancelOrder",
			success: function (response) {
				alert("주문 취소 되었습니다.");
				location.reload();
			}
		});
	}
}

function jsSearchOrderDate(arg) {
	
	var fr = document.subGoodsForm;
	var startDt = "orderFromDt";
	var endDt	= "orderToDt";
	
    if (arg == "today") { //오늘
    	fr.elements[startDt].value  = "<%=today %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "week") {  //일주일
    	fr.elements[startDt].value  = "<%=owa %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "halfMonth") {  //보름
    	fr.elements[startDt].value  = "<%=hma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "month") {  //한달
    	fr.elements[startDt].value  = "<%=oma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "twoMonths") {  //두달
    	fr.elements[startDt].value  = "<%=tma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    } 
}

function jsSearchOrderDateClear() {
	var startDt = "orderFromDt";
	var endDt	= "orderToDt";
	var fr = document.subGoodsForm;

	fr.elements[startDt].value = "";
	fr.elements[endDt].value = "";
}

function jsSearchModDate(arg) {
	
	var fr = document.subGoodsForm;
	var startDt = "modFromDt";
	var endDt	= "modToDt";
	
    if (arg == "today") { //오늘
    	fr.elements[startDt].value  = "<%=today %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "week") {  //일주일
    	fr.elements[startDt].value  = "<%=owa %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "halfMonth") {  //보름
    	fr.elements[startDt].value  = "<%=hma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "month") {  //한달
    	fr.elements[startDt].value  = "<%=oma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    }
    if (arg == "twoMonths") {  //두달
    	fr.elements[startDt].value  = "<%=tma %>";
    	fr.elements[endDt].value  = "<%=today %>";
    } 
}

function jsSearchModDateClear() {
	var startDt = "modFromDt";
	var endDt	= "modToDt";
	var fr = document.subGoodsForm;

	fr.elements[startDt].value = "";
	fr.elements[endDt].value = "";
}

function jssearchClientClear() {
	j$("#searchClientNm").val("");
	j$("#searchClientCd").val("");
}

function getClientPopup() {
	window.open("/partner/service/management/cspPopup?Oform=sub", "cspPopup", "width=600, height=400,  scrollbars=1");
}

function detail(obj_orderNum){
	j$("input[name=orderNum]").val(obj_orderNum);
	j$("#subGoodsForm").attr("action","/partner/service/management/getSubGoodsDetail");
	j$("#subGoodsForm").submit();
}



</script>
</head>
<body>


<form id="subGoodsForm" name="subGoodsForm" action="/partner/service/management/getSubGoodsList" method="POST">
<input type="hidden" name="orderNum" id="orderNum" />
<input type="hidden" name="counselCd" id="counselCd" />
<input type="hidden" name="orderType" id="orderType" />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td>
			<!-- 검색 영역 시작 -->
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>조회년도</strong></td>
					<td>
			    		<select id="searchYear" name="searchYear" >
			    			<option value="">선택</option>
			    			<option value="2016" ${param.searchYear == "2016" ? ' selected' : ''}>2016</option>
			    		</select>
					</td>
				</tr>
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>고객사명</strong></td>
					<td>
						<input type="text" id="searchClientNm" name=searchClientNm value="${param.searchClientNm }" readonly />
						<input type="hidden" id="searchClientCd" name=searchClientCd value="${param.searchClientCd }" />
						<input type="button" value="찾아보기" onclick="javascript:getClientPopup();" >
						<input type="button" value="초기화" onclick="javascript:jssearchClientClear();" >
					</td>
				</tr>
				<tr>
					<th scope="col">주문일자</th>
					<td colspan="3">
							<input type="text" name="orderFromDt" size="10" class="date_timepicker_orderFromDt" value="${param.orderFromDt}"/>
							<img id="orderFromDtImg" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="orderToDt" size="10" class="date_timepicker_orderToDt" value="${param.orderToDt}"/>
							<img id="orderToDtImg" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							<input type="button" value="오늘" onclick="javascript:jsSearchOrderDate('today');" >
							<input type="button" value="일주일" onclick="javascript:jsSearchOrderDate('week');" >
							<input type="button" value="15일" onclick="javascript:jsSearchOrderDate('halfMonth');" >
							<input type="button" value="한달" onclick="javascript:jsSearchOrderDate('month');" >
							<input type="button" value="두달" onclick="javascript:jsSearchOrderDate('twoMonths');" >
							<input type="button" value="전체" onclick="javascript:jsSearchOrderDateClear();" >
					</td>
					<th scope="col">처리일자</th>
					<td colspan="3">
							<input type="text" name="modFromDt" size="10" class="date_timepicker_modFromDt" value="${param.modFromDt}"/>
							<img id="modFromDtImg" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="modToDt" size="10" class="date_timepicker_modToDt" value="${param.modToDt}"/>
							<img id="modToDtImg" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							<input type="button" value="오늘" onclick="javascript:jsSearchModDate('today');" >
							<input type="button" value="일주일" onclick="javascript:jsSearchModDate('week');" >
							<input type="button" value="15일" onclick="javascript:jsSearchModDate('halfMonth');" >
							<input type="button" value="한달" onclick="javascript:jsSearchModDate('month');" >
							<input type="button" value="두달" onclick="javascript:jsSearchModDate('twoMonths');" >
							<input type="button" value="전체" onclick="javascript:jsSearchModDateClear();" >
					</td>
				</tr>
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>주문번호</strong></td>
			    	<td align="left" colspan="3">
			    		<input type="text" id="searchOrderNum" name="searchOrderNum" value="${param.searchOrderNum }" />
			    	</td>
					<td bgcolor="#F5F5F5" align="center"><strong>주문자명</strong></td>
			    	<td align="left" colspan="3">
			    		<input type="text" id="searchUserNm" name="searchUserNm" value="${param.searchUserNm }" />
			    	</td>
				</tr>
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>주문자ID</strong></td>
			    	<td align="left" colspan="7">
			    		<input type="text" id="searchUserId" name="searchUserId" value="${param.searchUserId }" />
			    	</td>
				</tr>
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>처리상태</strong></td>
			    	<td align="left" colspan="3">
			    		<input type="radio" name="searchOrderStatus" value="" ${param.searchOrderStatus == "" or param.searchOrderStatus == null ? ' checked' : ''}/>전체
			    		<input type="radio" name="searchOrderStatus" value="100960" ${param.searchOrderStatus == "100960" ? ' checked' : ''}/>처리중
			    		<input type="radio" name="searchOrderStatus" value="100782" ${param.searchOrderStatus == "100782" ? ' checked' : ''}/>주문완료
			    		<input type="radio" name="searchOrderStatus" value="100783" ${param.searchOrderStatus == "100783" ? ' checked' : ''}/>주문취소
			    		<input type="radio" name="searchOrderStatus" value="100961" ${param.searchOrderStatus == "100961" ? ' checked' : ''}/>상품준비중
			    		<input type="radio" name="searchOrderStatus" value="100962" ${param.searchOrderStatus == "100962" ? ' checked' : ''}/>배송중
			    		<input type="radio" name="searchOrderStatus" value="100963" ${param.searchOrderStatus == "100963" ? ' checked' : ''}/>배송완료
			    	</td>
					<td bgcolor="#F5F5F5" align="center"><strong>상품명</strong></td>
			    	<td align="left" colspan="3">
			    		<input type="text" id="searchGoodsNm" name="searchGoodsNm" value="${param.searchGoodsNm }" />
			    	</td>
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
			<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td align="left">
									<strong>총 ${paging.totalCount} 건 |</strong> 
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
								<th >선택</th>
								<th >고객사</th>
								<th >주문자명</th>
								<th >주문번호</th>
								<th >주문일<br>주문취소일</th>
								<th >상품명</th>
								<th >배송비</th>
								<th >총금액</th>
								<th >처리상태</th>
							</tr>
							<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="center" height="30px">
								<td ><input type="checkbox" id="check" name="orderNumArr" value="${list.orderNum}" ${list.orderStatus eq "100783" ? ' disabled' : ''}/></td>
								<td >${list.clientNm }</td>
								<td >${list.userNm }</td>
								<td ><a href="javascript:detail( '${list.orderNum} ');"  >${list.orderNum }</a></td>
								<td >
									${list.orderDt }
									<c:if test="${list.cancelDt != null and list.cancelDt ne ''}">
										<br>${list.cancelDt }
									</c:if>
								</td>
								<td >${list.orderNm }</td>
								<td >${list.dlvrPrice }원</td>
								<td >${list.orderAmt }원</td>
								<td >
									${list.orderStatusNm }
									<c:if test="${list.orderStatus ne '100783'}">
										<%-- <br><a href="javascript:goOrderCancel('${list.orderNum} ','${list.counselCd} ','${list.orderType} ');">주문취소</a> --%>
									</c:if>
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
								    		<td id="btn01">
									    		<select id="modifyOrderStatus" name=modifyOrderStatus >
									    			<option value="">선택</option>
									    			<option value="100960">처리중</option>
										    		<option value="100782">주문완료</option>
										    		<!-- <option value="100783">주문취소</option> -->
										    		<option value="100961">상품준비중</option>
									    			<option value="100962">배송중</option>
									    			<option value="100963">배송완료</option>
									    		</select>
								    			<a href="#none" class="modify" value="stop" ><span>처리상태변경</span></a>
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
