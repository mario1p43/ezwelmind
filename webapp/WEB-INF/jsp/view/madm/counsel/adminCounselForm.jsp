<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 이용목록</title>
<script type="text/javascript">
	$(document).ready(function(){
		init();
		
		$('.counselYmd').datetimepicker({
			format:'Y.m.d',
			timepicker:false
		});
		
		$("#stTime").change(function (){
			var str = $("#stTime").val();
			var dd = str.substring( 0, 2);
			
			$("#smsTime").val(dd);
		});
		
		/* 센터 변경시 상담사 셀렉트 */
		$("#centerList").change(function() {
			$.ajax({
				url: '/madm/counselor/getCounselorList?centerSeq=' + $(this).val(),
				dataType: 'json',
				success: function(data){
					var list = data.counselorList;
					
					$("#counselorList option").remove();
					if (list.length == 0) {
						$("#counselorList").append("<option value=''>-</option>");
						return;
					}
					var counselorSel = "";
					for (var i = 0; i < list.length; i++) {
						counselorSel = "<option mgrStatus='" + list[i].mgrStatus +"'"
							+ "value='" + list[i].userId + "'>" + list[i].userId + "(" + list[i].userNm + ")";
						if (list[i].mgrStatus == 'S') {
							counselorSel += " - 대기";
						} else if (list[i].mgrStatus == 'N') {
							counselorSel += " - 중지";
						} else if (list[i].mgrStatus == 'R') {
							counselorSel += " - 반려";
						}
						counselorSel += "</option>";
						$("#counselorList").append(counselorSel);
						
						//$("#counselorList").append("<option value='" + list[i].userId + "'>" + list[i].userId + "(" + list[i].userNm + ")" + "</option>");
					}
					
				}
			});
		});
		
		/* 상담유형 변경시 세부 */
		$("#channelType").change(function() {
			
			if($(this).val() == "100002") {
				$("#counselType option:eq(1)").prop("selected", true);
			} else {
				$("#counselType option:eq(0)").prop("selected", true);
			}
			
			$.ajax({
				url: '/madm/counsel/getCounselCategoryList?highCategoryCd=' + $(this).val(),
				dataType: 'json',
				success: function(data){
					var list = data.counselorList;
					
					$("#categoryCd option").remove();
					if (list.length == 0) {
						$("#categoryCd").append("<option value=''>-</option>");
						return;
					}
					for (var i = 0; i < list.length; i++) {
						$("#categoryCd").append("<option value='" + list[i].categoryCd + "'>" + list[i].categoryNm + "</option>");
					}
					
				}
			});
		}); 
		
		/* 상담사 변경시 세부 */
		$("#counselorList").change(function() {
			var mgrStatusTemp = $("#counselorList option:selected").attr("mgrStatus");
			if ( mgrStatusTemp == 'N' ) {
				alert('중지상태의 상담사에게는 상담을 신청할 수 없습니다.');
				$("#counselorList option:selected").prop("selected", false);
			} else if ( mgrStatusTemp == 'R' ) {
				alert('반려상태의 상담사에게는 상담을 신청할 수 없습니다.');
				$("#counselorList option:selected").prop("selected", false);
			} 
		}); 
		
		/** 상담사 일정 체크 */
		$("#btnCounselConfirm").click(function () {
			var centerSeq = $("#centerList").val();
			var userId = $("#counselorList").val();
			var stTime = $("#stTime").val();
			var ymd = $("#counselYmd").val();
			var smsTime = $("#smsTime").val()+$("#smsTime2").val();
			if ($("#intakeCd").val() == "") {
				alert("인테이크를 먼저 등록해주세요.");
				return;
			}
			if (typeof userId == "undefined" || userId == null || userId == "") {
				alert("상담사를 선택해주세요.");
				return;
			}
			if (ymd == "") {
				alert("상담날짜를 선택해주세요.");
				return;
			}
			if (stTime == "") {
				alert("상담시간을 선택해주세요.");
				return;
			}
			
			var params = {};
			params.userId = userId;
			params.ymd = replaceAll(ymd, ".", "");
			params.stTime = stTime;
			params.centerSeq = centerSeq;
			params.smsDt = smsTime;
			$.ajax({
				url: '/madm/counselor/counselScheduleConfrim',
				data: params,
				dataType: 'json',
				type: 'get',
				success: function(data) {
					if (data.resultValue == "1001") {
						if (confirm("※상담사가 등록한 스케줄은 없습니다.\n상담사 스케줄을 등록하시겠습니까?\n\n★★상담사 스케줄을 등록하고 주문을 하지 않아도 상담사 스케줄이 그대로 남습니다.")) {
							$.ajax({
								url: '/madm/counselor/addSchedule',
								data: params,
								dataType: 'json',
								type: 'get',
								success: function(data) {
									if (data.resultValue == "1") {
										alert("상담사 일정이 등록되었습니다.");
										$("#scheduleSeq").val(data.scheduleSeq);
										doPointCheck();
									} else {
										alert("실패하였습니다. 관리자에게 문의주세요.");
									}
								}
							});
						}
					} else if (data.resultValue == "1002") {
						alert("상담이 가능한 시간입니다.");
						$("#scheduleSeq").val(data.scheduleSeq);
						doPointCheck();
					} else {
						alert("상담사 스케줄이 이미 등록되어 있어서, \n주문이 불가능합니다.");
					}
				}
			});
			
			
		});
		
		
		/**
		 * 인테이크 등록
		 */
		$("#btnAddIntake").click(function () {
			var params = {};
			
			var gender = $("#gender").val();
			var rrn = $("#rrn").val();
			
			if (gender == "") {
				alert(" 임직원 정보에 성별이 없습니다. \n성별이 없을 경우 고객사 관리자에 성별이 '기타'로 계산됩니다. \n\n반드시 성별을 선택해주세요."); 
				$("#gender").focus();
				return;
			}
			
			if (rrn == "") {
				alert(" 임직원 정보에 주민번호 앞자리가 없습니다. \n주민번호 앞자리가 없을 경우 고객사 관리자에 연령대가 '기타'로 계산됩니다.\n\n반드시 주민번호 앞자리를 입력해주세요."); 
				$("#rrn").focus();
				return;
			}
			
			params.relation = $("#relation").val();
			var counselNm = $("#counselNm").val();
			if (counselNm == "") {alert("이름을 입력해주세요."); return;}
			params.counselNm = counselNm;
			
			var gender = $("#intakeGender").val();
			if(gender == ""){
				alert("성별을 선택해주세요.");
				$("#intakeGender").focus();
				return;
			}
			params.gender = gender;
			
			var rrn1 = $("#rrn1").val();
			var rrn2 = $("#rrn2").val();
			var rrn3 = $("#rrn3").val();
			if(rrn1 == "" || rrn2 == "" || rrn3 == ""){
				alert("생년월일을 선택해주세요.")
				$("#rrn1").focus();
				return;
			}
			params.rrn = rrn1 + rrn2 + rrn3;
			
			
			
			if ($("input:radio[name='educatonType']:checked").val() == "A") {
				var education = $("#education1").val();
				if (education == "") {alert("학력을 선택해주세요."); return;}
				params.education = education;
				
				var job = $("#job").val();
				if (job == "") {alert("직업을 선택해주세요."); return;}
				params.job = job;
				
				params.counselAges = "100450";
			} else {
				var education = $("#education2").val();
				if (education == "") {alert("학력을 선택해주세요."); return;}
				params.education = education;
				
				var session = $("#session").val();
				if (session == "") {alert("학년을 선택해주세요."); return;}
				params.session = session;
				
				params.counselAges = "100448";
			}
			
			var mobile = $("#mobile1").val() + $("#mobile2").val() + $("#mobile3").val();
			if (mobile.length < 10) {alert("휴대폰을 입력해주세요."); return;}
			params.mobile = $("#mobile1").val() + "-" + $("#mobile2").val() + "-" + $("#mobile3").val();
			
			var email = $("#email").val();
			if (email == "") {alert("이메일을 입력해주세요."); return;}
			params.email = email;
			
			params.channelType = $("#channelType").val();
			params.counselDiv = $("#categoryCd").val();
			params.counselType = $("#counselType").val();
			
			if($("#cause").val() == "optum") {
				params.cause = $("#cause").val() + " [ "+$("#cause1").val()+" - "+$("#cause2").val()+" ]";				
			} else if($("#cause").val() == "wpo") {
				params.cause = $("#cause").val() + " [ "+$("#cause3").val() +" ]";				
			} else {
				params.cause = $("#cause").val();	
			}
			
			params.memo = $("#memo").val();
			
			params.clientCd = $("#clientCd").val();
			params.userKey = $("#userKey").val();
			params.counselReservChk = $("#counselReservChk").val();
			
			$.ajax({
				url: '/madm/counsel/addCounselIntake',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					if (data.resultValue == "1") {
						alert("등록하였습니다.");
						$("#intakeCd").val(data.intakeCd);
						$("#trIntake").hide();
					} else {
						alert("실패하였습니다.")
					}
				}
			});
			
		});
		
		// 주문하기
		$("#doOrder").click(function () {
			$("#trOrder").hide();
			var smsTime = $("#smsTime").val()+$("#smsTime2").val();
			var params = {};
			
			params.smsDt = smsTime;
			params.userKey = $("#userKey").val();
			params.clientCd = $("#clientCd").val();
			params.intakeCd = $("#intakeCd").val();
			params.scheduleSeq = $("#scheduleSeq").val();
			params.ceilingCategoryCd = $("#ceilingCategoryCd").val();
			
			if ($("input:checkbox[id='smsYn']").is(":checked")) {
				params.smsYn = "Y";
			} else {
				params.smsYn = "N";
			}
			
			$.ajax({
				url: '/madm/counsel/doOrder',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					if (data.resultValue == "success") {
						alert("주문이 완료되었습니다.");
						location.href = "/madm/counsel/adminCounselMain?userKey=" + params.userKey;
					} else {
						alert("주문에 실패하였습니다.");
					}
				}
			});
		});
		
		/**
		 * 임직원 정보 수정
		 */
		$("#btnUpdateUser").click(function () {
			var params = {};
			
			var gender = $("#gender").val();
			var rrn = $("#rrn").val();
			var userKey = $("#userKey").val();
			var branchCd = $("#branchCd").val();
			var deptCd = $("#deptCd").val();
			var teamCd = $("#teamCd").val();
			var partCd = $("#partCd").val();
			var gradeCd = $("#gradeCd").val();
			
			if (gender == "") {
				alert("성별을 선택해주세요."); 
				return;
			}
			
			if (rrn == "") {
				alert("주민번호 앞 6자리를 입력해주세요."); 
				return;
			}

			params.gender = gender;
			params.rrn = rrn;
			params.userKey = userKey;
			params.branchCd = branchCd;
			params.deptCd = deptCd;
			params.teamCd = teamCd;
			params.partCd = partCd;
			params.gradeCd = gradeCd;
			
			if( confirm("입력하신 임직원 정보는 고객사관리자 통계에 연동됩니다. \n입력된 정보가 잘 입력되었는지 확인하세요. \n\n확인버튼을 누르면 정보가 수정됩니다.") ){
				$.ajax({
					url: '/madm/counsel/updateEmpInfo',
					data: params,
					dataType: 'json',
					type: 'post',
					success: function(data) {
						if (data.resultValue == "1") {
							alert("임직원 정보를 수정하였습니다.\n페이지가 새로고침 됩니다.");
							window.location.reload(true); // 페이지 새로고침
						} else {
							alert("실패하였습니다.")
						}
					}
				});
			}
		
			
		});
		
		// 센터검색
		$("#searchCenterBtn").click(function () {
			var searchCenter = $("#searchCenter").val();
			var params = {};
			
			if( searchCenter == ""){
				alert("센터명을 입력하세요");
				return true;
			}
			
			params.searchCenter = searchCenter;
			
			$.ajax({
				url: '/madm/counsel/searchCenter',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					
					if( data.resultValue.length <= 0 ){
						alert("검색 결과가 없습니다.");
						return true;
					}else{
						var iter = data.resultValue;
						var element = "";
						result = iter.length;
						
						element += "<option value=''>--- 선택 ---</option>";
						for (var i = 0; i < iter.length; i++) {
							element += "<option value='" + iter[i].centerSeq + "'>" + iter[i].centerNm + "</option>";
						}
						
						if (element != "") {
							$("#centerList").empty();
							$("#centerList").append(element);
						}
					}
					
				}
			});
			
		});
		
		$("#cause").on("change", function() {
			// 옵텀이면 추가 상담주제 필드 노출
			if($(this).val() == "optum") {
				$("#cause1").show();
				$("#cause2").show();
				$("#cause3").hide();
			} else if($(this).val() == "wpo") {
				$("#cause1").hide();
				$("#cause2").hide();
				$("#cause3").show();
			} else {
				$("#cause1").hide();
				$("#cause2").hide();
				$("#cause3").hide();
			}
		});
		
		var optumDetailCause = [
			["직장관련문제(WR-Health Issues)", ["사고/부상/장애(Accident/Injury/Disability)", "중요사건(Critical Incident)", "업무복귀(Return to Work)", "직장생활적응(Fitness for Work)"]], // 직장관련문제
			["직장관련 개인적 문제(WR-individual Issues)", ["업무의 양질 및 생산성(Quality of Productivity)", "잦은 결근 및 지각(Absenteeism or Latensess)", "직업 진로 및 전략(Career Path/Vocational)", "직업만족도(Work Satisfaction)", "일/가족/개인적 시간의 균형(Balancing Work/Family/Personal)", "은퇴(Retirement)"]], // 직장관련 개인적 문제
			["직장 관련 대인관계문제(WR-Interpersonal Issues)", ["동료와의 마찰(Conflict with Colleague)", "상사와의 마찰(Conflict with Supervisors & Managers)", "부하와의 마찰(Conflict with Subordinates)", "고객 및 공급업체와의 마찰(Conflict with Customers &Suppliers)", "차별(Perceived Discrimination)", "성희롱 및 괴롭힘(Perceived Harassment)"]], // 직장관련 대인관계 문제
			["직장관련 조직적문제(WR-Organisational Issues)", ["업무의 본질(Nature of Work)", "과로(Overworking)", "업무의 변화(Change of Work)", "조직의 변화(Organisational Change)", "직원 관리(Staff Management)", "직원의욕 및 사기(Staff Morale)"]], // 직장관련 조직적 문제
			["개인적인 대인관계적 문제(IH-Interpersonal Issues)", ["의사소통(Communication)", "대인관계적 충돌(Interpersonal Conflict)", "고립(Isolation)", "자신감(Self-Confidence)"]], // 개인적인 대인관계적 문제
			["건강관련문제(IH-Family)", ["원가족(Family of Orgin)", "부양(Elder Care)", "육아 및 자녀교육 문제(Parenting Issues)", "혼합가정/대가족 문제(Blended/Extended Family Issues)", "아동학대(Child at Risk/Abuse)", "부모 자녀간의 갈등(Parent Child Discord)"]], // 건강관련 문제
			["중독문제(IH-Addiction)", ["술(Alcohol)", "담배(Tobacco)", "처방 약(Prescription Drugs)", "불법약물(Illicit Drugs)", "도박(Gambling)"]], // 중독 문제
			["개인관계 문제(IH- Relationship)", ["관계의 질(Quality of Relationship)", "가정 내 폭력(Domestic Violence)", "파경/별거/이혼(Breakdown/Separation/Divorce)"]], // 개인관계 문제
			["심리적문제(IH-Psychological Issues)", ["불안감(Anxiety)", "우울증(Depression)", "공격성(Aggression)", "스트레스 및 극복방법(Stress & Coping)", "비통 및 사별(Grief &Bereavement)", "섭식장애(Eating Disorder)", "자살관념(Suicidal Ideation)"]], // 심리적 문제
			["건강관련문제(IH-Physical)", ["의료(Medical)", "운동 및 식이요법(Exercise& Diet)", "장애(Disability)"]], // 건강관련문제
			["웰니스(WB-Wellness)", ["영양(Nutrition)", "스트레스(Stress)", "등 관리(Back Care)", "심장 건강(Heart Health)", "운동(Exercise)", "여성 건강(Women's Health)", "남성 건강(Men's Health)", "기타(Other)"]], // 웰니스 
			["다른 문제(IH-Other Issues)", ["법적문제(Legal)", "재정문제(Financial)", "LGBTIQ"]] // 다른 문제
		];
		
		$("#cause1").on("change", function() {
			
			var thisValue = $(this).val();
			
			var optionHtml = "";
			
			// 옵션 검증
			for(var i in optumDetailCause) {
				if(optumDetailCause[i][0] == thisValue) {
					for(var z in optumDetailCause[i][1]) {
						optionHtml += "<option value='"+optumDetailCause[i][1][z]+"'>"+optumDetailCause[i][1][z]+"</option>";
					}
					
					break;
				}
			}	
			
			$("#cause2").html(optionHtml);
		});
		
		
		$("#channelType").on("change", function() {
			fncChangeChannelType();	
		});
		
		fncChangeChannelType();
		
		
			
	});  // end ready
	
	
	/** 
	 * 상담 가격정보
	 */ 
	function doPointCheck() {
		var params = {};
		params.userKey = $("#userKey").val();
		params.clientCd = $("#clientCd").val();
		params.intakeCd = $("#intakeCd").val();
		params.ymd = replaceAll($("#counselYmd").val(), ".", "");
		
		$.ajax({
			url: '/madm/counsel/getOrderInfo',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data) {
				if (data.resultValue == "success") {
					$("#counselOrderPrice").text(data.price);
					$("#trOrder").show();
					$("#btnCounselConfirm").hide();
				} else {
					alert("포인트가 부족합니다.");
				}
			}
		});
		///madm/counsel/getOrderInfo
	}
	
	function init() {
		var mobile = "${user.mobile}";
		if (mobile != "") {
			var mobileArray = mobile.split("-");
			$("#mobile1").val(mobileArray[0]);
			$("#mobile2").val(mobileArray[1]);
			$("#mobile3").val(mobileArray[2]);
		}
		
		var rrn = "${user.rrn}";
		if (rrn != "") {
			var rrnArray = rrn.split("-");
			if (rrnArray[1] == "1") {
				$("#gender").val("M");
			} else {
				$("#gender").val("F");
			}
			
			var year = rrnArray[0].substring(0, 2);
			var month = rrnArray[0].substring(2, 4);
			var day = rrnArray[0].substring(4, 6);
			
			$("#rrn1").val("19" + year);
			$("#rrn2").val(month);
			$("#rrn3").val(day);
		}
	}

	function branchCdChange(){
		$("select[name='deptCd'] option").remove();   
		$("select[name='teamCd'] option").remove();
		$("select[name='partCd'] option").remove();
		$("[name='deptCd']").append("<option value=''>선택해주세요.</option>");
		$("[name='teamCd']").append("<option value=''>선택해주세요.</option>");
		$("[name='partCd']").append("<option value=''>선택해주세요.</option>");
		var name 	= "branchCd";
		var setName = "deptCd";
		var cnt = getCommClientCdList(name, setName, clientCd);
	}

	function deptCdChange(){
		j$("select[name='teamCd'] option").remove();
		j$("select[name='partCd'] option").remove();
		j$("[name='teamCd']").append("<option value=''>선택해주세요.</option>");
		j$("[name='partCd']").append("<option value=''>선택해주세요.</option>");
		var name 	= "deptCd";
		var setName = "teamCd";
		var cnt = getCommClientCdList(name, setName, clientCd);
	}

	function teamCdChange(){
		j$("select[name='partCd'] option").remove();
		j$("[name='partCd']").append("<option value=''>선택해주세요.</option>");
		var name 	= "teamCd";
		var setName = "partCd";
		var cnt = getCommClientCdList(name, setName, clientCd);
	}

	function getCommClientCdList(name, setName) {
		var result = 0;
		if ($("[name='"+name+"']").val() != "" && $("[name='"+name+"']").val() != null) {
			$.ajax({
				url: "/madm/common/getCommClientList?highCommCd=" + $("[name='"+name+"']").val() + "&clientCd=" +  $("#clientCd").val(),
				dataType: 'json',
				async: false,
				success: function (response) {
					var iter = response.list;
					var element = "";
					result = iter.length;
					for (var i = 0; i < iter.length; i++) {
						element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
					}
					if (element != "") {
						$("[name='"+setName+"']").append(element);
					}
				}
			});
		}
		
		return result;
	}

	function fncChangeChannelType() {
		var channelType = $("#channelType").val();
		
		var cause = [];
		
		if(channelType == "100001") {
			cause = [
					["기타", "기타"], ["====================", "기타"], ["직장 내 문제", "직장 내 문제"], ["개인적 문제", "개인적 문제"], ["가족관련 문제", "가족관련 문제"], 
					["====================", "기타"], ["정서 문제", "정서 문제"], ["발달 문제", "발달 문제"], ["행동 문제", "행동 문제"], ["대인관계", "대인관계"], ["학습 및 진로", "학습 및 진로"],
					["====================", "기타"], ["optum", "optum"], ["wpo", "wpo"]
				];
		} else if(channelType == "100002") {
			cause = [
				["기타", "기타"], ["====================", "기타"], ["가사관련(이혼 등)/상속관련", "가사관련(이혼 등)/상속관련"], ["형사관련", "형사관련"], ["민사관련", "민사관련"], 
				["부동산관련(임대차 등)", "부동산관련(임대차 등)"], ["세무관련", "세무관련"], ["개인회생/파산관련", "개인회생/파산관련"], ["====================", "기타"], ["optum", "optum"], ["wpo", "wpo"]
			];
		} else {
			cause = [
				["기타", "기타"], ["====================", "기타"], ["신입사원 재무설계", "신입사원 재무설계"], ["신혼부부 재테크", "신혼부부 재테크"], ["노후자금 마련", "노후자금 마련"], 
				["주택마련", "주택마련"], ["====================", "기타"], ["optum", "optum"], ["wpo", "wpo"]
			];
		}
		
		$("#cause option").remove();
		
		for(var i in cause) {
			$("#cause").append('<option value="'+cause[i][1]+'">'+cause[i][0]+'</option>')
		}
	} 
