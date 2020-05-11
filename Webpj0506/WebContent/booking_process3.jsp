<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking_process3.jsp</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	width: 65%;
	height: auto;
	margin-left: 20px;
	float: left;
	text-align: left;
}

.widget {
	display: table-row;
	vertical-align: top;
}



#datepicker {
	display: table-cell;
	margin: 10px;
}

#timeselector {
	display: table-cell;
	margin: 10px;
}

.check {
	display: table;
	width: 30%;
	height: 250px;
	margin-top: 100px;
	margin-left: 20px;
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

#datepicker2 {
	margin: 10px 10px 10px 0px;
}


img {
	margin: 10px 10px 10px 20px;
	vertical-align: middle;
}

label {
	margin: 5px;
}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$.fn.timeSelect = function(){
		//alert("test1");
		var dt = $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd'}).val();
		$.ajax({
			"url" : "timetable.do",
			"type" : "get",
			//"data" : { assistant: $('#sstylist').val(), date: $('#datepicker').datepicker('getDate')} ,
			"data" : { assistant: $('#sstylist').val() , date: dt },
			"success" : function(data){ 
				//alert(data); //가능은 Y, 불가는 N
				//$('input:radio[name=stime]:first').attr("disabled", "true"); //이렇게 하면 버튼이 안먹히긴 하는데 모양은 그대로임
				//$('input:radio[name=stime]:first').css("opacity", 0.6); //전혀 반영이 안됨
				//$('#radio-4').checkboxradio("disable");
				//$('.cbradio:first').checkboxradio("disable");
				$('.cbradio').checkboxradio("enable"); // 시간선택버튼 초기화
				var t = data.split(",");
				var i = 0;
				$('.cbradio').each(function(){
					if(t[i]=="N"){
						$(this).checkboxradio("disable");	
					} else {
						$(this).checkboxradio("enable");
					}
					i++
				});
			},
			"error" : function(data){
				alert("뭔가 잘못됐나봄");
			}
		});
	}

	$(function() {
		$('#datepicker').datepicker(
				{
					minDate : new Date(), //선택 가능한 최소 날짜(오늘로 세팅)
				    maxDate : '+1m', //최대 언제까지 선택 가능한지.(한달로 세팅)
					//       numberOfMonths: [1, 2], //표시되는 달력 갯수 1행x2열
					dateFormat : 'yy-mm-dd',  
					//language : 'kr',
					prevText : '이전 달', // '<' 화살표 누르면 이전 달이라고 말풍선
       				nextText: '다음 달', // '>' 화살표 누르면 다음 달이라고 말풍선
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ], //월 표시 한글로
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //요일 표시 한글로
					showMonthAfterYear : true, // true : 년 월  false : 월 년 순으로 보여줌
					yearSuffix : '년', //2020 뒤에 '년' 붙임
					showButtonPanel : true, // 누르면 오늘이 있는 월로 가는 [Today]버튼 활성화
					//       datesDisabled: ['20-03-28', '20-04-21'],
					//       daysOfWeekDisabled: "1",
					//beforeShowDay: function(date){
					//	var day = date.getDay();
					//	return [(day != 0 && day != 6)];
					//}, //이건 미용실 자체 휴무로 강제로 줄 때
					beforeShowDay : function(date) { //특정 요일 비활성화 (여기서는 디자이너별 휴무요일 선택 안되도록)
				          var str = $('#dayoffs').val(); //해당 디자이너의 오프요일을 받아옴
				      		var day = date.getDay();
				          var len = str.length;
				          if( len ==1 ){ //일주일에 하루만 쉴 경우
				          	var a = str.charAt(0)*1;
				            	if( day == a ){
				              	return [false, "off"]
				              } else { 
				              		return [true, "work"]
				              }
				          } else if (len == 2) { //일주일에 이틀을 쉴 경우
				          		var b = str.charAt(0)*1;
				              var c = str.charAt(1)*1;
				              if(day == b || day == c ){
				              	return [false, "off"]
				              } else {
				              	return [true, "work"]
				              }
				          }
				  	}, 
					onSelect : function(dateText) { //날짜를 선택했을 때 
						$('#datepicker2').datepicker("setDate",
								$(this).datepicker("getDate"));
						$.fn.timeSelect();
						$('#showdate').html("선택하신 날짜는: " + dateText + " 입니다.");
						$('#selected_date').html(dateText+" ");
					}
				}); //datepicker end
	});

	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : "yy-mm-dd" //날짜 포맷변경을 위해 추가
		});	
	});

	$(function() {
		$("input").checkboxradio({
			icon : false
		});
	});	
