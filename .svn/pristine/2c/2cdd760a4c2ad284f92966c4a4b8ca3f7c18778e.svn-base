<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URI"%>
<%@ page import="java.util.*,java.io.*,org.apache.commons.logging.*" contentType="text/html; charset=UTF-8"%><%
Log logger = LogFactory.getLog(this.getClass());
String savefile = request.getParameter("filepath");
String filename = request.getParameter("filename");
logger.debug(">>>>>>>>>>>>" + savefile);
logger.debug(">>>>>>>>>>>>" + filename);
out.println(">>>>>>>>>>>>" + savefile);
out.println(">>>>>>>>>>>>" + filename);
logger.info("filename : "+filename);
//filename = new String(filename.getBytes("8859_1"), "MS949");
logger.info("filename2 : "+filename);

//File file = new File(savefile);

URL url = new URL(savefile);
URLConnection connection = url.openConnection(); 
/* if(!file.exists()) {
	out.println("<script>");
	out.println("alert('요청한 파일을 찾을 수 없습니다.');");
	out.println("history.back();");
	out.println("</script>");
	return;
} */

InputStream input = null;
BufferedOutputStream output = null;
response.reset();
String strClient = request.getHeader("User-Agent");
if (strClient.indexOf("MSIE 5.5") != -1) {
	response.setHeader("Content-Disposition", "filename=" + filename + ";");
} else {
	response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes("euc-kr"), "ISO8859_1")  + ";");
	response.setHeader("Content-Type", "application/octet-stream; charset=MS949");
}
//response.setHeader("Content-Length", ""+ file.length());
response.setHeader("Content-Transfer-Encoding", "binary;");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");

try {
	input = connection.getInputStream();
	byte buffer[] = new byte[1024];
	int len = 0;
	out.clear();
	out.flush();
	output = new BufferedOutputStream(response.getOutputStream());
	while((len = input.read(buffer)) > 0 ){
	  output.write(buffer,0,len);
	}
} catch(Exception e) {
	e.printStackTrace();
} finally{
	response.flushBuffer();
	if(input !=null)try{input.close();}catch(Exception e){}
	if(output !=null)try{output.close();}catch(Exception e){}
}
%>