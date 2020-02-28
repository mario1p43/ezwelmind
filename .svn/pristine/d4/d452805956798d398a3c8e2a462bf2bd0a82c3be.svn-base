<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>프로모션설정</title>
<script type="text/javascript">
j$(document).ready(function(){
	j$('.date_timepicker_from').datetimepicker({
		format:'Ymd',
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
		format:'Ymd',
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
	
	
	
	//리스트이동
	j$("#cancelBtn").click(function(){
		location.href = "/madm/service/exposure/promotion";
	});
	
	//등록하기
	j$("#insertBtn").click(function(){
		var selectDisplay = j$('[name=selectdisplay]').val();
		var selectSort = j$('[name=selectsort]').val();
		var selectPerNo = j$('[name=selectperNo]').val();
		
		$.validate({
			form : '#modifypromotionForm',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
				if(selectDisplay == ""){
					alert("전시유형을 선택해주세요.");
					return false;
				}else if(selectSort == ""){
					alert("상품정렬방법을 선택해주세요.");
					return false;			
				}else if(selectPerNo == ""){
					alert("페이지 당 상품 수를 선택해주세요.");
					return false;
				}
				
			}
			
		});
		

		j$("#modifypromotionForm").submit();
	});
	
	//상품등록
	j$("#addpoods").click(function(){
		j$("#modifypromotionForm").attr("action","/madm/service/exposure/addpgoods");
		j$("#modifypromotionForm").submit();
	});
	
	//판매가관리
	j$("#price").click(function(){
		j$("#modifypromotionForm").attr("action","/madm/service/exposure/price");
		j$("#modifypromotionForm").submit();
	});
	
});

function menuPopup() {
	window.open("/madm/service/exposure/menuPopup?Oform=modify", "menuPopup", "width=600, height=400,  scrollbars=1");
}

</script>
</head>
<body>
<form id="modifypromotionForm" name="modifypromotionForm" action="/madm/service/exposure/modify" method="POST" enctype="multipart/form-data">
<input type="hidden" name="promotionmenuCd" id="promotionmenuCd" value="${vo.menuCd }">
<input type="hidden" name="prmCd" id="prmCd" value="${vo.prmCd }">

<table cellpadding="0" cellspacing="0" border="0" width="100%"  >
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
					    	<td align="left" class="subtitle">프로모션설정</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
				    	<td class="line" align="center" bgcolor="#ababab" >프로모션 정보</td>
				    	<td class="line" align="center" bgcolor="#F5F5F5" ><a href="#" id="addpoods">판매상품 등록</a></td>
				    	<td class="line" align="center" bgcolor="#F5F5F5" ><a href="#" id="price">판매 정보 관리</a></td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
						<th class="line"  align="left" bgcolor="#F5F5F5">프로모션코드</th>
				    	<td class="line"  >${vo.prmCd }</td>
				    	<th class="line"  align="left" bgcolor="#F5F5F5">진행상태</th>
				    	<td class="line"  >${vo.statusNm }</td>
				    	<th class="line"  align="left" bgcolor="#F5F5F5">등록상품 수</th>
				    	<td class="line"  >${vo.goodsCount }</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<!-- <tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0" width="95%" align="left">
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr>
										</td>
										<td align="right">
											<input type="button" id="addpoods" value="상품등록">
											<input type="button" id="price" value="판매가관리">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr> -->
				
				
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 프로모션 정보</td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" align="left" bgcolor="#F5F5F5">프로모션메뉴</th>
				    	<td class="line" >
				    		<input type="text" name="promotionmenu" value="${vo.menuNm }" style="width: 150px;" data-validation="required" data-validation-error-msg="프로모션 메뉴를 선택해 주세요."/>
				    		<input type="button" value="메뉴설정" onclick="javascript:menuPopup();" >
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">프로모션 제목</th>
				    	<td class="line" >
				    		<input type="text" name="promotionnm" value="${vo.prmNm }" style="width: 150px;" data-validation="required" data-validation-error-msg="프로모션 제목을 입력해 해주세요."/>
				    		
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">프로모션내용</th>
						<td class="line" >
							<textarea rows="5" cols="10" id="ir1" name="acontent" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="프로모션 내용을 입력해 해주세요." >${vo.content }</textarea>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">판매기간</th>
						<td class="line" colspan="3">
							<input type="text" name="mreqFromDt" size="10" class="date_timepicker_from" value="${vo.stdt}" data-validation="required" data-validation-error-msg="판매기간을 입력해 해주세요." />
							<img id="fromDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="mreqToDt" size="10" class="date_timepicker_to" value="${vo.eddt}" data-validation="required" data-validation-error-msg="판매기간을 입력해 해주세요." />
							<img id="toDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
						</td>
					</tr>	
				</table>		
				</td>
			</tr>



			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>* 프로모션 설정</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" align="left" bgcolor="#F5F5F5">전시유형</th>
				    	<td class="line" >
				    		<comm:select name="selectdisplay" code="100809"  basicValue="--선택--" selectValue="${vo.display }" />
				    	</td>
				    	<th class="line" align="left" bgcolor="#F5F5F5">상품정렬방법</th>
				    	<td class="line" >
				    		<comm:select name="selectsort" code="100812"  basicValue="--선택--" selectValue="${vo.sort }" />
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">페이지 당 상품수</th>
				    	<td class="line" >
				    		<select name="selectperNo" >
				    			<option value="" >--선택--</option>
				    			<option value="12" ${vo.perNo == "12" ? 'selected':''}>12</option>
				    			<option value="16" ${vo.perNo == "16" ? 'selected':''}>16</option>
				    			<option value="20" ${vo.perNo == "20" ? 'selected':''}>20</option>
				    			<option value="30" ${vo.perNo == "30" ? 'selected':''}>30</option>
				    			<option value="40" ${vo.perNo == "40" ? 'selected':''}>40</option>
				    			<option value="80" ${vo.perNo == "80" ? 'selected':''}>80</option>
				    			<option value="100" ${vo.perNo == "100" ? 'selected':''}>100</option>
				    		</select>
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
								    		<button id="insertBtn" style="height:30px; width:100px;" type="button">수정하기</button>
								    		<button id="cancelBtn" style="height:30px; width:100px;" type="button">리스트이동</button>
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