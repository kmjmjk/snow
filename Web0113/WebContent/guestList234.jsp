<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestList234</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
guestList234.jsp<br>
  <%   
  String pnum;
  int pageNUM,pagecount;
  int start, end;    //start는 n번 클릭 후 처음 나오는 행  (n-1)*10+1
  int startpage, endpage;    //startpage 는 [1] endpage는 [10] 인데 다음을 눌렀을땐 [11]~[20]이 된다
  int temp;
  
  //검색에 필요한 변수
  String sqry;
  String skey, sval;
  String returnpage;  //검색 후 나오는 페이지
  
  skey=request.getParameter("keyfield");
  sval=request.getParameter("keyword");
  System.out.println("검색필드keyfield="+skey+" keword="+sval);
  
  if(skey==null || skey=="" || sval==null ||sval==""){    //skey값과 sval의 값이 널일경우는 전체 데이터를 출력하기 위해서 
	  sqry=" where title like '%%'";    //skey값과 sval의 값이 널일경우는 전체 데이터를 출력하고
	  skey=""; sval="";
  }else{sqry = " where "+ skey +" like '%"+sval+"%'";}   //값이 입력이 되었을경우에는 예를들어 where title like '%p%';와 같은 문장이지만 title부분이 키필드이고 sval이 키워드니까 이렇게 지정해주었다
  
  
  returnpage="&keyfield="+skey+"&keyword="+sval;   //페이지 검색 후 발생하는 페이지에 관한 것으로 주소창에 출력되기 때문에 &를 이용하여 연결이 되게끔 해주었다
  //returnpage의 값을 주지 않으면 검색 후 페이지를 변경할 시에 다른 페이지로 넘어가면 초기값으로 넘어간다(다음페이지 클릭 시 검색한 값이 저장되지 않는다) 
 
  pnum=request.getParameter("pageNum");
  if(pnum=="" || pnum==null){pnum="1";}   //페이지번호를 선택안하면 자동으로 1페이지가 나오게끔
  pageNUM=Integer.parseInt(pnum);
 
  start=(pageNUM-1)*10+1;
  end=(pageNUM*10);
  
  
  //<a href=guestList.jsp?pageNum=<%= a %] </a>   받은 숫자를 넘기는게 pageNum
	 msg=" select count(*) as cnt from guest"+sqry;  //count세는거를 as cnt로 cnt라는 가짜변수를 만들어 저장하겠다 뒤에 sqry값을 추가해주었다
	 ST=CN.createStatement();
	 RS=ST.executeQuery(msg);
	 while(RS.next()==true){
		 Gtotal = RS.getInt("cnt");   //RS.next=Gtotal
	 }
	 
	//pagecount=((Gtotal-1)/10)+1;    //밑에 if-else문과 같은말
	 if(Gtotal%10==0){pagecount=Gtotal/10;
		}else{pagecount=(Gtotal/10)+1;}
	
	 temp=(pageNUM-1)%10;
	 startpage=pageNUM-temp;
	 endpage=startpage+9;
	// System.out.println("0120월요일에 startpage="+startpage+" endpage="+endpage);
	 	 
	 //총페이지수 pagecount=32
	 //총데이터수 Gtotal=316
    %>
	 
	<table width=700 border=1 cellspacing=0 cellpadding=5>
	  <tr align="right">
	    <td colspan="6"> 레코드갯수:<%= Gtotal %>
	    <a href="index.jsp">[Index]</a>
	    <a href="guestWrite.jsp">[신규등록]</a> 
	    <a href="guestList.jsp">[전체출력]</a> &nbsp;
	    </td>
	  </tr>
	  <tr bgcolor="pink">
	    <td>행번호</td><td>사  번</td><td>이  름</td><td>제  목</td><td>날  짜</td><td>조회수</td>
	  </tr>
	  
	  <%
	  ST=CN.createStatement();
	  
	  String a="select * from (";
	  String b="select rownum rn, sabun, name, title, wdate, pay, hit ";
	  String z="from (select * from guest "+sqry+")";       //sqry가 keyfield와 keyword의 값을 받는 부분이기때문에 조건을 주기 위해 String z에 추가해주었다
	  String c=")where rn between "+start+" and "+end ;     //between 뒤와 end 앞뒤에 공백(띄어쓰기)를 하지 않으면 글자를 붙어서 입력받기 때문에 오류뜬다 
	 // System.out.println(c);                                 // 행번호 1and10으로 하면 1-10까지만 나오지만 변수선언 해준 start와 end를 사용
	  
	 /*  msg ="select * from (";     //만약 =을 쓰면 계속 msg의 값이 밑에 있는것들로 덮어씌워진다 그래서 =이 아니라 +=이라고 써야만 그 뒤에 문장들이 붙을 수 잇다
	  msg ="select rownum rn, sabun, name, title, wdate, pay from guest";
	  msg ="";
	  msg=")where rn between 1 and 10"; */
	  
	  //msg="select rownum, g.* from guest g";  //select rownum, sabun, name, title, wdate, pay, hit from guest; 로 써도 된다
	  msg=a+b+z+c;
	  RS=ST.executeQuery(msg);
	  while(RS.next()==true){
		  Gsabun = RS.getInt("sabun");
		  Gtitle = RS.getString("title");
	  %>
	<tr>
	  <td><%= RS.getInt("rn") %></td>
	  <td><%= RS.getInt("sabun") %></td>
	  <td><%= RS.getString("name") %></td>
	  <td><a href="guestDetail.jsp?idx=<%= Gsabun %>"><%= Gtitle %></a></td>  <!-- idx는 값을 이동해주는 역할이라고 볼 수 있다 title에 해당하는 sabun의 값을 선택 '?'는 구분해주는 확장자 (여러 카테고리 구분) -->
	  <td><%= RS.getDate("wdate") %></td>
	  <td><%= RS.getInt("hit") %></td>
	</tr>
	  <%
	    }  //while문 end
	  %>
	  <tr align="center">
	   <td colspan="6">
	   <%	   
	   if(startpage != 1){    //startpage가 1인 경우에는 이전버튼이 필요없기때문에 1이 아닐경우에만 이전버튼을 생성해주었다 / (startpage > 10)으로 조건을 줘도 성립
	   out.println("<a href=guestList234.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");}    //returnpage="&keyfield="+skey+"&keyword="+sval;로 위에서 정의해 주었다 

  	   if(endpage>pagecount){endpage=pagecount;}   //endpage가 현재페이지보다 클경우에는 마지막페이지를 현재페이지와 같게 만들어주어서 현재페이지가 마지막이 되도록
  	   
	     for(int i=startpage; i<=endpage; i++){      //리스트에 페이지넘버 클릭할 수 있는칸
	    	 if(pageNUM==i){    //i는 현재 클릭한 페이지이니까 페이지넘버가 현재 클릭한 넘버일때/ pnum은 String타입이기때문에 pageNUM으로 써줘야한다
	    		out.println("<a href=\"guestList234.jsp?pageNum="+i+returnpage+"\"><font style=\"color:green; font-size:14pt\">["+i+"]</font></a>");	 //선택한 페이지넘버에 색과 사이즈를 조절해서 알아볼 수 있도록
	    	 }else {
	   			out.println("<a href=\"guestList234.jsp?pageNum="+i+returnpage+"\">["+i+"]</a>");   //선택하지 않은 부분은 그냥 번호가 출력되게/번호를 누르면 guestList로 넘어간다
	    	 }
	     }
	     
	   if(endpage<pagecount){      //endpage가 현재페이지보다 작을경우에만 다음버튼이 뜨게해주었다
	   out.println("<a href=guestList234.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");}     
	   %>
	    </td>
	   </tr>
	   
	   <tr align="center">
	     <td colspan="6">
	       <form name = "myform" action="guestList234.jsp">
	        <span id="search">검색 : </span>
	        <select name = "keyfield">
	          <option value="">---선택하세요---</option>
	          <option value="">전체검색</option>
	          <option value="name">이름검색</option>
	          <option value="title">제목검색</option>
	          <option value="">내용검색</option>
	          <option value="">제목+내용</option>
	        </select>
	          <input type="text" name="keyword" size=12>
	          <input type="submit" value="검색">
	       </form>
	     </td>
	   </tr>  
	   
	</table>
</body>
</html>