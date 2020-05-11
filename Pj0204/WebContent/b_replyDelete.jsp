<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Renum = Integer.parseInt(request.getParameter("r_num"));
	Qnum = Integer.parseInt(request.getParameter("num"));
	msg="delete from breply where r_num="+Renum;
	ST=CN.createStatement();
	ST.executeUpdate(msg);
	response.sendRedirect("bDetail.jsp?num="+Qnum);
%>

</body>
</html>