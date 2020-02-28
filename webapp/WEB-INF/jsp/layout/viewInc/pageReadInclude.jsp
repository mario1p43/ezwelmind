<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select id="pageSize" name="pageSize" style="width:80px; height:20px; font-size:11pt;" >
	<option value="10" <c:if test="${param.pageSize eq '10'}">selected</c:if>>10</option>
	<option value="20"  <c:if test="${param.pageSize eq '20'}">selected</c:if>>20</option>
	<option value="30"  <c:if test="${param.pageSize eq '30'}">selected</c:if>>30</option>
	<option value="50"  <c:if test="${param.pageSize eq '50'}">selected</c:if>>50</option>
	<option value="100"  <c:if test="${param.pageSize eq '100'}">selected</c:if>>100</option>
</select>