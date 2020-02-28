<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>
<%!
public int nullIntconv(String inv)
{   
	int conv=0;
		
	try{
		conv=Integer.parseInt(inv);
	}
	catch(Exception e)
	{}
	return conv;
}
%>
<%
 int iYear=nullIntconv(request.getParameter("iYear"));
 int iMonth=nullIntconv(request.getParameter("iMonth"));

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth=ca.get(Calendar.MONTH);

 if(iYear==0)
 {
	  iYear=iTYear;
	  iMonth=iTMonth;
 }

 GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

 int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
 int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
 
 cal = new GregorianCalendar (iYear, iMonth, days); 
 int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
  
%>
<html>
<head>
<title>전체상담일정</title>
<script>
	$(document).ready(function(){
		
		
		$("#preMonth").click(function(){
			var year = <%=iYear %>;
			var month = <%=iMonth %>+1; 
			var ymd;
			var cYear;
			var cMonth;
			
			if(month == 1){
				month = 12;
				year = year - 1;
			}else{
				month = month - 1;
				year = year;
			}
				cYear = year;
				cMonth = month - 1;
			if(month < 10){
				ymd = year+"0"+month;
			}else{
				ymd = year+""+month;
			}
			location.href = "/partner/pCounselorMgr/totalSchedule?iYear="+cYear+"&amp;iMonth="+cMonth+"&amp;ymd="+ymd; 
			return false;
		});	
		
		
		$("#nextMonth").click(function(){
			var year = <%=iYear %>;
			var month = <%=iMonth %>+1; 
			var ymd;
			var cYear;
			var cMonth;
			
			if(month == 12){
				month = 1;
				year = year + 1;
			}else{
				month = month + 1;
				year = year;
			}
				cYear = year;
				cMonth = month-1;
			if(month < 10){
				ymd = year+"0"+month;
			}else{
				ymd = year+""+month;
			}
				location.href = "/partner/pCounselorMgr/totalSchedule?iYear="+cYear+"&amp;iMonth="+cMonth+"&amp;ymd="+ymd; 
				return false;
		});	
	
		
		$(".detail").click(function(){
			var counselCd = $(this).attr("value");
			location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+counselCd;
			return false;
		});
		
		
		$(".counselInfoPopup").click(function() {
			$(".rate").hide();
			$(this).parent().next().show();
		});
		
		
		$(".counselInfoClose").click(function() {
			$(this).parent(".rate").hide();
		});
		
		
	});
	
	
	function searchForm(){
		$("#frm").submit();
	}
</script>
</head>

<body>
<form id="frm" method="post" action="/partner/pCounselorMgr/totalSchedule">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	<td width="5%">
      		<input type="button" id="preMonth" value="&lt;" >
         </td>
        <td width="10%" align="left"><h3><%=iYear%>. <%=new SimpleDateFormat("MM").format(new Date(2008,iMonth,01))%></h3></td>
        <td>
        	<table width="100%">
        		<tr>
        			<td align="left" width="50px"><input type="button" id="nextMonth" value="&gt;"></td>
        			<c:if test="${centerOwnerYn eq 'Y' }">
        				<th align="left" width="90px">
	        				상담사 선택 : 
	        			</th>
	        			<td align="left">
	        				<select name="userId" onchange="searchForm();" style="width: 100px; height: 30px;">
	        					<option value=""> -- 전체 -- </option>
	        					<c:forEach var="list" items="${counselorList }">
	        						<option value="${list.userId }" <c:if test="${counselReservationDto.userId eq list.userId }"> selected </c:if> >${list.userNm }</option>
	        					</c:forEach>
	        				</select>
	        			</td>
        			</c:if>
        		</tr>
        	</table>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table align="center" border="1" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <th><font color="red">일요일</font></th>
          <th>월요일</th>
          <th>화요일</th>
          <th>수요일</th>
          <th>목요일</th>
          <th>금요일</th>
          <th><font color="skyblue">토요일</font></th>
        </tr>
        <%
        int cnt =1;
        for(int i=1;i<=iTotalweeks;i++)
        {
		%>
        <tr>
          <% 
	        for(int j=1;j<=7;j++)
	        {
		        if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
		        {
		         %>
                <td align="center" height="35">&nbsp;</td>
               <% 
		        }
		        else
		        {
		         %>
		         <td align="left" valign="top" width="10%" height="35" id="day_<%=(cnt-weekStartDay+1)%>">
		         <% if(j == 1){ %>
		         <font color="red">
		         <%}else if(j == 7){ %>
		         <font color="skyblue">
		         <%}else{ %>
		         <font>
		         <%}%>
		         
		         <span><%=(cnt-weekStartDay+1)%></span>
		         <c:set var="cDay" value="<%=(cnt-weekStartDay+1)%>"/>
		         <c:forEach  var="list" items="${totalScheduleList}"> 
		         	<c:if test="${list.ymd.substring(6) == cDay}">
		         		<c:if test="${(list.recordStatus eq 100692)}"><a href="#" class="detail" value="${list.counselCd}"><span style="text-decoration: underline;"> </c:if>
		         		<c:choose>
		         			<c:when test="${centerOwnerYn eq 'N' }">
       	               			<br><b><a href="javascript:void(0);" class="counselInfoPopup">${list.stTime }</a></b> | <comm:commNmOut code="${list.counselDiv }"  option="category"/> | ${list.clientCd } | ${list.counselNm }
       	               			<div class="rate" style="display:none;position:absolute;width:250px;background-color:#FAFAFA;border:1px solid #C1C1C1;padding:5px 0 5px 0;">
       	               				상담자 핸드폰:${list.mobile} &nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="counselInfoClose">[닫기]</a>
								</div>
       	               	 	</c:when>
       	               	 	<c:otherwise>
       	               	 		<br><b><a href="javascript:void(0);" class="counselInfoPopup">${list.stTime }</a></b> | <comm:commNmOut code="${list.counselDiv }"  option="category"/> | ${list.clientCd } | ${list.counselNm } <br> - ${list.counselorNm }(${list.counselorId })
       	               	 		<div class="rate" style="display:none;position:absolute;width:250px;background-color:#FAFAFA;border:1px solid #C1C1C1;padding:5px 0 5px 0;">
       	               	 			상담자 핸드폰:${list.mobile} &nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="counselInfoClose">[닫기]</a>
								</div> 
       	               	 	</c:otherwise>
       	                </c:choose>
		         		<c:if test="${(list.recordStatus eq 100692)}"></span></a> </c:if>
		         		<br>
    	            </c:if>
    	            
                </c:forEach>
                </font>
                </td>
               <% 
		        }
		        cnt++;
		      }
	        %>
        </tr>
        <% 
	    }
	    %>
      </tbody>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