</script>
</head>
<body>


<input type="hidden" id="userKey" name="userKey" value="${param.userKey}">
<input type="hidden" id="clientCd" name="clientCd" value="${user.clientCd}">

<input type="hidden" id="intakeCd" name="intakeCd" value="${intakeCd}">
<input type="hidden" id="scheduleSeq" name="scheduleSeq" value="">

<input type="hidden" id="ceilingCategoryCd" name="ceilingCategoryCd" value="100681">

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
		
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">임직원 정보<br>	    			
						<c:if test="${not empty user.ipinDi }">
		    				<span>※ 인증이 완료된 회원입니다.</span>
		    			</c:if>
		    			<c:if test="${empty user.ipinDi }">
		    				<span style="color:red;">※ 인증을 하지 않은 회원입니다.</span>
		    			</c:if>
						<br><span style="color: red;">※ 임직원 정보는 고객사관리자 통계에 반영됩니다. </span></td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>이름</strong>
								</td>
						    	<td width="40%" align="left">
						    		${user.userNm}
						    		<input type="hidden" name="userKey" id="userKey" value="${user.userKey }">
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong><span style="color:red;">* </span>성별</strong>
								</td>
						    	<td width="40%" align="left">
						    		<select name="gender" id="gender">
						    			<option value="">-- 선택 --</option>
						    			<option value="M" <c:if test="${user.gender eq 'M' }"> selected </c:if> >남성</option>
						    			<option value="F"  <c:if test="${user.gender eq 'F' }"> selected </c:if> >여성</option>
						    		</select>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong><span style="color:red;">* </span>주민번호 앞 7자리</strong>
								</td>
						    	<td width="40%" align="left">
						    		<input type="text" name="rrn" id="rrn" value="${user.rrn }" maxlength="8" />
						    		ex) 81년 1월 1일생 남자의 경우 : <b>810101-1</b>  81년 1월 1일생 여자의 경우 : <b>810101-2</b>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>소속</strong>
								</td>
						    	<td width="auto;" align="left">
									<commClient:select name="branchCd" id="branchCd" clientCd="${user.clientCd }" code="100002" onchange="branchCdChange();" selectValue="${user.branchCd}" basicValue="선택해주세요." />
									<commClient:select name="deptCd" id="deptCd" clientCd="${user.clientCd }" code="${user.branchCd}" onchange="deptCdChange();" selectValue="${user.deptCd}" basicValue="선택해주세요." />
									<commClient:select name="teamCd" id="teamCd" clientCd="${user.clientCd }" code="${user.deptCd}" onchange="teamCdChange();" selectValue="${user.teamCd}" basicValue="선택해주세요." />
									<commClient:select name="partCd" id="partCd" clientCd="${user.clientCd }" code="${user.teamCd}" selectValue="${user.partCd}" basicValue="선택해주세요." />
								</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>직급</strong>
								</td>
						    	<td width="auto;" align="left">
									<commClient:select name="gradeCd" id="gradeCd" code="100006" clientCd="${user.clientCd }" selectValue="${user.gradeCd}" basicValue="선택" />
								</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>사용한도</strong>
								</td>
						    	<td width="auto;" align="left">
						    		개인 한도 : ${ceiling}<br>개인 잔여한도 : ${privateRemainPoint}<br> 고객사 잔여한도 : ${clientRemainPoint}
								</td>
							</tr>
							<tr align="left" height="30px">
								<td colspan="2" align="center">
									<!-- 버튼 영역 시작 -->
									<table cellpadding="5" cellspacing="0" border="0" width="70%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
										<tr>
											<td align="center" colspan="4">
												<table cellpadding="0" cellspacing="0" border="0">
													<tr>
											    		<td id="btn01"><a href="#"><span id="btnUpdateUser">임직원 정보 수정</span></a></td>
									    			</tr>
									    		</table>
									    	</td>
										</tr>
									</table>
									<!-- 버튼 영역 종료 -->
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="30px"></td>
				</tr>
			</table>
			
			
			<c:if test="${empty intakeCd}">
			
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td height="20px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">인테이크 정보</td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
					<tr>
						<td>
							<!-- 검색 영역 시작 -->
							<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>검사받으실분</strong>
									</td>
							    	<td width="40%" align="left">
							    		<comm:select name="relation" id="relation" code="100440" selectValue="100441" />
							    	</td>
									
								</tr>
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>이름</strong>
									</td>
							    	<td width="40%" align="left">
							    		<input type="text" id="counselNm" name="counselNm" value="${user.userNm}">
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>성별</strong>
									</td>
							    	<td width="40%" align="left">
										<select id="intakeGender">
											<option value="" >---- 선 택 ----</option>
											<option value="M">남자</option>
		                                    <option value="F">여자</option>
										</select>
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>생년월일</strong>
									</td>
							    	<td width="40%" align="left">
										<select name="rrn1" id="rrn1"> 
											<option value="" >---- 선 택 ----</option>
											<jsp:useBean id="toDay" class="java.util.Date" />
											<fmt:formatDate value="${toDay}" pattern="yyyy" var="nowYear"/>
											<c:forEach var="i" begin="1920" end="${nowYear}">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
										<select name="rrn2" id="rrn2">
											<option value="" >---- 선 택 ----</option>
											<c:forEach var="i" begin="1" end="12">
												<option value="${i < 10 ? '0' : ''}${i}">${i < 10 ? '0' : ''}${i}</option>
											</c:forEach>
										</select>
										<select name="rrn3" id="rrn3">
											<option value="" >---- 선 택 ----</option>
											<c:forEach var="i" begin="1" end="31">
												<option value="${i < 10 ? '0' : ''}${i}">${i < 10 ? '0' : ''}${i}</option>
											</c:forEach>
										</select>
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<td rowspan="2" width="10%" bgcolor="#F5F5F5" align="center">
										<strong>학력</strong><br>
									</td>
							    	<td width="40%" align="left">
							    		<input type="radio" name="educatonType" value="A" checked>성인
							    		<comm:select id="education1" name="education1" code="100597"/>
							    		<comm:select id="job" name="job" code="100627"/>
							    	</td>
								</tr>
								
								<tr align="left" height="30px">
							    	<td width="40%" align="left">
							    		<input type="radio" name="educatonType" value="C">아동
							    		<comm:select id="education2" name="education2" code="100609"/>
							    		<comm:select id="session" name="session" code="100614"/>
							    	</td>
								</tr>
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>휴대폰번호</strong>
									</td>
							    	<td width="40%" align="left">
										<select id="mobile1">
		                                    <option value="010">010</option>
		                                    <option value="011">011</option>
		                                    <option value="016">016</option>
		                                    <option value="017">017</option>
		                                    <option value="018">018</option>
		                                    <option value="019">019</option>
	                                    	<option value="070">070</option>
										</select>
										<input type="text" id="mobile2" maxlength="4" size="5">
										<input type="text" id="mobile3" maxlength="4" size="5">
							    	</td>
								</tr>
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>이메일</strong>
									</td>
							    	<td width="40%" align="left">
							    		<input type="text" id="email" name="email" value="${user.email}">
							    	</td>
								</tr>
								
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>상담유형/세부</strong>
									</td>
							    	<td width="40%" align="left">
										<select id="channelType">
		                                    <option value="100001">심리상담</option>
		                                    <option value="100002">법률/세무상담</option>
		                                    <option value="100003">재무상담</option>
										</select>
										<select id="categoryCd">
											<c:forEach var="list" items="${ categoryList }">
												<option value="${list.categoryCd}">${list.categoryNm}</option>
											</c:forEach>
										</select>
							    	</td>
								</tr>
								
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>상담방법</strong>
									</td>
							    	<td width="40%" align="left">
							    		<select id="counselType">
		                                    <option value="100433">대면</option>
		                                    <option value="100434">전화</option>
		                                    <option value="100435">텍스트</option>
										</select>
							    	</td>
								</tr>
								
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>상담주제</strong>
									</td>
							    	<td width="40%" align="left">
							    		<select id="cause">
							    			<option value="기타">기타</option>
							    			<option value="기타">====================</option>
		                                    <option value="직장 내 문제">직장 내 문제</option>
		                                    <option value="개인적 문제">개인적 문제</option>
		                                    <option value="가족관련 문제">가족관련 문제</option>
		                                    <option value="기타">====================</option>
		                                    <option value="정서 문제">정서 문제</option>
		                                    <option value="발달 문제">발달 문제</option>
		                                    <option value="행동 문제">행동 문제</option>
		                                    <option value="대인관계">대인관계</option>
		                                    <option value="학습 및 진로">학습 및 진로</option>
		                                    <option value="기타">===================</option>
		                                    <option value="신입사원 재무설계">신입사원 재무설계</option>
		                                    <option value="신혼부부 재테크">신혼부부 재테크</option>
		                                    <option value="노후자금 마련">노후자금 마련</option>
		                                    <option value="주택마련">주택마련</option>
		                                    <option value="기타">===================</option>
		                                    <option value="가사관련(이혼 등)/상속관련">가사관련(이혼 등)/상속관련</option>
		                                    <option value="형사관련">형사관련</option>
		                                    <option value="민사관련">민사관련</option>
		                                    <option value="부동산관련(임대차 등)">부동산관련(임대차 등)</option>
		                                    <option value="세무관련">세무관련</option>
		                                    <option value="개인회생/파산관련">개인회생/파산관련</option>
		                                    <option value="기타">===================</option>
		                                    <option value="optum">optum</option>
		                                    <option value="wpo">wpo</option>
										</select>
										<select id="cause1" style="display: none;">
							    			<option value="">---- 선택 ----</option>
							    			<option value="직장관련문제(WR-Health Issues)">직장관련문제(WR-Health Issues)</option>
							    			<option value="직장관련 개인적 문제(WR-individual Issues)">직장관련 개인적 문제(WR-individual Issues)</option>
		                                    <option value="직장 관련 대인관계문제(WR-Interpersonal Issues)">직장 관련 대인관계문제(WR-Interpersonal Issues)</option>
		                                    <option value="직장관련 조직적문제(WR-Organisational Issues)">직장관련 조직적문제(WR-Organisational Issues)</option>
		                                    <option value="기타">====================</option>
		                                    <option value="개인적인 대인관계적 문제(IH-Interpersonal Issues)">개인적인 대인관계적 문제(IH-Interpersonal Issues)</option>
		                                    <option value="건강관련문제(IH-Family)">건강관련문제(IH-Family)</option>
		                                    <option value="중독문제(IH-Addiction)">중독문제(IH-Addiction)</option>
		                                    <option value="개인관계 문제(IH- Relationship)">개인관계 문제(IH- Relationship)</option>
		                                    <option value="심리적문제(IH-Psychological Issues)">심리적문제(IH-Psychological Issues)</option>
		                                    <option value="건강관련문제(IH-Physical)">건강관련문제(IH-Physical)</option>
		                                    <option value="웰니스(WB-Wellness)">웰니스(WB-Wellness)</option>
		                                    <option value="기타">===================</option>
		                                    <option value="다른 문제(IH-Other Issues)">다른 문제(IH-Other Issues)</option>
										</select>
										<select id="cause2" style="display: none;">
							    			
										</select>
										<select id="cause3" style="display: none;">
							    			<option value="">---- 선택 ----</option>
							    			<option value="중독관련(Addiction Concerns)">중독관련(Addiction Concerns)</option>
							    			<option value="적응/변화(Adjustment/Change)">적응/변화(Adjustment/Change)</option>
		                                    <option value="정서/감정(Emotional Health)">정서/감정(Emotional Health)</option>
		                                    <option value="가족/관계(Family/Relationship)">가족/관계(Family/Relationship)</option>
		                                    <option value="슬픔/상실(Grief/Loss)">슬픔/상실(Grief/Loss)</option>
		                                    <option value="직장문제(Workplace Concerns)">직장문제(Workplace Concerns)</option>
										</select>
							    	</td>
								</tr>
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>메모</strong>
									</td>
							    	<td width="40%" align="left">
							    		<input type="text" id="memo" name="memo">
							    	</td>
								</tr>
								
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>1회기 확인 여부</strong>
									</td>
							    	<td width="40%" align="left">
							    		<select id="counselReservChk">
							    			<option value="Y"> Y </option>
							    			<option value="N"> N </option>
										</select>
							    	</td>
								</tr>
							</table>
							<!-- 검색 영역 종료 -->
						</td>
					</tr>
					<tr id="trIntake">
						<td>
							<!-- 버튼 영역 시작 -->
							<table cellpadding="5" cellspacing="0" border="0" width="70%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
								<tr>
									<td align="center" colspan="4">
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
									    		<td id="btn01"><a href="#"><span id="btnAddIntake">인테이크 등록</span></a></td>
							    			</tr>
							    		</table>
							    	</td>
								</tr>
							</table>
							<!-- 버튼 영역 종료 -->
						</td>
					</tr>
					<tr>
						<td height="30px"></td>
					</tr>
	
				</table>
			
			</c:if>
			
	
			
			
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left" class="subtitle">상담유형</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<c:if test="${empty intakeCd}">
								<tr align="left" height="30px">
									<td width="10%" bgcolor="#F5F5F5" align="center">
										<strong>상담센터 검색</strong>
									</td>
							    	<td width="40%" align="left">
										<input type="text" name="searchCenter" id="searchCenter"  style="width:250px">
							    		<input type="button" id="searchCenterBtn" value="센터 검색">
							    	</td>
								</tr>
							</c:if>
							
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>상담센터/상담사</strong>
								</td>
						    	<td width="40%" align="left">
						    		<c:choose>
						    			<c:when test="${empty intakeCd}">
						    				<select id="centerList">
												<option value="">센터를 선택해주세요.</option>
												<c:forEach var="list" items="${ centerList }">
													<option value="${list.centerSeq}" <c:if test="${centerSeq eq list.centerSeq}">selected</c:if>>${list.centerNm}</option>
												</c:forEach>
											</select>
											<select id="counselorList">
											</select>
						    			</c:when>
						    			<c:otherwise>
						    				<select id="centerList">
						    					<option value="${counsel.centerSeq}">${counsel.centerNm}</option>
						    				</select>
						    				<select id="counselorList">
						    					<option value="${counsel.counselorId}">${counsel.counselorId}</option>
											</select>
						    			</c:otherwise>
						    		
						    		</c:choose>

						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>날짜/시간</strong>
								</td>
						    	<td width="40%" align="left">
						    		<input type="text" size="10" class="counselYmd" id="counselYmd" value="" readonly>
					    			<select id="stTime">
										<option value="">선택해주세요.</option>
										<option value="0700">0700</option>
										<option value="0800">0800</option>
										<option value="0900">0900</option>
										<option value="1000">1000</option>
										<option value="1100">1100</option>
										<option value="1200">1200</option>
										<option value="1300">1300</option>
										<option value="1400">1400</option>
										<option value="1500">1500</option>
										<option value="1600">1600</option>
										<option value="1700">1700</option>
										<option value="1800">1800</option>
										<option value="1900">1900</option>
										<option value="2000">2000</option>
										<option value="2100">2100</option>
										<option value="2200">2200</option>
									</select>
						    		<input type="button" id="btnCounselConfirm" value="상담스케줄 확인 / 주문확인">
						    	</td>
							</tr>
							
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				<tr>
					<td height="30px"></td>
				</tr>
				
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>주문가격</strong>
								</td>
						    	<td width="40%" align="left">
									<span id="counselOrderPrice"></span>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>SMS전송여부</strong>
								</td>
						    	<td width="40%" align="left">
									<input id="smsYn" type="checkbox" checked>
									&nbsp;&nbsp;&nbsp;★  SMS를 전송하지 않으려면 체크를 해제 해주세요.
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>SMS발송용 상담시간</strong>
								</td>
						    	<td width="40%" align="left">
									<select id="smsTime" disabled="disabled">
										<option value="">== 시간 선택 ==</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
									</select>
									<select id="smsTime2">
										<option value="00">= 분 선택 =</option>
										<option value="00">00</option>
										<option value="05">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
									</select>
									<span>*입력하지 않으면 변경할 시간으로 문자가 전송됩니다.</span>
						    	</td>
							</tr> 
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				<tr id="trOrder" style="display:none;">
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="70%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01">
								    			<a href="#"><span id="doOrder">주문하기</span></a>
								    		</td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

