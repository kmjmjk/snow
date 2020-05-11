<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit_save</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		Qnum = Integer.parseInt(request.getParameter("num"));
		Gtitle = request.getParameter("title");
		Gname = request.getParameter("name");
		//Gwdate = RS.getDate("wdate");
		Gcontent = request.getParameter("content");

		msg = "update blog set title=?, name=?, content=? where num=" + Qnum;
		PST = CN.prepareStatement(msg);
		PST.setString(1, Gtitle);
		PST.setString(2, Gname);
		PST.setString(3, Gcontent);
		PST.executeUpdate();

		response.sendRedirect("blist.jsp");
	%>
</body>
</html>