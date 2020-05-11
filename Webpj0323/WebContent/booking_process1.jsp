<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking_process1.jsp</title>
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
	width: 500px;
	height: 250px;
	float: left;
	text-align: left;
	align-content: center;
}

#accordian {
	display: table-cell;
	vertical-align: middle;
	align-items: center;
}

.check {
	display: table;
	width: 500px;
	height: 300px;
	margin-top: 50px;
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

</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$( function() {
    var icons = {
      header: "ui-icon-circle-arrow-e",
      activeHeader: "ui-icon-circle-arrow-s"
    };
    $( "#accordion" ).accordion({
      icons: icons,
      heightStyle: "content",
      active: false,
      collapsible: true
    });
    $( "#toggle" ).button().on( "click", function() {
      if ( $( "#accordion" ).accordion( "option", "icons" ) ) {
        $( "#accordion" ).accordion( "option", "icons", null );
      } else {
        $( "#accordion" ).accordion( "option", "icons", icons );
      }
    });
    $( "input" ).checkboxradio();
  } );
  

</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="title">
		<h3>예약 STEP1 </h3>
		<hr>
	</div>

	<div class="bookingBox">
		<form id="form" method="get" action="bkprocess2.do">
			<div class="select">
			   <h3>원하시는 서비스를 선택하세요. (중복가능)</h3><br>
			   
				<div id="accordion">
					<h3>커트</h3>
  <div>
    <p>
    <c:forEach var="s1" items="${service1}" varStatus="status" >
    <label for="check${status.count}">${s1.mservice}</label>
    <input type="checkbox" name="service" id="check${status.count}" value="${s1.mservice}&${s1.mprice}&${s1.mdtime}">
    </c:forEach>
    </p>
  </div>
  <h3>펌</h3>
  <div>
    <p>
    <c:forEach var="s2" items="${service2}" varStatus="status" >
    <label for="check${status.count+3}">${s2.mservice}</label>
    <input type="checkbox" name="service" id="check${status.count+3}" value="${s2.mservice}&${s2.mprice}&${s2.mdtime}">
    </c:forEach>
    </p>
  </div>
  <h3>염색</h3>
  <div>
    <p>
    <c:forEach var="s3" items="${service3}" varStatus="status" >
    <label for="check${status.count+5}">${s3.mservice}</label>
    <input type="checkbox" name="service" id="check${status.count+5}" value="${s3.mservice}&${s3.mprice}&${s3.mdtime}">
    </c:forEach>
    </p>
  </div>
  <h3>기타</h3>
  <div>
    <p>
    <c:forEach var="s4" items="${service4}" varStatus="status" >
    <label for="check${status.count+7}">${s4.mservice}</label>
    <input type="checkbox" name="service" id="check${status.count+7}" value="${s4.mservice}&${s4.mprice}&${s4.mdtime}">
    </c:forEach>
    </p>
  </div>
				</div>
			</div>
			<div class="check">
				<div class="chk_container">
					<div id="tamount">
					<input type="text" name="sname" value="${assistant}">
					선택하신 서비스는: <span id="sservices"></span> 이고, 예상 비용은: <span id="ttprice">_____</span>  원입니다. 계속하려면 다음을 누르세요. </div> 
					<br>
					
					<input type="submit" name="button1" id="button1" value="다음으로"> <p>
					<input type="button" name="button2" id="button2" value="메인으로"> <p>
					 
				</div>
			</div>
		</form>
	</div>
</body>
</html>