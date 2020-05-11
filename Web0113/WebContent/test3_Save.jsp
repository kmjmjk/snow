<%@ page language="java" contentType="text/html; charset=UTF-8"   %>

<!DOCTYPE html>
<html><head>
<title> [test3_Save.jsp]</title>
   <style type="text/css">
	  *{font-size:20pt; font-weight:bold;  font-family: Comic Sans MS ; margin-left: 10px; }
	  a{font-size:20pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:26pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
 test3_Save.jsp 단독실행금지<p>
  <%
  String a=request.getParameter("user_name");
  int b=Integer.parseInt(request.getParameter("user_pwd") );
  String c=request.getParameter("gender");
  String d=request.getParameter("job");
  String[] e=request.getParameterValues("hobby"); //체크박스만   배열로 받으세요
  String f=request.getParameter("myfile");
  String g=request.getParameter("memo");
 %>
 <hr>
 닉네임: <%= request.getParameter("user_name")  %> <br>
 비밀번: <%= request.getParameter("user_pwd")  %> <br>
 성 별:  <%=request.getParameter("gender")  %> <br>
 직 업:  <%=request.getParameter("job")  %> <br>
 취 미:  <% for(String data: e){ out.println( data+" ");} %> <br>
 파 일:  <%=request.getParameter("myfile")  %> <br>
 메 모:  <%=request.getParameter("memo")  %> <br>
 
  <hr>
  <a href="guestList.jsp">[전체출력]</a>  
  <a href="test3_Form.jsp">[test3_Form]</a>
  <a href="#">[로그인]</a>
  <a href="guestWrite.jsp">[입력화면]</a>
</body>
</html>




