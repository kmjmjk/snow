<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> openIDSave.jsp </title>
	<style type="text/css">
	  *{ font-size: 12pt; font-weight: bold; }
	  a{ font-size: 12t; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 12pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
	<div align="center">
		<img src="images/bar.gif" > <p>
		<img src="images/bar.gif" > <p>
		<img src="images/bar.gif" > <p>
		<img src="images/bar.gif" > <p>
		<img src="images/bar.gif" > <p>
	</div>
	
    <!-- openIDSave.jsp 단독실행금지  -->
	<%
	  String data = request.getParameter("userID");
	  msg="select count(*) as cnt from guest where sabun = "+data; //사번조회갯수

	  ST = CN.createStatement(); 
	  RS = ST.executeQuery(msg); 
	  if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
	  if( Gtotal>0 ){
	 %>
	  <script type="text/javascript">
	    alert(<%= data %> +"  이미 등록된 데이터입니다");
	    location.href="openID.jsp"; 
	  </script>
	  	
	<% }else{ %>   	  
	  <script type="text/javascript">
	    alert(<%= data %> +"  사용가능한 데이터입니다");
	    opener.myform.sabun.value = <%= data %> ;
	    opener.myform.name.focus();
	  	self.close();
	  </script>		
	 <% } %>
</body>
</html>




