<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.364</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		//movieList라는 배열을 생성해주었다 
		String[] movieList = { "타이타닉", "시네마천국", "혹성탈출", "킹콩" };
		pageContext.setAttribute("movieList", movieList);
	%>
	<ul>
		<c:forEach var="movie" items="${movieList}" varStatus="st">
			<c:choose>
				<c:when test="${st.first}">
					<li style="font-weight: bold; color: red;">${movie}</li>
				</c:when>
				<c:when test="${st.last}">
					<li style="font-weight: bold; color: green;">${movie}</li>
				</c:when>
				<c:otherwise>
					<li style="font-weight: bold; color: blue;">${movie}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
		
	<c:forEach var="movie" items="${movieList}" varStatus="st">
	  ${movie} <c:if test="${not st.last}">,</c:if>  <!-- 마지막이 아닐 경우에는 , 하나 반복될때마다 콤마가 들어가게 해주었다 얘를 쓸때도 EL언어로 써야하는 점 유의 -->
	</c:forEach>
</body>
</html>

