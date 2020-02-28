<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너 수정</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
var oEditors1 = [];
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		
		var title = j$("#title").val();
		if(title == ""){
			alert("제목을 입력하세요.");
			j$("#title").focus();
			return false;
		}
		var content = j$("#content").val();
		if(content == ""){
			alert("내용을 입력하세요.");
			j$("#content").focus();
			return false;
		}
		
		var startDd = j$("#startDd").val();
		var endDd	= j$("#endDd").val();
		if(startDd == "" || endDd == ""){
			alert("시작/종료일을 선택하세요.");
			j$("#startDd").focus();
			return false;
		}
		
		// ios이미지
		var iImg1 = j$("#iImg1").val();
		if(iImg1 == "" && "${splashDetail.iosImg1}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg1").focus();
			return false;
		}
		var iImg2 = j$("#iImg2").val();
		if(iImg2 == "" && "${splashDetail.iosImg2}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg2").focus();
			return false;
		}
		var iImg3 = j$("#iImg3").val();
		if(iImg3 == "" && "${splashDetail.iosImg3}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg3").focus();
			return false;
		}
		
		// 안드로이드 이미지
		var aImg1 = j$("#aImg1").val();
		if(aImg1 == "" && "${splashDetail.androidImg1}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg1").focus();
			return false;
		}
		var aImg2 = j$("#aImg2").val();
		if(aImg2 == "" && "${splashDetail.androidImg2}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg2").focus();
			return false;
		}
		var aImg3 = j$("#aImg3").val();
		if(aImg3 == "" && "${splashDetail.androidImg3}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg3").focus();
			return false;
		}
		var aImg4 = j$("#aImg4").val();
		if(aImg4 == "" && "${splashDetail.androidImg4}" == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg4").focus();
			return false;
		}
		if(confirm("수정하시겠습니까?")){
			j$("#modifySplash").submit();
		}	
		return false;
	});

	j$("#deleteBtn").click(function(){
		if(confirm("삭제하시면 복구하실수 없습니다.\n삭제하시겠습니까?")){
			j$("#deleteSplash").submit();
		}	
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/splash/splashManage";
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
<form:form id="modifySplash" modelAttribute="splashDto" action="/madm/mobile/splash/modifySplashDetail" method="POST" enctype="multipart/form-data">
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
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">순번</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="splashSeq" value="${splashDetail.splashSeq}"/>
					    		${splashDetail.splashSeq}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">타이틀</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="title" value="${splashDetail.title}" style="width: 300px;" />
					    	</td>
						</tr>
					    <tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
					    	<td class="line" colspan="3">
					    		<textarea rows="5" cols="10" id="content" name="content" style="width:100%; height:100px;">${splashDetail.content}</textarea>
					    	</td>
						</tr>

						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5" rowspan="3">IOS 이미지</th>
					    	<td class="line" colspan="3"> 320x480 : 
				            	<input name="iImg1" id="iImg1" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.iosImg1}">
								미리보기 : <img alt="미리보기" src="${splashDetail.iosImg1}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.iosImg1}')" onMouseOut="cutlayout()">
								</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<td class="line" colspan="3"> 640x960 : 
				            	<input name="iImg2" id="iImg2" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.iosImg2}">
								미리보기 : <img alt="미리보기" src="${splashDetail.iosImg2}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.iosImg2}')" onMouseOut="cutlayout()">
								</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<td class="line" colspan="3"> 640x1136 : 
				            	<input name="iImg3" id="iImg3" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.iosImg3}">
								미리보기 : <img alt="미리보기" src="${splashDetail.iosImg3}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.iosImg3}')" onMouseOut="cutlayout()">
					    		</c:if>
					    	</td>
						</tr>

						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5" rowspan="4">안드로이드 이미지</th>
					    	<td class="line" colspan="3"> 320x480 : 
				            	<input name="aImg1" id="aImg1" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.androidImg1}">
								미리보기 : <img alt="미리보기" src="${splashDetail.androidImg1}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.androidImg1}')" onMouseOut="cutlayout()">
					    		</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<td class="line" colspan="3"> 480x800 : 
				            	<input name="aImg2" id="aImg2" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.androidImg2}">
								미리보기 : <img alt="미리보기" src="${splashDetail.androidImg2}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.androidImg2}')" onMouseOut="cutlayout()">
					    		</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<td class="line" colspan="3"> 720x1280 : 
				            	<input name="aImg3" id="aImg3"type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.androidImg3}">
								미리보기 : <img alt="미리보기" src="${splashDetail.androidImg3}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.androidImg3}')" onMouseOut="cutlayout()">
								</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
					    	<td class="line" colspan="3"> 1200x1920 : 
				            	<input name="aImg4" id="aImg4" type="file" style="width:350px;"/> &nbsp;
				            	<c:if test="${not empty splashDetail.androidImg4}">
								미리보기 : <img alt="미리보기" src="${splashDetail.androidImg4}" style="width: 50px; height: 50px;"	onMouseOver="viewlayoutHtml('${splashDetail.androidImg4}')" onMouseOut="cutlayout()">
								</c:if>
					    	</td>
						</tr>

						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">시작일/종료일</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${splashDetail.startDt}"/>
								<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
								&nbsp;~&nbsp;
								<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${splashDetail.endDt}"/>
								<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					    	</td>
					    </tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
					    	<td class="line" colspan="3">
					    		<input type="radio" name="useYn" value="Y" ${splashDetail.useYn == 'Y' ? 'checked':''} > 사용
		    					<input type="radio" name="useYn" value="N" ${splashDetail.useYn == 'N' ? 'checked':''} > 비사용
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록자ID</th>
					    	<td class="line">
					    		${splashDetail.regId } 
					    	</td>
					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록일</th>
					    	<td class="line">
					    		${splashDetail.regDt }
					    	</td>
						</tr>
						<c:if test="${not empty splashDetail.modiId}">
							<tr align="left" height="30px">
								<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정자ID</th>
						    	<td class="line">
						    		${splashDetail.modiId } 
						    	</td>
						    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수정일</th>
						    	<td class="line">
						    		${splashDetail.modiDt }
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

<form:form id="deleteSplash" modelAttribute="splashDto" action="/madm/mobile/splash/modifySplashDetail" method="DELETE">
	<input type="hidden" name="splashSeq" value="${splashDetail.splashSeq}">
</form:form>

<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

