<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ezwel.common.web.acl.MenuUtil" %>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script type="text/javascript">

$(document).ready(function() {
	j$.cookie("SANGDAM4U_ADMIN_MENULEVELCD", j$("#left_menu_levelCd").val(),{path: '/'});
	
	$(".menu").click(function(){
    	var subMenu = $(this).next("tr").next("tr");

        if( subMenu.is(":visible") ){
            subMenu.slideUp();
        }else{
            subMenu.slideDown();
        }
    });
	
	/* 처음 메뉴 접속시 모두닫기
	var menuLength = $(".menu");
	for(var i = 0 ; i < menuLength.length; i ++){
		var subMenu = menuLength.next("tr").next("tr");
		
		if( subMenu.is(":visible") ){
            subMenu.slideUp();
        }
	} */
});

</script>
<%=MenuUtil.getLeftMenu(request) %>


