<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestDetail.jsp] </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>

<table width='700' border='1' cellspacing='0' cellpadding=5>
  <tr align="center">
    <td colspan="2"> [${dto.name}님] 상세데이터 출력 </td>
  </tr>
  
  <tr>
  	<td rowspan="5"  align="center" width=300> 
  	  <img src="images/hydran.png" height=200 width=300> 
  	</td>
  	<td> 사번 : ${data}  </td>
  </tr>
  
  <tr> <td> 제목 : ${dto.title} </td>  </tr>
  <tr> <td> 날짜 : ${dto.wdate} </td>  </tr>
  <tr> <td> 급여 : ${dto.pay}</td>  </tr>
  <tr> <td> 메일 : <a href="mailto:${dto.email}"> ${dto.email} </a> </td>  </tr>
  
  <tr align="center">
  	<td colspan="2">  
  		<a href="guestWrite.jsp">[등록]</a>
  		<a href="gdelete.tis?idx=${dto.sabun}">[삭제]</a> <!-- sabun값을 불러와야 값이 넘어가서 삭제가 된다 -->
  		<a href="gpreedit.tis?idx=${dto.sabun}">[수정]</a>
  		<a href="glist.tis">[list]</a>
  		<a href="index.jsp">[index]</a>
  	</td>
  </tr>
</table> 
 
 <p>	
	<jsp:include page="guest_reply.jsp">
 		<jsp:param value="${dto.sabun}" name="Gidx"/>
 	</jsp:include>
</body>
</html>












