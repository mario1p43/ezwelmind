<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
	.flexColumn{display: flex;  flex-direction: column; display: -webkit-flex;  -webkit-flex-direction: column; }
	.flex{display: flex; display: -webkit-flex;}
	.flexGrow{-webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0;  -webkit-flex : 1 1 0;}
	.center{-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; }/* 가로세로중앙정렬 */
	.centerH{-webkit-align-items: center; align-items: center; }/* 세로중앙정렬 */
	.rightR{-webkit-justify-content: flex-end; justify-content: flex-end; }
	.rightC{-webkit-align-items: flex-end; align-items: flex-end;}
    .m_main_header{
        display:flex;
        padding-top: 4.2667vw;
        padding-bottom: 6.4vw;
        padding-right: 5.5556vw;
        padding-left: 5.5556vw;
    }
    .m_header_logo{
        height: 6.9444vw;
    }
    .m_header_logout {
        display:flex;
    }
    .m_header_nav a span {
        letter-spacing: 0.0427vw;
        color: #FF8B7E;
        font-size: 3.8889vw;
    }
    .m_header_logout {
        justify-content: space-evenly;
    }
    .m_header_nav a img{
        margin-left: 2.2667vw;
        height: 3.8889vw;
    }
</style>
<div class="m_main_header">
    <img class="m_header_logo" src="/resources/img/logo.png" alt="" />
    <div class="m_header_nav flex flexGrow centerH rightR">
        <a class="flex centerH" href="/partner/login/logout">
            <span>로그아웃</span>
            <img class="m_header_logout" src="/resources/img/logout_icon.png" />
        </a>
    </div>
</div>