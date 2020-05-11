<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>my_bookings.jsp 예약 확인</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table {
	margin: 2px;
}

th, td {
	padding-left: 30px;
}

.leftcolumn {   
  float: left;  
  width: 50%;
  padding: 20px;
}

.rightcolumn {
  float: left;
  width: 30%;
  background-color: #f1f1f1;
  padding-left: 20px;
}

.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 15px;
}

.card {
  background-color: white;
  padding: 20px;
  margin-top: 30px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>

<script type="text/javascript">

</script>


</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<div class="row justify-content-md-center">
  <div class="leftcolumn">
    <div class="card" style="display:<c:out value="${cnt > 0?'block;':'none;'}" />">
      <h2>예약 확인</h2>
      <h5>총 ${cnt } 건의 예약이 있습니다.</h5>
      <div class="fakeimg" style="height:'auto';" >
      	<table class="w3-table-all w3-card-4">
			<tr>
			<td  colspan="2"><i>Booking No. ${dto.bknum}</i><hr></td>
			</tr>
			<tr>
			<th>예약자ID: </th><td> ${dto.bkid} </td>
			</tr>
			<tr>
			<th>방문 날짜: </th><td> ${dto.bkvisitdate} </td>
			</tr>
			<tr>
			<th>예약 시간: </th><td> ${dto.bktime} </td>
			</tr>
			<tr>
			<th>담당자 명: </th><td> ${dto.bkstylist } </td>
			</tr>
			<tr>
			<th>시술 메뉴: </th><td> ${dto.bkservice } </td>
			</tr>
			<tr>
			<th>예상 가격: </th><td> ${dto.bktcost }원 </td>
			</tr>
			<tr>
			<th>소요 시간: </th><td> 약 ${dto.bkdtime }분 </td>
			</tr>
			<tr></tr>
		</table>
      </div>
      <p>** 가장 최근의 예약만 조회됩니다. </p>     
    </div>
    <div class="card" style="display:<c:out value="${cnt eq 0?'block;':'none;'}" />">
      <h2>예약 확인</h2>
      <h5>예약한 내역이 존재하지 않습니다.</h5>
      <div class="fakeimg" style="height:200px;">
      	** 예약한 내용이 보이지 않은 경우 정상적으로 예약이 되지 않은 것이므로 다시 예약하시거나 전화 부탁드립니다.
      </div>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h3>주소 및 연락처</h3>
      <div class="fakeimg" style="height:100px;">
      	<p>서울 영등포구 선유동 2로 이화빌딩 2층<br>
           (당산역 12번 출구에서 약 200m)<br>
                      영업시간: 10:00AM ~ 7:00PM </p>
      </div>
      <p>** 예약 취소 및 변경 사항이 있을 경우 02-123-1234로 전화 주세요.</p>
    </div>
    <div class="card">
      <h3>찾아오시는 길..</h3>
      <div class="fakeimg">
      	<!-- * 카카오맵 - 지도퍼가기 -->
		<!-- 1. 지도 노드 -->
		<div id="daumRoughmapContainer1586851972997" class="root_daum_roughmap root_daum_roughmap_landing"></div>

		<!-- 2. 설치 스크립트 * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
		<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

		<!-- 3. 실행 스크립트 -->
		<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1586851972997",
			"key" : "xwkp",
			"mapWidth" : "300",
			"mapHeight" : "280"
		}).render();
		</script>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<br>
</body>
</html>