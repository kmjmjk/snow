<%@page import="net.tis.guest.GuestSQL"%>
<%@page import="com.sun.glass.ui.CommonDialogs.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
  Object ob = session.getAttribute("naver");  //naver는 가짜로 전달되는것(매개체)
  System.out.println("로그인 userID 세션 ="+ob);
  if(ob==null || ob=="" ||ob.equals("")){
%>
	<script type="text/javascript">
	alert("로그인을 먼저 해주세오");
	location.href="index.jsp";   //login.jsp로 보내야하지만 페이지가 없어서 임시로 index로 보내놓음
	</script>  
<% 
     return;  //밑에있는 문장들은 처리하지 못하고 탈출(데이터 삭제가 되지 않는다)
   }

  GuestSQL sql = new GuestSQL();
  String data = request.getParameter("idx");
  try{
   int ok = sql.guestDelete(data);   //GuestSQL에 있는거 가져오기 / 새로 만들어준 부분 
   if (ok > 0){ //삭제 성공이면
%>		
	<script type="text/javascript">
	alert("데이터 삭제 성공");
	location.href="guestList.jsp";      //위치를 guestList로 바꿔주기
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
  [guestDelete.jsp]<p>
  <img src=images/bc.gif width=180 height=250>
</div>
</body>
</html>