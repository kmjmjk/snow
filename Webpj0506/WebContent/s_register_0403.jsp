<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s_register.jsp</title>
<style>
table {
	border-collapse: collapse;
	width: 90%;
}

td {
	border: 1px solid black;
}

.wrapper {
	width: 1000px;
	margin: 0 auto;
	background-color: powderblue;
}

label {
	display: block;
	width: 80px;
}

</style>

<script type="text/javascript" src="js/jquery.min.js"></script>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<br>

<div class="wrapper">

<div align="center"> <h3>디자이너 등록 Form</h3> </div>
<br>
<form name="sform" method="post" enctype="multipart/form-data" action="sinsert.do">
	<div align="center">
		<table>
			<tr><th colspan="4" align="left"><font style="color:red;"> * 표시는 필수 </font></th></tr>
			
			<tr>
				<td>디자이너ID *</td>
				<td colspan="2">
					<input type="text" name="sid" id="sid" placeholder="영문, 숫자로 이루어진 6~12자리의 아이디를 입력하세요.">
					&nbsp; <input type="button" value="중복체크">
				</td>
				<td rowspan="3" width="200"><div id="showpic"><img src="./images/No_Picture.jpg" width="200" height="200"></div></td>
			</tr>
			<tr>
				<td>이름 *</td>
				<td colspan="2"><input type="text" name="sname" id="sname"></td>
			</tr>
			<tr>
				<td>전화번호 *</td>
				<td colspan="2">
				<input type="text" size="4" name="num1" maxlength="4" value="010">-
				<input type="text" size="4" name="num2" maxlength="4">-
				<input type="text" size="4" name="num3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>직급 *</td>
				<td colspan="3" align="justify" >
				<label><input type="radio" name="spos" value="owner">원장</label>
				<label><input type="radio" name="spos" value="master">실장</label>
				<label><input type="radio" name="spos" value="lead">수석</label>
				<label><input type="radio" name="spos" value="associate">일반</label>
				</td>
			</tr>
			<tr>
				<td>기본가격 </td>
				<td colspan="3"><input type="text" name="sprice" id="sprice" value="15000" size="10" >원</td>
			</tr>
			<tr>
				<td>근무일 * </td>
				<td colspan="3">
				<label><input type="checkbox" name="swdays" value="mon">월요일</label>
				<label><input type="checkbox" name="swdays" value="tue">화요일</label>
				<label><input type="checkbox" name="swdays" value="wed">수요일</label>
				<label><input type="checkbox" name="swdays" value="thu">목요일</label>
				<label><input type="checkbox" name="swdays" value="fri">금요일</label>
				<label><input type="checkbox" name="swdays" value="sat">토요일</label>
				<label><input type="checkbox" name="swdays" value="sun">일요일</label>
				</td>
			</tr>
			<tr>
				<td>사진 *</td>
				<td colspan="3"><input type="file" name="spicture"></td>
			</tr>
			<tr>
				<td>프로필 *</td>
				<td colspan= "3">
				<textarea name="sprofile" id="sprofile" rows="5" cols="65" > 내용(이력, 수상경력, 전문분야 등)을 입력하세요... </textarea>
				</td>
			</tr>			
		</table>
	</div>
	<br>
	<div align="center">
		<input type="submit" value="등록"> 
		<input type="reset" value="RESET">
	</div>
<br>
</form>
</div>
</body>
</html>