<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.315</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
내가 좋아하는 계절은 
<c:forEach var="season" items="${paramValues.season}">
  ${season}
</c:forEach>
</body>
</html>

