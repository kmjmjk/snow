<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWrite.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 18pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 20pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	
	</script>
</head>
<body>
	guestWrite.jsp <p>
	<form method="post" encType="multipart/form-data" name="myform" action="ginsert.tis" >
		사번: <input type="text" name="sabun"><br>
		이름: <input type="text" name="name" value="LEE" > <br>
		제목: <input type="text" name="title" value="spring"> <br>
		급여: <input type="text" name="pay"  value="72"> <br>
		메일: <input type="text" name="email" value="pk@DK.org"> <br>
		      <input type="file" name="uploadFile"><br>
		    <input type="submit" value="서브밋저장"> &nbsp;
		    <input type="reset" value="입력취소">
	</form>
	
	<p>
	<a href="index.jsp">[index]</a> 
  	<a href="guestWrite.jsp">[신규등록]</a>
  	<a href="game.tis">[서블릿]</a>
  	<a href="glist.tis">[list]</a>
  	<a href="naver">[naver]</a>
  	<a href="daum">[daum]</a>
  		
</body>
</html>






