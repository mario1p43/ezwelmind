<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>

<html>
<head>
<!-- 개인상담관리 -->
	<title>전체상담일정</title>

	<link href="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.css')}" rel="stylesheet">
	<link href="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.print.css')}" rel="stylesheet" media="print">
	<link href="${url:resource('/resources/js/plugin/qtip/jquery.qtip.min.css')}" rel="stylesheet">
	
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/lib/moment.min.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.min.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/lang/ko.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/qtip/jquery.qtip.min.js')}" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		body {
			padding: 0;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
			font-size: 14px;
		}
		#calendar {
			max-width: 500px;
			margin-top: 20px;
		}
		.fc-sat {
		    color: #0101DF !important;
		}
		.fc-sun {
			color: #FF0000 !important;
		}		
		.councelDetail td{
			border:1px solid #ddd;
		}
		.fc-day-number{
			cursor: pointer;
		}
		
		/* select box */
		article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
			display: block;
		}
		body {
			line-height: 1;
		}
		ol, ul {
			list-style: none;
		}
		blockquote, q {
			quotes: none;
		}
		blockquote:before, blockquote:after, q:before, q:after {
			content: '';
			content: none;
		}
		table {
			border-collapse: collapse;
			border-spacing: 0;
		}

		*, *:after, *:before {
			box-sizing: border-box;
		}

		.custom-select-wrapper {
			position: relative;
			user-select: none;
			width: 100%;
		}
		.custom-select {
			position: relative;
			display: flex;
			flex-direction: column;
		}
		.custom-select__trigger {
			position: relative;
			display: flex;
			align-items: center;
			justify-content: space-between;
			padding: 0 22px;
			font-size: 4.4444vw;
			color: #3b3b3b;
			height: 11.1111vw;
			line-height: 11.1111vw;
			background: #F2F2F2;
			cursor: pointer;
			box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.25);
		}
		.custom-options {
			position: absolute;
			display: block;
			top: 100%;
			left: 0;
			right: 0;
			background: #F2F2F2;;
			transition: all 0.2s;
			opacity: 0;
			visibility: hidden;
			pointer-events: none;
			border-bottom: 1px solid ;
			z-index: 2;
		}
		.custom-select.open .custom-options {
			opacity: 1;
			visibility: visible;
			pointer-events: all;
		}
		.custom-option {
			position: relative;
			display: block;
			padding: 0 22px 0 22px;
			font-size: 4.4444vw;
			font-weight: 300;
			color: #3b3b3b;
			line-height: 11.1111vw;
			cursor: pointer;
			transition: all 0.5s;
			text-align: center;
		}
		.item_border{
			display: block;
			border-bottom: 1px solid #C4C4C4;
		}
		.custom-option:hover {
			cursor: pointer;
			background-color: #b2b2b2;
		}
		.custom-option.selected {
			color: #ffffff;
			background-color: #2F80ED;
		}

		.arrow {
			position: relative;
			height: 7px;
			width: 7px;
		}
		.arrow::before, .arrow::after {
			content: "";
			position: absolute;
			bottom: 0px;
			width: 0.15rem;
			height: 100%;
			transition: all 0.5s;
		}
		.arrow::before {
			left: -2.3px;
			transform: rotate(45deg);
			background-color: #394a6d;
		}
		.arrow::after {
			left: 2.3px;
			transform: rotate(-45deg);
			background-color: #394a6d;
		}
		.open .arrow::before {
			left: -2.3px;
			transform: rotate(-45deg);
		}
		.open .arrow::after {
			left: 2.3px;
			transform: rotate(45deg);
		}
		
		</style>
	<script type="text/javascript">
		$(document).ready(function() {
			document.querySelector('.custom-select-wrapper').addEventListener('click', function() {
				this.querySelector('.custom-select').classList.toggle('open');
				for (const option of document.querySelectorAll(".custom-option")) {
					option.addEventListener('click', function() {
						if (!this.classList.contains('selected')) {
							this.parentNode.querySelector('.custom-option.selected').classList.remove('selected');
							this.classList.add('selected');
							this.closest('.custom-select').querySelector('.custom-select__trigger span').textContent = '상담사 : ' + this.textContent;
							//monthMove();
						}
					})
				}
			});
			

			window.addEventListener('click', function(e) {
				const select = document.querySelector('.custom-select')
				if (!select.contains(e.target)) {
					select.classList.remove('open');
				}
			});

			$('.calendar').fullCalendar({
				header: {
					left: 'prev,next',
					center: 'title',
					height: 300,
					right: 'month'
				}
				,height: "auto"
				,defaultDate: '${initDay}'
				,editable: false
				,eventLimit: false // allow "more" link when too many events
				<c:if test="${not empty totalScheduleList}">
				,events: ${totalScheduleList}
			    ,eventRender: function(event, element, view) {
			        element.qtip({ content: replaceAll(event.title, "\n", "<br>") });
			    }
		    	,eventClick: function(event) {
		    		viewDetail(event.counselCd);
			    }
				</c:if>
			});
	
			
			$('.fc-prev-button,.fc-next-button').click(function() {
				monthMove();
			});
			
			$(".fc-other-month").text(""); 
			var today = '${today}'.substring(0, 7);
			if (today != $(".calendar").fullCalendar('getDate').format("YYYY-MM")) {
				$(".fc-today ").removeClass("fc-today");
			}
		});
		
		
		function monthMove() {
			wrapWindowByMask();
			$(".fc-content").remove();
			var date = $(".calendar").fullCalendar('getDate');
			location.href = "/partner/pCounselorMgr/totalSchedule?ymd=" + date.format("YYYY-MM") + "&userId=" + $("[name='userId']").val();
		}
		
		
		function wrapWindowByMask() {
		    var loadingImg = '';
		    
		    var topPx = Math.max(0, (($(window).height() - 10) / 2) + $(window).scrollTop());
		    var leftPx = Math.max(0, (($(window).width() - 200) / 2) + $(window).scrollLeft());
		     
		    loadingImg += "<div id='loadingImg' style='position:absolute; left:" + leftPx + "px; top:" + topPx + "px; display:none; z-index:8000;'>";
		    loadingImg += " <img src='http://img.ezwelmind.co.kr/sangdam4u/images/common/viewLoading.gif'/>"; 
		    loadingImg += "</div>";   
		 
		    //화면에 레이어 추가 
		    j$('body').append(loadingImg)
		       
		    //로딩중 이미지 표시
		    j$('#loadingImg').show();
		}
		
		function viewDetail(counselCd) {
			j$.divPop("viewDetail", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/intakeDetail?counselCd="+counselCd);
			return false;
		}
		
		$("#clickday").click(function(){
			alert("dddd");
		});

		function selectDate(date){
			
			$(".clickday").text(date);
			var date1 =date.replace(/-/gi,"");
			var params = {};
			var ymd = date1;
			
			params.ymd = ymd;
			
			$.ajax({
				url: '/partner/pCounselorMgr/ajaxCounselCalendar',
				data: params,
				dataType: 'json',
				success: function(data){
					console.log(data.totalScheduleList2);
					var aa="<tr>";
						aa=aa+"<td>상담시간</td><td>상담사</td><td>내담자</td><td>임직원명</td><td>고객사</td><td>일정관리</td>";
						aa=aa+"</tr>";
					for(var i=0;i<data.totalScheduleList2.length;i++){
						aa=aa+"<tr>";
						aa=aa+"<td>"+data.totalScheduleList2[i].stTime +"~"+data.totalScheduleList2[i].edTime+"</td><td>"+data.totalScheduleList2[i].counselorNm+"</td><td>"+data.totalScheduleList2[i].counselNm+"</td>";
						aa=aa+"<td>"+data.totalScheduleList2[i].counselNm+"</td><td>"+data.totalScheduleList2[i].clientNm+"</td><td>"+"<a href='/partner/pCounselorMgr/counselFixList?counselNm="+data.totalScheduleList2[i].counselNm +"'>"+data.totalScheduleList2[i].counselNm +" 일정관리 이동</a></td>";
						aa=aa+"</tr>";  
						//console.log(data.totalScheduleList2[i].clientNm+":"+i);
					}
					$(".councelDetail").append(aa);

				}
			});
		}

	</script>
</head>

<body>

<div class="web">
	<div class="">
		<c:if test="${not empty counselorList }">
			<div class="custom-select-wrapper">
				<div class="custom-select">
					<div class="custom-select__trigger"><span>전체</span>
						<div class="arrow"></div>
					</div>
					<div class="custom-options">
						<span class="custom-option selected" data-value="">전체</span>
						<c:forEach var="list" items="${counselorList }">
							<span data-value="${list.userId }" class='custom-option <c:if test="${param.userId eq list.userId }"> selected </c:if>' >
								${list.userNm }
								<span class="item_border"></span>
							</span>
							
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
	</div>
<table width="80%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
		<tr>
			<td>
				<c:if test="${not empty counselorList }">
					<select name="userId" onchange="monthMove();" >
						<option value="">전체</option>
							<c:forEach var="list" items="${counselorList }">
								<option value="${list.userId }" <c:if test="${param.userId eq list.userId }"> selected </c:if> >${list.userNm }</option>
							</c:forEach>
					</select>	
				</c:if>
			</td>
		</tr>
		<tr height="30px">
			<td style="color: #CB1414;">
				<b>※ 상담정보를 클릭하면 <u>상세정보를 확인</u>할 수 있습니다.</b>
			</td>
		</tr>
		<tr>
			<td>
				<div class='calendar'></div>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
				<div class="clickday"></div>
				<table class="councelDetail" align="center"  style="" cellpadding="4" cellspacing="0" width="100%" style="text-align: center;">
					
				</table>

			</td>
		<tr>
	</table>
</div>


	
</body>

</html>
