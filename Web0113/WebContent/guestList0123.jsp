<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.tis.guest.GuestSQL" %>
<%@ page import="net.tis.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList0123.jsp] </title>
	<style type="text/css">
	  *{ font-size: 18pt; font-weight: bold; }
	  a{ font-size: 18pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 20pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
<%

 
%>
 <table width=900 border=1 cellspacing=0>
 	<tr bgcolor="green">
 	 <td>행번호</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>
	 
	 <%
	 GuestSQL sql = new GuestSQL();
	 ArrayList<GuestDTO> my = sql.guestSelect();  //guestSelect는 GuestSQL에 만들어 놓았다
	 for(int i=0; i<my.size(); i++){
		 GuestDTO dto = my.get(i);	 
	 %>
 	<tr>   
 		<td> <%= dto.getRn() %> </td>
 		<td> <%= dto.getSabun() %> </td>
 		<td> <%= dto.getName() %>  </td>
 		<td> <%= dto.getTitle() %>   </td>
 		<td> <%= dto.getWdate() %>  </td>
 		<td> <%= dto.getHit() %>  </td>
 	</tr>
 	<% } %>	 
  </table>
   
</body>
</html>











