<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bwrite_save.jsp</title>

</head>
<body>
<%
	Gtitle = request.getParameter("title");
	Gname = request.getParameter("name");
	Gcontent = request.getParameter("content");

	msg="insert into blog values(blog_seq.nextval,'"+Gname+"','"+Gtitle+"','"+Gcontent+"',sysdate,0)";
	System.out.println(msg);
	
	ST = CN.createStatement();
	int ok = ST.executeUpdate(msg);
	response.sendRedirect("blist.jsp");
	
	%>
</body>
</html>