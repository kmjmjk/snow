<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_edit
</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<jsp:include page="admin_header.jsp"></jsp:include>
</head>
<body>
<br><br><br>
<%
		Dnum = Integer.parseInt(request.getParameter("nnum"));
	        
		String msg = "select * from s_notice where nnum=" + Dnum;
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		while (RS.next() == true) {
			String Ntitle = RS.getString("ntitle");
			String Ncontent = RS.getString("ncontent"); 
			
	%>

<div class="card" style="margin: auto; width:580px; height:650px; background-color:	#EEEEEE">
	<form method="post" enctype="multipart/form-data"  name="myform" action="noticeEdit.do"
		style="text-align: center">
		<br>
		<input type="hidden" name="nnum" value="<%= Dnum %>">
		<input type="text" name="ntitle" style="width: 520px; height:40px" value="<%= Ntitle %>"><br>
		<br>
		<textarea name="ncontent" style="width: 520px; height: 450px" ><%= Ncontent %></textarea>
		<br>
		<p></p>	
		이미지 첨부 <input type="file" id="file" name="nfile">
		<p></p>
		<input type="submit" value="등록"> 
		<input type="reset" value="취소">
		
</form>
<% } %>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>