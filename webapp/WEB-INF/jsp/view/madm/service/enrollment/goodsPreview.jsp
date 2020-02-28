<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!doctype html>
<html lang="ko">
	<head>
		<title>상담포유 > 상품상세</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=1200">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="http://www.sangdam4u.com//resources/js/plugin/jquery.divpop.css" rel="stylesheet" type="text/css" />
<link href="http://www.sangdam4u.com//resources/js/plugin/calendarJquery/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<link href="http://www.sangdam4u.com//resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css" rel="stylesheet" type="text/css" />
<script src="http://www.sangdam4u.com//resources/js/jquery-1.11.1.min.js"></script>
<script src="http://www.sangdam4u.com//resources/js/jquery-ui-1.10.3.min.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.alert.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.cookie.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.divpop.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/common.js"></script>
<script src="http://www.sangdam4u.com//resources/js/md5.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/calendarJquery/jquery.datetimepicker.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.validate/jquery.validate.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.validate/additional-methods.js"></script>
<script src="http://www.sangdam4u.com//resources/js/plugin/jquery.form-validator.js"></script>
<link rel="stylesheet" href="http://img.ezwelmind.co.kr/sangdam4u/css/reset.css" />
<link rel="stylesheet" href="http://img.ezwelmind.co.kr/sangdam4u/css/common.css" />
<script src="http://img.ezwelmind.co.kr/sangdam4u/js/ezwel_mind_ui.js"></script>
<script src="http://img.ezwelmind.co.kr/sangdam4u/js/jquery.bxslider.js"></script><!-- 플러그인 - 배너 -->
<!-- 멘탈헬스존 css -->
<link rel="stylesheet" href="http://img.ezwelmind.co.kr/sangdam4u/css/mental_health.css" />
<script type="text/javascript">
var layerAction = "";
$(document).ready(function(){

	$("#qtyUpBtn").click(function(){
		var qty = $("#qty").val();
		qty++;
		$("#qty").val(qty);
	});

	$("#qtyDownBtn").click(function(){
		var qty = $("#qty").val();
		if(qty > 1){
			qty--;
			$("#qty").val(qty);
		}
	});
	
	/* $("#layerOkbtn").click(function(){
		if(layerAction == "order"){
			$("#goodsform").submit();
		}else if(layerAction == "cart"){
			getCart();
		}
	}); */

	$("#layerCancelbtn").click(function(){
		$("#requiredLayer").hide();
		layerAction = "";
	});

});
function checkQty(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) )
		{
			return;
		}
		else
		{
			return false;
		}
}
function checkRequired(obj){
	if("N" == "N" || layerAction == "cart"){
		return true;
	}else{
		$("#requiredLayer").show();
		layerAction = obj;
	}
}

</script>
</head>
<body>
<script type="text/javascript">
j$(document).ready(function() {

	setPopupDispYn();
	
	// 배너 닫기
	j$(".btn_close").click(function(){
		j$(this).parent().hide();
	});
	j$(".btnPopupClose").click(function(){
		j$(this).parent().parent().hide();
	});
	
	j$("#today_c").click(function(){
		var popupSeq = j$("#popupSeq").val();
		var cookieNm = "SANGDAM4U_COOKIE_POPUP_"+popupSeq;
		
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
	var popupSeq = j$("#popupSeq").val();
	var cookieNm = "SANGDAM4U_COOKIE_POPUP_"+popupSeq;
	var getPopupDispYn = $.cookie(cookieNm);
	
	if(getPopupDispYn != popupSeq){
		$("#popupDispYn").show();
	}
}
</script>
<div id="popupDispYn" style="display: none;">
</div>

 <script>
 // GA 추가 
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
 
  ga('create', 'UA-80067710-2', 'auto');
  ga('require', 'displayfeatures');
  ga('require', 'linkid');
  ga('send', 'pageview');
</script>
	<div id="skipNav"><a href="#content" class="blind">본문바로가기</a></div>
	<div class="wrap">
		<!-- Head 영역 START-->
		<div id="header">
<script type="text/javascript">
/* menuCd 셋팅 : 쿠키 , URL */
j$(document).ready(function() {
	j$.cookie("SANGDAM4U_COOKIE_MENUCD", j$("#leftMenuCd").val(),{path: '/'});
});

function JS_FN_goSangdam4UMenu(url) {
	j$.removeCookie("SANGDAM4U_COOKIE_MENUCD",{path: '/'});
	location.href=url;
}
/* END - menuCd 셋팅 : 쿠키 , URL */
</script>

<div class="user_wrap">
	<div class="user_cont">
		<div class="user_list">
			<ul class="user_link">
				
					<li class="pay_sch">
						
								<a href="javascript:void(0);" onclick="JS_FN_goSangdam4UMenu('/mypage/myOrderList')" >결제내역조회</a>
						
						
							<li class="logout"><a href="http://img.ezwelmind.co.kr/sangdam4u/files/sangdam4u_GUIDEBOOK_v1.0_TypeA.pdf" target="_blank">가이드 북</a></li>
						
						
					</li>
					<li class="pay_sch">
						
								<a href="javascript:void(0);" onclick="JS_FN_goSangdam4UMenu('/cart/getCart')" >장바구니(2)</a>
						
					</li>
					<li class="logout"><a href=">/login/logout">로그아웃</a></li>
				
			</ul>
			<ul class="sns_link">
				<li><a href="https://www.facebook.com/ezwelmind" target="_blank"><img src="http://img.ezwelmind.co.kr/sangdam4u/images/icon/icon_facebook.png" alt="facebook"></a></li>
				<li><a href="https://story.kakao.com/ch/ezwelmind/feed" target="_blank"><img src="http://img.ezwelmind.co.kr/sangdam4u/images/icon/icon_kakao.png" alt="kakaostory"></a></li>
			</ul>
		</div>
	</div>
</div>


	<div class="gnb_wrap">
		<div class='gnb_zone'><h1 class='logo'><a href='/'><img src='//img.ezwelmind.co.kr/sangdam4u/images/logo/img_logo_test.png' alt='EZWEL MIND'></a></h1><div class='gnb_cont'><h2 class='blind'>메인메뉴</h2><div class='gnb_area'>   <ul class='gnb gnb_new'>      <li class='dept1_m44' ><a href='javascript:void(0)'>나의상담포유</a>         <div class='gcont gcont_type01'>            <ul>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myInfoView")'>개인정보관리</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myOrderList")'>결제내역조회</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myCounselList")'>상담/검사조회</a></li>    <li class='cate' style='display:none'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>교육신청조회</a></li>    <li class='cate' style='display:none'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/orderCancel/main")'>취소 수수료 결제</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myInquiryList")'>1:1 문의조회</a></li>            </ul>         </div>      </li>      <li class='dept1_m50' ><a href='javascript:void(0)'>서비스소개</a>         <div class='gcont gcont_type01'>            <ul>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_outline_eap")'>서비스개요</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_method")'>이용방법</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_method2")'>이용방법</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_rule")'>상담비밀보장원칙</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_counsel")'>온라인상담포털</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/jedo/serviceNetwork")'>제휴네트워크</a></li>            </ul>         </div>      </li>      <li class='dept1_m59' ><a href='javascript:void(0)'>심리상담</a>         <div class='gcont gcont_type02'>            <ul>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_stress")'><strong>개인상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_stress")'>스트레스일반</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_gloom")'>우울</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_anxiety")'>불안</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_stress02")'>외상후스트레스장애</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_character")'>성격/성향</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_relations")'>대인관계</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_poison")'>중독</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_suicide")'>자살</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_rape")'>성문제</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_health")'>건강/생활습관</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_etc")'>기타정신과문제</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_promotion")'><strong>부부상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_promotion")'>부부관계증진</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_divorce")'>이혼상담</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_violence")'>성문제상담</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_sterility")'>불임/난임스트레스</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_family_conflict")'><strong>가족상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_family_conflict")'>가족갈등</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_family_coach")'>부모코칭</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_course")'><strong>자녀상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_course")'>학습/진로</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_emotion")'>정서문제</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_friend")'>교우관계</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_game")'>인터넷/폰/게임중독</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_charactor")'>인성코칭</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_etc")'>기타정신과문제</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_coach")'><strong>직장생활상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_coach")'>임직원코칭</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_change")'>조직변화적응</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_cohabit")'>비동거가족심리지원</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_danger")'>위기개입</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_harass")'>직장 내 폭력</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_stress")'>직무스트레스</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_conflict")'>동료/상사 갈등</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_laborer")'>감정노동자</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_workingmom")'>워킹맘</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_retirement")'>퇴직예정자</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_etc_finance")'><strong>기타상담</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_etc_finance")'>재무상담</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_etc_law")'>법률/세무상담</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_emergency")'><strong>긴급상담</strong></a>       <ul>       </ul>    </li>            </ul>         </div>      </li>      <li class='dept1_m95' ><a href='javascript:void(0)'>심리검사</a>         <div class='gcont gcont_type02'>            <ul>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/online/inspectionIntro")'><strong>온라인검사</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/online/inspectionIntro")'>온라인검사란?</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/online/inspection/list?prmCd=100000004")'>마음건강검진</a></li>       </ul>    </li>            </ul>         </div>      </li>      <li class='dept1_m284' ><a href='javascript:void(0)'>멘탈헬스존</a>         <div class='gcont gcont_type02'>            <ul>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'><strong>마음의 양식</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'>힐링도서관</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1003")'><strong>셀프힐링</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1003")'>컬러링북</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1002")'>명화그리기</a></li><li style='display:none'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1004")'>캘리그래피</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/meditation")'><strong>웰니스</strong></a>       <ul><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/meditation")'>명상</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_welness_brainFitness")'>브레인피트니스</a></li><li ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_welness_brainHealing")'>브레인힐링</a></li>       </ul>    </li>    <li class='cate'><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/asp/aspMain")'><strong>ASP메인페이지</strong></a>       <ul>       </ul>    </li>            </ul>         </div>      </li>      <li class='dept1_m116' ><a href='javascript:void(0)'>교육프로그램</a>         <div class='gcont gcont_type01'>            <ul>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/education/hanwaEdu?aspNm=HWSNC")'>온라인 강좌</a></li>            </ul>         </div>      </li>      <li class='dept1_m120' ><a href='javascript:void(0)'>커뮤니티</a>         <div class='gcont gcont_type01'>            <ul>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/notice/noticeList")'>공지사항</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/column/columnList")'>멘탈헬스 칼럼</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/counselPublic/counselPublicList")'>공개상담게시판</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/wish/wishList")'>희망해요</a></li>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/faq/faqList")'>고객문의</a></li>            </ul>         </div>      </li>      <li class='dept1_m218' style='display:none'><a href='javascript:void(0)'>네비게이터</a>         <div class='gcont gcont_type01'>            <ul>    <li class='cate' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/navigator/navigatorMain")'>상담네비게이터</a></li>            </ul>         </div>      </li>   </ul></div></div><button type='button' class='btn_list'>전체목록 보기</button></div><div class='all_menu_wrap'><div class='all_menu'><div class='menu44' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>나의상담포유</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myInfoView")'>개인정보관리</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myOrderList")'>결제내역조회</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myCounselList")'>상담/검사조회</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>교육신청조회</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/orderCancel/main")'>취소 수수료 결제</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mypage/myInquiryList")'>1:1 문의조회</a></dd>   </dl></div><div class='menu50' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>서비스소개</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_outline_eap")'>서비스개요</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_method")'>이용방법</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_method2")'>이용방법</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_rule")'>상담비밀보장원칙</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/service_counsel")'>온라인상담포털</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/jedo/serviceNetwork")'>제휴네트워크</a></dd>   </dl></div><div class='menu59' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>심리상담</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_personal_stress")'>개인상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_couple_promotion")'>부부상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_family_conflict")'>가족상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_children_course")'>자녀상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_group_coach")'>직장생활상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_etc_finance")'>기타상담</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/static/left/common/mental_emergency")'>긴급상담</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/counsel/counselBagic")'>상담신청</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/order/orderCounselMain")'>상담주문</a></dd>   </dl></div><div class='menu95' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>심리검사</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/online/inspectionIntro")'>온라인검사</a></dd>   </dl></div><div class='menu284' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>멘탈헬스존</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'>마음의 양식</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1003")'>셀프힐링</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/meditation")'>웰니스</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/asp/aspMain")'>ASP메인페이지</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/order/orderMentalHealZone")'>주문</a></dd><dd style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/order/orderCart")'>장바구니주문</a></dd>   </dl></div><div class='menu116' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>교육프로그램</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/education/hanwaEdu?aspNm=HWSNC")'>온라인 강좌</a></dd>   </dl></div><div class='menu120' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>커뮤니티</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/notice/noticeList")'>공지사항</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/column/columnList")'>멘탈헬스 칼럼</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/counselPublic/counselPublicList")'>공개상담게시판</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/wish/wishList")'>희망해요</a></dd><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/communication/faq/faqList")'>고객문의</a></dd>   </dl></div><div class='menu218' style='display:none' >   <dl class='list_type02'>      <dt><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/")'>네비게이터</a></dt><dd ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/navigator/navigatorMain")'>상담네비게이터</a></dd>   </dl></div></div></div>
	</div>
