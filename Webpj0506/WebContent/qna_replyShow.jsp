<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<% int Qnum = Integer.parseInt(request.getParameter("qnum"));%>
<%
	String msg = "select * from a_board where anum = "+Qnum	;

	System.out.println(msg);
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	while(RS.next()==true) {
		
		Aid = RS.getString("aid");
		Aname = RS.getString("aname");
		Atitle = RS.getString("atitle");
		Acontent = RS.getString("acontent");
		Adate = RS.getDate("adate");
		Ahit = RS.getInt("ahit");		
	

%>
				<td style="text-align: center"></td>
				<td style="text-align: left"><a href="qna_replyDetail.jsp?anum=<%= Qnum %>">Re : <%= Atitle %></a></td>
				<td style="text-align: center"><%= Aname %></td>
				<td style="text-align: center"><%= Adate %></td>
				<td style="text-align: center"><%= Ahit %></td>
<% } %>
</body>
</html>