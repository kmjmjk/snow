<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp] </title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>

	<script type="text/javascript">	
	  function clearText(){
		
	  }
	</script>
</head>
<body>
<%
 String pnum;
 int pageNUM, pagecount;
 int start, end; 
 int startpage, endpage;  
 int temp;
 
 String sqry="";
 String skey="", sval="";
 String returnpage=""; 
 
 skey=request.getParameter("ketfield");
 sval=request.getParameter("keyword");
 //키필드 및 키워드 미입력시 에러발생된다
 if(skey==null || skey=="" || sval==null || sval==""){
	 sqry=" where title like '%%'";
	 skey=""; sval="";
 }else{sqry=" where "+skey+" like '%"+sval+"%'";}
 
 pnum = request.getParameter("pageNum");
 if(pnum==null || pnum==""){pnum="1";}
 pageNUM=Integer.parseInt(pnum);

 start=(pageNUM-1)*10+1;
 end=pageNUM*10;
 
 temp=(pageNUM-1)%10;
 startpage=pageNUM-temp;
 endpage=startpage+9;
 
 msg = " select count(*) as cnt from guest"+sqry ; 
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 while(RS.next()==true){
	 Gtotal = RS.getInt("cnt");
 }
 
 if(Gtotal%10==0){ pagecount=Gtotal/10; }
 else{ pagecount=(Gtotal/10)+1; }
 
 
 if(endpage>pagecount){endpage=pagecount;}
 
%>
 <table width=700 border=1 cellspacing=0 cellpadding=5>
 	<tr align="right">
 		<td colspan="6"> 레코드갯수: <%= Gtotal %>  &nbsp;
 		   <a href="index.jsp">[index]</a>
 		   <a href="guestList.jsp">[출력]</a> &nbsp;&nbsp;
 		</td>
 	</tr>
 
 	<tr bgcolor="pink">
 	 <td>행번호</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>
  <%
 	 ST = CN.createStatement( );
  	 String a=" select * from (" ;
  	 String b=" select rownum rn, sabun, name, title, wdate, pay, hit " ;
  	 String z=" from (select * from guest "+sqry+")" ; 
  	 String c=" )where rn between "+start+" and "+end;

 	 msg = a+b+z+c; 
 	 RS = ST.executeQuery( msg );
 	 while(RS.next( )==true) {
 		 Gsabun = RS.getInt("sabun");
 		 Gtitle = RS.getString("title");
   %>		 
 	<tr onmouseover="style.backgroundColor='rgba(142, 144, 194, 0.2)'" onmouseout="style.backgroundColor=''">  
 		<td> <%= RS.getInt("rn") %> </td>
 		<td> <%= Gsabun %> </td>
 		<td> <%= RS.getString("name") %>  </td>
 		<td> <a href="guestDetail.jsp?idx=<%= Gsabun %>"><%= Gtitle %></a></td>
 		<td> <%= RS.getDate("wdate") %>  </td>
 		<td> <%= RS.getInt("hit") %>  </td>
 	</tr>	 
  <%		 
 	 }//while end
  %>
 
  
  <tr align="center">
  	<td colspan="6">
  	<%
  	
  	if(startpage >10 ){
  		out.println("<a href=guestList.jsp?pageNum="+(startpage-10)+">[이전]</a>");
  	}
  	
  	  for(int i=startpage; i<=endpage; i++){
  		  if(i==pageNUM){
  			  out.println("<font style=\"color:green; font-size:14pt\">["+i+"]</font></a>");
  		  }else{
	   		out.println("<a href=\"guestList.jsp?pageNum="+i+"\">["+i+"]</a>");}  	 
  	    }
  	if(endpage<pagecount){
  		out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+">[다음]</a>");}    
  	  
  	%>
  	
  	  <form name="myform">
  	  	 <span id="search">검색 : </span>
  	  	 <select name="keyfield">
  	  	   <option value="">---선택하세요---</option>
  	  	   <option value="name">이름필드</option>
  	  	   <option value="title">제목필드</option>
  	  	   <option value="">내용필드</option>
  	  	 </select>
  	  	
  	  	 <input type="text" name="keyword">
  	  	 <input type="submit" value="검색">
  	  
  	  </form>
  	</td>
  </tr>
 </table>
  
</body>
</html>

