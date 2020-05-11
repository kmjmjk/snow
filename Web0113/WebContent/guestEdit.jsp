<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestEdit]</title>
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
  Object ob = session.getAttribute("naver");  //naver는 가짜로 전달되는것(매개체)
  System.out.println("로그인 userID 세션 ="+ob);
  if(ob==null || ob=="" ||ob.equals("")){
%>
	<script type="text/javascript">
	alert("로그인을 먼저 해주세오");
	location.href="index.jsp";   //login.jsp로 보내야하지만 페이지가 없어서 임시로 index로 보내놓음
	</script>  
<% 
     return;  //밑에있는 문장들은 처리하지 못하고 탈출(데이터 삭제가 되지 않는다)
   }

int data = Integer.parseInt(request.getParameter("idx"));
msg = "select sabun, name, title, pay from guest where sabun = " + data;  //update 하기전에 내용을 꾸려야 하기때문에 select를 먼저 해줘야한다  '='안해주면 에러
ST = CN.createStatement();
RS=ST.executeQuery(msg);
while(RS.next()==true){
	Gsabun = RS.getInt("sabun");
	Gtitle = RS.getString("title");
	Gname = RS.getString("name");
	Gpay = RS.getInt("pay");
  }
%>	
	<h1>guestEdit01</h1>
	
	<form method="get" name="myform" action="guestEditSave.jsp">  <!-- guestEditSave로 값이 이동하게끔 action을 줬다  / title, submit이 guestEditSave로 데어터가 넘어간다-->
		수정사번 : <input type="text" name="sabun" value=<%= Gsabun %> readonly><br>  <!-- readonly를 쓰면 값이 고정값이 된다 -->
		수정이름 : <input type="text" name="name" value=<%= Gname %>><br>
		수정제목 : <input type="text" name="title" value=<%= Gtitle %>><br>
		수정급여 : <input type="text" name="pay" value=<%= Gpay %>><br>
		<input type="submit" value="서브밋수정">
		<input type="reset" value="수정취소">	
	</form>
	<p>
	<a href="first.jsp">[first]</a>
	<a href="guestwrite.jsp">[신규등록]</a>
	<a href="guestlist.jsp">[전체출력]</a>
	<a href="index.jsp">[index]</a>

</body>
</html>