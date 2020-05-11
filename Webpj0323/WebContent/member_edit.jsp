<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>가입 화면</title>

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
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<script>
		function DaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('add1').value = fullRoadAddr; //도로명
					//document.getElementById('address2').value = data.jibunAddress; //지번주소
				}
			}).open();
		}//daumpost end
	</script>
	<br>
	<br>
	<br>
	<br>
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-12">
					<form action="memEdit.do" method="get" >

						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" 
									name="id" id="id" placeholder="id를 입력하세요" onblur="id_check()"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="form-control" 
									name="pw" placeholder="숫자 4자리 "></td>
							</tr>

							 <tr>
								<th>비밀번호확인</th>
								<td><input type="password" class="form-control" 
									name="pw2" placeholder="다시한번 입력하세요"></td>
							</tr> 

							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" 
									name="name"></td>
							</tr>

							<tr>
								<th>성별</th>
								<td><input type="radio" id="gender" name="gender"
									value="여자">여자 &nbsp;&nbsp; <input type="radio"
									 name="gender" value="남자">남자 &nbsp;&nbsp;</td>
							</tr>

							<tr>
								<th>생년월일</th>
								<td>
								<script type="text/javascript">
								
									var today = new Date();
									var toyear = parseInt(today.getYear());
									var start = (toyear + 1900);
									var end = (toyear + 1900) - 76;

									document
											.write("<font size=2><select id=year name=year>")
									document
											.write("<option value='' placeholder= 년 selected>");
									for (i = start; i >= end; i--)
										document.write("<option>" + i);
									document.write("</select>년 ");

									document
											.write("<select id=month name=month>");
									document
											.write("<option value='' placeholder= 월 selected>");
									for (i = 1; i <= 12; i++)
										document.write("<option>" + i);
									document.write("</select>월 ");

									document.write("<select id=day name=day>");
									document
											.write("<option value='' placeholder= 일 selected>");
									for (i = 1; i <= 31; i++)
										document.write("<option>" + i);
									document.write("</select>일 ");
								</script></td>
							</tr>
							<tr>
							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="tel"
									pattern="(010)-\d{3,4}-\d{4}" title="ex) 010-1234-5678 " placeholder="'-'을 넣어서 입력하세요">
								</td>
							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"
									placeholder="sky@tis.net 형식으로 입력하세요">
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="button" class="form-control"
									onclick="DaumPostcode()" value="우편번호"> <input
									type="text" class="form-control" id="zipcode" name="zipcode"
									placeholder="우편번호">

									<p>
										<input type="text" class="form-control" id="add1" name="add1"
											placeholder="주소">
									<p>
										<input type="text" class="form-control"  name="add2"
											placeholder="상세주소"><br></td>
							</tr>
							<tr>
								<td colspan="2">&emsp;&emsp;&emsp;<input type="submit"
									class="btn btn-primary" value="가입"> <input type="reset"
									class="btn btn-danger" value="취소"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>