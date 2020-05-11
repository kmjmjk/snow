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
  Gsabun = Integer.parseInt( request.getParameter("sabun") ) ;
  Gname =  request.getParameter("name") ;
  Gtitle = request.getParameter("title") ;
  Gpay = Integer.parseInt( request.getParameter("pay") );
 
  //guestEditSave.jsp문서 단독실행하면 에러발생  
  //guestEdit.jsp문서에서 submit연결
  System.out.println("\n넘어온 수정사번 = " + Gsabun );
  System.out.println("넘어온 수정이름 = " + Gname );
  System.out.println("넘어온 수정제목 = " + Gtitle );
  System.out.println("넘어온 수정급여 = " + Gpay );
   
  msg="update guest set name=?, title=?, wdate=sysdate, pay=? where sabun = ? ";
  PST = CN.prepareStatement(msg);
  		PST.setString(1, Gname);
  		PST.setString(2, Gtitle);
  		PST.setInt(3, Gpay);
  		PST.setInt(4, Gsabun);
  PST.executeUpdate(); //괄호안 매개인자없음
  response.sendRedirect("guestList.jsp"); //수정후 전체출력이동
  
  //msg="update guest set name='"+Gname+"', title='"+Gtitle+"', wdate=sysdate, pay="+Gpay+" where sabun = "+ Gsabun ;
  //ST = CN.createStatement();
  //int ok  = ST.executeUpdate(msg); //진짜수정처리 
  //response.sendRedirect("guestList.jsp"); //수정후 전체출력이동
 %>
  
  <p>
     <a href="index.jsp">[index]</a>
	 <a href="guestWrite.jsp">[신규등록]</a>
	 <a href="guestList.jsp">[전체출력]</a>  
</body>
</html>