<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.tis.guest.GuestSQL" %>
<%@ page import="net.tis.guest.GuestDTO" %>

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
 
 <%
   GuestSQL sql = new GuestSQL();
   Gtotal = sql.guestGtotal(); 
 %>
 <tr bgcolor="#ff8c6b">
   <td colspan="6" align="right">
      데이터 수: <%= Gtotal %> &nbsp;
   </td> 
 </tr>
 	<tr bgcolor="#ff8c6b">
 	 <td>rn</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>

<%
  //GuestSQL sql = new GuestSQL();
  ArrayList<GuestDTO> list = sql.guestSelect();  //배열을 사용하지 않는 이유는 배열은 한가지의 타입만 받을 수 있으니까
  System.out.println(list.size());
  for(int i=0; i<list.size(); i++){  
	  GuestDTO dto = list.get(i);
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
   
  <p>
  <a href="index.jsp">[index]</a> 
  <a href="guestWrite.jsp">[신규등록]</a>
  <a href="guestList0130.jsp">[전체출력]</a>
</body>
</html>











