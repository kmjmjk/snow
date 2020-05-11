<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>

<html>
<head>
<title>login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<style>
.first {
	align: center;
	margin-top: 20px;
	padding-bottom: 25px;
	margin-left: 620px;
	margin-right: 620px;
	background-color: hsl(217, 43%, 93%);
}
</style>
</head>
<body>
	<jsp:include page="b_header.jsp">
		<jsp:param value="6" name="active"/>
	</jsp:include>	
	<div style="width: 350px; height:500px;margin:auto">
		<form action="blogin_save.jsp" method="post">
			<div class="form-group"
				style=" text-align: left;">
				<label for="usr">ID:</label> <input type="text" class="form-control"
					id="id" name="id">
			</div>
			<div class="form-group"
				style=" text-align: left;">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pass" name="pass1"
					placeholder="숫자 4자리">
			</div>
			<div style="text-align: center">	
			<button type="submit" class="btn btn-primary">로그인</button>			
		</div>
		</form>
	</div>	
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>