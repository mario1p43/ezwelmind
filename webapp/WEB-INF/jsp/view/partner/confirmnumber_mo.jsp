<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ConfirmNumber</title>
<link href="${url:img('/css_js/admin_css.css')}" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    }

    .login_image_wrapper {
        display: flex; display: -webkit-flex;
        -webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center;
    }

    .login_image_wrapper img {
        width: 65.8333vw;
        margin-bottom: 9.1667vw;
    }

    .login_form_wrapper .confirm_number_wrapper {
        display: flex;
        height: 13.8889vw;
        font-size: 5.5556vw;
        border-radius: 2.7778vw;
        background-color: rgba(255, 255, 255, 0.6);
        color: #26282B;
        margin: 20.5556vw 7.6389vw 0 7.6389vw ;
    }
    
    .login_form_wrapper div input {
        -webkit-flex-grow: 1; 
        flex-grow: 1; 
        flex : 1 1 0;  
        -webkit-flex : 1 1 0;
        height: 100%;
        border:none;
        font-size: 5.5556vw;
        font-weight: bold;
        color:black;
        background-color: rgba(255, 255, 255, 0.6);
    }
    .login_form_wrapper div input::placeholder {
        font-size: 5.5556vw;
        color: #828282;
    }
    .login_form_wrapper div input:focus {
        border:none;
    }

    .login_form_wrapper .span {
        text-align: right;
        font-size: 2.7778vw;
        font-weight: 300;
        color: black;
        margin-right: 7.6389vw;
        margin-top: 2.7778vw;
    }

    .login_form_wrapper .confirm_number_wrapper .check_icon { 
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

    .login_form_wrapper .confirm_number_wrapper .check_icon img { 
        width: 100%;
        height: auto;
        visibility: hidden;
    }

    .login_form_wrapper .confirm_number_wrapper .check_timer { 
        display: flex;
        -webkit-justify-content: center; 
        justify-content: center; 
        -webkit-align-items: center; 
        align-items: center;
        padding-right:5.5556vw;
        background-color: inherit;
        border-radius: 0 2.7778vw 2.7778vw 0;
    }

    .login_form_wrapper .confirm_number_wrapper .check_timer p { 
        font-size: 4.4444vw;
        color: #FF3F25;
    }

    .login_form_wrapper div button { 
        background: #FF8B7E;
        height: 13.8889vw;
        margin-top: 11.1111vw;
        width: 100%;
        font-size: 5.5556vw;
        font-weight: bold;
        color:white;
    }

    .login_form_wrapper div button.active { 
        background: linear-gradient(90deg, #B3E982 -93.1%, #7EC041 100%);
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

<body>
<script>
    j$(function() {
        let loginBtn = j$('#confirmButton');
        let timerCount = j$('#timer_count');
        let timerInput = j$('#confirmNumber');
        let timerValue = 10;
        let isTimeOver = false;
        let timer = setTimeout(function() {
            if(timerValue <= 0) {
                timerValue = 180;
                loginBtn.removeClass('active');
                loginBtn.text('인증번호 재전송');
                timerCount.css('visibility', 'hidden');
                j$('.check_icon img').css('visibility', 'hidden');
                isTimeOver = true;
                return;
            }
            
            timerValue--;
            timerCount.text(getTimerText(timerValue));
            let callback = arguments.callee;
            timer = setTimeout(callback, 1000);
        }, 1000);
    
        function getTimerText(time) {
            return parseInt(time/60) + ':' + time%60 < 10 ? '0' + time%60 : time%60;
        }
    
        timerInput.on('keyup', function() {
            j$('.check_icon img').css('visibility', 'visible');
            loginBtn.addClass('active');
            loginBtn.text('로그인');
        });
    
        j$('#confirmButton').on('click', function(e) {
            e.preventDefault();
            if(isTimeOver === true) {
                document.location.reload();
                return;
            }
            j$('#loginConfirm').submit();
        })
    });
</script>
<form id="loginConfirm" action="/partner/main/confirmnumber" method="post">

<div class="login_form_wrapper">
    <div class="login_image_wrapper">
        <img src="/resources/img/login_logo.png"/>
    </div>
    <div class="confirm_number_wrapper">
        <span class="check_icon"><img src="/resources/img/check_icon.png" /></span>
        <input type="text" id="confirmNumber" name="confirmNumber" size="8" autofocus="autofocus" class="write_box" placeholder="확인 번호" />
        <span class="check_timer"><p id="timer_count"></p></span>
    </div>
    <div class="span">
        등록된 휴대폰번호로 인증번호가 발송됩니다.
    </div>
    <div>
        <button type="submit" id="confirmButton" class="btn_login denial">확인</button>
    </div>
</div>
</form>

<div class="m_login_footer">
    <span>아이디 비밀번호 분실 시 이지웰니스로 문의바랍니다.</span>
    <span>이지웰니스 상담센터 담당 (02-6909-441)</span>
</div>
</body>
</html>