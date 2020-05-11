<%@ page language="java" contentType="text/html; charset=UTF-8" %>    
<%@ page import="net.tis.guest.GuestSQL" %>  
<%@ page import="net.tis.guest.GuestBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	*{font-size:12pt; font-weight:bold;}
	a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}
	a:hover{font-size:16pt; text-decoration:underline; color:green; front-family:Comic Sanc MS;}				
</style>
</head>
<body>
 <%!
   GuestSQL sql = new GuestSQL();   //자동으로 CN=DB.getConnection이 호출된다
   GuestBean bean = new GuestBean();
  
 %>
</body>
</html>