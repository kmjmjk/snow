<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- servelt p.346 참고 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.349.jsp</title>
	<style type="text/css">
	*{font-size: 16pt;}
	</style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
  <%
  String title="minji";
  int age=26;
  
  out.println(title+"<br>");
  out.println(age+"<br>");
  %>

  <c:set var="msg" value="hello it's me" scope="page"></c:set>
    메세지 : <c:out value="${msg}" /><br>
    
    <%
    int avg=69;
    out.println("점수는 "+avg+" 학점은");
    if(avg>=90){
    	out.println("A <br>");
    }
    if(avg>=80){
    	out.println("B <br>");
    }
    if(avg>=70){
    	out.println("C <br>");
    }
    if(avg>=60){
    	out.println("D <br>");
    }
    else{
    	out.println("F <br>");
    }
    %>
    
    <c:set var="name" value="kmj"/>
           내 이름은 ${name}<br>
    <c:remove var="name" />      
           내 이름은 ${name}<br>  <!-- 위에 c:remove를 사용하여 변수에 설정된 값을 지웠기때문에 여기에서는 name이 출력되지 않는다 -->
    
    <c:set var="num" value="72" />
          점수는 ${num}점 이며 당신은  <!-- if문만 사용할 경우에는 c:if test="조건"문으로 적지만 if-else문을 사용하고 싶을 경우엔 c:choose를 사용한다  -->
    <c:choose>    
      <c:when test="${num>=90}">A</c:when>   
      <c:when test="${num>=80}">B</c:when> 
      <c:when test="${num>=70}">C</c:when> 
      <c:when test="${num>=60}">D</c:when>
      <c:otherwise>F</c:otherwise>       
    </c:choose>
 
</body>
</html>