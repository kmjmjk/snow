<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	Enumeration ob=session.getAttributeNames();
	while(ob.hasMoreElements()){
		String name=(String)ob.nextElement();              
		String value=(String)session.getAttribute(name);   
%>		
		세션 이름: <%=name%><br>
		세션 값: <%=value%><br>
		세션 id: <%=session.getId()%><br><br>
<%		
	}
%>
</body>
</html>