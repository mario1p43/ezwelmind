<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>

<html>
<head>
<!-- 개인상담관리 -->
	<title>전체상담일정</title>

	<link href="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.css')}" rel="stylesheet" />
	<link href="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.print.css')}" rel="stylesheet" media="print" />
	<link href="${url:resource('/resources/js/plugin/qtip/jquery.qtip.min.css')}" rel="stylesheet" />
	
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/lib/moment.min.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/fullcalendar.min.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/fullcalendar-2.5.0/lang/ko_mo.js')}" ></script>
	<script src="${url:resource('/resources/js/plugin/qtip/jquery.qtip.min.js')}" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
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

		.counselor_wrapper {
			margin-bottom: 7.2222vw;
		}

		/* 달력 커스텀 */
		.calendar_wrapper {
			padding: 0 4.1667vw;
		}
		.fc-toolbar .fc-center h2 { 
			color:#004B85;
			font-size: 20px;
			font-weight: bold;
			border: none;
			background: none;
			box-shadow: none;
			letter-spacing: 0.15em;
		}
		
		.fc .fc-toolbar > * > :first-child { 
			border: none;
		}
		.fc .fc-toolbar > * > div:first-child { 
			color:#004B85;
			font-size: 14px;
			border: none;
			background: none;
			box-shadow: none;
			float: none;
			text-align: left;
			margin-left: 1.2em;
			margin-bottom: 3px;
		}

		.fc .fc-prev-button {
			background-image: url("${url:resource('/resources/img/left_arrow.png')}");
			background-repeat: no-repeat;
			background-color: white;
			background-blend-mode: multiply;
			background-position: center;
			box-shadow: none;
		}

		.fc .fc-next-button {
			background-image: url("${url:resource('/resources/img/right_arrow.png')}");
			background-repeat: no-repeat;
			background-color: white;
			background-blend-mode: multiply;
			background-position: center;
			box-shadow: none;
		}
		.fc th, .fc td {
			border: none;
		}
		.fc-ltr .fc-basic-view .fc-day-number {
			text-align: center;
		}
		th {
			background-color: white;
		}
		.fc-head-container .fc-widget-header {
			margin-bottom: 2.7778vw;
		}
		.fc-sun {
			color :#EB5757 !important;
		}
		.fc-sat {
			color: #2F80ED !important;
		}
		.fc-basic-view .fc-body .fc-row {
			min-height: 11.1111vw;
		}
		.fc-day-number { 
			font-size: 4.4444vw;
		}
		.fc table {
			font-size: 4.4444vw;
			font-weight: normal;
		}
		td {
			font-size: 4.4444vw;
			font-weight: normal;
		}
		.fc-day-grid-event{
			width: 2px;
			height: 4px;
			margin: auto;
		}
		.fc-icon-left-single-arrow, .fc-icon-right-single-arrow {
			visibility: hidden;
		}
		.fc td.fc-today {
			border: none;
		}
		.fc td.fc-today {
			background: none;
		}
		.fc-row .fc-content-skeleton {
			min-height: 11.111vw;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.fc-highlight{
			background-color: #006CBA !important;
			border-radius: 2.2222vw !important;
			opacity: 1 !important;
		}
		.day-active {
			color:white !important;
		}
		/* calendar custom end */
		i {
			border: solid #2F80ED;
			border-width: 0 0.5556vw 0.5556vw 0;
			display: inline-block;
			padding: 1.3889vw;
		}

		.right {
			transform: rotate(-45deg);
			-webkit-transform: rotate(-45deg);
		}
		.counsel_list_wrapper {
			display: flex;
			align-items: stretch;
			flex-direction: column;
		}
		.counsel_list_wrapper > div {
			margin: 4.4444vw 5.5556vw 0 5.5556vw;
			height: 13.3333vw;
			border-left: 2px solid #2F80ED;
			background-color:#F2F2F2;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
		}
		.counsel_date {
			width: 15.2778vw;
			display: flex;
			align-items: center;
			-webkit-justify-content: center; 
			justify-content: center;
		}
		.counsel_time {
			width: 20vw;
			display: flex;
			align-items: center;
			-webkit-justify-content: center; 
			justify-content: center;
			font-size: 4.4444vw;
			color: #333333;
		}
		.counsel_name {
			display: flex;
			align-items: center;
			-webkit-flex-grow: 1; 
			flex-grow: 1; 
			flex : 1 1 0;  
			-webkit-flex : 1 1 0;
			font-size:4.4444vw;
			color:#333333;
			padding-left:3.8889vw;
		}
		.linked_icon {
			width: 11.1111vw;
			display: flex;
			align-items: center;
		}
		.line {
			width: 1px;
			margin: 3.3333vw 0;
			background-color:#BDBDBD;
		}
		.month {
			display: flex;
			align-items: center;
			-webkit-justify-content: center; 
			justify-content: center;
			font-size: 2.7778vw;
			color:#333333;
			line-height: 1;
		}
		.day {
			display: flex;
			align-items: center;
			-webkit-justify-content: center; 
			justify-content: center;
			font-size: 2.7778vw;
			color:#333333;
			line-height: 1;
		}
		
		.fc-title{
			display:none;
		}
	</style>
	<script>
		
		Date.prototype.toStringFormat = function(pattern) {
			if(pattern) {
				let Y = this.getFullYear();
				let M = this.getMonth()+1 >= 10 ? (this.getMonth() + 1) : '0' + (this.getMonth() + 1);
				let D = this.getDate() >= 10 ? this.getDate() : '0' + this.getDate();
				return Y + pattern + M + pattern + D;
			}
		}

		$(document).ready(function() {
			$('.mobile_nav ul li a').eq(1).addClass('active');
			$('.mobile_nav ul li a img').eq(1).attr('src', "${url:resource('/resources/img/consulting_icon_active.png')}");
			window.userId = '${param.userId}';

			for (const option of document.querySelectorAll(".custom-option")) {
				if($(option).attr('data-value') == userId) {
					option.parentNode.querySelector('.custom-option.selected').classList.remove('selected');
					option.classList.add('selected');
					option.closest('.custom-select').querySelector('.custom-select__trigger span').textContent = '상담사 : ' + option.textContent;
				} 
			}

			document.querySelector('.custom-select-wrapper').addEventListener('click', function() {
				this.querySelector('.custom-select').classList.toggle('open');
				for (const option of document.querySelectorAll(".custom-option")) {
					option.addEventListener('click', function() {
						if (!this.classList.contains('selected')) {
							this.parentNode.querySelector('.custom-option.selected').classList.remove('selected');
							this.classList.add('selected');
							this.closest('.custom-select').querySelector('.custom-select__trigger span').textContent = '상담사 : ' + this.textContent;
							userId = $(option).attr('data-value');
							monthMove();
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
					left: 'prev',
					center: 'title',
					height: 300,
					right: 'next',
				},
				titleFormat:'MMMM',
				height: "auto",
				defaultDate: '${initDay}',
				editable: false,
				eventLimit: false,
				datesRender:function(info) {
					console.log(info);
				},
				dayClick:function(info) {
					if(typeof info == 'string') {
						selectDate(info);
					} else {
						selectDate(info._d.toStringFormat('-'));
					}
					
				},
				unselectAuto: false,
				selectable: true,
				<c:if test="${not empty totalScheduleList}">
				events: ${totalScheduleList},
			    eventRender: function(event, element, view) {
					//element.qtip({ content: replaceAll(event.title, "\n", "<br>") });
					console.log(event);
					console.log(element);
					console.log(view);
					element.qtip({content : ''});
				},
				eventClick: function(event, e, el) {
					//viewDetail(event.counselCd);
					//selectDate(event.start._i);
					selectDate(event.start._i);
					$('.calendar').fullCalendar('select', $.fullCalendar.moment(event.start._i));
					
				},
				
				</c:if>
			});

			var today = '${today}'.substring(0, 7);
			var text = $(".calendar").fullCalendar('getDate').format('YYYY.MM');
			
			$('.fc .fc-toolbar .fc-center h2').before('<div>' + text + '</div>');
			
			$('.fc-prev-button,.fc-next-button').click(function() {
				monthMove();
			});
			
			$(".fc-other-month").text(""); 
			
			if (today != $(".calendar").fullCalendar('getDate').format("YYYY-MM")) {
				$(".fc-today ").removeClass("fc-today");
			}
		});
		
		
		function monthMove() {
			wrapWindowByMask();
			$(".fc-content").remove();
			var date = $(".calendar").fullCalendar('getDate');
			location.href = "/partner/pCounselorMgr/totalSchedule?ymd=" + date.format("YYYY-MM") + "&userId=" + userId;
			
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
			//$(".clickday").text(date);
			var date1 =date.replace(/-/gi,"");
			var params = {};
			var ymd = date1;

			$('.fc-day-number').removeClass('day-active');
			$('.fc-day-number').each(function() {
				if($(this).attr('data-date') == date) {
					$(this).addClass('day-active');
					return false;
				}
			})
			
			params.ymd = ymd;
			
			$.ajax({
				url: '/partner/pCounselorMgr/ajaxCounselCalendar',
				data: params,
				dataType: 'json',
				success: function(data){
					// var aa="<tr>";
					// 	aa=aa+"<td>상담시간</td><td>상담사</td><td>내담자</td><td>임직원명</td><td>고객사</td><td>일정관리</td>";
					// 	aa=aa+"</tr>";
					// for(var i=0;i<data.totalScheduleList2.length;i++){
					// 	aa=aa+"<tr>";
					// 	aa=aa+"<td>"+data.totalScheduleList2[i].stTime +"~"+data.totalScheduleList2[i].edTime+"</td><td>"+data.totalScheduleList2[i].counselorNm+"</td><td>"+data.totalScheduleList2[i].counselNm+"</td>";
					// 	aa=aa+"<td>"+data.totalScheduleList2[i].counselNm+"</td><td>"+data.totalScheduleList2[i].clientNm+"</td><td>"+"<a href='/partner/pCounselorMgr/counselFixList?counselNm="+data.totalScheduleList2[i].counselNm +"'>"+data.totalScheduleList2[i].counselNm +" 일정관리 이동</a></td>";
					// 	aa=aa+"</tr>";  
					// 	//console.log(data.totalScheduleList2[i].clientNm+":"+i);
					// }
					// $(".councelDetail").append(aa);
					let wrapper = $('.counsel_list_wrapper').empty();
					if(data.totalScheduleList2.length != 0) {
						let fragment = $(document.createDocumentFragment());
						data.totalScheduleList2.forEach(function(v) {
							let item = $(
								`<div class="flex">
									<div class="counsel_date">
										<div><span class="month"></span><span class="day"></span></div>
									</div>
									<div class="line"></div>
									<div class="counsel_time"></div>
									<div class="line"></div>
									<div class="counsel_name"></div>
									<div class="linked_icon"><i class="right"></i></div>
								</div>`
								);
							let dateArr = date.split('-');
							$('.month', item).text(dateArr[1] + '월');
							$('.day', item).text(dateArr[2] + '일');
							$('.counsel_time', item).text(v.stTime);
							$('.counsel_name', item).text(v.counselNm);
							item.on('click', function() {
								$('body').css('overflow', 'hidden');

								location.href = "/partner/customermanagement/mainmanage?counselCd="+v.counselCd+"&clientType=Y";
							});
							fragment.append(item);
						});
						wrapper.append(fragment);
						
					}
				},
				error:function(err) {
					console.err(err);
				}
			});
		}

	</script>
</head>

<body>

<div class="web">
	<div class="counselor_wrapper">
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
	<div class="calendar_wrapper">
		<div class='calendar'></div>
	</div>
	<div class="counsel_list_wrapper">
		
	</div>
<!-- <table width="80%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
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
	</table> -->
</div>


	
</body>

</html>
