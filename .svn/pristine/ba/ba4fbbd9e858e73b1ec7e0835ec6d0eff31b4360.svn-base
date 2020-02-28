<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너 수정</title>
<script>
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		j$("#modifyBnr").submit();
		return false;
	});

	j$("#deleteBtn").click(function(){
		j$("#deleteBnr").submit();
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/banner/bnrManage";
		return false;
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
</script>

<script type="text/javascript">
function viewlayoutHtml(strObj){
	if(strObj == "null"){
    	return false;
	}

	var X = event.x;
	var Y = event.y;
	var viewObj;
	var viewDiv = document.getElementById("viewlayout");

	if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1){
		viewObj="<img src='"+strObj+"'>";
	} else {
		viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
	}
	
	X -= 100;
	Y += 30;
	
	viewDiv.style.left = X+"px";
	viewDiv.style.top  = Y+"px";
	viewDiv.style.display = "block";
	viewDiv.innerHTML=viewObj; 
}

function cutlayout(){
	var viewDiv = document.getElementById("viewlayout");
		viewDiv.style.display = "none";
}
</script>
</head>
<body>
<form:form id="modifyBnr" modelAttribute="ivnBannerDto" action="/madm/banner/modifyBnrDetail" method="POST" enctype="multipart/form-data">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="80%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">배너 수정</td>
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
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너순번</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="bannerSeq" value="${bnrDetail.bannerSeq}"/>
					    		${bnrDetail.bannerSeq}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">채널코드</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="channelCd" value="${bnrDetail.channelCd}">
					    		${bnrDetail.channelCd}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">코너</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="cornerCd" value="${bnrDetail.cornerCd}">
					    		${bnrDetail.cornerCd}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배너명</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="bannerNm" value="${bnrDetail.bannerNm}" style="width: 100%;" />
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">타이틀</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="subject" value="${bnrDetail.subject}" style="width: 100%;" />
					    	</td>
						</tr>
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
					    	<td class="line" colspan="3">
					    		<textarea rows="4" cols="10" name="comment" id="comment"" style="width:100%; height:100px;">${bnrDetail.comment}</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">이미지URL</th>
					    	<td class="line" colspan="3">
				            	<input name="fileNm"  id="fileNm"  type="file"  value="" style="width:350px;"/> &nbsp;
								미리보기 : <img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${bnrDetail.bannerImgUrl}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${bnrDetail.bannerImgUrl}')" onMouseOut="cutlayout()">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">타겟URL</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="targetLink" value="${bnrDetail.targetLink}" style="width: 300px;" />
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">시작일/종료일</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${bnrDetail.startDt}"/>
								<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${bnrDetail.endDt}"/>
								<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					    	</td>
					    </tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
					    	<td class="line" colspan="3">
					    		<input type="radio" name="useYn" value="Y" ${bnrDetail.useYn == 'Y' ? 'checked':''} > 사용
		    					<input type="radio" name="useYn" value="N" ${bnrDetail.useYn == 'N' ? 'checked':''} > 비사용
					    	</td>
						</tr>
						<%-- <tr align="left" height="30px">
							<td class="line" width="15%" align="center" bgcolor="#F5F5F5">노출우선순위</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="dispOrder" value="${bnrDetail.dispOrder}" style="width: 300px;" />
					    	</td>
						</tr> --%>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록자ID</th>
					    	<td class="line">
					    		${bnrDetail.regId } 
					    	</td>
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록일</th>
					    	<td class="line">
					    		${bnrDetail.regDt }
					    	</td>
						</tr>
						<c:if test="${not empty bnrDetail.modiId}">
							<tr align="left" height="30px">
								<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정자ID</th>
						    	<td class="line">
						    		${bnrDetail.modiId } 
						    	</td>
						    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정일</th>
						    	<td class="line">
						    		${bnrDetail.modiDt }
						    	</td>
							</tr>
						</c:if>
					</table>
					<!-- 배너 정보 영역 종료 -->
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사선택</th>
					    	<td class="line" colspan="3">
			    				<table>
			    					<tr>
			    						<td>
			    							<input type="checkbox" name="allClientYn" id="checkAll" value="Y" <c:if test="${bnrDetail.allClientYn eq 'Y'}"> checked </c:if>>
			    							<label for="checkAll">전체선택</label>
			    						</td>
			    					</tr>
					    			<c:forEach var="list" items="${clientList}" varStatus="idx">
				    					<c:if test="${(idx.index mod 4) eq 0 }"><tr></c:if>
						    				<td width="200px">
						    					<input type="checkbox" name="clientCdArr" id="check_${list.clientCd }" value="${list.clientCd }" <c:if test="${list.bannerSeq eq bnrDetail.bannerSeq}"> checked </c:if>>
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
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="2" align="center">
					    		<button id="modifyBtn" style="height:30px; width:100px;">수정</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="cancleBtn" style="height:30px; width:100px;">취소</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="deleteBtn" style="height:30px; width:100px;">삭제</button>
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
</form:form>

<form:form id="deleteBnr" modelAttribute="invBannerParam" action="/madm/banner/modifyBnrDetail" method="DELETE">
	<input type="hidden" name="bannerSeq" value="${bnrDetail.bannerSeq}">
</form:form>

<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

