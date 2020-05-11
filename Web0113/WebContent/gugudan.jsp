<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[gugudan.jsp]</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold;}
		a{font-size:14pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}
		a:hover{font-size:16pt; text-decoration:underline; color:green; front-family:Comic Sanc MS;}			
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
	<img src="./images/bar.gif"><p>
	<h1>gugudan.jsp</h1>
	<%!
		int kor=90, eng=85, hap=0;	
	%>
  <%	
	int dan=3;
	for(int i=0; i<10; i++){
	System.out.println(dan+"*"+i+"="+(dan*i));
	}	
	out.println("<img src=images/aaa.gif>");
	out.println("<img src=images/aaa.gif>"); 
	out.println("<img src=images/aaa.gif>"); 
	
	Date dt = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String wdate = sdf.format(dt);
	
	int kor=90, eng=85, hap=0;
	double avg=0.0;
	hap=kor+eng;
	avg=(double)hap/2;
	
	System.out.println("합은"+hap+"\t평균은"+avg);	
	%>
	
	<br>
	총점 : <%= hap %> <br>
	평균 : <%= avg %> <br>
	날짜 : <%= wdate %><br>
	
</body>
</html>