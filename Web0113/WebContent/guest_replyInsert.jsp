<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest_replyInsert.jsp</title>  <!-- 댓글 입력 -->
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:14pt; text-decoration:none; color:black; front-family:Comic Sanc MS;}
		a:hover{font-size:16pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}	
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  <%
  
  Rwriter = request.getParameter("writer");
  Rcontent = request.getParameter("content");
  Rsabun = Integer.parseInt(request.getParameter("sabun"));

  
	String msg="insert into guestreply values (guestreply_seq.nextval, ?, ?, ?)";
	 PST=CN.prepareStatement(msg);
	   PST.setString(1, Rwriter);
	   PST.setString(2, Rcontent);
	   PST.setInt(3, Rsabun);
	   PST.executeUpdate();
	   
	   response.sendRedirect("guestDetail.jsp?idx="+Rsabun);
	  %>
	
	 <a href="guestDetail.jsp?idx="+<%=Gsabun%>"> <%=Gtitle%> </a> 
	 

  <img src="images/bar.gif"> <br>
  <img src="images/bar.gif"> <br>
  <img src="images/bar.gif"> <p>
  

</body>
</html>