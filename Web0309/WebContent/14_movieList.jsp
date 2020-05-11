<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieList p.363</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
  <%  //movieList라는 배열을 생성해주었다 
	String[] movieList = {"타이타닉", "시네마천국", "혹성탈출", "킹콩"}; 
	//pageContext.setAttribute("movieList", movieList);  //pageContext를 이용한 방법과 아래 request.setAttribute 모두 알아 놓을 것
	request.setAttribute("movieList", movieList);
  %>
  <table border="1" style="width:100%; text-align:center;">
  <tr>
  <th>index</th> <th>count</th> <th>title</th>
  </tr>
  <c:forEach var="movie" varStatus="st" items="${movieList}">  <!-- 배열, 컬렉션 같은 인덱스가 필요한경우 varStatus속성을 사용한다 -->
  <tr>
    <td>${st.index}</td>
    <td>${st.count}</td>
    <td>${movie}</td>
   </tr> 
  </c:forEach>
  </table>
 <%--  
  <c:forEach var="movie" items="${movieList}">  <!-- items로 값을 전달-->
    ${movie}<br>  <!-- movie라는 변수에 저장된 값을 불러온다 -->
  </c:forEach>  <!-- forEach를 사용하여 배열이나 집합체(여러 값이 저장되어있는 것)을 불러 올 수 있다 -->    --%>
</body>
</html>