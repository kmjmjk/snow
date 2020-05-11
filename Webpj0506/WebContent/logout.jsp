<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login page</title>
	<meta charset="UTF-8">

</head>
<body>

<%
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="main.jsp";
</script>
</body>
</html>