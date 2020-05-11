<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestEdit.jsp] </title>
	<style type="text/css">
	  *{ font-size: 14pt; font-weight: bold; }
	  a{ font-size: 14pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 14pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>
</head>
<body>
 <p>

   <div align="center">
    guestEdit.jsp <p>   <!--  guestEdit.jsp단독실행금지  -->
    
    <img src="images/failed1.PNG" width=300 height=150> <p>
   
	
	<form method="get" name="myform" action="gedit.tis">
	  수정사번: <input type="text" name="sabun" value="${dto.sabun}"  readonly> <br>
	  수정이름: <input type="text" name="name"  value="${dto.name}"> <br>
	  수정제목: <input type="text" name="title" value="${dto.title}"> <br>
	  수정급여: <input type="text" name="pay"  value="${dto.pay}"> <br>
	  수정메일: <input type="text" name="email" value="${dto.email }"><br>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="submit"  value="서브밋수정"> &nbsp;
	    <input type="reset" value="수정취소">
	</form>
	
	<p>
	<a href="index.jsp">[index]</a> 
  	<a href="glist.tis">[list]</a>
    <a href="guestWrite.jsp">[신규등록]</a>
    </div>
</body>
</html>






