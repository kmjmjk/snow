<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.net.URLEncoder" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> BBBdownload.jsp </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	</head>
<body>
	BBBdownload.jsp단독실행금지 <br>
<%
 request.setCharacterEncoding("UTF-8");   //한글 깨지지 않게하기위해  

 String path = application.getRealPath("storage");
 String data = request.getParameter("fname");
 System.out.println("BBBdownload.jsp문서로 넘어온 파일명은 "+data+"입니다"); 
 File file = new File(path,data);
 //----response 내장개체 헤더정의 -> 팝업창이 실행된다----
  response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(data, "UTF-8"));
 // 정답   response.setHeader("Content-Disposition", "attachment;filename="+data);
 // 빈칸 해결해보기   response.setHeader("C-D", "attach~;~name="+data);
 try{
	 Date dt = new Date( );
	 Calendar cc = new GregorianCalendar( );
	 InputStream is = new FileInputStream(file);  //외부로부터 데이터를 읽어들이는 기능
	 OutputStream os = response.getOutputStream(); //외부로 데이터 전송
	 //OutputStream os = new FileOutputStream(file); //response를 쓰는방식 혹은 이 방식으로 사용 가능
	 //byte타입은 2byte / primitiveType(표준데이터 타입) : int,double,boolean,char,long
	 byte[] bt = new byte[(int)file.length()];  //length는 long타입이니까 배열으로 들어올때는 int형으로 바꿔서 저장할 것
	 is.read(bt,0,bt.length);
	 os.write(bt);
	 
	 is.close();
	 os.close();
 }catch(Exception e){ }
%>	

</body>
</html>

