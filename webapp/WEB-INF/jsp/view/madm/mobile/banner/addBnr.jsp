<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너등록</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors1 = [];
j$(document).ready(function(){
	j$("#cornerCd").on("change", function() {
	    var str = "";
	    j$( "select option:selected" ).each(function() {
	      str = j$( this ).attr("id");
	    });
	    j$("#channelCd").val(str);
	});

	j$("#insertBtn").click(function(){
		var cornerCd = j$("#cornerCd").val();
		if (cornerCd == "") {
			alert("코너를 선택하세요.");
			j$("#cornerCd").focus();
			return false;
		}
		
		var bannerNm = j$("#bannerNm").val();
		if(bannerNm == ""){
			alert("배너명을 입력하세요.");
			j$("#bannerNm").focus();
			return false;
		}
		
		var subject = j$("#subject").val();
		if(subject == ""){
			alert("타이틀을 입력하세요. ");
			j$("#subject").focus();
			return false;
		}

		oEditors1.getById["comment"].exec("UPDATE_CONTENTS_FIELD", []);
		var checkVal = "<P>&nbsp;</P>";
		var tempVal1 = j$("#comment").text().trim();
		if(checkVal == tempVal1){
			alert("내용을 입력하세요");
			return false;
		}

		var startDd = j$("#startDd").val();
		var endDd	= j$("#endDd").val();
		if(startDd == "" || endDd == ""){
			alert("시작/종료일을 선택하세요.");
			j$("#startDd").focus();
			return false;
		}
		
		var imgFile = j$("#imgFile").val();
		if(imgFile == ""){
			alert("이미지를 등록하세요. ");
			j$("#imgFile").focus();
			return false;
		}
		
		if(j$("#dispOrder").val() == "" || j$("#dispOrder").val() == "0"){
			alert("노출순서를 등록하세요. ");
			j$("#dispOrder").focus();
			return false;
		}
		
		
// 		var targetLink = j$("#targetLink").val();
// 		if(targetLink == ""){
// 			alert("노출 URL을 입력하세요. ");
// 			j$("#targetLink").focus();
// 			return false;
// 		}
		
		j$("#addBnr").submit();
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/banner/bnrManage?cornerCd=${cornerCd}";
	});

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
	    oAppRef: oEditors1,
	    elPlaceHolder: "comment",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
});
</script>
</head>
<body>

<form id="addBnr" action="/madm/mobile/banner/addBnr" method="POST" enctype="multipart/form-data">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td align="left" class="subtitle">배너등록</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td valign="top" align="center">
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
			<input type="hidden" name="cornerCd" id="cornerCd" value="${cornerCd }" />
			<input type="hidden" name="channelCd" id="channelCd" value="MOBI" readonly="readonly"/>
			
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너명</th>
		    	<td  >
		    		<input name="bannerNm" id="bannerNm" value="" type="text" style="width:300px;"/>
		    	</td>
		    </tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">타이틀</th>
		    	<td  >
		    		<input name="subject" id="subject" value="" type="text" style="width:300px;"/>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
		    	<td  >
		    		<textarea rows="5" cols="10" id="comment" name="comment" style="width:100%; height:100px;"></textarea>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">시작일/종료일</th>
		    	<td  width="35%" >
		    		<input type="text" name="startDt" id="startDt" size="10" class="date_timepicker_start" value=""/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					&nbsp;~&nbsp;
					<input type="text" name="endDt" id="endDt" size="10" class="date_timepicker_end" value=""/>
					<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
		    	</td>
		    </tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
		    	<td  >
		    		<input type="radio" name="useYn" value="Y" checked> 사용
		    		<input type="radio" name="useYn" value="N"> 비사용
		    	</td>
			</tr>			
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">이미지</th>
		    	<td  >
		    		<input name="imgFile" id="imgFile" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출 순서</th>
		    	<td  >		    		
		    		<input name="dispOrder" id="dispOrder" value="0" type="text" style="width:100px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">노출 URL</th>
		    	<td  >
		    		<!-- <input type="radio" name="checkType">
		    		직접입력 &nbsp;&nbsp;&nbsp; -->
		    		<input name="targetLink" id="targetLink" value="" type="text" style="width:300px;"/>
		    	</td>
			</tr>
			<!-- <tr align="left" height="30px">
		    	<td  >
		    		<input type="radio" name="checkType">
		    		이벤트 선택
		    		<input name="targetLink" value="" type="text" readonly="readonly" style="width:300px;"/>
		    		<input type="button" value="검색">
		    	</td>
			</tr> -->
		</table>
		<!-- 검색 영역 종료 -->
		</td>
	</tr>
	
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
		<!-- 배너 정보 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
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
	<td height="20px"></td>
</tr>
<tr>
	<td>
	<!-- 버튼 영역 시작 -->
	<table cellpadding="5" cellspacing="0" border="0" width="70%" align="left" style="border-collapse:collapse;">
		<tr>
			<td class="" colspan="4" height="60px" align="center">
	    		<input type="button" id="insertBtn" value="저장" style="height:30px;width:100px;"/>
	    		<span style="margin-left: 20px;"></span>
	    		<input type="button" id="cancleBtn" value="취소" style="height:30px;width:100px;"/>
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

