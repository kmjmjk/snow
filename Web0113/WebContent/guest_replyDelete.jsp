<%@page import="net.tis.guest.GuestSQL"%>
<%@page import="com.sun.glass.ui.CommonDialogs.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
	<!-- <style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:black; front-family:Comic Sanc MS;}
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}	
	</style> -->

	<script type="text/javascript">
	</script>
</head>
<body>

<div align="center">
  <img src="images/failed0.png" width=350 height=350><p>
</div>


<% 
 Rnum = Integer.parseInt(request.getParameter("Gnum"));
 String Rdata = request.getParameter("Gidx") ;
 GuestSQL sql = new GuestSQL();
 
  try{
   msg="delete from guestreply where num="+Rnum;
   ST=CN.createStatement();
   int ok=ST.executeUpdate(msg);
   if(ok>0){
%>
	<script type="text/javascript">
	alert("데이터 삭제 성공");
	location.href="guestDetail.jsp?idx=<%= Rdata %>";    
	</script>	
<% }else{ %>
  <script type="text/javascript">
  alert("데이터 삭제 실패");
  history.back();  //이전 화면으로 (문서로) 이동
  </script>
<% }
  }catch(Exception e){response.sendRedirect("index.jsp");}  //try-catch를 써서 오류가 발생했을때 초기화면으로 넘어가게만들어줬다
  %>  		   

<div align="center">
  [guest_replyDelete.jsp]<p>
  <img src=images/bc.gif width=180 height=250>
</div>
</body>
</html>