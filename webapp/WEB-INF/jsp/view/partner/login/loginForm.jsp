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
		var interval;
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
	    					}
	    				}
	    			})
	    	      	
	    			return false;
	    		});
	    		
	    		j$("#btn_check_id").click(function(e){
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
	    						alert("존재하지 않는 계정입니다.");
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
				j$('#timerDiv').css("display","");
				min = parseInt(time/60);
				sec = time%60;
				
				$("#timerDiv").text(min + "분" + sec + "초");
				time --;
				
				if(time < 0){
					clearInterval(interval);
					j$('#confirmKeyDiv').css("display","none");
					j$("#loginBtn_mo").remove();
					j$('#resendConfirmKey').css("display","none");
					j$('#btn_check_id').css("display","");
					j$('#timerDiv').css("display","none");
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
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<form id="login_mo" action="<spring:eval expression="@global['page.login.url']" />" method="post" >
		<input type="hidden" name="userId" id="id_mo" value="" />
			<div class="mobile_member_header">
				<h1><img src="//img.ezwelmind.co.kr/sangdam4u/images/common/img_logo_clientcd.png" alt="상담포유" /></h1>
				<ul class="login_sort">
					<li></li>
				</ul>
			</div>
			
					
			<div class="login_contents">
				<div class="cont_bn">
					<div class="partner"></div>
					<!-- <img alt="이지웰니스상담포유 관리자시스템 이지웰니스는 사람이 행복한 하루, 그 하루로 행복해지는 세상을 만들어 갑니다." /> src="//img.ezwelmind.co.kr/sangdam4u/images/member/img_login_bn04.jpg" -->
				</div>
				<fieldset class="field_pd02">
					<h2><div class="partner_login"></div></h2>
					<p>관리시스템은 지정된 관리자만 로그인이 가능합니다.</p>
					
					
					<div class="write_wrap">
						<div class="input_area">
							<input type="text" id="userId_mo" size="15" autofocus="autofocus" class="write_box" placeholder="사번/아이디" />
						</div>
						<div>
							<input type="password" id="pwd_mo" name="userPwd" size="15" class="write_box" placeholder="비밀번호" />
						</div>
						<div id="confirmKeyDiv" style="display:none;">
							<input type="text" id="confirmNumber" size="15" class="write_box" style="margin: 10px 0px;" placeholder="인증번호" />
						</div>
						<button id="btn_check_id" class="btn_login denial">로그인</button>
						<div id="timerDiv"></div>
						<button id="resendConfirmKey" class="denial"  style="display:none;top:0; right:0; width:106px; height:96px; background:#3eb3c7; color:#fff; font-size:18px;">재전송</button>
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
			</div>
		</form>

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