<%@page import="net.tis.guest.GuestSQL"%>
<%@page import="net.tis.guest.GuestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave.jsp] </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  <font color=blue> guestWriteSave.jsp단독실행하면 에러발생 </font><p>
  
 <%
  //guestWriteSave.jsp문서에서 데이터받기
  int Gsabun = Integer.parseInt( request.getParameter("sabun") ) ;
  String Gname =  request.getParameter("name") ;
  String Gtitle = request.getParameter("title") ;
  int Gpay = Integer.parseInt( request.getParameter("pay") );
  String Gemail = request.getParameter("email") ;
  
  GuestDTO dto = new GuestDTO();
  GuestSQL sql = new GuestSQL();
  //저장처리메소드 guestInsert메소드호출, 데이터전달
  //정답 이미확인 sql.guestInsert(Gsabun, Gname, Gtitle, Gpay, Gemail);
  
  	dto.setSabun(Gsabun);
  	dto.setName(Gname);
  	dto.setTitle(Gtitle);
  	dto.setPay(Gpay);
  	dto.setEmail(Gemail);
    //DTO의 세터에 값대입후 dto만 넘김
    sql.guestInsert(dto);
    
   response.sendRedirect("guestList.jsp"); 
 %>
 
 <%-- <jsp:useBean id="sql" class="net.tis.guest.GuestSQL" />
 <jsp:useBean id="dto" class="net.tis.guest.GuestDTO" /> 
 <%
    dto.setSabun(Gsabun);
	dto.setName(Gname);
	dto.setTitle(Gtitle);
	dto.setPay(Gpay);
	dto.setEmail(Gemail);
	  int ok = sql.guestInsert(dto);
	  if(ok>0){
		System.out.println("guestWriteSave.jsp저장성공 2월3일 월요일") ;
	    response.sendRedirect("guestList.jsp");
	  }else{  response.sendRedirect("index.jsp");}
 %> --%>
</body>
</html>
















