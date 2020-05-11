<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL317page</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
<form action="04_testlogin.jsp" method="get">
<label for="userid"> 아이디 : </label>
<input type="text" name="id" id="userid"><br>

<label for="usrepwd"> 암  &nbsp; 호 : </label>
<input type="password" name="pwd" id="userpwd"><br> 

<input type="submit" value="로그인">
</form>
</body>
</html>