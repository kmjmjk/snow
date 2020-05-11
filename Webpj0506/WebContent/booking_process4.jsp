<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking_process4.jsp</title>
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
	width: 44%;
	height: 250px;
	float: left;
	text-align: left;
	align-content: center;
}

.widget {
	display: table-cell;
	vertical-align: middle;
	align-items: center;
}

.check {
	display: table;
	width: 44%;
	height: 300px;
	margin-top: 50px;
	margin-left: 100px;
	float: left;
	text-align: left;
}

.chk_containter {
	display: table-cell;
	vertical-align: top;
}

#tamount {
	height: 40px; 	
}

img {
	margin: 10px 10px 10px 20px;
	vertical-align: middle;
}

table {
	margin: 0 auto;
	width: 90%;		
}

td {
	text-align: left;
	padding: 10px;
	border-bottom: 1px solid gray;
}

th {
	padding: 10px;
	border-left: 5px solid dodgerblue;
}


</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="title">
		<h3> 예약 STEP4 </h3>
		<hr>
	</div>

	<div class="bookingBox">
		<form method="get" action="bkprocess5.do">
			<div class="select">
			<div class="widget">
  <h3> 예약 내용을 확인하세요. </h3>
  
  <table id="summary">
  	<tr>
  		<th>방문날짜</th>
  		<td>${ldate}</td>
  	</tr>
  	<tr>
  		<th>방문시간</th>
  		<td>${ltime}</td>
  	</tr>
  	<tr>
  		<th>디자이너</th>
  		<td>${last} 쌤</td>
  	</tr>
  	<tr>
  		<th>시술메뉴</th>
  		<td>${srvs}</td>
  	</tr>
  	<tr>
  		<th>예상가격</th>
  		<td>시술가: ${ttp}원, 추가금: ${extra}원</td>
  	</tr>
  	<tr>
  		<th>소요시간</th>
  		<td>${tdt}분</td>
  	</tr>
  	
  	
  	
  </table>
  </div>
			</div>
			<div class="check">
				<div class="chk_container">
					<div id="tamount"> 내용이 맞으면 [예약확인]을, 처음부터 다시 예약하시려면 [예약취소] 버튼을 눌러주세요. </div> 
					<br>
					<input type="submit" name="button1" id="button1" value="예약확인"> <p>
					<input type="button" name="button2" id="button2" value="예약취소"> 					
				</div>
			</div>
		</form>
	</div>
</body>
</html>