
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="net.tis.guest.GuestSQL" %>
<%@ page import="net.tis.guest.GuestDTO" %>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList0130.jsp] </title>
	<style type="text/css">
	  *{ font-size: 18pt; font-weight: bold; }
	  a{ font-size: 18pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 20pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
<font color=blue>[guestList0130.jsp]</font><p>

 <table width=900 border=1 cellspacing=0>
 	<tr bgcolor="yellow">
 	 <td>rn</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>

<%
   GuestSQL sql = new GuestSQL();
   ArrayList<GuestDTO> my = sql.guestSelect();
   for(int i=0; i<my.size(); i++){
   	GuestDTO bean = my.get(i);
   	int Gsabun = bean.getSabun();
   	String Gtitle = bean.getTitle();
%>	 
 	<tr>   
 		<td> <%= bean.getRn() %> </td>
 		<td> <%= bean.getSabun() %> </td>
 		<td> <%= bean.getName() %>  </td>
 		<td> <a href="guestDetail0130.jsp?idx="><%= Gsabun %><%= Gtitle %></a></td>
 		<td> <%= bean.getWdate() %>  </td>
 		<td> <%= bean.getHit() %>  </td>
 	</tr>	 
	<% } %>
  </table>
   
  <p>
  <a href="index.jsp">[index]</a> 
  <a href="guestWrite.jsp">[신규등록]</a>
  <a href="guestList0130.jsp">[전체출력]</a>
</body>
</html>











