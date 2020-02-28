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
	
	//today -15
	ct.setDate(ct.getDate()-8);
	String hma = fmt.format(ct);
	
	//today -30
	ct.setDate(ct.getDate()-15);
	String oma = fmt.format(ct);

	//today -60
	ct.setDate(ct.getDate()-30);
	String tma = fmt.format(ct);
	
%>
<html>
<head>
<title>등록대기상품</title>
<script type="text/javascript">
j$(document).ready(function(){
	j$('.date_timepicker_from').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_to').val()?j$('.date_timepicker_to').val():false
			})
		},
		timepicker:false
	});

	j$("#fromDt").click(function(){
		j$('.date_timepicker_from').datetimepicker('show');
	});

	j$('.date_timepicker_to').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_from').val()?j$('.date_timepicker_from').val():false
			})
		},
		timepicker:false
	});

	j$("#toDt").click(function(){
		j$('.date_timepicker_to').datetimepicker('show');
	});
	
	
	
	j$('.searchbtn').click(function() {
		var fromDt = j$('.date_timepicker_from').val()
		var toDt = j$('.date_timepicker_to').val()

		if(fromDt == "" && toDt != "" ){
			alert("등록일 시작기간 조건을 확인해 주세요.");
			return;
		}

		if(fromDt != "" && toDt == "" ){
			alert("등록일 종료기간 조건을 확인해 주세요.");
			return;
		}
		
		 j$("#adddelayForm").submit();
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
			
			j$("#adddelayForm").attr("action","/partner/service/management/modify");
			j$("#adddelayForm").submit();
		}, function() {
		}); // end alert
	});
	
	j$("#selectcount , #selectoption").change(function(){
		j$(".searchbtn").trigger("click");
	});
	
});

function jsSearchDate(arg) {
	
	var fr = document.adddelayForm;
	var startDt = "reqFromDt";
	var endDt	= "reqToDt";
	
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

function jsSearchDateClear() {
	var startDt = "reqFromDt";
	var endDt	= "reqToDt";
	var fr = document.adddelayForm;

	fr.elements[startDt].value = "";
	fr.elements[endDt].value = "";
}

function detail(Cd,Type){
	j$("#adddelayForm").attr("action","/partner/service/management/modifyGoods?goodsCd="+Cd+"&goodsType="+Type);
	j$("#adddelayForm").submit();
}
</script>
</head>
<body>

<form id="adddelayForm" name="adddelayForm" action="/partner/service/management/adddelaygoods" method="POST">
<input type="hidden" id="formtype" name="formtype"  value="delay"  />
<input type="hidden" id="modifytype" name="modifytype"  value=""  />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">등록대기상품</td>
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
								<td bgcolor="#F5F5F5" align="center"><strong>승인유무</strong></td>
								<td colspan="3">
									<input type="radio" name="approve" value="" ${param.approve=="" ? 'checked' : '' }> 전체
									<input type="radio" name="approve" value="100801" ${param.approve=="100801" ? 'checked' : '' }> 등록대기
									<input type="radio" name="approve" value="100802" ${param.approve=="100802" ? 'checked' : '' }> 가격변동
									<input type="radio" name="approve" value="100803" ${param.approve=="100803" ? 'checked' : '' }> 판매중지
								</td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>상품검색</strong></td>
						    	<td align="left" colspan="3">
						    		<select id="selectgoods" name="selectgoods" >
						    			<option value="">선택</option>
						    			<option value="code" ${param.selectgoods == "code" ? ' selected' : ''}>상품코드</option>
						    			<option value="name" ${param.selectgoods == "name" ? ' selected' : ''}>상품명</option>
						    		</select>
						    		<input type="text" id="searchgoods" name="searchgoods" value="${param.searchgoods }" />
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>가격별검색</strong></td>
						    	<td align="left" colspan="3">
						    		<select id="selectamount" name="selectamount" >
						    			<option value="">선택</option>
						    			<option value="sale" ${param.selectamount == "sale" ? ' selected' : ''}>판매가</option>
						    			<option value="buy" ${param.selectamount == "buy" ? ' selected' : ''}>매입가</option>
						    		</select>
						    													
						    	<input type="text" id="amount1" name="amount1" value="${param.amount1 }" />
						    	~
						    	<input type="text" id="amount2" name="amount2" value="${param.amount2 }" />
						    	</td>
							</tr>
							<tr>
								<th scope="col">등록일</th>
								<td colspan="3">
										<input type="text" name="reqFromDt" size="10" class="date_timepicker_from" value="${param.reqFromDt}"/>
									<img id="fromDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
										&nbsp;~&nbsp;
										<input type="text" name="reqToDt" size="10" class="date_timepicker_to" value="${param.reqToDt}"/>
									<img id="toDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
										<input type="button" value="오늘" onclick="javascript:jsSearchDate('today');" >
										<input type="button" value="일주일" onclick="javascript:jsSearchDate('week');" >
										<input type="button" value="15일" onclick="javascript:jsSearchDate('halfMonth');" >
										<input type="button" value="한달" onclick="javascript:jsSearchDate('month');" >
										<input type="button" value="두달" onclick="javascript:jsSearchDate('twoMonths');" >
										<input type="button" value="전체" onclick="javascript:jsSearchDateClear();" >
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
											<td align="right">
												<select id="selectcount" name="selectcount" >
													<option value="20" ${param.selectcount == "20" ? ' selected' : ''}>20건</option>
													<option value="30" ${param.selectcount == "30" ? ' selected' : ''}>30건</option>
													<option value="50" ${param.selectcount == "50" ? ' selected' : ''}>50건</option>
												</select> 
												<select id="selectoption" name="selectoption" >
													<option value="code" ${param.selectoption == "code" ? ' selected' : ''}>상품코드순</option>
													<option value="name" ${param.selectoption == "name" ? ' selected' : ''}>상품명순</option>
													<option value="modi" ${param.selectoption == "modi" ? ' selected' : ''}>수정일순</option>
													<option value="price1" ${param.selectoption == "price1" ? ' selected' : ''}>높은가격순</option>
													<option value="price2" ${param.selectoption == "price2" ? ' selected' : ''}>낮은가격순</option>
													<option value="csp" ${param.selectoption == "csp" ? ' selected' : ''}>업체명순</option>
												</select>
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
											<th >상품코드</th>
											<th >CSP업체명</th>
											<th >상품명</th>
											<th >정상가</th>
											<th >매입가</th>
											<th >판매가</th>
											<th >수익률</th>
											<th >승인유무</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td ><input type="checkbox" id="check" name="goodsCdArr" value="${list.goodsCd}" /></td>
											<td ><a href="javascript:detail( '${list.goodsCd} ', '${list.goodsType} ');"  >${list.goodsCd }</a></td>
											<td >${list.cspNm }</td>
											<td ><a href="javascript:detail( '${list.goodsCd} ', '${list.goodsType} ');"  >${list.goodsNm }</a></td>
											<td >${list.normalPrice }원</td>
											<td >${list.buyprice }원</td>
											<td >${list.salePrice }원</td>
											<td >${list.disRate }%</td>
											<td >${list.statusNm }</td>
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
				
				<tr>
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td id="btn01"><a href="#" class="modify" value="del" ><span>상품삭제</span></a></td>
											<td id="btn01"><a href="#" class="modify" value="stop" ><span>판매중지</span></a></td>
											<td id="btn01"><a href="#" class="modify" value="start" ><span>판매하기</span></a></td>
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
