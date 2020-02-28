<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />  

<html>
<head>
	<title>로그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<script>
	      j$(document).ready(function(){

	    		j$("#loginBtn").click(function(){
	    			if ( j$("#userId").val() == "" ){
	    				alert("ID를 입력해주세요.");
	    				j$("#userId").focus();
	    				return false;
	    			}
	    			
	    			if(j$("#pwd").val() == "" ) {
	    				alert("비밀번호를 입력해주세요.");
	    				j$("#pwd").focus();
	    				return false;
	    			} 
	    			
	    			if( $("#id_save").prop("checked") ) {
	    				/* 아이디 쿠키 저장 */
	    	    		$.cookie("SANGDAM4U_COOKIE_PARTNER_USER_ID", j$("#userId").val(),{path: '/'});
	        	 	}else{
	        	 		/* 아이디 쿠키 삭제 */
	        	 		$.removeCookie("SANGDAM4U_COOKIE_PARTNER_USER_ID", {path: '/'});
	        	 	}
	    			
	    			j$("#id").val("");
	    	      	j$("#id").val(j$("#userId").val() + "3001");
	    			
	    			j$("#login").submit();
	    			return false;
	    		});
	    		
	    		j$("#loginBtn_mo").click(function(){
	    			if ( j$("#userId_mo").val() == "" ){
	    				alert("ID를 입력해주세요.");
	    				j$("#userId_mo").focus();
	    				return false;
	    			}
	    			
	    			if(j$("#pwd_mo").val() == "" ) {
	    				alert("비밀번호를 입력해주세요.");
	    				j$("#pwd_mo").focus();
	    				return false;
	    			} 
	    			
	    			if( $("#id_save_mo").prop("checked") ) {
	    				/* 아이디 쿠키 저장 */
	    	    		$.cookie("SANGDAM4U_COOKIE_PARTNER_USER_ID", j$("#userId_mo").val(),{path: '/'});
	        	 	}else{
	        	 		/* 아이디 쿠키 삭제 */
	        	 		$.removeCookie("SANGDAM4U_COOKIE_PARTNER_USER_ID", {path: '/'});
	        	 	}
	    			
	    			j$("#id_mo").val("");
	    	      	j$("#id_mo").val(j$("#userId_mo").val() + "3001");
	    			
	    			j$("#login_mo").submit();
	    			return false;
	    		});
	    		
	    		setUserId();
	      });

		function setUserId(){
			// 쿠키에 담긴 유저 아이디
			var setUserId = $.cookie("SANGDAM4U_COOKIE_PARTNER_USER_ID");
			$("#userId").val(setUserId);
			$("#userId_mo").val(setUserId);
			
			// 체크박스 선택
			if(setUserId != undefined){
				$("#id_save").prop('checked',true);
				$("#id_save_mo").prop('checked',true);
			}
		}
	</script>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<div class="web">


		<form id="login" action="<spring:eval expression="@global['page.login.url']" />" method="post">
		<input type="hidden" name="userId" id="id" value="" />
			<div class="member_header">
				<h1><img src="//img.ezwelmind.co.kr/sangdam4u/images/common/img_logo_clientcd.png" alt="상담포유" /></h1>
				<ul class="login_sort">
					<li></li>
				</ul>
			</div>
			<div class="login_contents">
				<div class="cont_bn">
					<img src="//img.ezwelmind.co.kr/sangdam4u/images/member/img_login_bn04.jpg" alt="이지웰니스상담포유 관리자시스템 이지웰니스는 사람이 행복한 하루, 그 하루로 행복해지는 세상을 만들어 갑니다." />
				</div>
				<fieldset class="field_pd02">
					<h2><img src="//img.ezwelmind.co.kr/sangdam4u/images/member/tit_login.gif" alt="LOGIN" /></h2>
					<p>관리시스템은 지정된 관리자만 로그인이 가능합니다.</p>
					<div class="write_wrap">
						<div class="input_area">
							<input type="text" id="userId" size="15" autofocus="autofocus" class="write_box" placeholder="사번/아이디" />
						</div>
						<div>
							<input type="password" id="pwd" name="userPwd" size="15" class="write_box" placeholder="비밀번호" />
						</div>
						<button type="submit" id="loginBtn" class="btn_login denial">로그인</button>
					</div>
					<input type="checkbox" name="id_save" id="id_save" /> <label for="id_save" class="save_id">아이디저장</label>
				</fieldset>
			</div>
			<div class="login_footer">
				<ul>
					<li>아이디, 비밀번호를 분실하신 경우 상담센터 혹은 소속 기업의 담당자에게 문의바랍니다.</li>
				</ul>
			</div>
			
		
		<c:if test="${today < 20180826}">
		
		
		
		<div id="popupDispYn" style="display: none;">
			<div id="pop_cont" style="position: fixed; left: 42%; top: 17%; z-index: 99; background: white; padding: 15px 15px 15px 15px;  border: 1px solid gray;" >
				<div>
					<div align="right" style="margin-bottom: 5px;">
						<img  class="btn_close" alt="닫기" src="http://img.ezwelmind.co.kr/sangdam4u/images/btn/btn_close_18x18.png">
					</div>
					<img alt="서비스 점검안내" src="//img.ezwelmind.co.kr//sangdam4u/images/popup/180821_partner_popup.jpg">
					<div class="today_close">
						<input id="today_c" type="checkbox" value="7"><label for="today_c" style="font-size: smaller; ">&nbsp;오늘 하루 보지 않기</label>
						<img align="right" class="btn_close" alt="닫기" src="http://img.ezwelmind.co.kr/sangdam4u/images/btn/btn_close_18x18.png">
					</div>
				</div>
			</div>
		</div>
		
		</c:if>
		
			
		</form>




</div>




<script>	
	$(document).ready(function() {
		
		setPopupDispYn();
		
		$(".btn_close").click(function(){
			$('#popupDispYn').hide();
		});
		
		$("#today_c").click(function(){
			var cookieNm = "EZWELMIND_PARTNER_TEMP_COOKIE_POPUP";
			var popupSeq = 1; 
			
			if( $("#today_c").prop("checked") ) {
				/* 팝업 쿠키 저장 */
	    		$.cookie(cookieNm, popupSeq, {path: '/'});
		 	}else{
		 		/* 팝업 쿠키 삭제 */
		 		$.removeCookie(cookieNm, {path: '/'});
		 	}
		});
	});
	
	function setPopupDispYn(){
		// 쿠키에 담긴 팝업 정보
		var cookieNm = "EZWELMIND_PARTNER_TEMP_COOKIE_POPUP";
		var popupSeq = 1;
		var getPopupDispYn = $.cookie(cookieNm);
		
		if(getPopupDispYn != popupSeq){
			$("#popupDispYn").show();
		}
	}
	
</script>
</body>
</html>


