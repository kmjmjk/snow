<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking_process2.jsp</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<style>
.title {
	margin-left: 30px;
}

#button1 {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

#button2 {
  background-color: #f44336; /* Red */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

.bookingBox {
	display: flex;
	justify-content: space-around ;
	align-items: center;
	text-align: center;
	background-color: powderblue;
}

.select {
	display: table;
	width: 650px;
	height: auto;
	margin-left: 20px;
	float: left;
	text-align: left;
	background-color: lightgray;
}

.widget {
	display: table-cell;
	vertical-align: top;
}

.controlgroup-vertical {
	width: 100%;
}

.check {
	display: table;
	width: 400px;
	height: 250px;
	margin-top: 100px;
	margin-left: 100px;
	float: left;
	text-align: left;
}

.chk_containter {
	display: table-cell;
	vertical-align: middle;
}

#tamount {
	height: 50px; 	
}

img {
	margin: 10px 10px 10px 20px;
	vertical-align: middle;
	clear: both;
}


</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( ".controlgroup" ).controlgroup()
    $( ".controlgroup-vertical" ).controlgroup({
      "direction": "vertical"
    });
  } );
</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="title">
		<h3> 예약 STEP2 </h3>
		<hr>
	</div>

	<div class="bookingBox">
		<form method="get" action="./bkprocess3.do">
			<div class="select">
				<div class="widget">
  <h3> 원하시는 디자이너를 선택하세요. </h3>
  
    <div class="controlgroup-vertical">
      <c:forEach var="stlt" items="${slist}" varStatus="status">
      <label for="${stlt.spos}">${stlt.sname}<br><img src="./storage/${stlt.spicture}" width="100" height="100" >
      <input type="radio" name="sstylist" id="${stlt.spos}" value="${stlt.sname}&${stlt.sprice}&${stlt.sdayoff}"> ${stlt.sprofile}   </label>
      </c:forEach>  
    </div>
</div>
			</div>
			<div class="check">
				<div class="chk_container">
					<div id="tamount"> 
					<input type="text" name="sname" value="${assistant}">
					선택하신 디자이너는: <span id="stylist">_______</span> 쌤이고, 예상 비용은: <span id="ttprice">_________</span> 입니다. 계속하려면 다음을 누르세요. </div> 
					<br>
					<input type="submit" name="button1" id="button1" value="다음으로"> <p>
					<input type="button" name="button2" id="button2" value="이전으로"> 					
				</div>
			</div>
		</form>
	</div>
</body>
</html>