<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold;}
		a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}			
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  guestWriteSave.jsp<p>
  <%
	Gsabun=Integer.parseInt(request.getParameter("sabun"));
	Gname=request.getParameter("name");
	Gtitle=request.getParameter("title");
	Gpay=Integer.parseInt(request.getParameter("pay"));
	
	//msg="insert into guest valuse(9900,'my','gugu',sysdate,71,0)";
	msg="insert into guest values("+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"+Gpay+",0)";
	out.println(msg);
	//System.out.println(msg);	
	
	out.println("넘어온 사번은 "+Gsabun+"<br>");
	out.println("넘어온 이름은 "+Gname+"<br>");
	out.println("넘어온 제목은 "+Gtitle+"<br>");
	out.println("넘어온 급여는 "+Gpay+"<br>");	
	
	ST=CN.createStatement();	
	int ok = ST.executeUpdate(msg);  //int ok는 삭제해도 상관은 없지만 delete에서 삭제한 값이 양수이면 저장 되는 문을 정확히 해주기 위해서 써준 것  
	response.sendRedirect("guestList.jsp");   //내장객체 response에 문서이동
  %>
  <p>
     <a href="index.jsp">[index]</a>
	 <a href="guestWrite.jsp">[신규등록]</a>
	 <a href="guestList.jsp">[전체출력]</a>  
</body>
</html>