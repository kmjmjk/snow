<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project 1st</title>
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
<jsp:include page="b_header.jsp"></jsp:include>
	<%
	Qnum = Integer.parseInt(request.getParameter("num"));
	msg="select title, name, wdate, content from blog where num="+Qnum;
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
	if(RS.next()==true){
			Gname = RS.getString("name");
			Gwdate = RS.getDate("wdate");
			Gtitle = RS.getString("title");
			Gcontent = RS.getString("content");
		} 
	%>
	<br>
	<form name="myform" method="get" enctype="miltipart/form-data" action="./bEdit_save.jsp" style="text-align:center">
	<input type="hidden" name="num" value="<%= Qnum %>">
	제목 <input type="text" name="title" value="<%=Gtitle %>" style="width:400px;"><br>
	이름 <input type="text" name="name" value="<%= Gname %>" style="width:400px;"><br><br>
	<textarea name="content" style="width:440px; height:450px;"><%= Gcontent %></textarea><br><br>
	<input type="submit" value="수정">
	<input type="button" value="취소" onclick="location.href='bDetail.jsp?num=<%= Qnum %>'">
	
</form>
</body>
</html>