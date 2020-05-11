<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DDD.jsp </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
	<%
	  //DDD.jsp문서는 단독실행금지 
	  String a=request.getParameter("Psabun");  //CCC.jsp에서 사번과 타이틀을 불러오기
	  String b=request.getParameter("Ptitle");
	  out.println("댓글 넘어온 사번은 "+a+"<br>");
	  out.println("댓글 넘어온 제목은 "+b+"<p>");	
	%>
	
	<img src="images/aaa.gif">  <img src="images/aaa.gif">
	<img src="images/aaa.gif">  <img src="images/aaa.gif">
	<img src="images/aaa.gif">  <img src="images/aaa.gif">
	<hr>
	<a href="CCC.jsp">[CCC.jsp]</a>
	<a href="index.jsp">[index.jsp]</a>
	<a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>