</script>
<script type="text/javascript">
function selectedTm(){
	//alert("changed!");
	var check_count = document.getElementsByName("stime").length;
	for (var i=0; i<check_count; i++) {
		if (document.getElementsByName("stime")[i].checked == true) {
		var t = document.getElementsByName("stime")[i].value;
		//console.log(t);
		var p = ${ttp+extra};
		document.getElementById("selected_time").innerHTML=t+" 에 방문하실 예정입니다.";
		document.getElementById("total_price").innerHTML="총 예상비용은 "+p.toLocaleString()+"원 입니다.";
		}
	}
}
</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="title">
		<h3>예약 STEP3</h3>
		<hr>
	</div>

	<div class="bookingBox">
		<form method="get" action="bkprocess4.do">
			<div class="select">
				<h3>방문하실 날짜를 선택하세요.</h3><br>
				<div align="left"> ${last}쌤의 휴무일은 ${offinfo}  입니다.</div><br>
				<div class="widget">
					
					<div id="datepicker"></div>
					<div id="timeselector">
						<span id="showdate">방문하실 날짜를 먼저 선택하세요. </span>
					    <p>
						<label for="radio-1">10:00</label> 
						<input type="radio" name="stime" id="radio-1" class="cbradio" value="10:00" onchange="selectedTm()"> 
						<label for="radio-2">11:00</label>
						<input type="radio" name="stime" id="radio-2" class="cbradio" value="11:00" onchange="selectedTm()"> 
						<label for="radio-3">12:00</label> 
						<input type="radio" name="stime" id="radio-3" class="cbradio" value="12:00" onchange="selectedTm()"> <br>
						<label for="radio-4">13:00</label> 
						<input type="radio" name="stime" id="radio-4" class="cbradio" value="13:00" onchange="selectedTm()"> 
						<label for="radio-5">14:00</label>
						<input type="radio" name="stime" id="radio-5" class="cbradio" value="14:00" onchange="selectedTm()"> 
						<label for="radio-6">15:00</label> 
						<input type="radio" name="stime" id="radio-6" class="cbradio" value="15:00" onchange="selectedTm()"> <br>
						<label for="radio-7">16:00</label> 
						<input type="radio" name="stime" id="radio-7" class="cbradio" value="16:00" onchange="selectedTm()"> 
						<label for="radio-8">17:00</label>
						<input type="radio" name="stime" id="radio-8" class="cbradio" value="17:00" onchange="selectedTm()"> 
						<label for="radio-9">18:00</label> 
						<input type="radio" name="stime" id="radio-9" class="cbradio" value="18:00" onchange="selectedTm()"> <br>						
						</p>
					</div>
				</div>
			</div>
			<div class="check">
				<div class="chk_container">
					<!-- 테스트 할 때는 text로 두고 나중에 완료되면 hidden으로 바꿔줄꺼야(데이터는 여기서 넘겨야 함) -->
					<input type="hidden" id="sstylist" value="${last}" size="10">
					<input type="hidden" id="dayoffs" value="${off}" size="10">
					<input type="hidden" id="datepicker2" name="sdate" size="10"><br>
					<div id="tamount"> 
					<span id="selected_date"></span><span id="selected_time"></span><span id="total_price"></span><br> 
					계속하시려면 '다음으로' 버튼을 누르세요.
					</div>
					<br> <input type="submit" name="button1" id="button1"
						value="다음으로">
					<p>
						<input type="button" name="button2" id="button2" value="이전으로">
				</div>
			</div>
		</form>
	</div>
</body>
</html>