<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestDetail.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
   
   <%
    //guestDetail.jsp단독실행하면 에러발생=>반드시 guestList.jsp문서에서 제목클릭
    int data = Integer.parseInt(request.getParameter("idx"));
    
    //조회수증가
    msg="update guest set hit=hit+1 where sabun =  " + data ;
    ST = CN.createStatement();
    int ok = ST.executeUpdate(msg) ; 
    
    msg="select * from guest  where sabun = " + data ;
    //System.out.println(msg); 
    ST = CN.createStatement( );
    RS = ST.executeQuery(msg);
    if(RS.next()==true){
    	Gsabun = RS.getInt("sabun");
    	Gname = RS.getString("name");
    	Gtitle = RS.getString("title");
    	Gwdate = RS.getDate("wdate");
    	Gpay = RS.getInt("pay");
    	Gemail = RS.getString("email");
    }//end
   %>
   	
<table width='700' border='1' cellspacing='0' cellpadding=5>
  <tr align="center">
    <td colspan="2"> [<%= Gname %>님] 상세데이터 출력 </td>
  </tr>
  
  <tr>
  	<td rowspan="5"  align="center" width=300> 
  	  <img src="images/aaa.gif" height=200 width=300> 
  	</td>
  	<td> 사번 : <%= Gsabun %>  </td>
  </tr>
  
  <tr> <td> 제목 : <%= Gtitle %> </td>  </tr>
  <tr> <td> 날짜 : <%= Gwdate %> </td>  </tr>
  <tr> <td> 급여 : <%= Gpay %></td>  </tr>
  <tr> <td> 메일 : <a href="mailto:<%= Gemail %>"> <%= Gemail %> </a> </td>  </tr>
  
  <tr align="center">
  	<td colspan="2">  
  		<a href="guestWrite.jsp">[등록]</a>
  		<a href="guestList.jsp">[전체출력]</a>
  		<a href="guestDelete.jsp?idx=<%= Gsabun %>">[삭제1]</a>
  		<a href="guestEdit.jsp?idx=<%= Gsabun %>">[수정]</a>
  		<a href="guestDelete2.jsp?idx=<%= Gsabun %>">[삭제2]</a>
  	</td>
  </tr>
</table> 
 
 <p>
 <jsp:include page="guest_reply.jsp">
 	<jsp:param value="<%=Gsabun%>" name="Gidx" />
 </jsp:include>
   	
</body>
</html>












