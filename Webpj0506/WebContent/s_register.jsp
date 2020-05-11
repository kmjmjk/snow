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
<script type="text/javascript">
function handleFileSelect(){ // 이미지 파일 미리보기
	var files = document.getElementById('file').files[0]; //파일객체
	var reader = new FileReader(); //class임 자바스크립트는 FileReader reader = new FileReader(); 하면 안됨. var를 써라.
	//파일 정보 수집
	reader.onload = (function(theFile){ //익명의 function 두개 있음 
		return function(e){
		//alert(theFile.name);
		//이미지 뷰	
		var img_view = ['<img src="',e.target.result,'"width="200" height="200" alt="tis" />'].join('');
		//var img_view = ['<img src="',e.target.result, '"name="', escape(theFile.name),'"width="450" height="250" />'].join('');
		//alert(img_view); //문자열이 어떻게 합쳐졌는지 보여줌(물리적인 파일 이름이 escape로 아스키코드로 바뀜)
		document.getElementById('showpic').innerHTML = img_view;
		};
	})(files);
 reader.readAsDataURL(files);
}//end
</script>

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
				<td>프리미엄(직급별 추가금) </td>
				<td colspan="3"><input type="text" name="sprice" id="sprice" value="0" size="10" >원</td>
			</tr>
			<tr>
				<td>휴무일 * </td> 
				<td colspan="3">
				<label><input type="checkbox" name="sdayoff" value="1">월요일</label>
				<label><input type="checkbox" name="sdayoff" value="2">화요일</label>
				<label><input type="checkbox" name="sdayoff" value="3">수요일</label>
				<label><input type="checkbox" name="sdayoff" value="4">목요일</label>
				<label><input type="checkbox" name="sdayoff" value="5">금요일</label>
				<label><input type="checkbox" name="sdayoff" value="6">토요일</label>
				<label><input type="checkbox" name="sdayoff" value="0">일요일</label>
				</td>
			</tr>
			<tr>
				<td>사진 *</td>
				<td colspan="3"><input type="file" name="spicture" id="file" onchange="handleFileSelect()"></td>
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