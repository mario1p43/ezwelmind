<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>프로모션설정</title>
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
	
	//등록취소
	j$("#cancelBtn").click(function(){
		 location.href = "/madm/service/exposure/promotion";
	});
	
	
	//등록하기
	j$("#insertBtn").click(function(){
		var selectDisplay = j$('[name=selectdisplay]').val();
		var selectSort = j$('[name=selectsort]').val();
		var selectPerNo = j$('[name=selectperNo]').val();
		
		$.validate({
			form : '#addpromotionForm',
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
		
		
		j$("#addpromotionForm").attr("action","/madm/service/exposure/add");
		j$("#addpromotionForm").submit();
	});
	
});

function menuPopup() {
	window.open("/madm/service/exposure/menuPopup?Oform=add", "menuPopup", "width=600, height=400,  scrollbars=1");
}

</script>
</head>
<body>
<form id="addpromotionForm" name="addpromotionForm" action="/madm/service/exposure/promotion" method="POST" enctype="multipart/form-data">
<input type="hidden" name="promotionmenuCd" id=""promotionmenuCd"" value="">

<table cellpadding="0" cellspacing="0" border="0" width="95%"  >
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="95%" align="left" style="border-bottom: 1px solid silver;">
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
				<td><h3>* 프로모션 정보</h3></td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">프로모션메뉴</th>
				    	<td class="line" width="85%" >
				    		<input type="text" name="promotionmenu" value="" style="width: 450px;" data-validation="required" data-validation-error-msg="프로모션 메뉴를 선택해 주세요."/>
				    		<input type="button" value="메뉴설정" onclick="javascript:menuPopup();" >
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">프로모션 제목</th>
				    	<td class="line" >
				    		<input type="text" name="promotionnm" value="" style="width: 450px;" data-validation="required" data-validation-error-msg="프로모션 제목을 입력해 해주세요."/>
				    		
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">프로모션내용</th>
						<td class="line" >
							<textarea rows="5" cols="10" id="ir1" name="acontent" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="프로모션 내용을 입력해 해주세요." ></textarea>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">판매기간</th>
						<td class="line" colspan="3">
							<input type="text" name="reqFromDt" size="10" class="date_timepicker_from" value="" data-validation="required" data-validation-error-msg="판매기간을 입력해 해주세요." />
							<img id="fromDt" src="http://img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
							&nbsp;~&nbsp;
							<input type="text" name="reqToDt" size="10" class="date_timepicker_to" value="" data-validation="required" data-validation-error-msg="판매기간을 입력해 해주세요." />
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
				<td><h3>* 프로모션 설정</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">전시유형</th>
				    	<td class="line" width="35%" >
				    	<comm:select name="selectdisplay" code="100809"  basicValue="--선택--" selectValue="" />
				    	</td>
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">상품정렬방법</th>
				    	<td class="line" width="35%" >
				    	<comm:select name="selectsort" code="100812"  basicValue="--선택--" selectValue="" />
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">페이지 당 상품수</th>
				    	<td class="line" >
				    		<select name="selectperNo" >
				    			<option value=''>--선택--</option>
				    			<option value='12'>12</option>
				    			<option value='16'>16</option>
				    			<option value='20'>20</option>
				    			<option value='30'>30</option>
				    			<option value='40'>40</option>
				    			<option value='80'>80</option>
				    			<option value='100'>100</option>
				    		</select>
				    	</td>
				    	<!-- <th class="line" align="center" bgcolor="#F5F5F5">타이틀 이미지</th>
				    	<td class="line" >
				    		<input type="text" name="imgurl" value="" style="width: 350px;" />
				    	</td> -->
					</tr>
					<!-- <tr>
						<th class="line" align="center" bgcolor="#F5F5F5">타이틀 문구</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir2" name="amemo" style="width:100%; height:100px;" ></textarea>
				    	</td>
				    </tr> -->
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td>
								    		<button id="insertBtn" style="height:30px; width:100px; margin-left: 50px;" type="button">등록하기</button>
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