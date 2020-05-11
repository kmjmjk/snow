<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String strId1="apple";  //String msg="select count(*) as cnt from login where userid=? and pwd=? " ;
	String strId2="orange";
	String strId3="melon";
	/*세션 설정*/
	session.setAttribute("logId1", strId1);
	session.setAttribute("logId2", strId2);
	session.setAttribute("logId3", strId3);
%>
세션에 속성을 설정했습니다.<br>
<a href="viewSession1.jsp">viewSession1</a>
</body>
</html>