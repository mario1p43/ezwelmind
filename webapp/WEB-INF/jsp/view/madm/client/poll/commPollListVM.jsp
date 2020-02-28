<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>진단 항목 목록</title>
<style type="text/css">
.upload_table {border-top:solid 2px #838383;width:100%;border-spacing:0;}
.upload_table th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
.upload_table th:first-child{border-left:none;}
.upload_table td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;}
.upload_table td:first-child{border-left:none;}
#sampleFile {cursor:pointer;color: rgb(0,0,255);width:300px;text-align:left;padding-top:20px;padding-bottom: 20px;font-size: 23px;font-weight: bold;font-style: italic;}
</style>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors1 = [];
	var oEditors2 = [];
	
	$(document).ready(function(){
		QST.init(); // init
	});
	
	var QST = {
		init : function() {
			
		},
		newForm : function() {
			location.href = "/madm/clientPoll/commPollAddForm";
		}
	};
</script>
</head>
<body>
	<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">진단 항목 목록</td>
		</tr>
		<tr>
			<td height="10px">
				<input type="button" onclick="QST.newForm();" value="신규 진단 항목 추가" style="margin-bottom: 8px; float: right" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<thead>
						<tr>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 10%;">순번</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 30%;">진단 명</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 20%;">문항 수</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 20%;">등록자</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 20%;">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="bean">
							<tr>
								<td align="center">${bean.grpSeq }</td>
								<td align="center"><a href="/madm/clientPoll/commPollModifyForm?grpSeq=${bean.grpSeq }">${bean.grpNm }</a></td>
								<td align="center">${bean.qstCnt }</td>
								<td align="center">${bean.regId }</td>
								<td align="center">${bean.regDt }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
	</table>
</body>
</html>