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
	Dnum = Integer.parseInt(request.getParameter("nnum"));
	System.out.println(Dnum);
	try{	
	msg="delete from s_notice where nnum="+Dnum;
	ST=CN.createStatement();
	ST.executeUpdate(msg);		
	response.sendRedirect("notice.do");	

}catch(Exception e){}
%>	
</body>
</html>