<!-- 전 페이지 공통으로 들어갑니다. -->
<script>
	$(document).ready(function() {
	
		j$(".current_zone_btn").click(function(){
			j$(".current_zone").show();
		});
	
		$(".toggle_btn").click(function() {
			if (!$(this).hasClass("on")) {
				$.ajax({
					url: '/common/getReservation',
					dataType: 'json',
					success: function(data){
						$("#topWait").text(data.wait);
						$("#topDecide").text(data.decide);
						$("#topUsePoint").text(comma(data.usePoint));
						
						$("#stand_move1").removeClass();
						$("#stand_move1").addClass("stand_move");
						$("#stand_move1").addClass("p" + data.picPer);
						$("#reservationPersent").html(data.remainPer + "<span>%</span>")
						
						try{
							$("#stand_move2").removeClass();
							$("#stand_move2").addClass("stand_move");
							$("#stand_move2").addClass("p" + data.picPrivate);
						}catch(e){}
					}
				});
			}
		});
		
	});
</script>
<div class="current_info">
	<div class="current_zone" style="display:none;">
		<div class="current_wrap">
			<div class="design_area"></div><!-- //디자인적요소로 인한 빈 tag -->
			<div class="current_cont">
				<div class="reservation">
					<dl>
						<dt>
							<strong class="current_tit">예약현황</strong>
							<a href="javascript:void(0)" onclick="JS_FN_goSangdam4UMenu('/mypage/myOrderList')" class="btnc_dgo"><img src="http://img.ezwelmind.co.kr/sangdam4u/images/common/btn_directgo.png" alt="바로가기"></a>
						</dt>
						<dd class="first_dd">
							<em id="topWait"></em>
							<strong class="info01_tit">상담예정</strong>
						</dd>
						<dd>
							<em id="topDecide"></em>
							<strong class="info02_tit">상담완료</strong>
						</dd>
					</dl>
				</div>
				
				
					<div class="exploit">
						<dl>
							<dt>
								<strong class="current_tit">이용현황</strong>
							</dt>
							<dd class="f_dd">
								<div class="graph_wrap">
									<div class="overwrap"></div><!-- overwrap -->
									<div class="stand_move" id="stand_move1"><!-- 0% ~ 100% 에 대한 위치를 클래스 p0 ~ p100 으로 (10단위 씩) 구분하였습니다.  -->
										<img src="http://img.ezwelmind.co.kr/sangdam4u/images/common/bg_graph_stand.png" alt="퍼센트별 움직이는 이미지">
									</div>
								<em class="persent" id="reservationPersent"></em><!-- 퍼센트 글자 -->
								</div>
								<strong class="info01_tit">회사잔여율(%)</strong>
							</dd>
							<dd class="s_dd">
								<div class="sgraph_wrap">
								<div class="overwrap"></div><!-- overwrap -->
								<div class="stand_move" id="stand_move2"><!-- 0% ~ 100% 에 대한 위치를 클래스 p0 ~ p100 으로 (10단위 씩) 구분하였습니다.  -->
									<img src="http://img.ezwelmind.co.kr/sangdam4u/images/common/bg_sgraph_stand.png" alt="수치별 움직이는 이미지">
								</div>
								<em class="point" id="topUsePoint"></em><!-- 포인트 글자 -->
								</div>
								<strong class="info02_tit">개인사용현황</strong>
							</dd>
				        </dl>
					</div>
			</div>
		</div>
	</div>
		<button type="button" class="toggle_btn on current_zone_btn">열고닫기 버튼</button>
</div><!-- //current_info -->
<!-- //전 페이지 공통으로 들어갑니다. -->
<div class='nav_wrap'>   <ul class='nav_zone'>       <li><a href='/'>홈</a></li><li><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'>마음의 양식</a></li><li><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'>힐링도서관</a></li><li><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000026")'>일반심리학</a></li>   </ul></div><input type='hidden' id='leftMenuCd' name='leftMenuCd' value='281'><input type='hidden' id='sangdam4UPayCd' name='sangdam4UPayCd' value='100392|100393|100394'>
		</div>
		<!-- Head 영역 END-->
		
		<div id="content">
			<div class="left_area">
<div class='sub_tit_area'><img src='//img.ezwelmind.co.kr/sangdam4u/images/icon/ico_mental_health.png' alt='멘탈헬스존'><h2 class='sub_tit'>멘탈헬스존</h2></div><p class='sub_tit02'>마음의 양식</p><ul class='dept_list'><li class='dept_zone on'  ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/healingLibrary?pageCd=1001")'><span>힐링도서관</span></a><ul class='dept02 on'><li class='on' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000026")'><span>일반심리학</span></a></li><li class='' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000027")'><span>스트레스/감정</span></a></li><li class='' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000030")'><span>자기계발</span></a></li><li class='' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000008")'><span>교육/육아</span></a></li><li class='' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000029")'><span>마음치료</span></a></li><li class='' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000028")'><span>심리검사</span></a></li><li class='' style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000011")'><span>힐링도서관_감정별추천(기분전환)</span></a></li><li class='' style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000012")'><span>힐링도서관_감정별추천(사랑/설렘)</span></a></li><li class='' style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000013")'><span>힐링도서관_감정별추천(스트레스)</span></a></li><li class='' style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000014")'><span>힐링도서관_감정별추천(추억/회상)</span></a></li><li class='' style='display:none' ><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/mentalhealthzone/goodsList?prmCd=100000015")'><span>힐링도서관_감정별추천(휴식/힐링)</span></a></li></ul></li></ul><input type='hidden' id='leftMenuCd' name='leftMenuCd' value='281'><input type='hidden' id='sangdam4UPayCd' name='sangdam4UPayCd' value='100392|100393|100394'>
			</div>
			<div class="right_area">
				
