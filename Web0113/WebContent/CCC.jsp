<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CCC.jsp </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
	<%!    //전역변수 넘어가는것들은 %뒤에 !를 해주는게 좋다
	  //CCC.jsp문서
	  int mysabun=7789;
	  String mytitle="monday";
	%>
	
	<img src="images/bar.gif"> <br>
	<img src="images/bar.gif"> <br>
	<img src="images/bar.gif"> <br>
	<p>
	<table width=600 border=1  cellspacing=0>
		<tr bgcolor="pink">
			<td>닉네임</td>
			<td>연락처</td>
			<td>과정명</td>
		</tr>
		<tr>
			<td>sky</td>
			<td>010-****-7654</td>
			<td>자바스크립트</td>
		</tr>
		<tr>
			<td>blue</td>
			<td>010-****-2345</td>
			<td>mvc2서블릿</td>
		</tr>
		<tr>
			<td>green</td>
			<td>010-****-1234</td>
			<td>웹서버페이지</td>
		</tr>
	</table>
	
 <jsp:include page="DDD.jsp">
   <jsp:param value="<%= mysabun %>" name="Psabun"/>
   <jsp:param value="<%= mytitle %>" name="Ptitle"/>
 </jsp:include>
</body>
</html>

