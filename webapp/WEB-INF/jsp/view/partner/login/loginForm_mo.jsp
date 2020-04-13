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
		var interval;
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
	    			var params = {};
	    			params.confirmNumber = $("#confirmNumber").val();
	    			
	    			j$.ajax({
	    				url: '/login/confirmnumber',
	    				async: false,
	    				data: params,
	    				dataType: 'json',
	    				type: 'GET',
	    				cache:true,
	    				success: function(data, textStatus){
	    					if(data.confirm === 'true'){
	    		    			j$("#login_mo").submit();
	    					}else{
	    						j$('#confirmKeyDiv').css("display","none");
	    						j$("#loginBtn_mo").remove();
	    						j$('#resendConfirmKey').css("display","none");
	    						j$('#btn_check_id').css("display","");
	    						clearInterval(interval);
	    						j$('#timer_count').css("display","none");
	    						alert("인증번호 오류입니다.");
	    					    event.preventDefault();
	    					}
	    				}
	    			})
	    	      	
	    			return false;
	    		});
	    		
	    		j$("#btn_check_id").click(function(e){
				    e.preventDefault();
	    			var params = {};
	    			params.userId = $("#userId_mo").val();
	    			params.userPwd = $("#pwd_mo").val();
	    			j$.ajax({
	    				url: '/login/checkId',
	    				async: false,
	    				data: params,
	    				dataType: 'json',
	    				type: 'GET',
	    				cache:true,
	    				success: function(data, textStatus){
	    					if(data.isUser === 'true'){
	    						j$('#confirmKeyDiv').css("display","");
	    						j$("<button id='loginBtn_mo' onclick='login()' class='btn_login denial'>로그인</button>").insertAfter('#confirmKeyDiv');
	    						j$('#resendConfirmKey').css("display","");
	    						j$('#btn_check_id').css("display","none");
	    						timer();
	    						alert(data.userMobile+ " 번호로 인증번호가 발송되었습니다.");
	    					}else{
	    						j$('#confirmKeyDiv').css("display","none");
	    						j$("#loginBtn_mo").remove();
	    						j$('#resendConfirmKey').css("display","none");
	    						j$('#btn_check_id').css("display","");
	    						alert("계정정보가 일치하지 않습니다.");
	    					}
	    				}
	    			})
	    		});	    		

	    		j$("#resendConfirmKey").click(function(e){
				    e.preventDefault();
	    			var params = {};
	    			params.userId = $("#userId_mo").val();
	    			j$.ajax({
	    				url: '/login/checkId',
	    				async: false,
	    				data: params,
	    				dataType: 'json',
	    				type: 'GET',
	    				cache:true,
	    				success: function(data, textStatus){
	    					if(data.isUser === 'true'){
	    						j$('#confirmKeyDiv').css("display","");
	    						j$('#loginBtn_mo').css("display","");
	    						j$('#resendConfirmKey').css("display","");
	    						j$('#btn_check_id').css("display","none");
	    						clearInterval(interval);
	    						timer();
	    						alert(data.userMobile+ " 번호로 인증번호가 발송되었습니다.");
	    					}else{
	    						j$('#confirmKeyDiv').css("display","none");
	    						j$("#loginBtn_mo").remove();
	    						j$('#resendConfirmKey').css("display","none");
	    						j$('#btn_check_id').css("display","");
	    						alert("존재하지 않는 계정입니다.");
	    					}
	    				}
	    			})
	    		});
	    		
				j$('#confirmNumber').on('keyup', function() {
					j$('.check_icon img').css('visibility', 'visible');
					j$('#loginBtn_mo').addClass('active');
					j$('#loginBtn_mo').text('로그인');
				});
				j$("#userId_mo, #pwd_mo").on('keyup', function(e) {
					isLoginInfo = (j$("#userId_mo").val() != '' && j$("#pwd_mo").val() != "");
					if(isLoginInfo === true) {
						j$('#btn_check_id').addClass('active');
					} else {
						j$('#btn_check_id').removeClass('active');
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
		
		function timer(){
			var time = 180;
			var min = "";
			var sec = "";
			
			interval = setInterval(function(){
				j$('#timer_count').css("display","");
				min = parseInt(time/60);
				sec = time%60;
				
				$("#timer_count").text(min + ":" + sec);
				time --;
				
				if(time < 0){
					clearInterval(interval);
					j$('#confirmKeyDiv').css("display","none");
					j$("#loginBtn_mo").remove();
					j$('#resendConfirmKey').css("display","none");
					j$('#btn_check_id').css("display","");
					j$('#timer_count').css("display","none");
				}
			}, 1000);
		}
		
		function login(){

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
			var params = {};
			params.confirmNumber = $("#confirmNumber").val();
			
			j$.ajax({
				url: '/login/confirmnumber',
				async: false,
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					if(data.confirm === 'true'){
		    			j$("#login_mo").submit();
					}else{
						j$('#confirmKeyDiv').css("display","none");
						j$("#loginBtn_mo").remove();
						j$('#resendConfirmKey').css("display","none");
						j$('#btn_check_id').css("display","");
						clearInterval(interval);
						j$('#timerDiv').css("display","none");
						alert("인증번호 오류입니다.");
					    event.preventDefault();
					}
				}
			})
	      	
			return false;
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
			background: url("${url:resource('/resources/img/login_background.png')}") no-repeat 50% 50% fixed; 
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

		.login_form_wrapper button.active {
			color:white;
			background-color: #004B85;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
		}
		.login_form_wrapper button {
			margin-top: 2.2222vw;
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
		.confirm_number_wrapper {
			display: flex;
			height: 13.8889vw;
			font-size: 5.5556vw;
			border-radius: 2.7778vw;
			background-color: rgba(255, 255, 255, 0.6);
			color: #26282B;
		}
		.confirm_number_wrapper .check_icon { 
			width: 4.7222vw;
			padding-right:3.8889vw;
			padding-left:5.5556vw;
			display: flex;
			-webkit-justify-content: center; 
			justify-content: center; 
			-webkit-align-items: center; 
			align-items: center;
			background-color: inherit;
			border-radius: 2.7778vw 0 0 2.7778vw;
		}
		.confirm_number_wrapper .check_icon img { 
			width: 100%;
			height: auto;
			visibility: hidden;
		}
		.confirm_number_wrapper .check_timer { 
			display: flex;
			-webkit-justify-content: center; 
			justify-content: center; 
			-webkit-align-items: center; 
			align-items: center;
			padding-right:5.5556vw;
			background-color: inherit;
			border-radius: 0 2.7778vw 2.7778vw 0;
		}
		.confirm_number_wrapper .check_timer p { 
			font-size: 4.4444vw;
			color: #FF3F25;
		}
		.confirm_number_wrapper input {
			-webkit-flex-grow: 1 !important; 
			flex-grow: 1 !important; 
			flex : 1 1 0 !important;  
			-webkit-flex : 1 1 0 !important;
			height: 100% !important;
			border:none !important;
			font-size: 5.5556vw !important;
			font-weight: bold !important;
			color:black !important;
			background-color: rgba(255, 255, 255, 0.6) !important;
		}
	</style>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<form id="login_mo" action="<spring:eval expression="@global['page.login.url']" />" method="post" >
		<input type="hidden" name="userId" id="id_mo" value="" />
		<div class="login_form_wrapper">
			<div class="login_image_wrapper">
				<img src="${url:resource('/resources/img/login_logo.png')}"/>
			</div>
			<div>
				<input type="text" id="userId_mo" size="15" autofocus="autofocus" class="write_box" placeholder="사번/아이디" />
			</div>
			<div>
				<input type="password" id="pwd_mo" name="userPwd" size="15" class="write_box" placeholder="비밀번호" />
			</div>
			<div class="confirm_number_wrapper" id="confirmKeyDiv" style="display:none">
				<span class="check_icon"><img src="${url:resource('/resources/img/check_icon.png')}" /></span>
				<input type="text" id="confirmNumber" name="confirmNumber" size="8" autofocus="autofocus" class="write_box" placeholder="인증 번호" />
				<span class="check_timer"><p id="timer_count"></p></span>
			</div>
			<div>
				<button id="btn_check_id" class="btn_login denial">로그인</button>
				<button id="resendConfirmKey" class="denial"  style=" background:#3eb3c7;">재전송</button>
			</div>
		</div>
			<!-- <div class="mobile_member_header">
				<h1><img src="//img.ezwelmind.co.kr/sangdam4u/images/common/img_logo_clientcd.png" alt="상담포유" /></h1>
				<ul class="login_sort">
					<li></li>
				</ul>
			</div>
			<div class="login_contents">
				
				<fieldset class="padding10">
					<h2><img src="//img.ezwelmind.co.kr/sangdam4u/images/member/tit_login.gif" alt="LOGIN" /></h2>
					<p>관리시스템은 지정된 관리자만 로그인이 가능합니다.!!</p>
					<div class="write_wrap">
						<div class="input_area">
							<input type="text" id="userId_mo" size="15" autofocus="autofocus" class="write_box" placeholder="사번/아이디" />
						</div>
						<div>
							<input type="password" id="pwd_mo" name="userPwd" size="15" class="write_box" placeholder="인증번호" />
						</div>
						<div id="confirmKeyDiv" style="display:none">
							<input type="text" id="confirmNumber" size="15" class="write_box" placeholder="확인번호" />
						</div>
						<div id="timerDiv"></div>
						<button id="btn_check_id" class="btn_login denial">로그인</button>
						<button id="loginBtn_mo" class="btn_login denial" style="display:none">로그인</button>
					</div>
					<input type="checkbox" name="id_save" id="id_save_mo" /> <label for="id_save" class="save_id">아이디저장</label>
					<br>
					<br>
				</fieldset>
				
			</div>
			<div class="mobile_login_footer padding10">
					<ul>
						<li>아이디, 비밀번호를 분실하신 경우<br> 상담센터 혹은 소속 기업의 담당자에게 문의바랍니다.</li>
					</ul>
			</div> -->
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
