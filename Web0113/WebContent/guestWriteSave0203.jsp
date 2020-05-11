<%@page import="net.tis.guest.GuestSQL"%>
<%@page import="net.tis.guest.GuestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  <font color=blue> guestWriteSave.jsp단독실행하면 에러발생 </font><p>
  
 <%
  //guestWriteSave.jsp문서에 PreparedStatement명령어적용
  int Gsabun = Integer.parseInt( request.getParameter("sabun") ) ;
  String Gname =  request.getParameter("name") ;
  String Gtitle = request.getParameter("title") ;
  int Gpay = Integer.parseInt( request.getParameter("pay") );
  String Gemail = request.getParameter("email") ;
  System.out.println(Gsabun+" "+Gname+" " +Gtitle+" "+Gpay+" "+Gemail);
 
  GuestDTO dto = new GuestDTO();
  GuestSQL sql = new GuestSQL();
  
  //sql.guestInsert(Gsabun, Gname, Gtitle, Gpay, Gemail); //sql.guestInsert로  GuestSQL에서 설정한 변수의 위피에 위에서 정의해준 값을 넣어준다
  
  dto.setSabun(Gsabun);
  dto.setName(Gname);
  dto.setTitle(Gtitle);
  dto.setPay(Gpay);
  dto.setEmail(Gemail);
  //DTO의 set에 값 대입 후 dto만 넘기는 방법 /34번에 적은 방법도 좋고 이방법을 사용해도 좋음 (편한거 사용해_☆)
  sql.guestInsert(dto); 
  //저장처리메소드 guestInsert메소트 호출, 데이터 전달
  response.sendRedirect("guestList.jsp"); //내장객체response 문서이동  
 %>
 
<%--  ※ jsp 문서에서 java 문서 접근하는 방법 / useBean을 사용해서 액션태그로 저장처리하기 (import 불필요)  
 <jsp:useBean id="sql" class="net.tis.guest.GuestSQL"/>
 <jsp:useBean id="dto" class="net.tis.guest.GuestDTO"/>
 <%
   dto.setSabun(Gsabun);
   dto.setName(Gname);
   dto.setTitle(Gtitle);
   dto.setPay(Gpay);
   dto.setEmail(Gemail);  
   
   int ok = sql.guestInsert(dto);
   if(ok>0){
	  System.out.println("guestWriteSave.jsp저장성공 0203");
	
   response.sendRedirect("guestList.jsp");
   }else {response.sendRedirect("index.jsp");} --%>
 %>  
</body>
</html>








