<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp] </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">	
	  function clearText(){
		document.myform.keyword.value="";
		document.myform.keyword.focus="";
	  }
	</script>
</head>
<body>
<!-- 단독실행시 값이 넘어오지 않는다 -->
 <table width=900 border=1 cellspacing=0>
 	<tr align="right">
 		<td colspan="6">
 		   <a href="index.jsp">[index]</a>
 		   <a href="glist.tis">[list]</a>
 		   <a href="guestWrite.jsp">[등록]</a> &nbsp;&nbsp;
 		    레코드갯수: ${Atotal}/${Gtotal} &nbsp; <!-- ListController에서  Gtotal의 값을 전달받았다 -->
 		</td>
 	</tr>
 
 	<tr bgcolor="pink">
 	 <td>행번호</td> <td>사 번</td> <td>이 름</td> <td>제 목</td> <td>날 짜</td> <td>조회수</td>
 	</tr>
 	
 	<c:forEach var="bean" items="${LG}">   <!-- LG가 데이터를 갖고있다 ListController에서 LG라는 변수로 값을 받아왔다 --> 
 	 <tr>   
 		<td> ${bean.rn} </td>
 		<td> ${bean.sabun} </td>
 		<td> ${bean.name}  </td>
 		<!-- <td> <a href="gdetail.tis?idx=${bean.sabun}"> ${bean.title} </a></td>  --><!-- 제목을 클릭하면 DetailController로 넘어가게 a태그를 해주었다 --> 
 		<td> <a href="gdetail.tis?Gidx=${bean.sabun}">${bean.title} <c:if test="${bean.rcnt>0}"><font color="black";>[${bean.rcnt}]</font></c:if> </a></td>
 		<td> ${bean.wdate}  </td>
 		<td> ${bean.hit}  </td>
 	 </tr>	
 	</c:forEach> 
 
  <tr align="center">
  	<td colspan="6">
  	    
  	<c:if test="${startpage!=1}"><a href="glist.tis?pageNum=${startpage-10}${returnpage}">[이전]</a></c:if>    
  	<c:forEach var="i" begin="${startpage}" end="${endpage}">
  	  <c:choose>
  	    <c:when test="${i==pageNUM}"><a href="glist.tis?pageNum=${i}${returnpage}"><font style="color:red; font-size:16pt;">[${i}]</font></a></c:when>
  	    <c:otherwise><a href="glist.tis?pageNum=${i}${returnpage}">[${i}]</a></c:otherwise>
  	  </c:choose>
  	</c:forEach> 	
  	<c:if test="${endpage<pagecount}"><a href="glist.tis?pageNum=${startpage+10}${returnpage}">[다음]</a></c:if>
  	
    </td>
  </tr>
  
  <tr align="center">
  	<td colspan="6">
  	  <form name="myform" action="glist.tis">
  	  	  검색 :     
  	  	 <select name="keyfield" onchange="clearText();">  
  	  	 	<option value="">----선택---- </option>
  	  	 	<option value="name"<c:if test="${skey eq'name'}" >selected</c:if>>이름</option>
  	  	 	<option value="title" <c:if test="${skey eq'title'}" >selected</c:if>>제목</option>
  	  	 	<!-- <option value="">내용필드</option>
  	  	 	<option value="">전체출력</option> -->
  	  	 </select>
  	  	 <input type="text" name="keyword" value="${sval}" size=10>
  	  	 <input type="submit" value="검색">
  	  </form>
  	</td>
  </tr>
 </table>
   
</body>
</html>

