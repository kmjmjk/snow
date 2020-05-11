<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
  <title>shop kim</title>
  <meta charset="utf-8">
  
 <c:if test="${id eq 'admin'}">   <!-- 관리자 로그인시 관리자헤더 -->
 <jsp:include page="admin_header.jsp"></jsp:include>
 </c:if> 
 
 <c:if test="${id == null || id !='admin'}">
 <jsp:include page="header.jsp"></jsp:include>
 </c:if>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>


  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/img1.png" alt="First slide" height="550">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/img2.png" alt="Second slide" height="550">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/img3.png" alt="Third slide" height="550">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br> <br> 
<div class="container">
  <h1>Service</h1>  
</div>
<br>
 <section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
						
							<div><img alt="hair" src="images/hair.png" width="120" height="150"></div>
							<div class="text mt-4">
							
								<h3>HAIR</h3>
								
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div><img alt="hair" src="images/make.png" width="120" height="150"></div>
							<div class="text mt-4">
								<h3 >MAKE-UP</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div><img alt="hair" src="images/wedding.png" width="120" height="150"></div>
							<div class="text mt-4">
								<h3 >WEDDING</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div><img alt="hair" src="images/nail.png" width="120" height="150"> </div>
							<div class="text mt-4">
								<h3 >NAIL</h3>
								<p >Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	<br><br><br><br>
        
<jsp:include page="footer.jsp"></jsp:include>
<br>
	
</body>

</html>
