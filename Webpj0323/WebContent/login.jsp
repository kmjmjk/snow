<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login page</title>
	<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.ftco-section{
	background-color:#EEEEEE	;

	margin-left: 650px;
	margin-right: 650px;
	
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	padding-bottom: 25px;
}

</style>
</head>
<body>
<br><br><br><br><br><br><br><br>
<section class="ftco-section">
<div class="container">
  <h2>Login</h2>
  <form action="login.do" method="get">
    <div class="form-group">
      <label for="email">ID</label>
      <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="username">
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pass">
    </div>
   
    <button type="submit" class="btn btn-primary" id="btlogin">로그인</button>
  </form>
</div>
</section>
<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
