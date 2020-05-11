<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="upload.do" method="post" enctype="multipart/form-data">  <!-- 파일전송을 할 때는 method post 방식을 사용 enctpye="multipart/form=data"지정 필수 action에 서블릿 연결 -->
    글쓴이: <input type="text" name="name"><br>
    제 &nbsp; 목 : <input type="text" name="title"><br>
    파일 지정하기 : <input type="file" name="uploadFile"><br>  <!-- 파일의 이름을 지정해서 서블릿으로 연결하기 위한 변수 -->
  <input type="submit" value="전송">
</form>

</body>
</html>