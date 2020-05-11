<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	*{font-size:12pt; font-weight:bold;}
	a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}
	a:hover{font-size:16pt; text-decoration:underline; color:green; front-family:Comic Sanc MS;}				
</style>
</head>
<body>
  <%!
	Connection CN;  //DB서버정보 및 user/pwq 기억, CN참조해서 명령어를 생성한다
	Statement ST;  //정적인 명령어
	PreparedStatement PST;  //동적인명령어 / 함수를 여기에 만들어놓고 다른곳에서 불러올 수 있는 역할
	ResultSet RS;  //조회한 결과를 기억 RS=ST.executeQuery(select~,RS.next()
			
	int Grn, Gsabun, Gpay, Ghit;  //사번 급여 조회수
	String Gname, Gtitle, Gemail;  //이름 제목
	java.util.Date Gwdate;  //날짜
	
	int Gdata;
	int Atotal;  //총 레코드 갯수 (316)
	int Gtotal;  //검색했을때 나오는 레코드의 수
	String msg;  //쿼리문 기억하는 문자열
	
	int  Rrn, Rnum, Rsabun, Rcnt;
	String Rwriter, Rcontent;
  %>
  <%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system","1234");
	//System.out.println("오라클연결 성공!^_^");
	}catch(Exception ex){out.println("<h1>에러 : "+ex.toString()+"</h1>");}
  %>
</body>
</html>