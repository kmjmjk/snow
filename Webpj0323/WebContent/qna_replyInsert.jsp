<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"></script>
</head>
<body>
<%
	int Anum = Integer.parseInt(request.getParameter("anum"));
	String Atitle = request.getParameter("atitle");
	String Acontent = request.getParameter("acontent");
	
	msg = "insert into a_board values(?,'admin','shop kim',?,?,sysdate,0)";
	System.out.println(msg);
	PST = CN.prepareStatement(msg);
	PST.setInt(1, Anum);
	PST.setString(2, Atitle);
	PST.setString(3, Acontent);
	PST.executeUpdate();		
	
	response.sendRedirect("qnalist.do");
%>

	
</body>
</html>