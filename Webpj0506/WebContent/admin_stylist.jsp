<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일관리</title>
<jsp:include page="admin_header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

#style1{margin:180px;}
-body,h1,h2,h3,h4,h5,h6 {font-family: "돋움", sans-serif; font-weight: bolder;} 
.w3-bar-block .w3-bar-item {padding:20px}

.button {
  background-color: #e7e7e7;
  border: none;
  color: white;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.btn{
	margin-top:50px;
	margin-left: 510px;
}
</style>
<title>디자이너</title>
</head>
<body>
<br><br><br><br><br><br><br><br>
<section>
			<div class="container">
			
				<div class="row">
				<c:forEach var="stlt" items="${slist}" varStatus="status">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div><img alt="hair" src="./storage/${stlt.spicture }" width="120" height="150"></div>
							<div class="text mt-4">
								<h3>${stlt.sname}</h3>
								<hr>
								<p>${stlt.sprofile }</p>
							</div>
						</div>
					</div>	
				</c:forEach>
				</div>
				 <input type="button" class="btn btn-outline-secondary" value="신규등록" onclick="location.href='s_register.jsp'"> 
			</div>
		</section>

<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>