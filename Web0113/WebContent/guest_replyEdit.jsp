<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guest_replyEdit]</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold;}
		a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}
		a:hover{font-size:16pt; text-decoration:underline; color:green; front-family:Comic Sanc MS;}			
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>

<% 

Rnum = Integer.parseInt(request.getParameter("num"));
Rwriter = request.getParameter("writer");
Rcontent = request.getParameter("content");
Rsabun = Integer.parseInt(request.getParameter("sabun"));

msg="update guestreply set writer=?, content=?  where num = ? ";
PST = CN.prepareStatement(msg);
		PST.setString(1, Rwriter);
		PST.setString(2, Rcontent);
		PST.setInt(3, Rnum);

        PST.executeUpdate(); //괄호안 매개인자없음
response.sendRedirect("guestDetail.jsp?idx="+Rsabun); //수정후 전체출력이동

%>	
</body>
</html>