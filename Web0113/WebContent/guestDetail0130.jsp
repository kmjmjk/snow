<%@page import="net.tis.guest.GuestDTO"%>
<%@page import="net.tis.guest.GuestSQL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:black; front-family:Comic Sanc MS;}
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}	
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
  <%
    /* int data = Integer.parseInt(request.getParameter("idx"));
	msg="select * from guest where sabun = " + data;
	//System.out.println(msg);
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	  if(RS.next()==true){     //while문을 써도 되지만 간편하게 if문 사용
		  Gsabun = RS.getInt("sabun");
		  Gname = RS.getString("name");
		  Gtitle = RS.getString("title");
		  Gwdate = RS.getDate("wdate");
		  Gpay = RS.getInt("pay");
		  Gemail = RS.getString("email");
	   }
	  msg="update guest set hit = hit+1 where sabun = "+data;  //제목 클릭할때마다 조회수가 1씩 등가되게끔
	  ST = CN.createStatement();
	  ST.executeUpdate(msg); */
   %>
  
  <%
   String data = request.getParameter("idx");
   GuestSQL sql = new GuestSQL();
   GuestDTO dto = sql.guestDetail(data);
   int Gsabun = dto.getSabun(); 
  %>
  
  <table width=500 border=1 cellspacing=1 cellpadding=7>
  <tr align="center" bgcolor="pink">
    <td colspan="2" style="font-size:14pt";>【<%=dto.getName() %>님의 상세데이터】</td>
  </tr>
  <tr>
    <td rowspan="5" align="center" width="225"><img src="images/aaa.gif"></td>
    <td>사번 : <%= dto.getSabun() %></td>  
  </tr>
  <tr>
    <td>제목 : <%= dto.getTitle() %></td> 
  </tr>
  <tr>   
    <td>급여 : <%= dto.getPay() %></td>
  </tr>
   <tr>   
    <td>메일 : <%= dto.getEmail() %></td>
  </tr>
  <tr>
    <td>날짜 : <%= dto.getWdate() %></td>
  </tr>
  <tr align="center">
	  <td colspan="2">
	  <a href="index.jsp">[INDEX]</a>
	  <a href="guestWrite.jsp">[신규등록]</a>
	  <a href="guestList0130.jsp">[전체출력]</a>
	  <a href="guestDelete.jsp?idx=<%= Gsabun %>">[삭제]</a>   <!-- 사번값을 idx에 저장 -->
	  <a href="guestEdit.jsp?idx=<%= Gsabun %>">[수정]</a>
	  <a href="guestDelete.jsp?idx=<%= Gsabun %>">[삭제2]</a>
	  </td>
  </tr>
</table>

<hr>
  <jsp:include page="guest_reply.jsp">  
    <jsp:param value="<%= Gsabun %>" name="Gidx"/>
  </jsp:include>

</body>
</html>