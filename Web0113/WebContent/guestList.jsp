<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp] </title>
	<style type="text/css">
	 *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:purple ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">	
	  function clearText(){    
		document.myform.keyword.value="";
		document.myform.keyword.focus="";     //선택화면을 새로 선택하면 sval에 있는 값이 지워지게끔
	  }
	</script>
</head>
<body>
<jsp:include page="guest_header.jsp"></jsp:include>
<%
 String pnum;
 int pageNUM, pagecount;
 int start, end; 
 int startpage, endpage;  
 int temp;

 
 String sqry;
 String skey, sval;
 String returnpage; //검색 후 나오는 페이지
 
 int Rnumber;
 
 skey=request.getParameter("keyfield");
 sval=request.getParameter("keyword");
 //키필드및키워드 미입력시 에러발생하니까 해결
 
 
  if(skey != null && skey != ""){      //guestList234참고 / 이거의 경우는 unll이 아니고 빈칸이 아닌 것 둘 다 만족해야하기때문에 &&를 써주었다(입력이 되었을때)	
	 sqry="(select * from guest where "+skey+" like '%"+sval+"%')";
	 returnpage="&keyfield="+skey+"&keyword="+sval;
	 
 }else{
	 sqry= " guest";
	 returnpage="";     //입력이 되지 않았을때 공백이거나 널값인 경우에는 
	 skey=""; sval="";
 } 
 
 pnum = request.getParameter("pageNum"); //<a href=guestList.jsp?pageNum=i>[i]</a>
 if(pnum==null || pnum==""){ pnum="1";}
 pageNUM=Integer.parseInt(pnum);
 
 msg = "select count(*) as cnt from guest" ; 
 ST = CN.createStatement();
 RS = ST.executeQuery(msg);
 if(RS.next()==true){ Atotal = RS.getInt("cnt"); }  //Atotal은 총 레코드의 수(316개 출력)


 msg = "select count(*) as cnt from" + sqry ; 
 ST = CN.createStatement();
 RS = ST.executeQuery(msg);
 if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }  //Gtotal은 검색 후 출력되는 레코드의 수
 
 if(Gtotal%10==0){ pagecount=Gtotal/10; }
 else{ pagecount=(Gtotal/10)+1; }
//pagecount=((Gtotal-1)/10)+1;    //밑에 if-else문과 같은말

 
 start = (pageNUM-1)*10+1 ; //[24클릭]  231 시작행 
 end = (pageNUM*10);  //[24클릭] 240 끝행
 
 temp=(pageNUM-1)%10;  //3
 startpage=pageNUM-temp; //21
 endpage=startpage+9;  //30
 if(endpage > pagecount){ endpage=pagecount; } //[이전][31]~~[40] 출력
 //33 pnum = request.getParameter("pageNum"); ~ 51endpage분석
%>
 <table width=900 border=1 cellspacing=0>
 
  	<tr align="right">
 		<td colspan="6"> 레코드갯수: <%= Gtotal %> / <%= Atotal %>  &nbsp;
 		   <a href="index.jsp">[index]</a>
 		   <a href="login.jsp">[login]</a>
 		   <a href="guestList.jsp">[출력]</a> &nbsp;&nbsp;
 		</td>
 	</tr>
 
 	
 	<tr bgcolor="pink">
 	 <td>행번호</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>
  <%
 	 ST = CN.createStatement( );
  	String a=" select * from  ( " ;
  	String b=" select rownum rn,sabun,name,title,wdate,pay, hit from " ;
  	String z= sqry;
  	String c=" ) where rn between " +  start +" and "+  end  ;
 	 msg = a+b+z+c; 
 	 RS = ST.executeQuery( msg );
 	 while(RS.next( )==true) {
 		 Gsabun = RS.getInt("sabun");
 		 Gtitle = RS.getString("title");
 		 Rnumber = Gtotal - RS.getInt("rn") +1;    //Gtotal(316개)에서 행번호를 빼면 0,1,2~로 출력된다 그래서 +1을 해주면 순서대로 보여지게 된다!_!
 		 //Rnumber = Gtotal - (pageNUM-1)+10;
 		 
   %>		
 <%--  <!--      여기         --> 
   <%
      msg="select count(*) as cnt from guestreply where sabun="+Gsabun;
   		ST=CN.createStatement();
   		RS=ST.executeQuery(msg);
   		while(RS.next()==true){
   			Rcnt = RS.getInt("cnt");
   		}
   
   %> --%>
     
 	<tr onmouseover="style.backgroundColor='rgb(200,200,200)' "  onmouseout="style.backgroundColor='' ">   
 		<td> <%= Rnumber %> </td>
 		<td> <%= Gsabun %> </td>
 		<td> <%= RS.getString("name") %>  </td>
 		<td> <a href="guestDetail.jsp?idx=<%= Gsabun %>"> <%= Gtitle %>   </a></td>
 		<td> <%= RS.getDate("wdate") %>  </td>
 		<td> <%= RS.getInt("hit") %>  </td>
 	</tr>	 
  <%		 
 	 }//while end
  %>
  <tr align="center">
  	<td colspan="6">
  	<%  
  	  //이전[Prev]
  	 if(startpage>10){ //[1] [11] [21] [31]
 	   out.println("<a href=guestList.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");	 
  	 }
  	
  	  for(int i=startpage; i<=endpage; i++){
  		if(i==pageNUM){
  		 out.println("<font style='color:red;font-size:20pt'>["+i+"]</font>");	  
  		}else{out.println("<a href=guestList.jsp?pageNum="+i+returnpage+">["+i+"]</a>"); }
  	  }
  	
  	 //다음[Next] 
  	 if(endpage<pagecount){ //[10] [20] [30] [40표시안됨] < 32 
 	  out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");	 
  	 }
  	%>
    </td>
  </tr>
  
  <tr align="center">
  	<td colspan="6">
 	
  	  <form name="myform">
  	  	 <select name="keyfield" onchange="clearText()">  
  	  	 	<option value="" >---선 택--- </option>
  	  	 	<option value="name"  <%if(skey.equals("name")){out.println("selected");}%>>이름필드</option>    <!-- selected 를 원래 selected="selected"로 작성하지만  -->
  	  	 	<option value="title" <%if(skey.equals("title")){out.println("selected");}%>}>제목필드</option>
  	  	 	<option value="" >내용필드</option>
  	  	 	<option value="" >전체검색</option>
  	  	 	
  	  	 </select>
  	  	 <input type="text" name="keyword" value="<%= sval %>" size=12>
  	  	 <input type="submit" value="검색">
  	  </form>
  	</td>
  </tr>
  
 </table>
    <!--
      select * from guest where keyfiled like '%keyword%'
      select * from guest where skey변수 like '%sval변수%'
      select * from guest where title like '%%'   모든데이터출력 
        행번호표시, 10개씩출력 페이지쪼개기     
     -->
   <p>
<jsp:include page="guest_footer.jsp"></jsp:include>  
</body>
</html>











