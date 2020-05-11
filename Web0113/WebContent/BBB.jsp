<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> BBB.jsp </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
		
	</script>
</head>
<body>
<%
 //ServletContext sc = config.getServletContext();
 //String path= sc.getRealPath("storage");
 String path = application.getRealPath("storage");
 System.out.println(path);
 
 int size= 1024*1024*7; 
 DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();  //dfr을 RenamePolisy로 해주어서 파일 중복일 경우 자동으로 새이름 지정이 된다(덮어쓰기가 아니라)
 //MultipartRequest(request,경로,크기,인코딩,생략파일중복여부) ;
 MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8",dfr) ;
 
 String a=mr.getParameter("num");
 String b=mr.getParameter("title");
 //String c=mr.getParameter("file1"); //다르게접근 getFilesystemName(file1) 파일이름만 넘어옵니다
 String c= mr.getFilesystemName("file1");  //file가져오겠다 getFile
  out.println("mr넘어온번호 = " + a  + "<br>");
  out.println("mr넘어온제목 = " + b  + "<br>");
  out.println("mr넘어온파일 = " + c  + "<br>");
  
  File ff = mr.getFile("file1");  //4행에 "java.io.File" 를 import 해주었다
  long fsize = ff.length();   //long은 8byte int는 4byte
  System.out.println(c+"파일의 크기는 "+fsize);
  out.println(c+"파일의 크기는 "+fsize+"(8byte)<br>");
%>	
<a href="BBBdownload.jsp?fname=<%= c %>"><img src="<%=request.getContextPath()%>/storage/<%=c%>" width="150" height="85"></a>  &nbsp;
<a href="BBBdownload.jsp?fname=<%= c %>"><img src="./storage/<%=c%>" width="150" height="85"></a> <p>   <!-- storage앞에 webcontent를 적지 않는 이유는 webcontent는 가상의 이름이고 변경가능하기 때문 -->

	<a href="AAA.jsp">[AAA.jsp]</a>
	<a href="index.jsp">[index.jsp]</a>
	<a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>





