<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.Enumeration"%>

<%
	String user_id = (session.getAttribute("USERID") == null) ? "" : (String) session.getAttribute("USERID");
	String user_name = (session.getAttribute("USERNAME") == null) ? "" : (String) session.getAttribute("USERNAME");
	
	String ip = request.getHeader("X-Forwarded-For");
	 
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("Proxy-Client-IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("WL-Proxy-Client-IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("HTTP_CLIENT_IP");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
    }
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
        ip = request.getRemoteAddr();
    }
    
    String headerNames = "";
    String headervalues = "";
    Enumeration tmpEnum = request.getHeaderNames();
	while (tmpEnum.hasMoreElements()) {
		String headerName = (String) tmpEnum.nextElement();
		String headerValue = request.getHeader(headerName);
		
		headerNames += " <br/> " + headerName;
		headervalues += " <br/> " + headerValue;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>헤더 목록 출력</title>
</head>
<body>
<h1>접속자 정보</h1>
<table border="1px;" style="width:100%;">
	<tr>
		<th style="width:40%;">구분</th>
		<th style="width:60%;">내용</th>
	</tr>
	<tr>
		<td>사용자 이름(로그인 정보 있을시)</td>
		<td><%=user_name%></td>
	</tr>
	<tr>
		<td>사용자 client ip</td>
		<td><%=ip%></td>
	</tr>
</table>

<h1>참고용</h1>
<table border="1px;" style="width:100%;">
	<tr>
		<th style="width:40%;">구분</th>
		<th style="width:60%;">내용</th>
	</tr>
	<tr>
		<td>Forwarded</td>
		<td><%=request.getHeader("Forwarded")%></td>
	</tr>
	<tr>
		<td>X-Forwarded-For</td>
		<td><%=request.getHeader("X-Forwarded-For")%></td>
	</tr>
	<tr>
		<td>x-forwarded-for</td>
		<td><%=request.getHeader("x-forwarded-for")%></td>
	</tr>
	<tr>
		<td>Proxy-Client-IP</td>
		<td><%=request.getHeader("Proxy-Client-IP")%></td>
	</tr>
	<tr>
		<td>WL-Proxy-Client-IP</td>
		<td><%=request.getHeader("WL-Proxy-Client-IP")%></td>
	</tr>
	<tr>
		<td>HTTP_CLIENT_IP</td>
		<td><%=request.getHeader("HTTP_CLIENT_IP")%></td>
	</tr>
	<tr>
		<td>HTTP_X_FORWARDED_FOR</td>
		<td><%=request.getHeader("HTTP_X_FORWARDED_FOR")%></td>
	</tr>
	<tr>
		<td>X-Real-IP</td>
		<td><%=request.getHeader("X-Real-IP")%></td>
	</tr>
	<tr>
		<td>X-RealIP</td>
		<td><%=request.getHeader("X-RealIP")%></td>
	</tr>
	<tr>
		<td>Client-IP</td>
		<td><%=request.getHeader("Client-IP")%></td>
	</tr>
	<tr>
		<td>getRemoteAddr</td>
		<td><%=request.getRemoteAddr()%></td>
	</tr>
	<tr>
		<td>HeaderNames</td>
		<td><%=headerNames%></td>
	</tr>
	<tr>
		<td>Headervalues</td>
		<td><%=headervalues%></td>
	</tr>
</table>

<h1>헤더 정보</h1>
<%
	Enumeration headerEnum = request.getHeaderNames();
	while (headerEnum.hasMoreElements()) {
		String headerName = (String) headerEnum.nextElement();
		String headerValue = request.getHeader(headerName);
%>
	<%=headerName%> | 
	<%=headerValue%><br />
<%
	}
%>
</body>
</html>