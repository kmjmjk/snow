<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[test01]</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold;}
		a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}
		a:hover{font-size:16pt; text-decoration:underline; color:green; front-family:Comic Sanc MS;}			
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
	세션 id <%= session.getId() %><br>
	세션 id <% out.println(" "+session.getId() ); %><br>
	
	<he color="red">
	<a href="first.jsp">[first]</a>
	<a href="guestwrite.jsp">[신규등록]</a>
	<a href="guestlist.jsp">[전체출력]</a>
	<a href="index.jsp">[index]</a>
	
		

</body>
</html>