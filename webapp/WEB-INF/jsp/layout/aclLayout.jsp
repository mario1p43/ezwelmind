<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- acl -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
	<head>
		<sec:authentication var="sesUser" property="principal.user" />
		<c:if test="${sesUser.userType eq '2001'}">
		<title>마인드어드민 > <decorator:title default=""/></title>
		</c:if>
		<c:if test="${sesUser.userType eq '3001'}">
		<title>파트너어드민 > <decorator:title default=""/></title>
		</c:if>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="robots" content="noindex" />
		<link rel="shortcut icon" href="${url:img('/home/images/layout/favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${url:img('/home/images/layout/apple-touch-icon.png')}">

		<link href="${url:resource('/resources/css/sample.css')}" rel="stylesheet" type="text/css" />
		<link href="${url:resource('/resources/css/jquery-theme/smoothness/jquery-ui.css')}" rel="stylesheet" type="text/css" />
		<style>
			input.search {
				height: 19px; width: 200px
			}
			select.search {
				height: 25px; padding-left: 10px;; padding-right: 10px;
			}
			li.ui-state-default {margin: 0px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
			span.ui-icon {float: left; margin: 0 4px;}
			span.text {float: left; padding-right: 8px}
		</style>
		<%@ include file="/WEB-INF/jsp/layout/inc/staticBefore.jspf"%>
		<script>
			jQuery(document).ready(function(){
				jQuery('.ui-state-default.ui-corner-all').parent().children().css("float", "left").css("margin-left", "5px");
				jQuery("input[type='submit'], .button a, button").button()
																 .click(function( event ) {
																	 event.preventDefault();
																 });

				jQuery('.ui-state-default').hover(
					function(){ jQuery(this).addClass('ui-state-hover'); },
					function(){ jQuery(this).removeClass('ui-state-hover'); }
				);
				jQuery('.ui-state-default').click(function(){ jQuery(this).toggleClass('ui-state-active'); })

				jQuery('.icons').append(' <a href="#">Toggle text</a>').find('a').click(function(){ jQuery('.icon-collection li span.text').toggle(); return false; }).trigger('click');
			});
		</script>



		<decorator:head />
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
		<body>
		<!-- Head 영역 START-->
	
		
		<jsp:include page="/WEB-INF/jsp/layout/inc/defaultHeader.jsp" />
		<!-- Head 영역 START-->
		<table width="100%">
			<tr>
				<td width="250px" valign="top">
					<!-- Left 메뉴영역 start -->
					<jsp:include page="/WEB-INF/jsp/layout/inc/defaultLeftMenu.jsp" />
					<!-- Left 메뉴영역 END-->
				</td>
				<td valign="top" height="600px">
					<!-- 메인 영역 start -->
					<decorator:body />
					<!-- 메인 영역 END-->
				</td>
			</tr>
		</table>
		<!-- footer 영역 start -->
		<jsp:include page="/WEB-INF/jsp/layout/inc/defaultFooter.jsp" />
		<!-- footer 영역 END-->
		<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
	</body>
	</body>
</html>