<form id="goodsform" name="goodsform" action="/order/orderMentalHealZone" method="POST">
<script type="text/javascript">
$(function(){
	$('.tab_nav a').click(function() { 
		$('.tab_nav li').removeClass('on');
		$(this).parent().addClass('on');
		$('.tab_cont').removeClass('on')
		var activeTab = $(this).attr("href");
		$(activeTab).addClass('on');
		return false;
	});
});
</script>
<h3 class="cont_tit">상품 상세 정보</h3>
<!-- contents_area -->
<div class="contents_area">
    <!-- detail_view -->
    <div class="detail_view">
        <h4 class="detail_view_tit">${goods.goodsNm} </h4>
        <!-- detail_view_cont -->
        <div class="detail_view_cont">
            <div class="img">
            	<!-- <img src="../../images/data/img_thumb.jpg" alt=""> -->
            	<img src="${url:img(goods.filePath500)}" alt="${goods.fileNm500}" >
            </div>
            
            <!-- detail_view_info -->
            <div class="detail_view_info">
                <ul>
                    <li>
                        <strong class="n">정상가</strong>
                        ${String.format("%,d",Integer.parseInt(goods.goodsBuyPrice))}원
                    </li>
                    <li>
                        <strong class="n">판매가</strong>
                        <strong class="txt_ty02">${String.format("%,d",Integer.parseInt(goods.goodsSalePrice))}원</strong>
                        <c:if test="${goods.dcAmtYn eq 'Y' or goods.dcRateYn eq 'Y'}">
	                        <p class="box_discount"><span>할인</span></p>
	                        <span>(
	                        <c:if test="${goods.dcAmtYn eq 'Y'}">
	    	                    ${String.format("%,d",Integer.parseInt(goods.goodsBuyPrice - goods.goodsSalePrice))}원.
	    	                </c:if> 
    	                    <c:if test="${goods.dcRateYn eq 'Y'}">
	        	                ${Math.round((goods.goodsBuyPrice - goods.goodsSalePrice)/goods.goodsBuyPrice*100)}%
	        	            </c:if>
	                        )</span>
                        </c:if>
                        
                    </li>
                </ul>
                <ul>
                   	<c:choose>
                   		<c:when test="${goods.goodsManu ne '' and goods.goodsOrigin ne ''}">
		                    <li>
		                        <strong class="n">제조사/원산지</strong>${goods.goodsManu}/${goods.goodsOrigin}
		                    </li>
                   		</c:when>
                   		<c:when test="${goods.goodsManu ne '' and goods.goodsOrigin eq ''}">
		                    <li>
		                        <strong class="n">제조사</strong>${goods.goodsManu}
		                    </li>
                   		</c:when>
                   		<c:when test="${goods.goodsManu eq '' and goods.goodsOrigin ne ''}">
		                    <li>
		                        <strong class="n">원산지</strong>${goods.goodsOrigin}
		                    </li>
                   		</c:when>
                   		<c:otherwise>
                   		</c:otherwise>
                   	</c:choose>
                    <li>
                        <strong class="n">상품코드</strong>
                    </li>
                    <li>
                        <strong class="n">배송료</strong>
                        <c:choose>
                        	<c:when test="${'Y' eq goods.dlvrPriceYn}">
                        		무료
                        	</c:when>
                        	<c:when test="${'0' eq goods.dlvrPrice}">
                        		무료
                        	</c:when>
                        	<c:otherwise>
                        		${String.format("%,d",Integer.parseInt(goods.dlvrPrice)) }
                        	</c:otherwise>
                        </c:choose>
                    </li>
                </ul>
                <ul>
                    <li>
                        <strong class="n">수량</strong>
                        <!-- input_num -->  
                        <div class="input_num">
                            <input type="text" class="input_box" id="qty" maxlength="9" name="qty" value="1" onkeydown="return checkQty(event)">
                            <div>
                                <input type="button" class="n_up" id="qtyUpBtn" alt="up">
                                <input type="button" class="n_down" id="qtyDownBtn" alt="down">
                            </div>
                        </div>
                        <!-- //input_num --> 
                        <span class="txt_sp">개</span>
                    </li>
                </ul>
                <c:if test="${goodsOption != null and goodsOption.size() > 0}">
	                <ul>
	                    <li>
	                        <strong class="n">옵션</strong>
							<c:forEach var="list" items="${goodsOption}" varStatus="status">
								<input type="hidden" name="selectYn" value="${list.selectYn}" />
								<select class="sel_box274" name="optionList">
									<option value="">${list.grpNm} ${list.selectYn eq 'Y'  ? '(필수)':''}</option>
									<c:forEach var="goodsOptionList" items="${list.goodsOptionList}" varStatus="status">
										<option value="${list.grpNm}//${goodsOptionList.itemNm}//${goodsOptionList.itemSalePrice}//${list.grpCd}//${goodsOptionList.itemCd}">${goodsOptionList.itemNm}(+${goodsOptionList.itemSalePrice}원)</option>
									</c:forEach>
								</select>
							</c:forEach>
	                    </li>
	                </ul>
                </c:if>
                <!-- detail_view_btn -->
                <div class="detail_view_btn">
                    <a href="#none" class="btn_ty" >장바구니담기</a>
                    <a href="#none" class="btn_ty02" >주문하기</a>
                </div>
                <!-- //detail_view_btn -->
            </div>
            <!-- //detail_view_info -->
        </div>
        <!-- detail_view_cont -->
    </div>
    <!-- //detail_view --> 

    <!-- tab_ty -->
    <ul class="tab_ty tab_nav">
    	<c:if test="${'Y' eq goods.requiredCheckYn}">
        	<li class="on"><a href="#tc01">필수확인사항</a></li><!-- 활성화 class=""on -->
        </c:if>
        <li${goods.requiredCheckYn ne 'Y'  ? ' class="on"':''}><a href="#tc02">상세정보</a></li>
        <li><a href="#tc03">배송안내</a></li>
        <li><a href="#tc04">교환/환불/반품/취소 규정</a></li>
    </ul>
    <!-- //tab_ty -->
    
    <!-- 필수확인사항 -->
    <c:if test="${'Y' eq goods.requiredCheckYn}">
	    <div class="tab_cont on" id="tc01"><!-- 활성화 class="on" -->
	        <h5 class="blind">필수확인사항</h5>
	        <dl>
	            <dt class="txt_tit"></dt>
	            <dd>${goods.requiredCheckContent }</dd>
	        </dl>
	    </div>
    </c:if>
    <!-- //필수확인사항 -->
    
    <!-- 상세정보 -->
    <div class="tab_cont${goods.requiredCheckYn ne 'Y'  ? ' on':''}" id="tc02">
        <h5 class="blind">상세정보</h5>
        <!-- board_ty -->
        <div class="board_ty">
            <table>
                <caption>상세정보</caption>
                <colgroup>
                    <col span="1" style="width:22%;">
                    <col span="1" style="width:78%;">
                </colgroup>
                <tbody>
    				<c:forEach var="list" items="${goodsGrp}" varStatus="status">
	                    <tr>
	                        <th scope="row" class="left">${status.index}. ${list.title}</th>
	                        <td class="left">${list.goodsDesc.replaceAll("\\r\\n","<br>")}</td>
	                    </tr>
					</c:forEach>
                </tbody>
            </table>
        </div>
        <!-- //board_ty -->
        
        <!-- img_view -->
        <div class="img_view mt40">
            <!-- <img src="../../images/data/img_detail_view.jpg" alt=""> -->
            ${goods.goodsDesc } 
        </div>
        <!-- //img_view -->
    </div>
    <!-- //상세정보 -->
    
    <!-- 배송안내 -->
    <div class="tab_cont" id="tc03">
        <h5 class="blind">배송안내</h5>
        <dl>
            <dt class="txt_tit"></dt>
            <dd>${goods.goodsDlvr }</dd>
        </dl>
    </div>
    <!-- //배송안내 -->
    <!-- 교환/환불/반품/취소 규정 -->
    <div class="tab_cont" id="tc04">
        <h5 class="blind">교환/환불/반품/취소 규정</h5>
        <dl>
            <dt class="txt_tit"></dt>
            <dd>${goods.goodsSubGoodsCancelRefund }</dd>
        </dl>
    </div>
    <!-- //교환/환불/반품/취소 규정 -->
</div>
<!-- //contents_area -->

<!-- Popup : layer_area -->
<div class="layer_area" style="display:none" id="requiredLayer">
    <!-- pop_cont -->
    <div class="pop_cont">
        <!-- pop_cont_area -->
        <div class="pop_cont_area">
            <h4 class="pop_tit_s">필수입력사항</h4>
            <!-- box_cont -->
            <div class="box_cont">
                <ul class="input_list">
                    <li><input type="text" name="requiredInputContent" class="input_box_w" style="width:300px;"></li>
                </ul>
            </div>
            <!-- //box_cont -->
        </div>
        <!-- //pop_cont_area -->
        <a href="#none" class="d_btn" id="layerOkbtn">확인</a>
    </div>
    <!-- //pop_cont -->
    <button type="button" class="btn_close" id="layerCancelbtn">닫기</button>
</div>
<!-- //Popup : layer_area -->

</form>

			</div><!-- end of right_area -->
		</div>

		<!-- footer 영역 start -->
		













	<div id="footer">
		<div class="site_info">
			<div class="s_info">
				<ul>
					<li><a href="javascript:void(0);" class="personal_terms" onclick="layerPopup('personalInfo'); return false;">개인정보처리방침</a></li>
					<li><a href="javascript:void(0);" onclick="layerPopup('useService'); return false;">이용약관</a></li>
					<li><a href="http://www.ezwelmind.com" target="_blank" >서비스업체소개</a></li>
					<li><a href="http://www.ecmc.or.kr" target="_blank" >전자거래분쟁조정위원회</a></li>
				</ul>
			</div>
		</div>

		<div class="c_info">
			<h2 class="foot_tit">나만의 힐링공간 상담포유</h2>
			<div class="c_cont">
				<p>
					<strong>이지웰니스(주)</strong><!-- 2015.09.08 추가 -->
					서울시 구로구 디지털로 34길 43 (구로동)코오롱싸이언스밸리 1차 11층<br />
					<strong>사업자등록번호</strong> 423-86-00129 <strong class="ml15">통신판매업신고</strong>  구로-0917호<br />
					<strong>대표</strong> 강민재 <strong class="ml15">개인정보보호최고관리책임자</strong> 강민재<br />
					<strong>고객센터</strong> TEL 1644-4474 <span class="ml15">FAX 070-7500-1697</span>
					<span class="certify_box"><a href="http://www.crosscert.com/seal/sangdam4u_com.html" target="blank"><img src="http://img.ezwelmind.co.kr/sangdam4u/images/common/img_certify.png" alt="보안인증서"></a></span><!-- 2015.09.09 - 내용추가 -->
				</p>
			</div>
			<div class="pay_cont">
				<strong>구매안전서비스(채무지급보증)</strong>
				<p>
					당사는 기업은행과 채무지급보증 계약을 체결하여 <br />5만원 이상 현금 등으로 결제한 금액에 대해 <br />안전거래를 보장하고 있습니다.
				</p>
			</div>
		</div>

	</div><!-- //footer -->
	
	<!-- 퀵메뉴 -->
	<div class="quick_area">
		<div class="quick_list">
			<ul>
				<li class="qmenu01"><a href='javascript:void(0)' onclick='JS_FN_goSangdam4UMenu("/counsel/counselBagic")'><img src="http://img.ezwelmind.co.kr/sangdam4u/images/common/img_quick_m01.png" alt="즉시상담"></a></li>

			</ul>
		</div>
	</div>
<script>
<!-- 액션 수행후 팝업 (insert, update)-->-

</script>

<script type="text/javascript">
	function layerPopup(id){
		
		switch(id) {
			case 'personalInfo':
				$.divPop('personalInfo', "개인정보처리방침", $("#divPersonalInfo"));
				break;
			
			case 'useService':
				$.divPop('useService', "이용약관", $("#divUseService"));
				break;
			
			default:
				break;
		}
	}
