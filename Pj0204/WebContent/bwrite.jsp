<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bwrite</title>
</head>
<body>

<jsp:include page="b_header.jsp">
	<jsp:param value="2" name="active" />
</jsp:include>
	<br>
	<%
		String userid = (String) session.getAttribute("id");
		if (userid != null) {
	%>
	<div class="card" style="margin: auto; width:580px; height:650px; background-color:#FAFAFA">
	<form method="post" enctype="multipart/form-data" name="myform" action="bwrite_save.jsp"
		style="text-align: center">
		<br>
		<input type="text" name="title" style="width: 520px; height:40px" placeholder="글제목"><br>
		<input type="hidden" name="name" style="width: 520px;" placeholder="닉네임" value=<%=userid %> readonly><br>
		<textarea name="content" style="width: 520px; height: 450px;"> </textarea>
		<br>
		
		<input type="submit" value="등록"> 
		<input type="reset" value="취소">
		<%
			}
			if (session.getAttribute("id") == null) {
		%>
		<script language=javascript>
			alert("로그인이 필요합니다");
			location.href = "blogin.jsp";
		</script>
		<%
			}
		%>
		
	</form>
	</div>
</body>
</html>