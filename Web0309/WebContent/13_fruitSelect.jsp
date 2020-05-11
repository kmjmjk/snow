<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aaa.jsp</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<c:choose>
	 <c:when test="${param.fruit == 1}">
	   <span style="color : red;">사과</span>
	 </c:when>
	 <c:when test="${param.fruit == 2}">
	   <span style="color : green;">메론</span>
	 </c:when>
	 <c:when test="${param.fruit == 3}">
	   <span style="color : yellow;">바나나</span>
	 </c:when>
	</c:choose>

</body>
</html>