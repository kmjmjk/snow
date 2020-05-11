<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>[test4_Save.jsp]</title>
<style type="text/css">
* {
	font-size: 16pt;
	font-weight: bold;
	font-family: Comic Sans MS;
	margin-left: 10px;
}

a {
	font-size: 16pt;
	text-decoration: none;
	font-weight: bold;
	color: blue;
	font-family: Comic Sans MS;
}

a:hover {
	font-size: 20pt;
	text-decoration: underline;
	color: green;
	font-family: Comic Sans MS;
}
</style>
</head>
<body>
	test4_Save.jsp 단독실행금지
	<p>
		<%
			//좋아하는 동물 
			String[] animal = request.getParameterValues("hobby");
			for (String temp : animal) {
		%>
		<img src="images/<%= temp %>.png" width="150" height="150">
		<%
			}
		%>
	
	<hr>
	<a href="test3_Form.jsp">[test3_Form]</a>
	<a href="test4_Form.jsp">[test4_Form]</a>
	<a href="guestWrite.jsp">[guestWrite]</a>
</body>
</html>




