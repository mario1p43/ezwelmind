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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script>
	      j$(document).ready(function(){
				var isLoginInfo = false;
				//크롬 자동완성 때문에 아이디 입력값 로드 시 체크
				isLoginInfo = (j$("#userId").val() != '' && j$("#pwd").val() != "");
				if(isLoginInfo === true) {
					j$('#loginBtn').addClass('active');
				} else {
					j$('#loginBtn').removeClass('active');
				}
				////////////////////////////////////////////

	    		j$("#loginBtn").click(function(){
					if(isLoginInfo === false) {
						return;
					}
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
					if(isLoginInfo === false) {
						return;
					}

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
				
				j$("#userId, #pwd").on('keyup', function(e) {
					isLoginInfo = (j$("#userId").val() != '' && j$("#pwd").val() != "");
					if(isLoginInfo === true) {
						j$('#loginBtn').addClass('active');
					} else {
						j$('#loginBtn').removeClass('active');
					}
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
	<style>
		.flexColumn{display: flex;  flex-direction: column; display: -webkit-flex;  -webkit-flex-direction: column; }
		.flex{display: flex; display: -webkit-flex;}
		.flexGrow{-webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0;  -webkit-flex : 1 1 0;}
		.center{-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; }/* 가로세로중앙정렬 */
		.centerH{-webkit-align-items: center; align-items: center; }/* 세로중앙정렬 */
		.rightR{-webkit-justify-content: flex-end; justify-content: flex-end; }
		.rightC{-webkit-align-items: flex-end; align-items: flex-end;}
		.member_wrap{
			width: 100vw !important;
			height: 100vh;
			display: flex; display: -webkit-flex;
			-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center;
		}
		body {
			background: url('/resources/img/login_background.png') no-repeat 50% 50% fixed; 
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover; 
		}

		form {
			width: 100vw;
		}
	
		.login_form_wrapper {
			display: flex;
			flex-direction: column;
			justify-content: center;
			padding: 0 7.6389vw;
		}

		.login_image_wrapper {
			display: flex; display: -webkit-flex;
			-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center;
		}

		.login_image_wrapper img {
			width: 65.8333vw;
			margin-bottom: 9.1667vw;
		}
		
		.login_form_wrapper div input {
			height: 13.3333vw;
			font-size: 5.5556vw;
			padding-left: 4.4444vw;
			width: -webkit-fill-available;
			border-radius: 1.1111vw;
			border: 1px solid #828282;
			background-color: #ffffff;
			color: black;
		}
		.login_form_wrapper div input:focus {
			background-color: white;
			color:black;
		}
		.login_form_wrapper div input::placeholder {
			font-size: 5.5556vw;
			color: #828282;
		}
		.login_form_wrapper div button {
			border-radius: 1.1111vw;
			background-color: #bdbdbd;
			font-weight: bold;
			color: #e0e0e0;
			width: 100%;
			height: 13.3333vw;
			font-size: 5.5556vw;
		}
		.login_form_wrapper div button.active {
			color:white;
			background-color: #004B85;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
		}
		.login_form_wrapper div {
			margin-top: 2.2222vw;
		}
		
		.m_login_footer{
			display: flex;
			position: absolute;
			bottom: 4.4444vw;
			flex-direction: column;
		}
		.m_login_footer span {
			font-size: 2.7778vw;
			color: #003B74;
			text-align: center;
		}

	</style>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
	<form id="login" action="<spring:eval expression="@global['page.login.url']" />" method="post">
	<input type="hidden" name="userId" id="id" value="" />
	<div class="login_form_wrapper">
		<div class="login_image_wrapper">
			<img src="/resources/img/login_logo.png"/>
		</div>
		<div>
			<input type="text" id="userId" size="15" autofocus="autofocus" class="write_box" placeholder="아이디" />
		</div>
		<div>
			<input type="password" id="pwd" name="userPwd" size="15" class="write_box" placeholder="비밀번호" />
		</div>
		<div>
			<button type="submit" id="loginBtn" class="btn_login denial">로그인</button>
		</div>
	</div>
	
	
		
	
	<c:if test="${today < 20180826}">
	
	<!-- <div id="popupDispYn" style="display: none;">
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
	</div> -->
	
	</c:if>
	
		
	</form>
	

	<div class="m_login_footer">
		<span>아이디 비밀번호 분실 시 이지웰니스로 문의바랍니다.</span>
		<span>이지웰니스 상담센터 담당 (02-6909-441)</span>
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


