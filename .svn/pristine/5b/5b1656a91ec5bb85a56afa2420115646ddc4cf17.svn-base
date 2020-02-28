<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>설문항목 그룹</title>
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
	
	$(document).ready(function(){
		GROUP.init();
	});
	
	var GROUP = {
		init : function() {
			
		},
		openForm : function() {
			$.divPop('groupEditForm', "그룹 설정", $("#groupForm"));
		},
		newForm : function() {
			
			// 초기화 
			$("#tmpltSeq").val("");
			
			GROUP.openForm();
		},
		editForm : function(tmpltSeq, tmpltNm, contents, useYn, grpSeq, grpNm) {
			GROUP.openForm();
			
			// contents 내부에 inner html 문자가 섞여있어 escape
			var regex = /<br\s*[\/]?>/gi;
			contents = contents.replace(regex, '\n');
			
			// data setting
			$("input[name=tmpltSeq]").val(tmpltSeq)
			$("input[name=tmpltNm]").val(tmpltNm)
			$("textarea[name=contents]").val(contents)
			$("select[name=useYn] option[value="+useYn+"]").prop("selected", true);
			
			
			var grpArr = grpSeq.split(",");
			
			$("#grpSeqs select").each(function(i) {
				$(this).find("option[value="+grpArr[i]+"]").prop("selected", true);
			});
		},
		save : function() {
			
			// vaild begin --
			if($("input[name=tmpltNm]").val() == "") {
				alert("그룹명을 입력해주세요.");
				$("input[name=tmpltNm]").focus();
				
				return false;
			}
			if($("textarea[name=contents]").val() == "") {
				alert("그룹내용을 입력해주세요.");
				$("textarea[name=contents]").focus();
				
				return false;
			}
			if($("select[name=useYn]").val() == "") {
				alert("사용여부를 선택해주세요.");
				$("select[name=useYn]").focus();
				
				return false;
			}
			
			var grpSeqs = [];
			var isDuplication = false;
			
			$("#grpSeqs select").each(function() {
				for(var i = 0; i < grpSeqs.length; i++) {
					if(grpSeqs[i] == $(this).val()) {
						isDuplication = true;
						
						return false;
					} 
				}
				
				grpSeqs.push($(this).val());
				
				// arr name
				$(this).attr("name", "fields["+i+"].grpSeq");
			});
			
			if(isDuplication) {
				alert("같은 설문항목을 사용할 수 없습니다.");
				
				return false;
			}
			// vaild end --
			
			// submit
			$("#tmpltForm").attr("action", "/madm/clientPoll/pollGroup/save");
			$("#tmpltForm").attr("method", "post");
			$("#tmpltForm").submit();
		},
		goCommPollList : function() {
			location.href = "/madm/clientPoll/commPollList";
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
			<td align="left" class="subtitle">설문항목 그룹 설정</td>
		</tr>
		<tr>
			<td height="10px">
				<input type="button" onclick="GROUP.goCommPollList();" value="진단 목록" style="margin-bottom: 8px; float: right" />
				<input type="button" onclick="GROUP.newForm();" value="신규 그룹 추가" style="margin-bottom: 8px; float: right; margin-right: 3px;" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<thead>
						<tr>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 10%;">순번</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 25%;">그룹명</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 30%;">내용</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 20%;">연결된 진단 항목</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 5%;">사용여부</th>
							<th class="line" align="center" bgcolor="#F5F5F5" style="width: 10%;">기능</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="bean">
							<tr>
								<td align="center">${bean.tmpltSeq }</td>
								<td align="center">${bean.tmpltNm }</td>
								<td align="center">${bean.contents }</td>
								<td align="center">
									1단계 - ${fn:split(bean.grpNm, ',')[0] }<br/>
									2단계 - ${fn:split(bean.grpNm, ',')[1] }<br/>
									3단계 - ${fn:split(bean.grpNm, ',')[2] }<br/>
									4단계 - ${fn:split(bean.grpNm, ',')[3] }<br/>
								</td>
								<td align="center">${bean.useYn }</td>
								<td align="center">
									<input type="button" onclick="GROUP.editForm('${bean.tmpltSeq }', '${bean.tmpltNm }', '${bean.contents }', '${bean.useYn }', '${bean.grpSeq }', '${bean.grpNm }');" value="수정" />&nbsp;
								</td>
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
	
	<div id="groupForm" style="display: none">
	<form id="tmpltForm">
	<input type="hidden" id="tmpltSeq" name="tmpltSeq" />
   	<table cellpadding="0" cellspacing="0" border="0" width="650px">
   		<tr>
   			<td align="center">
   				<table border="1" style="width:100%">
   					<tbody>
   						<tr>
	   						<th align="center" bgcolor="#F5F5F5">그룹 명</th>
	   						<td>
	   							<input type="text" name="tmpltNm" style="width: 100%" />
	   						</td>
   						</tr>
   						<tr>
	   						<th align="center" bgcolor="#F5F5F5">그룹 내용</th>
	   						<td>
	   							<textarea rows="4" name="contents" style="width: 96%"></textarea>
	   						</td>
   						</tr>
   						<tr>
	   						<th align="center" bgcolor="#F5F5F5">사용 여부</th>
	   						<td>
	   							<select name="useYn">
	   								<option value="Y">사용</option>
	   								<option value="N">미사용</option>
	   							</select>
	   						</td>
   						</tr>
   						<tr>
	   						<th align="center" bgcolor="#F5F5F5">진단 항목</th>
	   						<td id="grpSeqs">
	   							1단계 - 
	   							<select style="width: 70%">
	   								<c:forEach items="${grpList }" var="grp">
	   									<option value="${grp.grpSeq }">${grp.grpNm }</option>
	   								</c:forEach>
	   							</select><br/> 
	   							2단계 - 
	   							<select style="width: 70%">
	   								<c:forEach items="${grpList }" var="grp">
	   									<option value="${grp.grpSeq }">${grp.grpNm }</option>
	   								</c:forEach>
	   							</select><br/> 
	   							3단계 - 
	   							<select style="width: 70%">
	   								<c:forEach items="${grpList }" var="grp">
	   									<option value="${grp.grpSeq }">${grp.grpNm }</option>
	   								</c:forEach>
	   							</select><br/> 
	   							4단계 - 
	   							<select style="width: 70%">
	   								<c:forEach items="${grpList }" var="grp">
	   									<option value="${grp.grpSeq }">${grp.grpNm }</option>
	   								</c:forEach>
	   							</select><br/> 
	   						</td>
   						</tr>
   					</tbody>
   				</table>
   			</td>
   		</tr>
   		<tr>
   			<td height="20px"></td>
   		</tr>
   		<tr>
   			<td align="center">
   				<table cellpadding="0" cellspacing="0" border="0">
   					<tr>
   						<td id="btn01">
   							<a href="#none" onclick="GROUP.save()" style="color: #111111;background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg);">
   								<span style="background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg) right 0;">저 장</span>
   							</a>
   						</td>
   						<td width="40px"></td>
   						<td id="btn01">
   							<a class="btClose" href="#"style="color: #111111;background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg);">
   								<span style="background: url(//img.ezwelmind.co.kr//admin/common/btn01_2.jpg) right 0;">취 소</span>
   							</a>
   						</td>
   					</tr>
   				</table>
   			</td>
   		</tr>
   	</table>
   	</form>
   </div>
</body>
</html>