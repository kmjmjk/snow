<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가입 화면</title>
<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row" >
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
					<form action="b_joinSave.jsp" method="post" enctype="multipart/form-data">

						<table class="table table-boardered" >
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" name="id"
									placeholder="id를 입력하세요"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="form-control"
									name="pass1" placeholder="숫자 4자리 " ></td>
							</tr>

							<!-- <tr>
								<th>비밀번호확인</th>ss
								<td><input type="password" class="form-control"
									name="pass2"></td>
							</tr> -->

							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" name="name1"></td>
							</tr>

							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="tel" pattern="(010)-\d{3,4}-\d{4}"  title="ex) 010-1234-5678 ">
								</td>
							</tr>

							<tr>
								<th>성별</th>
								<td><input type="radio" name="gender" value="여자">여자
									&nbsp;&nbsp; <input type="radio" name="gender" value="남자">남자
									&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<th>직업</th>
								<td><select name="job" class="form-control">
										<option value="학생">학생</option>
										<option value="공무원">공무원</option>
										<option value="의사">의사</option>
										<option value="교사">교사</option>
								</select>
							</tr>
							<tr>
								<th>연령</th>
								<td><input type="radio" name="age" value="10">10대
									&nbsp;&nbsp; <input type="radio" name="age" value="20">20대
									&nbsp;&nbsp; <input type="radio" name="age" value="30">30대
									&nbsp;&nbsp; <input type="radio" name="age" value="40">40대
									&nbsp;&nbsp; <input type="radio" name="age" value="40">50대
									&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th>프로필</th>
								<td colspan="2" align="center"><input type="file" id="file" name="file1"
									onchange="handleFileSelect()"></td>
								<td rowspan="9">
									<div id="preview"></div>
								</td>
							</tr>
							<tr>
								<td colspan="2">&emsp;&emsp;&emsp;<input type="submit"
									class="btn btn-primary" value="가입"> <input
									type="reset" class="btn btn-danger" value="취소"></td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>
	<%-- <jsp:include page="bottom.jsp"></jsp:include> --%>
</body>
</html>