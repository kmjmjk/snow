<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<title> [test4_Save.jsp]</title>
   <style type="text/css">
	  *{font-size:16pt; font-weight:bold;  font-family: Comic Sans MS ; margin-left: 10px; }
	  a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
<hr> &nbsp;&nbsp;결과 보기<hr>

 <% //기본 test4_Form.jsp 파일에서 사용했던 방법 긁어온거임
  String[] animal=request.getParameterValues("item");
  for(String item:animal){
	 out.write("<img src=images/"+item+".png  width=150 height=100>");
  }
 %>
 <br>
 <c:forEach var="img" items="${paramValues.item}" varStatus="st">  <!-- paramValues는 파라미터값을 배열로 넘겨올때 사용 -->
   <img src="images/${img}.png" width=150 height=100>
 </c:forEach>
 
<br>
 <c:forEach var="item" items="${paramValues.item}" varStatus="st">
   ${item} <c:if test="${not st.last}">, </c:if>
 </c:forEach>
 
</body>
</html>




