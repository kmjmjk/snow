<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%!
	Connection CN;  //DB서버정보 및 user/pwq 기억, CN참조해서 명령어를 생성한다
	Statement ST;  //정적인 명령어
	PreparedStatement PST;  //동적인명령어 / 함수를 여기에 만들어놓고 다른곳에서 불러올 수 있는 역할
	ResultSet RS;  //조회한 결과를 기억 RS=ST.executeQuery(select~,RS.next()
		
	String msg, sql;  //쿼리문 기억하는 문자열
	
	String id, pw, name, tel, email, gender, zipcode, add1, add2, birth;
	
	int Qnum,Dnum,nnum, nhit;
	String Nid, Ntitle, Ncontent, Nfile;
	Date Ndate;	
	
	String Aid, Aname, Atitle, Acontent;
	int Ahit, Anum;
	Date Adate;
  %>
  <%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system","1234");
	}catch(Exception ex){out.println("<h1>에러 : "+ex.toString()+"</h1>");}
  %>
</body>
</html>