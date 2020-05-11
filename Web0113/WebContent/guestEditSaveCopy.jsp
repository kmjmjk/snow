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
  guestSave.jsp<p>
  <%
	Gsabun=Integer.parseInt(request.getParameter("sabun"));
	Gname=request.getParameter("name");
	Gtitle=request.getParameter("title");
	Gpay=Integer.parseInt(request.getParameter("pay"));
	
	//msg="insert into guest valuse(9900,'my','gugu',sysdate,71,0)";
	msg="update guest set name='"+Gname+"',title='"+Gtitle+"', wdate=sysdate, pay="+Gpay+" where sabun="+Gsabun;  //hit는 조회수 클릭시 자동으로 변경되는 값이니까 건드리면X
	out.println(msg);
	System.out.println(msg);	

	out.println("넘어온 수정사번은 "+Gsabun+"<br>");
	out.println("넘어온 수정이름은 "+Gname+"<br>");
	out.println("넘어온 수정제목은 "+Gtitle+"<br>");
	out.println("넘어온 수정급여는 "+Gpay+"<br>");	
	
	ST=CN.createStatement();	
	int ok = ST.executeUpdate(msg);
	response.sendRedirect("guestList.jsp");   //전체출력화면으로 이동 
  %>
  
  <p>
     <a href="index.jsp">[index]</a>
	 <a href="guestWrite.jsp">[신규등록]</a>
	 <a href="guestList.jsp">[전체출력]</a>  
</body>
</html>