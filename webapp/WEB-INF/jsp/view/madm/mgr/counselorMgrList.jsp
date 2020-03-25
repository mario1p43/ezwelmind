<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사관리</title>

<script src="${url:resource('/resources/js/spin.js')}"></script>
<script type="text/javascript">

j$(document).ready(function(){

	j$("#searchBtn").click(function(){
		submitReady();		
		$('#searchMgr').attr('action', "/madm/mgr/counselorMgrList").submit();
		//j$("#searchMgr").submit();
		return false;
	});


	j$("#insertBtn").click(function(){
		location.href = "/madm/mgr/counselorMgrAdd";
 		return false;
	});

	j$("#excelBtn").click(function(){
		
		submitReady();		
		$('#searchMgr').attr('action', "/madm/mgr/excelDownload").submit(); 
		/* var form = $('<form></form>');
	    form.attr('action', '/madm/mgr/excelDownload');
	    form.attr('method', 'post');
	    form.appendTo('body');
	    form.appendTo()
	    
	    
	    form.submit(); */
		
		
		/* var centerNm = '${centerNm}';
		var userNm = '${param.userNm}';
		var mgrStatus = "${param.sMgrStatus}";
		var channelType = '${param.sChannelType}';
		var workType = "${param.sWorkType}";
		var startDt = '${param.startDt}';
		var endDt = '${param.endDt}';
		var authCd = '${param.authCd}';
		
		location.href = "/madm/mgr/excelDownload?centerNm="+centerNm+"&amp;userNm="+userNm+"&amp;mgrStatus="+mgrStatus+"&amp;channelType="+channelType+"&amp;workType="+workType+"&amp;startDt="+startDt+"&amp;endDt="+endDt+"&amp;authCd="+authCd;
 		return false; */
	});
	
	j$(".counselorListDetail").click(function(){
		var userId = j$(this).attr("value");
		location.href = "/madm/mgr/getCounselorMgrDetail?userId="+userId;
		return false;
	});
 
	j$(".centerDetail").click(function(){
		var centerSeq = j$(this).attr("value");
		location.href = "/madm/centerInfo/getCenterModify?centerSeq="+centerSeq;
		return false;
	});
	
 	//달력
	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#btendDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});	
	
	
	j$("#calendar4").click(function(){
		var time = new Date();
		var yearStart = time.getFullYear();
		time
		var monthStart = time.getMonth()+1;
		if(monthStart < 10){
			monthStart = '0'+monthStart;
		}
		var dayStart = time.getDate();
		if(dayStart < 10){
			dayStart = '0'+dayStart;
		}
		time.setDate (time.getDate() - 30); 

		var yearEnd = time.getFullYear();
		var monthEnd = time.getMonth()+1;
		if(monthEnd < 10){
			monthEnd = '0'+monthEnd;
		}
		var dayEnd = time.getDate();
		if(dayEnd < 10){
			dayEnd = '0'+dayEnd;
		}
		var start = yearStart+"/"+monthStart+"/"+dayStart;
		var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
	});
	
	j$("#calendar3").click(function(){
		var time = new Date();
		
		var yearStart = time.getFullYear();
		var monthStart = time.getMonth()+1;
		if(monthStart < 10){
			monthStart = '0'+monthStart;
		}
		var dayStart = time.getDate();
		if(dayStart < 10){
			dayStart = '0'+dayStart;
		}
		 
		time.setDate (time.getDate() - 15); 
		var yearEnd = time.getFullYear();
		var monthEnd = time.getMonth()+1;
		if(monthEnd < 10){
			monthEnd = '0'+monthEnd;
		}
		var dayEnd = time.getDate();
		if(dayEnd < 10){
			dayEnd = '0'+dayEnd;
		}
		var start = yearStart+"/"+monthStart+"/"+dayStart;
		var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
	});
	
	j$("#calendar2").click(function(){
		var time = new Date();
		
		var yearStart = time.getFullYear();
		var monthStart = time.getMonth()+1;
		if(monthStart < 10){
			monthStart = '0'+monthStart;
		}
		var dayStart = time.getDate();
		if(dayStart < 10){
			dayStart = '0'+dayStart;
		}
		 
		time.setDate (time.getDate() - 7); 
		var yearEnd = time.getFullYear();
		var monthEnd = time.getMonth()+1;
		if(monthEnd < 10){
			monthEnd = '0'+monthEnd;
		}
		var dayEnd = time.getDate();
		if(dayEnd < 10){
			dayEnd = '0'+dayEnd;
		}
		var start = yearStart+"/"+monthStart+"/"+dayStart;
		var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
	});
	
	j$("#calendar1").click(function(){
		var time = new Date();
		var year = time.getFullYear();
		var month = time.getMonth()+1;
		if(month < 10){
			month = '0'+month;
		}
		var day = time.getDate();
		if(day < 10){
			day = '0'+day;
		}
		var start = year+"/"+month+"/"+day;

		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(start);
	});

	<c:if test='${not empty param.sMgrStatus}'>
	var chkValue = '${param.sMgrStatus}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mgrStatus][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sChannelType}'>
	var chkValue = '${param.sChannelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sWorkType}'>
	var chkValue = '${param.sWorkType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=workType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty centerSeq}'>
	var chkValue = '${centerSeq}';
	document.searchMgr.centerNm.value = chkValue;
	</c:if>
	
	
	<c:if test='${not empty param.authCd}'>
	var chkValue = '${param.authCd}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sAuthCd][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sMentalAges}'>
	var chkValue = '${param.sMentalAges}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mentalAges][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sDiagnosisAges}'>
	var chkValue = '${param.sDiagnosisAges}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisAges][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>

	
	<c:if test='${not empty param.sLawDiv}'>
	var chkValue = '${param.sLawDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=lawDiv][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sFinanceDiv}'>
	var chkValue = '${param.sFinanceDiv}';
	if(chkValue != ""){
		$('[name=financeDiv]').attr('checked',true);
	}
	</c:if>
	
	<c:if test='${not empty param.sDiagnosisDiv}'>
	var chkValue = '${param.sDiagnosisDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisDiv][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sMentalType}'>
	var chkValue = '${param.sMentalType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mentalType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sLawType}'>
	var chkValue = '${param.sLawType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=lawType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sFinanceType}'>
	var chkValue = '${param.sFinanceType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=financeType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>

	
	<c:if test='${not empty param.sDiagnosisType}'>
	var chkValue = '${param.sDiagnosisType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sMentalDiv}'>
	var chkValue = '${param.sMentalDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkValue != ""){
		$('[name=mentalDiv][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sLanguageType}'>
	var chkValue = '${param.sLanguageType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkValue != ""){
		$('[name=languageType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sSpecialType}'>
	var chkValue = '${param.sSpecialType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkValue != ""){
		$('[name=specialType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sAges}'>
	var chkValue = '${param.sAges}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkValue != ""){
		$('[name=ages][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	$( document ).ready(function() {
		var previous; 
		$(".mgrStatusVal").on('focus', function () {  
			previous = this.value;
		console.log("previous:::"+previous);
		}).change(function() { 
			var newval = this.value;
			var leng = j$("input[class=check]:checked").length;
			
			if( leng == 0 ) {
				 j$.alert("선택된 값이 없습니다.");
				 //window.location.reload();
				 return;
			}
			
			console.log("newval:::"+newval);	
			var con_test = confirm("상담사에 변경내용이 SMS로 전달됩니다.")
			if(con_test == true){
				// 대기 -> 반려 
				if(previous == 'S' && newval == 'R'){
					$("#mgrStatus1").click();
					
				//승인 -> 대기 
				}else if(previous == 'Y' && newval == 'S'){
					$("#mgrStatus2").click();
					
				//대기 -> 승인 
				}else if(previous == 'S' && newval == 'Y'){
					$("#mgrStatus3").click();
					
				//대기 -> 중지
				}else if(previous == 'S' && newval == 'N'){
					$("#mgrStatus5").click();
					
				//중지 -> 대기
				}else if(previous == 'N' && newval == 'S'){
					$("#mgrStatus6").click();
					
				//반려 -> 대기
				}else if(previous == 'R' && newval == 'S'){
					$("#mgrStatus7").click();
				}
			}else if(con_test == false){
			  window.location.reload();
			}
				
				
		});
	});
	

	
	
	function mgrStatusChange(){
		/* var aaa = $("#mgrStatusVal").val();
		
		var params = {};
		
		params.userId = $("#tempUserId").val();
		params.mgrStatus = 'R';
		params.changeReason = $("#changeReason").val();
		
		if(params.changeReason == '' || params.changeReason == null){
			alert('반려사유를 적어주세요.');
			//sendChangeRPop();
			return false;
		}
		
		if(confirm("해당 상담사를 중지 처리하시겠습니까?")){
				var spinner = new Spinner().spin().el;
	        jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		} */
		

	}
	
	
	// 대기 -> 반려
	j$("#mgrStatus1").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp = "";
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
			if(frm.elements["mgrStatusTemp"].value != '대기'){
				alert('대기상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+"'"+ frm.elements["check"][i].value+"'";
						if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= frm.elements["check"][i].value;
					   	if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		} 
		// 임시로 저장
		$("#tempUserId").val(temp);
		sendChangeRPop();
	});	
	
	//승인 ->  대기
 	j$("#mgrStatus2").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp = "" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
			if(frm.elements["mgrStatusTemp"].value != '승인'){
				alert('승인상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+ frm.elements["check"][i].value;
						if(frm.elements["mgrStatusTemp"][i].value != '승인'){
							alert('승인상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= frm.elements["check"][i].value;
					   	if(frm.elements["mgrStatusTemp"][i].value != '승인'){
							alert('승인상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'S';
		
		
 		if(confirm("해당 상담사를 대기 처리하시겠습니까?")){
 			var spinner = new Spinner().spin().el;
            jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}

		return false;
	});
	
	//대기 ->  승인
 	j$("#mgrStatus3").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp = "" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
			if(frm.elements["mgrStatusTemp"].value != '대기'){
				alert('대기상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+ frm.elements["check"][i].value;
						if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= frm.elements["check"][i].value;
					   	if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'Y';
		console.log(params.userId);
		
 		if(confirm("해당 상담사를 승인 처리하시겠습니까?")){
 			var spinner = new Spinner().spin().el;
            jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}

		return false;
	});
	
 	//대기 ->  승인
 	j$("#mgrStatus5").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		if(leng >1){
			j$.alert("선택된 값이 없습니다.");
			 return;
		}
		
		var frm = searchMgr;
		var temp = "" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= frm.elements["check"].value;
			if(frm.elements["mgrStatusTemp"].value != '대기'){
				alert('대기상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+frm.elements["check"][i].value;
						if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= frm.elements["check"][i].value;
					   	if(frm.elements["mgrStatusTemp"][i].value != '대기'){
							alert('대기상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'N';
		
		
 		if(confirm("해당 상담사를 중지 처리하시겠습니까?")){
 			var spinner = new Spinner().spin().el;
            jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}

		return false;
	});
 	
 	//대기 ->  승인
 	j$("#mgrStatus6").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp = "" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
			if(frm.elements["mgrStatusTemp"].value != '중지'){
				alert('중지상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+"'"+ frm.elements["check"][i].value+"'";
						if(frm.elements["mgrStatusTemp"][i].value != '중지'){
							alert('중지상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= "'"+frm.elements["check"][i].value+"'";
					   	if(frm.elements["mgrStatusTemp"][i].value != '중지'){
							alert('중지상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'S';
		
		
 		if(confirm("해당 상담사를 대기 처리하시겠습니까?")){
 			var spinner = new Spinner().spin().el;
            jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}

		return false;
	});
 	//반려 -> 대기
 	j$("#mgrStatus7").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp = "" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
			if(frm.elements["mgrStatusTemp"].value != '반려'){
				alert('반려상태가 아닌 상담사를 선택하셨습니다.');
				return false;
			}
		} else {
			for(var i=0;i<frm.elements["check"].length;i++){
				if(frm.elements["check"][i].checked > 0){
					if(cnt!=0){ 
					   	temp+=","+"'"+ frm.elements["check"][i].value+"'";
						if(frm.elements["mgrStatusTemp"][i].value != '반려'){
							alert('반려상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}else{
					   	temp+= "'"+frm.elements["check"][i].value+"'";
					   	if(frm.elements["mgrStatusTemp"][i].value != '반려'){
							alert('반려상태가 아닌 상담사를 선택하셨습니다.');
							return false;
						}
					}
					cnt++;
			    }
		    }
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'S';
		
		
 		if(confirm("해당 상담사를 대기 처리하시겠습니까?")){
 			var spinner = new Spinner().spin().el;
            jQuery(document.body).append(spinner);
			
			j$.ajax({
				url: '/madm/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}

		return false;
	});
	
	//별 등급관리
	j$("#mgrStatus4").click(function(){
 		location.href = "/madm/mgr/starMgr";
 	});
	
	j$('#area1').change(function(){
		var params = {};
		var strData = "";
		var area1 = this.value
		params.area1  = area1;
		
		j$('#subData').remove();	
		
		if(area1 == 100016){
			
		}else{
		
		
			j$.ajax({
				url: '/madm/centerInfo/ajaxArea',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					strData += "<span id='subData'>";
					strData += "<select id='area2' name='area2' data-validation='required' data-validation-error-msg-required='군/구을 확인 해주세요.'>";
					strData += "<option value=''>군/구 선택</option>";
					
					j$.each(data.serviceList, function(i, serviceList){
						strData += "   <option value='"+serviceList.commCd+"'>"+serviceList.commNm+"</option>";
					});
					
					strData += "</select>";
					strData += "</span>";
					j$('#area2').show();
					j$('#area2').after(strData);  
				}
			});
		}

		return false;
		
	}); 
});

//특정 문자열을 입력하지 않으면 회원가입을 하지 못하도록 - 현대카드 스튜디오 블랙 사용
function sendChangeRPop(){
	$.divPop('sendChangeR', "반려사유", $("#sendChangeRDiv"));
	return false;
}

//대기 ->  반려
function sendChangeR(){
	
	var params = {};
	
	params.userId = $("#tempUserId").val();
	params.mgrStatus = 'R';
	params.changeReason = $("#changeReason").val();
	
	if(params.changeReason == '' || params.changeReason == null){
		alert('반려사유를 적어주세요.');
		return false;
	}
	if(confirm("해당 상담사를 반려 처리하시겠습니까?")){
		var spinner = new Spinner().spin().el;
   		jQuery(document.body).append(spinner);
		
		j$.ajax({
			url: '/madm/mgr/counselorInfoMgrStatus',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				window.location.reload();
			}
		}); 
	}

	return false;
}

function centerReload(type){
	/* if(setType == "sel"){
		var tempCenterNm = $("#centerNm").val();
		$("#chkCenterNm").val(tempCenterNm);
	}else if(setType == "txt"){
		var centerNmList = new Array();
		<c:forEach var="list" items="${centerList}">
		centerNmList.push("${list.centerNm}");
		</c:forEach>

		var tempCenterNm = $("#chkCenterNm").val();
		for(var i=0 ; i < centerNmList.length ; i++){
			if(centerNmList[i].indexOf(tempCenterNm) != -1) {
				$("#centerNm").val(centerNmList[i]);
				break;
			}	
		}
	} */
	if(type=='sel'){
		var tempCenterCd = j$("#centerNm").val();
		var tempCenterNm = j$("#centerNm option:selected").text();
		$("#chkCenterNm").val(tempCenterNm);
		$("[name='centerSeq']").val(tempCenterCd);
	}else if(type=='txt'){
		var tempCenterNm = j$("#chkCenterNm").val();
		j$("#centerNm").find("option").filter(function(index) {
			return $(this).text().indexOf(tempCenterNm) !== -1
		}).prop("selected", "selected");
		var tempCenterCd = j$("#centerNm").val();
		$("[name='centerSeq']").val(tempCenterCd);
	}
/* 	var inputValue = $("[name='centerNm']").val();
	if(inputValue==null || inputValue==""){
		$("[name='searchCenterSeq']").val('');
		j$("#centerSeq").val('');
	} */
	
}
function submitReady(){
	var frm = searchMgr;
	var temp ="" ;
	var cnt = 0;
	var centerSeq = frm.elements["centerSeq"].value;
	if(centerSeq=="") frm.elements["centerSeq"].value = 0;
	//재직상태 checkbox 값 
	for(var i=0;i<frm.elements["mgrStatus"].length;i++){
		if(frm.elements["mgrStatus"][i].checked > 0){
			if(cnt!=0){   
			   temp +=","+ frm.elements["mgrStatus"][i].value;
			}else{
			   temp += frm.elements["mgrStatus"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sMgrStatus"].value = temp;
	
		 temp = "" ;
	 cnt = 0;

	// checkbox 값 
	for(var i=0;i<frm.elements["channelType"].length;i++){
		if(frm.elements["channelType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["channelType"][i].value;
			   
			}else{
			   temp+= frm.elements["channelType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sChannelType"].value = temp; 
	 
	temp ="" ;
	cnt = 0;

	// checkbox 값 
	for(var i=0;i<frm.elements["workType"].length;i++){
		if(frm.elements["workType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["workType"][i].value;
			}else{
			   temp+= frm.elements["workType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sWorkType"].value = temp;

	temp = "" ;
	cnt = 0;

	// checkbox 값 
	for(var i=0;i<frm.elements["sAuthCd"].length;i++){
		if(frm.elements["sAuthCd"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["sAuthCd"][i].value;
			   
			}else{
			   temp+= frm.elements["sAuthCd"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["authCd"].value = temp;
	 
	temp = "" ;
	cnt = 0;

	// checkbox 값 상담대상 - 심리
	for(var i=0;i<frm.elements["mentalAges"].length;i++){
		if(frm.elements["mentalAges"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["mentalAges"][i].value;
			   
			}else{
			   temp+= frm.elements["mentalAges"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sMentalAges"].value = temp;
	temp = "" ;
	cnt = 0;
	// checkbox 값 상담대상 - 심리검사
	 for(var i=0;i<frm.elements["diagnosisAges"].length;i++){
		if(frm.elements["diagnosisAges"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["diagnosisAges"][i].value;
			   
			}else{
			   temp+= frm.elements["diagnosisAges"][i].value;
			}
			cnt++;
	    }
    }
	 frm.elements["sDiagnosisAges"].value = temp;
	 temp = "" ;
	 cnt = 0;
	 
	// checkbox 값 상담분야 - 심리
	for(var i=0;i<frm.elements["mentalDiv"].length;i++){
		if(frm.elements["mentalDiv"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["mentalDiv"][i].value;
			   
			}else{
			   temp+= frm.elements["mentalDiv"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sMentalDiv"].value = temp;
	 temp = "" ;
	 cnt = 0;
	 
	 
	// checkbox 값 상담분야 - 법률
	/* for(var i=0;i<frm.elements["lawDiv"].length;i++){
		if(frm.elements["lawDiv"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["lawDiv"][i].value;
			   
			}else{
			   temp+= frm.elements["lawDiv"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sLawDiv"].value = temp;
	 temp = "" ;
	 cnt = 0; */
	// checkbox 값 상담분야 - 재무
	/* if(frm.elements["financeDiv"].checked > 0){
		temp+= frm.elements["financeDiv"].value;
		cnt++;
	}
	 frm.elements["sFinanceDiv"].value = temp;
	 temp = "" ;
	 cnt = 0; */
	 
	// checkbox 값 상담분야 - 심리검사
	for(var i=0;i<frm.elements["diagnosisDiv"].length;i++){
		if(frm.elements["diagnosisDiv"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["diagnosisDiv"][i].value;
			   
			}else{
			   temp+= frm.elements["diagnosisDiv"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sDiagnosisDiv"].value = temp; 
	 temp = "" ;
	 cnt = 0;

	// checkbox 값 상담분야 - 상담방법(심리)
	for(var i=0;i<frm.elements["mentalType"].length;i++){
		if(frm.elements["mentalType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["mentalType"][i].value;
			   
			}else{
			   temp+= frm.elements["mentalType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sMentalType"].value = temp;  
	 temp = "" ;
	 cnt = 0;

	// checkbox 값 상담분야 - 상담방법(법률)
	/* for(var i=0;i<frm.elements["lawType"].length;i++){
		if(frm.elements["lawType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["lawType"][i].value;
			   
			}else{
			   temp+= frm.elements["lawType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sLawType"].value = temp;  
	 temp = "" ;
	 cnt = 0;  */

	// checkbox 값 상담분야 - 상담방법(재무)
	/* for(var i=0;i<frm.elements["financeType"].length;i++){
		if(frm.elements["financeType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["financeType"][i].value;
			   
			}else{
			   temp+= frm.elements["financeType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sFinanceType"].value = temp;   
	 temp = "" ;
	 cnt = 0; */

	 
	// checkbox 값 상담분야 - 외국어 상담
	for(var i=0;i<frm.elements["languageType"].length;i++){
		if(frm.elements["languageType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["languageType"][i].value;
			   
			}else{
			   temp+= frm.elements["languageType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sLanguageType"].value = temp;   
	 temp = "" ;
	 cnt = 0;
	
	// checkbox 값 상담분야 - 특수주제
	for(var i=0;i<frm.elements["specialType"].length;i++){
		if(frm.elements["specialType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["specialType"][i].value;
			   
			}else{
			   temp+= frm.elements["specialType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sSpecialType"].value = temp;   
	 temp = "" ;
	 cnt = 0; 
	
	// checkbox 값 상담분야 - 나이대별
	for(var i=0;i<frm.elements["ages"].length;i++){
		if(frm.elements["ages"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["ages"][i].value;
			   
			}else{
			   temp+= frm.elements["ages"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sAges"].value = temp;   
	 temp = "" ;
	 cnt = 0; 
	 
	// checkbox 값 상담분야 - 상담방법(심리검사)
	for(var i=0;i<frm.elements["diagnosisType"].length;i++){
		if(frm.elements["diagnosisType"][i].checked > 0){
			if(cnt!=0){   
			   temp+=","+ frm.elements["diagnosisType"][i].value;
			   
			}else{
			   temp+= frm.elements["diagnosisType"][i].value;
			}
			cnt++;
		    }
	    }
	 frm.elements["sDiagnosisType"].value = temp;   
	 
	 frm.elements["centerNm"].value = null;
}


function showDetail(){
	if($(".searchDetail").is(":visible")){
		$(".updownBtn").text("▼");
		$(".searchDetail").css("display","none");
	}else{
		$(".updownBtn").text("▲");
		$(".searchDetail").css("display","");
	}

}



</script>
</head>
<body>

<form id="searchMgr" name="searchMgr" modelAttribute="CounselorInfoMgrDto" action="/madm/mgr/counselorMgrList" method="GET">
<input type="hidden" id="centerIndex" name="centerIndex">
<input type="hidden" name="sMgrStatus" value="${param.sMgrStatus}" />
<input type="hidden" name="sChannelType" value="${param.sChannelType}" />
<input type="hidden" name="sWorkType" value="${param.sWorkType}" />
<input type="hidden" name="authCd" value="${param.authCd }">
<input type="hidden" name="sMentalAges" value="${param.sMentalAges }">
<input type="hidden" name="sMentalDiv" value="${param.sMentalDiv }">
<input type="hidden" name="sLawDiv" value="${param.sLawDiv }">
<input type="hidden" name="sFinanceDiv" value="${param.sFinanceDiv }">
<input type="hidden" name="sDiagnosisDiv" value="${param.sDiagnosisDiv }">
<input type="hidden" name="sDiagnosisType" value="${param.sDiagnosisType }">
<input type="hidden" name="sDiagnosisAges" value="${param.sDiagnosisAges }">
<input type="hidden" name="sMentalType" value="${param.sMentalType }">
<input type="hidden" name="sLawType" value="${param.sLawType }">
<input type="hidden" name="sFinanceType" value="${param.sFinanceType }">
<input type="hidden" name="centerSeq" value="${param.centerSeq }">

<input type="hidden" name="sLanguageType" value="${param.sLanguageType }">
<input type="hidden" name="sSpecialType" value="${param.sSpecialType }">
<input type="hidden" name="sAges" value="${param.sAges }">



<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">상담사관리</td>
				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
					<input type="button" id="excelBtn" value="엑셀다운로드">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1"  width="100%"  style="border-collapse:collapse;">
			<tr>
				<th align="center" width="13%" colspan="2" >센터명</th>
				<td >
					<select id="centerNm" name="centerNm" style="height: 20px;" onchange="centerReload('sel');">
						<option value="">상담센터를 선택하세요</option>
						<c:forEach var="list" items="${centerList}" varStatus="listCnt">
							<option value="${list.centerSeq }" >${list.centerNm }</option>
						</c:forEach>
					</select>
					<input type="text" id="chkCenterNm" value="" onchange="centerReload('txt');" onkeyup="centerReload('txt');" style="width:200px;" placeholder="상담센터명을 입력 또는 선택하세요.">
				</td>
				<th align="center" width="13%">상담사명</th>
				<td><input type="text" name="userNm" id="userNm" size="50%" maxlength="25" value="${param.userNm}"/></td>
			</tr>
			<tr>
				<th align="center" colspan="2" >상태값</th>
					<td>
						<input type="checkbox" name="mgrStatus" data-validation-qty="1-3" value="S"></input>대기
						<input type="checkbox" name="mgrStatus" data-validation-qty="1-3" value="Y"></input>승인
						<input type="checkbox" name="mgrStatus" data-validation-qty="1-3" value="N"></input>중지
						<input type="checkbox" name="mgrStatus" data-validation-qty="1-3" value="R"></input>반려
					</td>
				<th align="center" width="13%">상담유형</th>
					<td width="40%">
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100001"></input>심리
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100002"></input>법률
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100003"></input>재무
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100004"></input>심리검사
					</td>
			</tr>
			<tr>
				<th align="center" colspan="2" >접속권한</th>
				<td align="left">
					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_CENTER" />센터장
					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SANGDAM" />상담
					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SEND" />파견
					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_GROUP" />집단
					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_TEACHER" />강사
				</td>
				<th align="center">근무형태</th>
					<td colspan="3">
						<input type="checkbox" name="workType" data-validation-qty="1-2" value="S" ></input>상주
						<input type="checkbox" name="workType" data-validation-qty="1-2" value="P"></input>파트타임
					</td>
				
			</tr>
			<tr align="left" height="30px">
				<th colspan="2" align="center">지역구분</th>
		    	<td width="35%" align="left">
		    		<span id="area2" >
					<select id="area1" name="area1" >
									<option value="">시/도 선택</option>
				    			<option value="100007" ${param.area1 == "100007" ? 'selected':''}>강원도</option>
				    			<option value="100008" ${param.area1 == "100008" ? 'selected':''}>경기도</option>
				    			<option value="100009" ${param.area1 == "100009" ? 'selected':''}>경상남도</option>
				    			<option value="100010" ${param.area1 == "100010" ? 'selected':''}>경상북도</option>
				    			<option value="100011" ${param.area1 == "100011" ? 'selected':''}>광주광역시</option>
				    			<option value="100012" ${param.area1 == "100012" ? 'selected':''}>대구광역시</option>
				    			<option value="100013" ${param.area1 == "100013" ? 'selected':''}>대전광역시</option>
				    			<option value="100014" ${param.area1 == "100014" ? 'selected':''}>부산광역시</option>
				    			<option value="100015" ${param.area1 == "100015" ? 'selected':''}>서울특별시</option>
				    			<option value="100016" ${param.area1 == "100016" ? 'selected':''}>세종특별자치시</option>
				    			<option value="100017" ${param.area1 == "100017" ? 'selected':''}>울산광역시</option>
				    			<option value="100018" ${param.area1 == "100018" ? 'selected':''}>인천광역시</option>
				    			<option value="100019" ${param.area1 == "100019" ? 'selected':''}>전라남도</option>
				    			<option value="100020" ${param.area1 == "100020" ? 'selected':''}>전라북도</option>
				    			<option value="100021" ${param.area1 == "100021" ? 'selected':''}>제주특별자치도</option>
				    			<option value="100022" ${param.area1 == "100022" ? 'selected':''}>충청남도</option>
				    			<option value="100023" ${param.area1 == "100023" ? 'selected':''}>충천북도</option>
	   				</select>
	   				<c:choose>
	   					<c:when test="${param.area1 eq 100016}">
	   						<span id='subData'></span></span>
	   					</c:when>
	   					<c:when test="${param.area2 eq null}">
	   						<span id='subData'><select><option>군/구 선택 </select> </span></span>
	   					</c:when>
	   					<c:otherwise>
			    	  	<span id='subData'><comm:select name="area2"  code='${param.area1}'  basicValue="군/구 선택" selectValue="${param.area2}" /></span></span>  
			    	  </c:otherwise>
			    	</c:choose>  
		    	</td>
				<th align="center">상담사 전화번호</th>
				<td colspan="3">
					<input type="text" id="mobile" name="mobile" value="${param.mobile}" style="width:288px;">
				</td>
			</tr>
			<tr align="left" height="30px">
				<th align="center" colspan="2">성별</th>
				<td>
					<select id="gender" name="gender">
						<option value="">==== 선택 ====</option>
						<option value="M" ${param.gender eq 'M' ? 'selected' : '' }>남성</option>
						<option value="F" ${param.gender eq 'F' ? 'selected' : '' }>여성</option>
					</select>
				</td>
				<th align="center">연령대</th>
				<td colspan="2">
<%--  					<select id="ages" name="ages">
						<option value="">==== 선택 ====</option>
						<c:forEach begin="2" end="7" var="ages">
							<option value="${ages }" ${param.ages eq ages ? 'selected' : '' }>${ages }0대</option>
						</c:forEach>
					</select> --%>
					 
					<input type="checkbox" name="ages" value="^2" >20대
					<input type="checkbox" name="ages" value="^3" >30대
					<input type="checkbox" name="ages" value="^4" >40대
					<input type="checkbox" name="ages" value="^5" >50대
					<input type="checkbox" name="ages" value="^6" >60대
					<input type="checkbox" name="ages" value="^7" >70대
				</td>
			</tr>
			<tr>
				<th align="center" colspan="2">센터 노출여부</th>
				<td align="left" >
					<select id="dispYn" name="dispYn">
						<option value="">==== 선택 ====</option>
						<option value="Y" ${param.dispYn eq 'Y' ? 'selected' : '' }>노출</option>
						<option value="N" ${param.dispYn eq 'N' ? 'selected' : '' }>비노출</option>
					</select>
				</td>
				<th align="center" >자격 급수</th>
				<td align="left" >
					<select id="" name="qualify">
						<option value="">==== 선택 ====</option>
						<option value="1급" >1급</option>
						<option value="2급" >2급</option>
						<option value="기타" >기타</option>
					</select>
				</td>
			</tr>
			<!-- 상세검색 추가 -->
			<tr>
				<td colspan="7"><div onclick="showDetail()" style="cursor: pointer;text-align: center;">상세검색 <span class="updownBtn">▼</span></div></td>
			</tr>

			<tr class="searchDetail" style="display: none;" >
				<th align="center" rowspan="3">심리</th>
				<th align="center">상담대상</th>
				<td align="left" colspan="5" width="auto">
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100447" id="mentalAges"/> 유아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100448" /> 아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100449" /> 청소년
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100450" /> 성인
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100451" /> 노년기 성인
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				<th align="center">상담분야</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100005"  id="mentalDiv"/> 개인상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100006"  /> 부부/가족상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100007"  /> 놀이치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100008"  /> 미술치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100009"  /> 언어치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100010"  /> 특수재활치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100011"  /> 기타 
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				
				<th align="center">상담방법</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="mentalType" name="mentalType"  value="100433" id="mentalType" /> 대면
					<input type="checkbox" class="mentalType" name="mentalType"  value="100434"  /> 전화
					<input type="checkbox" class="mentalType" name="mentalType"  value="100435"  /> 게시판
					<input type="checkbox" class="mentalType" name="mentalType"  value="100436"  /> 파견
					<input type="checkbox" class="mentalType" name="mentalType"  value="100437"  /> 집단
					<input type="checkbox" class="mentalType" name="mentalType"  value="100438"  /> 강의
				</td>
			</tr>
			
			<tr  class="searchDetail" style="display: none;" >
			<th align="center" rowspan="3">심리검사</th>
				<th align="center">상담대상</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100447" id="diagnosisAges" /> 유아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100448"  /> 아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100449"  /> 청소년
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100450"  /> 성인
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100451"  /> 노년기 성인
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				<th align="center">상담방법</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100433" id="diagnosisType" /> 대면
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100434"  /> 전화
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100435"  /> 게시판
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100436"  /> 파견
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100437"  /> 집단
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100438"  /> 강의
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				<th align="center">상담분야</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100016" id="diagnosisDiv" /> 종합심리검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100017"  /> 정서 및 성격검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100018"  /> 진로 및 적성검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100019"  /> 신경심리검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100020"  /> 기타 
				</td>
			</tr>
			
			<!-- <tr  class="searchDetail"  style="display: none;" >
				<th align="center">법률</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100012" id="lawDiv" /> 일반법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100013"  /> 부동산법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100014"  /> 세무
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				<th align="center">재무</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="financeDiv" name="financeDiv"  value="100015" id="financeDiv" /> 재무상담
				</td>
			</tr> -->
			
			<!-- <tr  class="searchDetail"  style="display: none;" >
				<th align="center">법률</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="lawType" name="lawType"  value="100433" id="lawType" /> 대면
					<input type="checkbox" class="lawType" name="lawType"  value="100434"  /> 전화
					<input type="checkbox" class="lawType" name="lawType"  value="100435"  /> 게시판
					<input type="checkbox" class="lawType" name="lawType"  value="100436"  /> 파견
					<input type="checkbox" class="lawType" name="lawType"  value="100437"  /> 집단
					<input type="checkbox" class="lawType" name="lawType"  value="100438"  /> 강의
				</td>
			</tr>
			<tr  class="searchDetail"  style="display: none;" >
				<th align="center">재무</th>
				<td align="left" colspan="5">
					<input type="checkbox" class="financeType" name="financeType"  value="100433" id="financeType" /> 대면
					<input type="checkbox" class="financeType" name="financeType"  value="100434"  /> 전화
					<input type="checkbox" class="financeType" name="financeType"  value="100435"  /> 게시판
					<input type="checkbox" class="financeType" name="financeType"  value="100436"  /> 파견
					<input type="checkbox" class="financeType" name="financeType"  value="100437"  /> 집단
					<input type="checkbox" class="financeType" name="financeType"  value="100438"  /> 강의
				</td>
			</tr> -->
			<tr class="searchDetail" style="display: none;">
				<th align="center" rowspan="2">Capability</th>
				<th align="center">외국어 상담</td>
				<td colspan="5">		
					<input type="checkbox" class="languageType" name="languageType" value="101075" /> 영어
					<input type="checkbox" class="languageType" name="languageType" value="101076" /> 중국어
					<input type="checkbox" class="languageType" name="languageType" value="101077" /> 일본어
					<input type="checkbox" class="languageType" name="languageType" value="101078" /> 스페인어
					<input type="checkbox" class="languageType" name="languageType" value="101079" /> 프랑스어
					<input type="checkbox" class="languageType" name="languageType" value="101080" /> 기타
				</td>
			</tr>
			
			<tr class="searchDetail" style="display: none;">
				<th align="center">특수주제</th>
				<td colspan="5">
					<input type="checkbox" class="specialType" name="specialType"  value="101082"  /> 성피해상담
					<input type="checkbox" class="specialType" name="specialType"  value="101083"  /> 커리어상담
					<input type="checkbox" class="specialType" name="specialType"  value="101084"  /> 심리코칭
					<input type="checkbox" class="specialType" name="specialType"  value="101085"  /> 트라우마치료
					<input type="checkbox" class="specialType" name="specialType"  value="101086"  /> 애도상담
					<input type="checkbox" class="specialType" name="specialType"  value="101087"  /> 자살위기상담 <br />
					<input type="checkbox" class="specialType" name="specialType"  value="101088"  /> 직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)
					<input type="checkbox" class="specialType" name="specialType"  value="101089"  /> 내마음보고서 해석상담
					<input type="checkbox" class="specialType" name="specialType"  value="101090"  /> 수면상담(CBTI)
					<input type="checkbox" class="specialType" name="specialType"  value="101091"  /> 심리적응급처치(위기개입)
				</td>
			</tr>

			
		</table>
	</td>
</tr>


<tr><td height="20px"></td></tr>

<tr>
	<td align="center">
		<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검색"/>
	</td>
</tr>

<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건 |
								</strong>
								<span style="margin-left: 5px;"></span>
								<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
							</td>
							<td align="right">
								<span class="button" style="display: none;"><a id="mgrStatus1"  href="#">대기 -> 반려</a></span>
								<span class="button" style="display: none;"><a id="mgrStatus2"  href="#">승인 -> 대기</a></span>
								<span class="button" style="display: none;"><a id="mgrStatus3"  href="#">대기 -> 승인</a></span>
								<span class="button" style="display: none;"><a id="mgrStatus5"  href="#">대기 -> 중지</a></span>
								<span class="button" style="display: none;"><a id="mgrStatus6"  href="#">중지 -> 대기</a></span>
								<span class="button" style="display: none;"><a id="mgrStatus7"  href="#">반려 -> 대기</a></span>
	 							<span class="button"><a id="mgrStatus4"  href="#">별 등급관리</a></span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" style="text-align:center; border-collapse:collapse;width: 100%;">
						<thead>
							<tr>
								<th width="" rowspan="2" style="width: 20px !important;">선택</th>
								<th width="" rowspan="2" style="width: 20px !important;">순번</th>
								<th width="" rowspan="2" style="width: 150px !important;">센터명</th>
								<th width="" rowspan="2" style="width: 50px !important;">상담사명</th>
								<th width="" rowspan="2" style="width: 30px !important;">나이</th>
								<th width="" rowspan="2" style="width: 30px !important;">성별</th>
								<th width="" rowspan="2" style="width: 100px !important;">전화번호</th>
								
								<th width="" rowspan="2" style="width: 150px !important;">지역구분</th>
								<!-- <th width="" rowspan="2" style="width: 150px !important;">센터주소</th> -->
								<th width="" rowspan="2" style="width: 50px !important;">접속권한</th>
								<!-- <th width="" rowspan="2" style="width: 50px !important;">근무형태</th> -->
								<th width="" rowspan="2" style="width: 50px !important;">상담유형</th>
								<!-- <th width="" colspan="2">상담대상</th> -->
								<th width="" rowspan="2" style="width: 100px !important;">상담분야</th>
								<th width="" rowspan="2" style="width: 100px !important;">상담방법</th>
								<th width="" rowspan="2" style="width: 50px !important;">상태값</th>
								<th width="" rowspan="2" style="width: 60px !important;">최초등록일</th>
								<th width="" rowspan="2" style="width: 60px !important;">정보변경일</th>
							</tr>
<!-- 							<tr>

								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">심리검사</th>
								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">법률</th>
								<th style="width: 100px !important;">재무</th>
								<th style="width: 100px !important;">심리검사</th>
								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">법률</th>
								<th style="width: 100px !important;">재무</th>
								<th style="width: 100px !important;">심리검사</th>
							</tr> -->
						</thead>
						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td>
									<input type="checkbox" class="check" name="check" value="${list.userId}" />	
									<input type="hidden" class="mgrStatusTemp" name="mgrStatusTemp" value="${list.mgrStatus}" />	
								</td>
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#" class="centerDetail" value="${list.centerSeq}"><strong>${list.centerNm}</strong></a></td>
								<td><a href="#" class="counselorListDetail" value="${list.userId}"><strong>${list.userNm}</strong></a></td>
								<td>${list.rrn}</td>
								<td>${list.gender}</td>
								<td>${list.mobile}</td>
								
								<td>
									<comm:commNmOut code="${list.area1 }"  option="commCd"/> 
									<c:choose>
										<c:when test="${list.area2 eq null}"></c:when>
										<c:otherwise> / <comm:commNmOut code="${list.area2 }"  option="commCd"/></c:otherwise>
									</c:choose>
								</td>
								<%-- <td>${list.addr1 }${list.addr2 }</td> --%>
								<td>${list.authCd }</td>
								<%-- <td>${list.workType}</td> --%>
								<c:if test="${list.channelType}"></c:if>
								<%-- <td>
									<c:if test="${not empty list.channelType}">
										<comm:commNmOut code="${list.channelType}"  option="category"/>
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.mentalAges}">
										<comm:commNmOut code="${list.mentalAges}"  option="commCd"/>
									</c:if>
								</td> --%>
								<td>
									<c:if test="${not empty list.diagnosisAges}">
										<comm:commNmOut code="${list.diagnosisAges}"  option="commCd"/>
									</c:if>
								</td>
								<%-- <td>
									<c:if test="${not empty list.mentalDiv}">
										<comm:commNmOut code="${list.mentalDiv}"  option="category"/>
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.lawDiv}">
										<comm:commNmOut code="${list.lawDiv}"  option="category"/>
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.financeDiv}">
										<comm:commNmOut code="${list.financeDiv}"  option="category"/>
									</c:if>
								</td> --%>
								<td>
									<c:if test="${not empty list.diagnosisDiv}">
										<comm:commNmOut code="${list.diagnosisDiv}"  option="category"/>
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.mentalType}">
										<comm:commNmOut code="${list.mentalType}"  option="commCd"/>
									</c:if>
								</td>
								<%-- <td>
									<c:if test="${not empty list.lawType}">
										<comm:commNmOut code="${list.lawType}"  option="commCd"/>
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.financeType}">
										<comm:commNmOut code="${list.financeType}"  option="commCd"/>
									</c:if>
								</td> 
								<td>
									<c:if test="${not empty list.diagnosisType}">
										<comm:commNmOut code="${list.diagnosisType}"  option="commCd"/>
									</c:if>
								</td> --%>
								<td>
									<select class="mgrStatusVal" name="" style="height: 20px;text-align: center;" >
						    				<option value="">---- 선택 ----</option>
						    				<option value="Y" <c:if test="${list.mgrStatus eq '승인' }"> selected </c:if> >승인</option>
							    			<option value="N" <c:if test="${list.mgrStatus eq '중지' }"> selected </c:if> >중지</option>
							    			<option value="S" <c:if test="${list.mgrStatus eq '대기' }"> selected </c:if> >대기</option>
							    			<option value="R" <c:if test="${list.mgrStatus eq '반려' }"> selected </c:if> >반려</option>
						    		</select>
								</td>
								<td>${list.regDt}</td>
								<td>${list.modiDt}</td>
							</tr>
 						</c:forEach> 
						</tbody>
					</table>
					<br />
					
 					<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
						<tr>
							<td align="center">
  								<ui:paging value="${paging}" 
  									btnFirst="${url:img('/images/btn_first.jpg')}"
  									btnPrev="${url:img('/images/btn_prev.jpg')}"
  									btnNext="${url:img('/images/btn_next.jpg')}"
  									btnLast="${url:img('/images/btn_last.jpg')}" />  
							</td>
						</tr>
					</table> 
				</td>
			</tr>
		
</tr>
</table>
<div id="sendChangeRDiv" style="display: none;" >
	<div class="terms_wrap" style="width: 800px; height: 200px; overflow-y: hidden;">
		<textarea rows="4" cols="10"
			id="changeReason" name="changeReason"
			style="width:750px;height:100px;border:1px solid #ccc;
			padding:14px 19px 13px;color:#797979;font-size:13px;vertical-align:middle;"></textarea>
		<input type="hidden" id="tempUserId" name="tempUserId" value=""/>
		<button type="button" class="btn_login" onclick="sendChangeR(); return false;"
			style="position:absolute; top:215px; right:370px; width:100px; height:45px; 
			background:#3eb3c7; color:#fff; font-size:18px;">전송</button>
	</div>
</div>
</form>
</body>
</html>

