<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello</title>
	
</head>
<body>
<%
	String data=request.getParameter("title");
	if(data=="hb"||data.equals("hb")){
%>
 <font size=6 color=blue>
 <b><%= data %> 로그인 성공</b>
 </font><br>
 <img src="images/bt_login.gif" width=250 height=50>
 
 <%
	}else{response.sendRedirect("index.jsp");}
 %>
</body>
</html>