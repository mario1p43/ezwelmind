<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ConfirmNumber</title>
<link href="${url:img('/css_js/admin_css.css')}" rel="stylesheet" type="text/css" />
</head>
<body>
ConfirmNumber
<br>
<form id="loginConfirm" action="/partner/main/confirmnumber" method="post">
<input type="text" id="confirmNumber" name="confirmNumber" size="15" autofocus="autofocus" class="write_box" placeholder="확인 번호" />
<button type="submit" id="confirmButton" class="btn_login denial">확인</button>
</form>
</body>
</html>