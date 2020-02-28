<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%><html>
<head>
<title>공지사항 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	var oEditors = [];

	j$(document).ready(function(){
		
		j$("#modifyBtn").click(function(){
			oEditors.getById["loginTxt"].exec("UPDATE_CONTENTS_FIELD", []);
			if( confirm("저장하시겠습니까?") ){
				j$("#frm").submit();
			}
		});

		j$("#cancleBtn").click(function(){
			if( confirm(" 리스트로 돌아가시겠습니까?\n(작성중인 내용은 저장되지 않습니다.)") ){
				location.href = "/madm/client/clientLoginList";
			}
		});
		
	});
	
	j$(function(){
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "loginTxt",
		    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		    htParams : {bUseToolbar : true,
	            fOnBeforeUnload : function(){},
	            fOnAppLoad : function(){}
	            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	  		 },
		    fCreator: "createSEditor2"
		});
	});

	function viewlayoutHtml(strObj){
		var agent = navigator.userAgent.toLowerCase(); 
		
		if(strObj == "null"){
	    	return false;
		}

		var X = screen.width/2;
		var Y = screen.height/2 - 300;
		var viewObj;
		var viewDiv = document.getElementById("viewlayout");

		if(strObj.indexOf(".jpg") > -1 || strObj.indexOf(".gif") > -1){
			viewObj="<img src='"+strObj+"'>";
		} else {
			viewObj="<table bgColor='#d4d0c8'><tr><td>"+strObj+"</td></tr></table>";
		}
		
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

<form id="frm" action="/madm/client/modifyClientLoginAct" method="POST" enctype="multipart/form-data">
<input type="hidden" name="clientCd" value="${clientDetail.clientCd }">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td>
			<!-- 버튼 영역 시작 -->
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">고객사 로그인 이미지/문구 관리</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; vertical-align: middle; " >
				<!-- 고객사 테이블 -->	
				<tr>
					<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
						<tr align="left" height="50px" >
							<th class="line" align="center" width="15%">고객사</th>
							<td width="auto;">
								${clientDetail.clientNm } (${clientDetail.clientCd })
							</td>
						</tr>
						<tr align="left" height="50px" >
							<th class="line" align="center">로그인 문구</th>
							<td>
				            	<textarea rows="10" cols="6" id="loginTxt" name="loginTxt" style="width:100%; height:250px;">${clientDetail.loginTxt}</textarea>
							</td>
						</tr>
						<tr align="left" height="50px" >
							<th class="line" align="center">로그인 이미지</th>
							<td>
			            		<input type="file" name="fileNm" id="fileNm" size="50"    />
			            		
								<c:choose>
									<c:when test="${not empty clientDetail.welcomeImg }">
										<img alt="미리보기" src="<spring:eval expression="@global['upload.http.img']" />${clientDetail.welcomeImg}" style="width: 50px; height: 50px;" onMouseOver="viewlayoutHtml('<spring:eval expression="@global['upload.http.img']" />${clientDetail.welcomeImg}')" onMouseOut="cutlayout()"></a>
									</c:when>
									<c:otherwise> 등록된 이미지가 없습니다.</c:otherwise>
								</c:choose>
			            		
			            		<input type="hidden" name="db_welcomeImg" value="${clientDetail.welcomeImg}" >
							</td>
						</tr>
					</table>
				</tr>
				<!-- 고객사 테이블 끝-->
				
				<tr>
					<td height="3 0px"></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
				<tr align="center" height="50px">
					<td class="" colspan="2" align="center">
						<input type="button" id="modifyBtn" value="저장" style="height:30px; width:100px;">
			    		<span style="margin-left: 20px;"></span>
			    		<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
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
