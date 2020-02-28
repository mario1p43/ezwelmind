<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%><%@
	taglib prefix="s" uri="/struts-tags" %>
<%
	String funcNum = (String)request.getParameter("CKEditorFuncNum");
	String httpPathUrl = (String)request.getAttribute("httpPathUrl");
%>
<script type='text/javascript'>
window.parent.CKEDITOR.tools.callFunction(<%=funcNum%>, '<%=httpPathUrl%>', '');
</script>
