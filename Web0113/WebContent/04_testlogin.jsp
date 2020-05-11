<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL317page</title>
	<style type="text/css">
		*{font-size:12pt; font-weight:bold; font-family:돋움;}
		a{font-size:12pt; text-decoration:none; color:blue; front-family:Comic Sanc MS;}	
		a:hover{font-size:12pt; text-decoration:underline; color:purple; front-family:Comic Sanc MS;}						
	</style>

	<script type="text/javascript">
	</script>
</head>
<body>
	당신이 입력한 정보입니다 (고전적 방식) <br>
	아이디 : <%=request.getParameter("id") %>
	비밀번호 : <%= request.getParameter("pwd") %>
	<hr>
	당신이 입력한 정보입니다 (EL방식)<br> 
	아이디 :${param.id}
	비밀번호 : ${param["pwd"]}<br><br>  <!-- param.받을 값  // 혹은  param["받을 값"] 두가지로 적을 수 있다 -->
	<a href="JSTL01.jsp">[로그인페이지로 이동]</a>
 
</body>
</html>