<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestListCopy</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:black; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
guestList.jsp<br>
  <%   
	 msg=" select count(*) as cnt from guest ";  //count세는거를 as cnt로 cnt라는 가짜변수를 만들어 저장하겠다
	 ST=CN.createStatement();
	 RS=ST.executeQuery(msg);
	 while(RS.next()==true){
		 Gtotal = RS.getInt("cnt");   //RS.next=Gtotal
	 }
   %>
	 
	<table width=700 border=1 cellspacing=0 cellpadding=5>
	  <tr align="right">
	    <td colspan="6"> 레코드갯수:<%= Gtotal %></td>
	  </tr>
	  <tr bgcolor="pink">
	    <td>행번호</td><td>사  번</td><td>이  름</td><td>제  목</td><td>날  짜</td><td>조회수</td>
	  </tr>
	  
	  <%
	  ST=CN.createStatement();
	  msg="select rownum, g.* from guest g";  //select rownum, sabun, name, title, wdate, pay, hit from guest; 로 써도 된다
	  RS=ST.executeQuery(msg);
	  while(RS.next()==true){
		  Gsabun = RS.getInt("sabun");
		  Gtitle = RS.getString("title");
	  %>
	<tr>
	  <td><%= RS.getInt("rownum") %></td>
	  <td><%= RS.getInt("sabun") %></td>
	  <td><%= RS.getString("name") %></td>
	  <td><a href="guestDetail.jsp?idx=<%= Gsabun %>"><%= Gtitle %></a></td>  <!-- idx는 값을 이동해주는 역할이라고 볼 수 있다 title에 해당하는 sabun의 값을 선택 '?'는 구분해주는 확장자 (여러 카테고리 구분) -->
	  <td><%= RS.getDate("wdate") %></td>
	  <td><%= RS.getInt("hit") %></td>
	</tr>
	  <%
	    }  //while문 end
	  %>	  
	  <tr align="center">
	    <td colspan="6">
	    <a href="index.jsp">[Index]</a>
	    <a href="guestWrite.jsp">[신규등록]</a>
	    <a href="guestList.jsp">[전체출력]</a>
	    </td>
	  </tr>
	</table>
</body>
</html>