</script>

<div id="divPersonalInfo" style="display: none;" >
	<div class="terms_wrap" style="width: 600px; height: 350px;"><!-- 팝업 사이즈 가로 : 600 세로 : 500-->
		<h1>(주)이지웰니스 개인정보처리방침</h1>
		<p class="mgrb30">(주)이지웰니스(sangdam4u.com 이하 "회사"라 함)는 "정보통신망이용 촉진 및 정보보호 등에 관한 법률"(이하 “정통망법”이라 함)등 모든 관련법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. 회사는 개인정보처리방침의 공개를 통하여 회원 여러분의 개인정보가 어떠한 목적과 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지를 알려드립니다. 본 개인정보처리방침은 관련법령의 개정이나 당사 내부방침에 의해 변경될 수 있으며 회원 가입시나 사이트 이용 시에 수시로 확인하여 주시기 바랍니다.</p>
	
		<h2 class="dotted">용어의 정의</h2>
		<ul class="mgrb30">
			<li>본 개인정보처리방침에서의 사용되는 용어의 정의는 다음과 같다. </li>
			<li>① "상담포유"라 함은 (주)이지웰니스가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버 몰을 운영하는 사업자들의 의미로도 사용합니다.</li>
			<li>② "상담포유 사이트" (이하 "사이트"라 한다)란 "회사"에 회원으로 등록한 이용자가 다양한 정보와 서비스를 제공받을 수 있도록 회사가 제작, 운영하는 인터넷 웹사이트를 의미합니다. </li>
			<li>③ "상담포유 회원"(이하 "회원"이라 한다)이란 "회사" 들에게 개인정보제공의 동의와 함께 회원등록을 하고 ID를 부여 받은 회원 또는 그 회원전체를 의미하며, 이때의 가입은 고객사일 경우, 약관 동의 절차만으로도 이용이 가능함을 의미합니다.</li>
			<li>④ "이용자"라 함은 상담포유에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원을 말합니다. </li>
			<li>⑤ "회원"이라 함은 "회사"에 개인정보를 제공하여 회원등록을 한 자로서, "상담포유 회원"에 가입한 자를 의미합니다. </li>
			<li>⑥ "가족회원"이라 함은 고객사 임직원의 초대와 승인을 거쳐 회원 자격을 갖춘 회원님들에게 복지관에서 고객사 임직원과 동일 또는 유사한 수준의 서비스를 이용함을 의미합니다.</li>
			<li>1. 개인정보의 수집항목 및 이용목적</li>
			<li>2. 개인정보 수집에 대한 동의 </li>
			<li>3. 수집하는 개인정보의 이용 및 보유기간 </li>
			<li>4. 개인정보의 열람, 갱신, 수정 또는 삭제</li>
			<li>5. 동의철회 및 파기</li>
			<li>6. 제3자에 대한 제공 및 위탁처리업체</li>
			<li>7. 개인정보보호를 위해 회원들이 알아야 할 사항</li>
			<li>8. 비회원 고객의 개인정보수집 및 보호</li>
			<li>9. 아동의 개인정보보호</li>
			<li>10. 쿠키의 운영 및 활용</li>
			<li>11. 링크사이트</li>
			<li>12. 개인정보 보호를 위한 기술적, 관리적 대책</li>
			<li>13. 게시물에 포함된 개인정보 </li>
			<li>14. 개인정보관련 의견수렴 및 불만처리에 관한 사항</li>
			<li>15. 개인정보 관리책임자 및 담당자의 소속, 성명 및 연락처</li>
			<li>16. 방침변경 등에 대한 고지</li>
		</ul>
		<h2>1. 개인정보의 수집항목 및 이용목적</h2>
		<ul class="mgrb30">
			<li>① 개인정보란?<br>생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.</li>
			<li>② 회사는 고객이 회원가입을 할 때 서비스 제공을 위해 필요한 필수적인 최소한의 개인정보를 받고 있습니다. 회사가 고객의 개인정보를 수집하는 목적은 상담포유 사이트를 통하여 고객에게 최적의 서비스를 제공해드리기 위한 것이며 고객이 제공한 개인정보를 바탕으로 고객에게 보다 더 유용한 정보를 선택적으로 제공하기 위한 것입니다.</li>
			<li>③ 회사는 고객의 사전 동의 없이는 고객의 개인정보를 사전에 밝힌 목적 이외로 이용하거나 제3자에게 공개하지 않습니다.</li>
			<li>④ 회사는 관련 법령에 의하거나 기타 아래의 항목을 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다. </li>
		</ul>
		<dl class="mgrb30">
			<dt>가. 필수항목 </dt>
			<dd>- 성명, 휴대전화번호, 생년월일, 전자메일주소, 아이디, 비밀번호: 이용자 본인 식별을 위한 목적 등.</dd>
			<dd>- 전자메일주소, 연락처: 회원정보관리를 위한 연락 및 안내 목적</dd>
			<dd>- 법정대리인의 이름/전자메일/휴대폰번호/통신사 정보: 만 14세 미만 아동에 대한 법정대리인 동의 확인을 위한 목적, 채권 추심 등</dd>
			<dd>- IP Address, 방문일시, 서비스 이용기록(자동으로 생성되는 개인정보): 부정이용방지, 비인가 사용 방지 분쟁조정 해결을 위한 기록보존 등</dd>
		</dl>
		<dl class="mgrb30">
			<dt>나. 선택항목 </dt>
			<dd>- 아이핀정보, 연계정보(CI), 중복가입확인정보(DI): 상품주문 및 결제를 위한 본인 식별 목적 </dd>
			<dd>- 기본배송지, 연락처, 수취인의 성명/ 전화번호/휴대폰 번호/배송주소: 고객이 주문하신 상품 및 경품 배송을 위한 목적, 채권추심 등</dd>
			<dd>- 연락처, SMS수신여부, 전자메일, 메일수신여부, DM수신 여부, 유선안내(TM)수신여부: 계약이행에 대한 연락 및 안내 등의 고지를 위한 목적, 서비스 판매 정보제공 홍보 가입권유활동 (할인쿠폰, 특가상품정보, 판촉광고 포함) 안내 등의 고지를 위한 목적 등</dd>
			<dd>- 은행계좌번호, 입금(예금)자명, 은행명, 휴대폰번호: 대금결제서비스 제공용</dd>
		</dl>
		<ul class="mgrb30">
			<li>⑤ 회사는 고객님의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 등)는 수집하지 않습니다. </li>
			<li>⑥ 수집방법 : 홈페이지 (회원가입) </li>
		</ul>
		<h2>2. 개인정보 수집에 대한 동의</h2>
		<p class="mgrb30">회사는 회원님께서 회사의 개인정보활용동의서 및 이용약관의 내용에 대해 "동의한다" 버튼 또는 "동의하지 않는다" 버튼을 클릭(Click)할 수 있는 절차를 마련하여, "동의한다"버튼을 클릭할 경우에, 입력하신 개인정보들이 당사의 고객DB에 저장되어 "동의" 버튼 위에 명시된 이용목적대로 이용되는 것을 동의한 것으로 간주하게 됩니다.</p>
		<h2>3. 수집하는 개인정보의 이용 및 보유기간 회사는 이용자의 개인정보를 원칙적으로 고지 및 약정한 기간 동안 보유 및 이용하며 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</h2>
		<p class="mgrb30">가. 관련법령 및 회사 방침에 의한 정보보유 사유 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 일정한 기간 동안 이용자 개인정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
		<dl>
			<dt>① 계약 또는 청약철회 등에 관한 기록 </dt>
			<dd>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조</dd>
			<dd>보존 기간 : 5년 </dd>
		</dl>
		<dl>
			<dt>② 대금결제 및 재화 등의 공급에 관한 기록 </dt>
			<dd>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조</dd>
			<dd>보존 기간 : 5년 </dd>
		</dl>
		<dl>
			<dt>③ 소비자의 불만 또는 분쟁처리에 관한 기록 </dt>
			<dd>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조</dd>
			<dd>보존 기간 : 3년 </dd>
		</dl>
		<dl>
			<dt>④ 접속에 관한 기록</dt>
			<dd>보존 이유 : 통신비밀보호법 제15조의2 및 시행령 제41조</dd>
			<dd>보존기간 : 3개월 </dd>
		</dl>
		<dl>
			<dt>⑤ 부정거래기록 </dt>
			<dd>보존 이유 : 부정거래의 배제</dd>
			<dd>보존 기간 : 6개월</dd>
			<dd>보존항목 : ID, 휴대폰번호, 이메일 주소, 생년월일, 부정거래사유, 탈퇴 시 회원 상태값 등</dd>
			<dd>*부정거래 : 법령, 회사와 이용자 간의 서비스 이용 약관 또는 공서양속을 위반하거나 기타 회사, 회원 또는 타인의 권리나 이익을 침해하는 방법이나 내용의 거래를 말함. </dd>
		</dl>
		<p class="mgrb30">나. 수집된 개인정보의 보유•이용기간은 서비스이용계약체결(회원가입)시부터 서비스이용계약해지(탈퇴신청, 직권탈퇴 포함)입니다. 또한 동의 해지 시 회사는 이용자의 개인정보를 상기 명시한 정보보유 사유에 따라 일정 기 간 저장하는 자료를 제외하고는 지체 없이 파기하며 개인정보취급이 제3자에게 위탁된 경우에는 수탁자에게도 파기하도록 지시합니다.</p>
		<p class="mgrb30">다. 201년 8월 18일 이전 가입한 이용자가 2년 이내에 상담포유에서 이용기록이 없을 시 ‘정보통신망 이용촉진 및 정보보호등에 관한 법률 부칙 제11322호 제2조’ 에 근거하여 이 법 시행일로부터 2년 이내에 주민등록번호를 파기합니다.</p>
		<p class="mgrb30">라. 2015년 8월 18일 기준 과거 1년간 상담포유에서 이용 기록이 없을 시, 서비스 미이용자의 개인정보는 ‘정보통신망 이용촉진 및 정보보호등에 관한 법률 제29조’ 에 근거하여 이용자에게 사전통지하고 개인정보를 파기하거나 별도로 분리하여 저장 관리합니다. 단, 통신비밀보호법, 전자상거래 등에서의 소비자보호에 관한 법률 등의 관계법령의 규정에 의하여 보존할 필요가 있는 경우 관계법령에서 규정한 일정한 기간 동안 이용자 개인정보를 보관합니다.</p>
		<p class="mgrb30">마. 파기방법 <br>이용자의 개인정보는 수집 및 이용목적이 달성된 후에는 지체 없이 파기됩니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각 등을 통하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 파기합니다.</p>
		<h2>4. 개인정보의 열람, 갱신, 수정 또는 삭제</h2>
		<ul>
			<li>① 회원님께서는 언제든지 등록되어 있는 회원님의 개인정보를 열람하거나 수정하실 수 있습니다. 개인정보 열람 및 정정을 하고자 할 경우에는 상담포유 홈페이지에서 로그인 후 "나의복지 > 개인정보관리"항목을 클릭하여 직접 열람 또는 정정하거나, 개인정보관리책임자 및 민원담당자에게 서면, 전화 또는 E-mail로 연락하시면 지체 없이 조치하겠습니다.</li>
			<li>② 회원님께서 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인 정보를 이용 또는 제공하지 않습니다. </li>
			<li>③ 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정하도록 조치하겠습니다.</li>
		</ul>
		<h2>5. 동의철회 및 파기</h2>
		<p class="mgrb30">회원가입 등을 통한 개인정보의 수집, 이용, 제공에 대하여 회원은 가입 시 동의한 내용에 대해서 언제든지 철회할 수 있습니다. 동의 철회는 임직원의 경우 회원님이 소속하신 기업/기관과 EAP아웃소싱에 대한 계약 종료 시 또는 소속하신 기업/기관에서 퇴직 시 철회가 되며, 가족회원의 경우 홈페이지 가족회원탈퇴 메뉴에서 언제든지 개인정보의 수집·이용·제공에 대한 동의를 바로 철회할 수 있습니다. 또한, 개인정보 관리 책임자 또는 담당자에게 연락하시면 즉시 회원탈퇴를 위해 필요한 조치를 취합니다. 동의를 철회하고 개인정보를 파기하는 등의 조치가 있으면 그 사실을 회원님께 지체 없이 통지하도록 하겠습니다.</p>
		<p class="mgrb30">이미 제공된 회원정보를 철회 하는 데는 일정 시간이 소요되며 시간 동안 마케팅에 활용되지 않도록 하겠습니다. 회사는 회원님의 소중한 정보를 보호하기 위하여 신속하게 처리되도록 최선의 노력을 다하겠습니다.</p>
		<h2>6. 제3자에 대한 제공 및 위탁처리업체</h2>
		<ul class="mgrb15">
			<li>① 회사는 고객의 동의가 있거나 법률의 규정에 의한 경우를 제외하고는 어떠한 경우에도 “1. 개인정보의 수집항목 및 이용목적”에서 고지한 범위를 넘어서 고객의 개인정보를 이용하거나 타인 또는 타기업, 기관에 제공하지 않습니다.</li>
			<li>② 회사가 제공하는 서비스를 통하여 회원간의 거래관계가 이루어진 경우, 배송 등 거래이행을 위하여 관련 정보는 필요한 범위 내에서 회원이 동의한 경우 아래와 같이 거래 당사자에게 제공합니다.</li>
		</ul>
		<div class="agree_tb_wrap mgrb30">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="103" />
					<col width="112" />
					<col width="112" />
					<col width="121" />
					<col width="226" />
				</colgroup>
				<tr>
					<th>구분</th>
					<th>개인정보<br>제공받는 자</th>
					<th>개인정보<br>이용 목적</th>
					<th>개인정보<br>제공 항목</th>
					<th>보유 및 이용 기간</th>
				</tr>
				<tr>
					<td>심리상담</td>
					<td>[업체리스트]</td>
					<td rowspan="4">청약의의 확인,<br>거래이행, 배송,<br>고객상담, AS등<br>불만처리</td>
					<td rowspan="4">성명, 주소<br>전화번호<br>휴대폰번호<br>주문정보<br>이메일</td>
					<td rowspan="4">개인정보 이용목적 달성 시까지<br><br>(단, 관계 법령의 규정에 의해 보존의<br>필요가 있는 경우 및 사전<br>동의를 득한 우는 해당 기간까지)</td>
				</tr>
				<tr>
					<td>심리상담</td>
					<td>[업체리스트]</td>
				</tr>
				<tr>
					<td>온라인강좌</td>
					<td>[업체리스트]</td>
				</tr>
				<tr>
					<td>집단교육</td>
					<td>[업체리스트]</td>
				</tr>
			</table>
		</div>
		<ul class="mgrb30">
			<li>③ 회사는 위탁계약 체결 시 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</li>
			<li>④ 회사가 고객의 개인정보를 제3자에게 제공하는 경우 사전에 고객에게 고객의 개인정보를 제공받는 자, 개인정보를 제공받는 자의 개인정보 이용목적, 제공하는 개인정보의 항목, 개인정보를 제공받는 자의 개인정보 보유 및 이용기간에 대해 동의를 구하는 절차를 거치거나 회원 가입 시 별도로 동의를 구하는 절차를 거치게 됩니다. 고객이 동의하지 않는 경우에는 개인정보를 제공하거나 공유하지 않습니다. 고객이 개인정보의 제공에 동의하더라도 언제든지 그 동의를 철회할 수 있습니다.</li>
			<li>⑤ 다음의 경우에는 예외적으로 고객의 동의 없이 개인정보를 제공할 수 있습니다.<br>가. 형사소송법, 금융실명거래및비밀보장에관한법률, 신용정보의이용및보호에관한법률, 전기통신기본법<br>전기통신사업법, 전파법, 지방세법, 소비자보호법, 한국은행법, 등 관계법령에 특별한 규정이 있는 경우<br>나. 통계작성, 학술연구나 시장조사를 위하여 특정 개인을 식별할 수 없는 형태로 제공하는 경우<br>다. 그러나 예외 사항에서도 관계법령에 의하거나 수사기관의 요청에 의해 정보를 제공한 경우에는<br>본래의 수집목적 및 이용목적에 반하여 무분별하게 정보가 제공되지 않도록 최대한 노력하겠습니다. </li>
			<li>⑥ 회사는 보다 나은 서비스 제공과 고객 편의 제공 등 업무수행을 원활하게 하기 위하여 회원이 동의한 경우 고객의 개인정보를 필요한 업무 범위 내에서 다음과 같이 타 업체에 수집, 보관, 처리 등을 위탁하여 처리하고 있습니다.</li>
		</ul>
		<div class="agree_tb_wrap mgrb30">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="103" />
					<col width="112" />
				</colgroup>
				<tr>
					<th>수탁자</th>
					<th>위탁업무의 내용</th>
				</tr>
				<tr>
					<td>CJ대한통운㈜ 외 기타 택배사</td>
					<td>주문한 상품의 상품 배송업무</td>
				</tr>
				<tr>
					<td>KG이니시스 등 결제대행업체</td>
					<td>상품 구매에 필요한 신용카드 결제를 포함한 전자지급수단,<br>그밖에 전자적 방법에 따른 지급수단 전자금융거래수단 등의 결제정보 전송</td>
				</tr>
				<tr>
					<td>NICE평가정보</td>
					<td>휴대폰인증, 아이핀(I-PIN) 중복가입확인정보, 연계정보 확인</td>
				</tr>
				<tr>
					<td>(주)휴머스온</td>
					<td>SMS/EMS발송(상담예약 및 취소 시, 상담일정 확정 시, 상담연장 시,<br>상담증명서/결과보고서 발급안내 시 등)</td>
				</tr>
				<tr>
					<td>이벤트 및 프로모션<br>[수탁업체 내역보기]</td>
					<td>이벤트 경품배송 및 당첨자 관리/이벤트 당첨에 따른 소득세 신고업무 대행</td>
				</tr>
			</table>
		</div>
		<h2>7. 개인정보보호를 위해 회원들이 알아야 할 사항</h2>
		<ul class="mgrb30">
			<li>① 회원님의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다. 이용자가 입력한 부정확한 정보로 인해 발생하는 사고의 책임은 이용자 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원자격이 상실될 수 있습니다.</li>
			<li>② 회원님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 비밀번호를 포함한 회원님의 개인정보가 유출되지 않도록 주의하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오. 만약 이 같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 『정보통신망이용촉진 및 정보보호등에 관한 법률』등에 의해 처벌받을 수 있습니다.</li>
		</ul>
		<p class="mgrb30">* 타인의 주민번호를 도용하여 온라인 회원가입을 하는 등 다른 사람의 주민등록번호를 부정하게 사용자는 3년 이하의 징역 또는 1천만 원 이하의 벌금이 부과될 수 있습니다.<br>※ 참조: 주민등록법 제37조(벌칙)(시행일 2011. 8. 31)</p>
		<h2>8. 비회원 고객의 개인정보수집 및 보호</h2>
		<p class="mgrb30">회사에서는 회원뿐만 아니라 비회원 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 회사는 비회원 주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보 만을 고객에게 요청하고 있습니다. 회사에서 비회원으로 구매를 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인 정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다.</p>
		<h2>9. 아동의 개인정보보호</h2>
		<ul class="mgrb30">
			<li>① 당사는 온라인 환경에서 만14세 미만 아동의 개인정보를 보호하는 것 역시 중요한 일이라고 생각하고 있습니다. 만 14세 미만인 아동 회원의 개인정보는 법정대리인의 동의 없이는 수집하지 않으며, 이지웰니스가 제공하는 서비스의 이용에 있어서도 성인회원과 차이를 두어 특별히 보호하고 있습니다.</li>
			<li>② 만 14세 미만 아동 및 법정대리인은 개인정보를 열람하거나 수정 할 수 있으며, 오류에 대한 정정 및 개인정보의 수집·이용·제공에 대한 동의 철회를 요청 할 수 있습니다.</li>
			<li>③ 만 14세 미만 및 법정대리인의 개인정보보호를 위한 열람, 수정, 동의 철회 등의 권리와 행사방법은 회원에 대한 규정을 준용합니다. </li>
		</ul>
		<h2>10. 쿠키의 운영 및 활용</h2>
		<ul class="mgrb30">
			<li>① 회사는 다른 많은 웹사이트와 마찬가지로 쿠키를 운용합니다. '쿠키(cookie)'는 회원님에 대한 정보를 저장하고 수시로 찾아내는 역할을 합니다. 그리고, 웹사이트가 회원님의 컴퓨터 브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 4KB 미만의 텍스트로 이뤄진 소량의 정보입니다.</li>
			<li>② 회원께서 회사의 웹사이트에 접속을 하시면, 회사의 컴퓨터는 회원님의 브라우저에 있는 쿠키의 내용을 읽고, 회원의 추가정보를 회원님의 컴퓨터에서 찾아 접속에 따른 성명 등의 추가 입력 없이 서비스를 제공할 수 있습니다.</li>
			<li>③ 회원께서는 쿠키에 대한 선택권이 있으며, 다음과 같은 방법으로 쿠키의 전부 또는 일부를 받아들여 웹 브라우저 상단의 “도구 > 인터넷옵션>개인정보>개인정보 설정”에서 “모든쿠키허용-낮음-보통-보통 높음-높음-모든쿠키차단”을 할 수 있는 선택권을 가질 수 있습니다. 그러나, 회원님께서 쿠키에 대한 설치를 거부하거나 삭제로 설정한 경우에는 해당 웹 페이지에 일정부분에 대해서 접근할 때마다 회원님의 아이디(ID)나 비밀번호(password)를 다시 입력하셔야 합니다.</li>
			<li>④ 회사는 이용자의 편의를 위하여 쿠키를 운영하며. 회사가 쿠키를 통해 수집하는 정보는 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다. 수집된 회원의 ID는 타겟(Target) 마케팅 등의 목적을 위해 사용될 수 있습니다. 쿠키는 브라우저의 종료 시나 로그아웃 시 만료됩니다.</li>
		</ul>
		<h2>11. 링크사이트</h2>
		<p class="mgrb30">회사는 회원님께 다른 회사 및 관계사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 회사는 외부사이트 및 자료에 대한 아무런 통제권이 없으므로 그것으로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사가 포함하고 있는 링크를 클릭(click)하여 타 사이트(site)의 페이지로 옮겨갈 경우 해당 사이트의 개인정보처리방침은 회사와 무관하므로 새로 방문한 사이트의 방침을 살펴 보시기 바랍니다.</p>
		<h2>12. 개인정보 보호를 위한 기술적, 관리적 대책</h2>
		<ul class="mgrb30">
			<li>① 기술적 대책<br>회사는 회원님의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.<br>가. 회원님의 개인정보는 비밀번호에 의해 보호되며 전송데이터를 암호화하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.<br>나. 회사는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.<br>다. 회사는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL)를 채택하고 있습니다.<br>라. 해킹 등 외부침입에 대비하여 침입차단시스템 및 취약점 분석시스템 등을 이용하여 보안에 만전을 기하고 있습니다.</li>
			<li>② 관리적 대책<br>회사는 고객님의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.<br>가. 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자, 개인정보관리책임자 및 담당자 등 개인정보관리업무를 수행하는 자, 기타 업무상 개인정보의 취급이 불가피한 자.<br>나. 개인정보를 취급하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보 보호 의무 등에 관해 정기적인 사내 교육을 실시하고 있습니다.<br>다. 입사 시 개인정보 관련 취급자의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다.<br>라. 개인정보 관련 취급자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.<br>마. 개인정보와 일반 데이터를 혼합하여 보관하지 않고 별도로 분리하여 보관하고 있습니다.<br>바. 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다.<br>사. 회사는 이용자 본인의 부주의 또는 인터넷상의 문제로 인해 발생한 개인정보 유출문제에 대해 고의, 과실이 없을 경우 책임을 지지 아니합니다. 회원 개개인이 본인의 개인정보를 보호하기 위해서 자신의 ID 와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야 합니다.<br>아. 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 회사는 즉각 회원님께 사실을 알리고 적절한 대책과 보상을 강구할 것입니다.<br>자. 회사는 고객의 개인정보를 보호하여 개인정보 유출로 인한 피해가 발생하지 않도록 하기 위하여 다음과 같은 방법을 통하여 개인정보를 파기합니다.<br>1) 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>2) 전자적 파일 형태로 저장된 개인 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. </li>
		</ul>
		<h2>13. 게시물에 포함된 개인정보</h2>
		<p class="mgrb30">당사는 회원님의 게시물을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 그러나 다음의 경우에는 명시적 또는 개별적인 경고 후 삭제 조치할 수 있습니다.</p>
		<ul class="mgrb30">
			<li>- 스팸(spam)성 게시물(예; 행운의 편지, 사행성 메일 등)</li>
			<li>- 타인을 비방할 목적으로 허위사실을 유포하여 타인의 명예를 훼손하는 글</li>
			<li>- 동의 없는 타인의 개인정보 공개</li>
			<li>- 제 3자의 저작권 등 권리를 침해하는 내용</li>
		</ul>
		<p class="mgrb30">당사는 바람직한 게시판 문화를 활성화하고 개인정보를 보호하기 위하여 동의 없이 타인의 개인정보를 게시한 경우 특정부분을 삭제하거나 기호 등으로 수정하여 게시할 수 있습니다.</p>
		<h2>14. 개인정보관련 의견수렴 및 불만처리에 관한 사항</h2>
		<ul class="mgrb30">
			<li>① 회사는 개인정보와 관련된 회원의 의견수렴과 불만처리를 위하여 회원관리자를 지정해서 해당업무를 수행하도록 합니다.</li>
			<li>② 회사는 회원님의 의견을 소중하게 생각하며, 회원님은 의문사항으로부터 언제나 성실한 답변을 받을 권리가 있습니다.</li>
			<li>③ 회사는 회원님과의 원활환 의사소통을 위해 민원처리센터를 운영하고 있으며 연락처는 다음과 같습니다.</li>
			<li>[민원처리센터]</li>
			<li>- 전자우편 : mj.kang@ezwel.com</li>
			<li>- 전화번호 : 02-6909-4499</li>
			<li>- 팩스번호 : 070-7500-1697</li>
			<li class="mgrb15">- 주 소 : 152-729 서울특별시 구로구 디지털로 34길 43 코오롱싸이언스밸리 1차 11층</li>
			<li>③ 전화상담은 평일 09:00 ~ 18:00까지 가능합니다.</li>
			<li>④ 전자우편이나 팩스 및 우편을 이용한 상담은 접수 후 24시간 내에 성실하게 답변 드리겠습니다.<br>다만, 근무시간 이후 또는 주말 및 공휴일에는 익일 처리하는 것을 원칙으로 합니다.</li>
			<li>⑤ 기타 개인정보에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 정보보호마크 인증위원회,<br>대검찰청 인터넷범죄수사센터, 경찰청 사이버범죄수사대 등으로 문의하실 수 있습니다.</li>
			<li>* 개인정보침해신고센터</li>
			<li>- 전화 : 02) 118</li>
			<li>- URL : http://www.118.or.kr</li>
			<li>* 경찰청 사이버테러대응센터</li>
			<li>- 전화 : 02-393-9112</li>
			<li>- URL : http://www.ctrc.go.kr/</li>
			<li>* 대검찰청 사이버범죄수사단</li>
			<li>- URL : http://www.spo.go.kr/minwon/center/report/minwon24.jsp</li>
			<li>- e-mail : cybercid@spo.go.kr</li>
		</ul>
		<h2>15. 개인정보 관리책임자 및 담당자의 소속, 성명 및 연락처</h2>
		<p class="mgrb30">회사는 회원님께서 양질의 정보를 안전하게 이용하실 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 회원님께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보관리책임자가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손에 관해서는 책임이 없습니다. 회원님의 개인정보를 취급하는 책임자, 담당자들은 다음과 같으며 개인정보 관련 문의사항에 신속하고 성실하게 답변해드리고 있습니다.</p>
		<dl class="mgrb30">
			<dt class="dotted">이지웰니스(주) 개인정보관리책임자(CPO)</dt>
			<dd>성　　명 : 강 민 재</dd>
			<dd>소속부서 : 컨설팅실</dd>
			<dd>직　　위 : 이 　 사</dd>
			<dd>전자우편 : mj.kang@ezwel.com</dd>
			<dd>전화번호 : 02-6909-4401</dd>
			<dd>팩스번호 : 070-7500-1697</dd>
		</dl>
		<dl class="mgrb30">
			<dt class="dotted">이지웰니스(주) 개인정보 민원담당자</dt>
			<dd>성　　명 : 이 지 연</dd>
			<dd>소속부서 : 제휴마케팅팀</dd>
			<dd>전자우편 : jylee622@ezwel.com</dd>
			<dd>전화번호 : 02-6909-4409</dd>
			<dd>팩스번호 : 070-7500-1697</dd>
		</dl>
		<h2>16. 방침변경등에 대한 고지</h2>
		<p class="mgrb30">현 개인정보처리방침은 2015년 9월 1일부터 적용됩니다. 내용의 추가, 삭제 및 수정이 있을 경우에는 시행일의 7일 전부터 웹사이트의 공지사항을 통하여 고지할 것이며 중요한 사항일 경우 시행일 30일전부터 웹사이트의 공지사항을 통한 고지 및 이메일 고지를 할 것입니다. 단, 개인정보 수집 및 활용, 제3자제공 등이 변경될 경우 별도의 동의를 받겠습니다. 또한 개인정보 처리방침에 버전번호 및 변경공고일자 및 그 시행일자 등을 부여하여 개정여부를 쉽게 알 수 있도록 하고 있습니다.</p>
		<p class="mgrb30">개인정보처리방침 버전번호 : v1.0<br>개인정보처리방침 시행일자 : 2015-09-01</p>
	</div>
