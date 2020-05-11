<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- servelt p.346 참고 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.349.jsp</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
<c:catch>  <!-- catch를 사용하여 예외처리 --(결과)-> value에 숫자가 아닌 문자값을 주었더니 오류 출력이 되었다 -->
	<c:set var="dan" value="${a}" />  <!-- EL언어로 작성하면 오류가 null로 표현되지만 그냥 a를 적으면 ax1=  이런식으로 오류를 알려준다-->
	<c:forEach var="i" begin="1" end="9" step="1">  
   ${dan}x${i}=${dan*i}<br>
	</c:forEach>
</c:catch>	
<hr>
	<c:set var="dan" value="7" />
	<c:forEach var="i" begin="1" end="9" step="1">
		<c:if test="${i le 5}">${dan}x${i}=${dan*i}<br></c:if>
		<!-- le는 <=와 같은뜻 / i가 5일때까지만 출력되게(i가5일때 break) -->
	</c:forEach>
<hr>
	<c:set var="like" value="커피,디저트,아이스,초콜릿" />
	<c:forTokens var="li" items="${like}" delims=",">
     ${li}
   </c:forTokens>
</body>
</html>




