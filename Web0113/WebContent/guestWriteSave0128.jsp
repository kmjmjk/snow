<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave0128.jsp] </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  <font color=blue> guestWriteSave0128.jsp단독실행하면 에러발생 </font><p>
  
 <%
  Gsabun = Integer.parseInt( request.getParameter("sabun") ) ;
  msg="select count(*) as cnt from guest where sabun="+Gsabun; //사번조회갯수

  ST = CN.createStatement(); 
  RS = ST.executeQuery(msg); 
  if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
  if(Gtotal>0){
 %>	  
	 <script type="text/javascript">
	    alert(<%= Gsabun %> +"  이미 등록된 데이터입니다");
	    location.href="guestWrite.jsp"; 
	 </script>
    	  
 <%
 	return ; //자바문서에서도 return단독기술은 아래문장 처리안함 
  }
  
  Gname =  request.getParameter("name") ;
  Gtitle = request.getParameter("title") ;
  Gpay = Integer.parseInt( request.getParameter("pay") );
  Gemail = request.getParameter("email") ;
  System.out.println( Gsabun+" "+ Gname+" " + Gtitle+" " + Gpay+ " " + Gemail);
  //msg="insert into guest values(8800,'tis','sunday', sysdate, 21, 0 ,'bc@tis.com') " ;
  msg="insert into guest values("+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"+Gpay+",0, '"+ Gemail +"')" ;
  out.println(msg);
  System.out.println(msg);	
 
  ST = CN.createStatement( );
  int ok = ST.executeUpdate(msg);
  response.sendRedirect("guestList.jsp"); //내장객체response 문서이동
  //guestWriteSave0128.jsp문서  구정연휴 다음날 작성
 %>
 
</body>
</html>