</div>

<div id="divUseService" style="display: none;" >
<div class="terms_wrap" style="width: 600px; height: 350px;"><!-- 팝업 사이즈 가로 : 600 세로 : 500-->
	<h1>제1조 [목적]</h1>
	<p class="mgrb30">본 약관은 이지웰니스 주식회사(이하 “회사”라 함)가 운영하는 상담포유를 EAP 아웃소싱을 위탁한 기업(이하 “고객사”라 함)의 임직원과 임직원의 승인 하에 상담포유에 개인정보를 제공하여 회원등록을 한 자(이하 “회원”이라 함)로서, 상담포유의 정보를 지속적으로 제공받으며, 상담포유가 제공하는 서비스를 계속적으로 이용할 수 있는 임직원과 임직원 가족이 이용함에 있어, 상담포유와 회원간 권리•의무 및 책임사항을 규정함을 목적으로 합니다.</p>
	<h2>제2조 [용어의 정의]</h2>
	<ul class="mgrb30">
		<li>1. 주식회사 이지웰니스㈜라 함은 EAP서비스를 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 사이버 몰로 가상의 영업장을 의미합니다.</li>
		<li>2. 상담포유라 함은 회사가 재화 또는 용역을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 웹사이트를 말하며, 아울러 상담포유를 운영하는 사업자의 의미로도 사용합니다.</li>
		<li>3. 회사가 제공하는 서비스라 함은 상담포유가 제공하는 재화, 용역, EAP서비스 등을 의미합니다.</li>
		<li>4. 회원님이 속한 기업/기관이라 함은 상담포유와 EAP서비스를 받기 위해 아웃소싱 계약을 맺은 법인이나 단체를 의미합니다.</li>
		<li>5. 회원이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자 및 고객사의 임직원 가입 승인 신청에 의해 가족회원에 가입한 자를 의미합니다.</li>
		<li>6. 가족회원이라 함은 고객사 임직원의 초대와 승인을 거쳐 회원 자격을 갖춘 회원님들에게 상담포유에서 고객사 임직원과 동일 또는 유사한 수준의 서비스를 이용함을 의미합니다.</li>
		<li>7. 아이디라 함은 회원의 식별과 서비스 이용을 위하여, 고객사와 상담포유가 협의를 통해 규정한 문자와 숫자의 조합을 의미합니다.</li>
		<li>8. 비밀번호라 함은 회원이 부여 받은 아이디와 일치되는 회원임을 확인하고, 회원의 비밀보호를 위해 고객 스스로 정한 문자 또는 숫자의 조합을 의미합니다.</li>
		<li>9. 제휴사라 함은 회원에 대한 서비스 제공을 목적으로 상담포유와 계약을 맺고, 재화와 용역을 제공하는 기업을 의미합니다.</li>
		<li>10. 제휴몰이라 함은 제휴사가 운영하는 웹사이트를 의미합니다.</li>
		<li>11. 가입신청자라 함은 임직원의 가족으로써 가족회원이 되고자 하는 자를 의미합니다.</li>
		<li>12. 해지라 함은 상담포유와 고객사가 계약을 종료시키는 것을 의미합니다.</li>
	</ul>
	<h2>제3조 [이용약관의 효력 및 변경]</h2>
	<ul class="mgrb30">
		<li>1. 본 약관은 상담포유가 고객사와 계약을 통하여 서비스 운영의 권리를 득하고, 서비스를 제공하는 시점(상담포유 오픈)에 회원에게 공지함으로 그 효력을 발효합니다.</li>
		<li>2. 상담포유는 본 약관의 내용을 회원이 쉽게 알아 볼 수 있도록 상담포유의 초기 화면에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
		<li>3. 상담포유는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용 촉진 등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
		<li>4. 상담포유는 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 단, 회원에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.</li>
		<li>5. 전항에 따른 시행일 이후에 회원이 서비스를 이용한 경우에는 개정약관에 동의한 것으로 간주합니다.</li>
		<li>6. 이 약관에서 정하지 아니한 사항이나 해석에 대해서는 관계법령 및 상관례에 따릅니다.</li>
	</ul>
	<h2>제4조 [회원 가입]</h2>
	<ul class="mgrb30">
		<li>1. 회원가입은 임직원의 경우 고객사가 서비스 이용자격을 부여한 회원님에 대해 상담포유에 회원등록을 요청하고, 상담포유가 이러한 신청에 대해여 승인함으로써 이루어지며, 가족회원의 경우 고객사의 임직원 가입승인 신청에 대하여 승낙함으로써 이루어집니다.</li>
		<li>2. 회원가입 성립 시기는 임직원의 경우 상담포유가 고객사의 요청에 의해 개인정보 등록을 완료한 시점으로 하며, 가족회원의 경우 임직원의 승인이 완료한 시점으로 합니다.</li>
		<li>3. 상담포유는 기술상 또는 업무상의 문제로 인해 회원가입 승낙을 유보할 수 있으며, 이 경우 상담포유는 회원에게 알려드립니다.</li>
		<li>4. 상담포유는 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 상담포유는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.</li>
		<li>가. 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우<br>(단, 상담포유의 회원 재가입 승낙을 얻은 경우에는 예외)</li>
		<li>나. 실명이 아니거나 타인의 명의를 이용한 경우</li>
		<li>다. 허위의 정보를 기재하거나, 상담포유가 제시하는 내용을 기재하지 않은 경우</li>
		<li>라. 14세 미만 아동이 법정 대리인(부모 등)의 동의를 얻지 아니한 경우</li>
		<li>마. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
	</ul>
	<h2>제5조 [ID 부여 및 변경 등]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유의 아이디(ID)는 임직원의 경우 고객사에서 지정한 식별자가 아이디(ID)로 사용되며, 가족회원의 경우에는 회원이 스스로 지정할 수 있습니다.</li>
		<li>2. 아이디(ID)는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 임직원에 한해 고객사 복지 제도 담당자를 통해 변경 신청해야 합니다.</li>
		<li>3. 임직원에 한해 아이디(ID)는 다음 각 호에 해당하는 경우에 변경될 수 있습니다.</li>
		<li>가. 고객사에서 회원의 식별 값을 잘못 전달 했을 경우</li>
		<li>나. 상담포유에서 회원의 식별 값을 잘못 입력 했을 경우</li>
		<li>다. 기타 합리적인 사유가 있는 경우</li>
	</ul>
	<h2>제6조 [회원정보의 변경]</h2>
	<ul class="mgrb30">
		<li>1. 회원은 상담포유의 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디(ID) 등은 수정이 불가능합니다.</li>
		<li>2. 회원은 개인정보가 변경되었을 경우 상담포유에서 직접 수정 하셔야 합니다. 또한 상담포유의 개인정보 관리 책임자 또는 담당자에게 연락하여 정정을 요청하시면 지체 없이 조치하겠습니다.</li>
		<li>3. 제2항의 변경사항을 수정하지 않음으로써 발생한 불이익에 대하여 상담포유는 책임지지 않습니다.</li>
	</ul>
	<h2>제7조 [회원탈퇴]</h2>
	<ul class="mgrb30">
		<li>1. 회원탈퇴는 임직원의 경우 회원님이 소속하신 기업/기관과 EAP 아웃소싱에 대한 계약 종료 시 또는 소속하신 기업/기관에서 퇴직 시 철회가 되며, 가족회원의 경우 홈페이지 가족회원탈퇴 메뉴에서 언제든지 개인정보의 수집&middot;이용&middot;제공에 대한 동의를 바로 철회할 수 있습니다. 또한, 개인정보 관리 책임자 또는 담당자에게 연락하시면 즉시 회원탈퇴를 위해 필요한 조치를 취합니다.</li>
		<li>2. 가족 회원은 상담포유에 언제든지 탈퇴를 요청할 수 있으며 상담포유는 즉시 회원탈퇴를 처리합니다. 다만, 해지의사를 통지하기 전에 모든 상품의 판매 및 구매 절차를 완료, 철회 또는 취소해야만 합니다. 이 경우 판매 및 구매의 철회 또는 취소로 인한 불이익은 회원 본인이 부담하여야 합니다. </li>
		<li>3. 임직원의 퇴직이나 퇴직에 갈음하는 인사상태로의 변경, 혹은 임직원이 소속된 고객사와 상담포유의 계약이 종료되었을 때, 가족회원은 자동으로 탈퇴 처리될 수 있습니다.</li>
		<li>4. 회원이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 상담포유가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원탈퇴 처리를 하며, 관련 개인정보를 파기시점에 준하여 파기합니다.</li>
	</ul>
	<h2>제8조 [회원에 대한 통지]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유가 회원에 대한 통지를 하는 경우, 회원이 지정한 전자우편 주소로 할 수 있습니다. 상담포유의 통지는 부가통신사업자 또는 수신인이 관리하는 메일서버 등에 도착하여 회원이 검색할 수 있는 상태에 이르렀을 때 도달된 것으로 보며, 회원이 전자우편을 개봉하였는지 여부, 회원의 PC에 전자우편이 전송되었는지 여부는 불문합니다.</li>
		<li>2. 상담포유는 회원 전체에 대한 통지의 경우 1주일 이상 상담포유 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.</li>
	</ul>
	<h2>제9조 [상담포유의 의무]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여야 합니다.</li>
		<li>2. 상담포유는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.</li>
		<li>3. 상담포유는 서비스 이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 전자우편 또는 전화 등을 통하여 회원에게 처리과정 및 결과를 전달합니다.</li>
		<li>4. 상담포유는 상품이나 용역에 대하여 표시&middot;광고의 공정화에 관한 법률 제3조 소정의 부당한 표시&middot;광고행위를 함으로써 회원이 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
	</ul>
	<h2>제10조 [회원의 의무]</h2>
	<ul class="mgrb30">
		<li>1. 회원은 다음 행위를 하여서는 안 됩니다.</li>
		<li>가. 개인정보의 허위내용 등록</li>
		<li>나. 타인의 정보도용</li>
		<li>다. 상담포유가 게시한 정보의 변경</li>
		<li>라. 상담포유가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
		<li>마. 상담포유와 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
		<li>바. 상담포유 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
		<li>사. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 미풍양속에 반하는 정보를 상담포유 공개 또는 게시하는 행위</li>
		<li>아. 상담포유의 동의 없이 영리를 목적으로 서비스를 사용하는 행위</li>
		<li>자. 기타 불법적이거나 부당한 행위</li>
		<li>2. 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 상담포유가 통지하는 사항 등을 준수하여야 하며, 기타 상담포유의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
	</ul>
	<h2>제11조 [개인정보보호 의무]</h2>
	<p>상담포유는 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 상담포유의 개인정보처리방침이 적용됩니다. 다만, 회원이 제휴사 서비스 이용을 위하여 개인정보공유에 동의한 경우 제휴사이트에서는 상담포유의 개인정보처리방침이 적용되지 않습니다.</p>
	<h2>제12조 [아이디 및 비밀번호의 관리에 대한 의무]</h2>
	<ul class="mgrb30">
		<li>1. 회원의 아이디와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.</li>
		<li>2. 상담포유는 회원의 아이디가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 상담포유 및 상담포유의 운영자로 오인한 우려가 있는 경우, 해당 아이디의 이용을 제한할 수 있습니다.</li>
		<li>3. 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 상담포유에 통지하고 상담포유의 안내에 따라야 합니다.</li>
		<li>4. 제3항의 경우에 해당 회원이 상담포유에 그 사실을 통지하지 않거나, 통지한 경우에도 상담포유의 안내에 따르지 않아 발생한 불이익에 대하여 상담포유는 책임지지 않습니다</li>
	</ul>
	<h2>제13조 [서비스의 제공]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 가족회원 서비스를 제공합니다.</li>
		<li>가. 임직원의 초대와 승인을 거쳐 상담포유에서 임직원과 동일 또는 유사한 수준의 서비스를 이용함을 의미합니다.</li>
		<li>2. 상담포유는 회원에게 다음과 같은 업무를 수행합니다.</li>
		<li>가. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
		<li>나. 구매계약이 체결된 재화 또는 용역의 배송</li>
		<li>다. 기타 상담포유가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스</li>
		<li>3. 상담포유가 제공하기로 회원과 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 상담포유는 이로 인하여 회원이 입은 손해를 배상합니다. 단, 상담포유에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.</li>
		<li>4. 상담포유는 서비스를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.</li>
		<li>5. 서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.</li>
		<li>6. 상담포유는 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 상담포유는 제8조(회원에 대한 통지)에 정한 방법으로 회원에게 통지합니다. 다만 상담포유가 사전에 통지할 수 없는 부득이한 사유가 있는 경우에는 사후 통지할 수 있습니다.</li>
		<li>7. 상담포유는 본 조 제6항의 단서조항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 회원이 입은 손해에 대하여 배상합니다. 단, 상담포유의 고의 또는 과실이 없는 경우에는 그러하지 아니합니다</li>
		<li>8. 상담포유는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.</li>
	</ul>
	<h2>제14조 [서비스의 변경]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.</li>
		<li>2. 서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등을 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.</li>
		<li>3. 상담포유는 제공되는 서비스의 일부 또는 전부를 상담포유의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.</li>
		<li>4. 상담포유는 고객사별 정책에 따라 구분하여 서비스 이용, 서비스 메뉴 등을 세분화하여 이용에 차등을 둘 수 있습니다.</li>
	</ul>
	<h2>제15조 [구매 신청]</h2>
	<ul class="mgrb30">
		<li>1. 회원은 상담포유에서 다음 또는 유사한 방법에 의하여 구매를 신청하며, 상담포유는 회원이 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.</li>
		<li>가. 재화 등의 검색 및 선택</li>
		<li>나. 성명, 주소, 전화번호 등의 입력</li>
		<li>다. 결제방법의 선택</li>
		<li>라. 구매신청 결과에 대한 확인</li>
	</ul>
	<h2>제16조 [계약의 성립]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 제15조와 같은 구매 및 신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.</li>
		<li>가. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
		<li>나. 기타 구매신청에 승낙하는 것이 상담포유의 기술상 현저히 지장이 있다고 판단하는 경우</li>
		<li>2. 상담포유의 승낙이 제18조 제1항의 수신확인통지형태로 회원에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
	</ul>
	<h2>제17조 [대금 지급 방법]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 현재 서비스 중인 방법으로 할 수 있습니다. 단, 상담포유는 회원의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</li>
		<li>가. 포인트(EAP 마일리지)</li>
		<li>나. 폰 뱅킹, 인터넷 뱅킹 등의 각종 계좌이체</li>
		<li>다. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
		<li>라. 전자화폐에 의한 결제</li>
		<li>마. 각종 적립금에 의한 결제</li>
		<li>바. 상담포유와 계약을 맺었거나 상담포유가 인정한 상품권에 의한 결제</li>
		<li>사. 기타 전자적 지급방법에 의한 대금 지급 등</li>
	</ul>
	<h2>제18조 [수신확인통지&middot;구매신청 변경 및 취소]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 회원의 구매신청이 있는 경우 회원에게 전자우편 주소로 수신확인통지를 합니다.</li>
		<li>2. 수신확인통지를 받은 회원은 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.</li>
		<li>3. 상담포유는 배송 전 회원의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.</li>
	</ul>
	<h2>제19조 [배송]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 회원이 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시하고, 약정된 기간 내에 배송될 수 있도록 필요한 조치를 취합니다.</li>
		<li>2. 만약 약정 배송기간을 초과한 경우에는 그로 인한 회원이 손해를 배상하여야 합니다. 다만, 상담포유가 고의•과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
	</ul>
	<h2>제20조 [환급, 반품 및 교환]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 회원이 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시하고, 약정된 기간 내에 배송될 수 있도록 필요한 조치를 취합니다.</li>
		<li>2. 다음 각 호의 경우에는 상담포유는 배송된 재화일지라도 재화를 반품 받은 경우 3영업일 이내에 회원의 요구에 따라 즉시 환급 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 하며 반품 비용 일체를 상담포유가 부담합니다.</li>
		<li>가. 배송된 재화가 주문내용과 상이하거나 상담포유가 제공한 정보와 상이할 경우</li>
		<li>나. 배송된 재화가 파손, 손상되었거나 오염되었을 경우 (단, 고객의 책임이 있는 사유로 훼손된 경우는 제외합니다.)</li>
		<li>다. 재화가 약정된 배송기간보다 늦게 배송된 경우</li>
		<li>라. 방문 판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 회원의 구매가 이루어진 경우</li>
		<li>마. 단, 재화 등의 내용이 표시, 광고 내용 또는 계약내용과 다르게 이행된 경우에는, 당해 재화를 공급받은 날로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회를 할 수 있습니다.</li>
		<li>3. 본 조 제2항에 해당하지 않는 사유로 배송된 재화를 반환하는 경우 반품 비용 일체를 회원이 부담해야 합니다.</li>
		<li>4. 상담포유는 대금을 환급함에 있어서 회원이 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</li>
		<li>5. 회원은 재화 등을 배송 받은 경우 다음 각호에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.</li>
		<li>가. 회원의 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우</li>
		<li>나. 회원의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
		<li>다. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우 </li>
		<li>라. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
		<li>6. 제5항 나호 내지 라호의 경우에 상담포유가 사전에 계약철회 등이 제한되는 사실을 회원이 쉽게 알 수 있는 곳에 명기하지 않았다면 회원의 계약철회 등이 제한되지 않습니다. </li>
	</ul>
	<h2>제21조 [상담포유와 연결된 제휴 몰과의 관계]  </h2>
	<ul class="mgrb30">
		<li>1. 상담포유와 연결된 제휴몰이란 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨) 방식 등을 통해 연결된 경우를 말합니다.</li>
		<li>2. 상담포유는 연결된 제휴몰이 독자적으로 제공하는 재화 등에 의하여 회원과 행하는 거래에 대해서는 제휴몰이 보증 책임을 진다는 뜻을 서비스 화면에 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</li>
	</ul>
	<h2>제22조 [저작권의 귀속 및 이용제한]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유가 작성한 저작물에 대한 저작권 기타 지적재산권은 상담포유에 귀속합니다.</li>
		<li>2. 회원은 상담포유를 이용함으로써 얻은 정보를 상담포유의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
	</ul>
	<h2>제23조 [포인트]</h2>
	<ul class="mgrb30">
		<li>1. 포인트는 기업/기관으로 배정된 EAP예산으로 현금처럼 사용할 수 있는 결제수단을 의미합니다.</li>
		<li>2. 포인트는 기업/기관에 배정되며, 임직원은 고객사 정책에 따라 개인별로 정해진 한도 내에서만 사용 가능합니다.</li>
		<li>3. 기업/기관에 배정된 총 포인트와 임직원의 포인트 현황 및 사용내역은 포인트 조회에서 확인할 수 있습니다.</li>
		<li>4. 임직원 개인의 한도가 남아있어도 기업/기관의 총 포인트가 소진된 경우 포인트를 사용할 수 없습니다.</li>
		<li>5. 가족회원은 고객사의 정책에 따라 임직원의 포인트를 함께 공유하여 임직원과 동일 또는 유사한 사용 범위(온라인에 한함)로 이용할 수 있습니다.</li>
		<li>6. 포인트의 공유 여부는 기본적으로 고객사 정책을 따르지만, 임직원이 가족회원의 포인트 사용 여부를 개별적으로 제한할 수 있습니다.</li>
	</ul>
	<h2>제24조 [면책조항]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.</li>
		<li>2. 상담포유는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.</li>
		<li>3. 상담포유는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.</li>
		<li>4. 상담포유는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.</li>
		<li>5. 상담포유는 회원이 서비스를 이용하여 기대하는 효익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.</li>
	</ul>
	<h2>제25조 [분쟁해결]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유는 회원이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 고객 서비스 담당 조직을 설치&middot;운영합니다.</li>
		<li>2. 상담포유는 회원이 제출하는 불만사항 및 의견이 있을 경우 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 즉시 통보해야 합니다.</li>
		<li>3. 상담포유와 회원간에 발생한 전자상거래 분쟁과 관련하여 회원의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시&middot;도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
	</ul>
	<h2>제26조 [재판권 및 준거법]</h2>
	<ul class="mgrb30">
		<li>1. 상담포유와 회원간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.</li>
		<li>2. 상담포유와 회원간에 제기된 전자거래 소송에는 대한민국법을 적용합니다.</li>
	</ul>
	<p>부칙 본 이용약관은 2015년 09월 01일부로 시행되며 종전의 약관내용은 본 약관으로 대체합니다.</p>
</div>
</div>

		<!-- footer 영역 END-->
		


<script type="text/javascript">
	function fileDownLoad(path, name, isImageServer){
	    var f = document.downForm;

		f.filepath.value = path;
		f.filename.value = name;
		if (isImageServer && isImageServer == true) {
			f.isImageServer.value = "true";
		}
		f.action = "/common/file/download";
		f.target = "ifDownFormTarget";
		f.submit();
	}
</script>
<iframe id="ifDownFormTarget" name="ifDownFormTarget" style="display: none; width: 0px; height: 0px"></iframe>
<form name="downForm" method="post">
	<input type="hidden" name="filepath" value="">
	<input type="hidden" name="filename" value="">
	<input type="hidden" name="isImageServer" value="false">
</form>
	</div>
	</body>

</html>
