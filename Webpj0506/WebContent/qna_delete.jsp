<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_write</title>
<jsp:include page="admin_header.jsp"></jsp:include>
</head>
<body>
<br><br>

<%
	int Qnum = Integer.parseInt(request.getParameter("qnum"));
	System.out.println(Qnum);
	try{	
	msg="delete from q_board where qnum="+Qnum;
	ST=CN.createStatement();
	ST.executeUpdate(msg);		
	response.sendRedirect("qnalist.do");	

}catch(Exception e){}
%>	
</body>
</html>