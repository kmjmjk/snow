<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.357</title>
<style type="text/css">
* {
	font-size: 16pt;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
<!-- label과 option태그를 이용하여 폼을 만들어 보았다 -->
	<form action="12_colorSelect.jsp">  <!-- 전송을 누르면 이 파일로 action이 실행된다  -->
		<label for="color">색상을 선택하세요</label><br> <select id="color"
			name="color">
			<option value="1">빨강</option>
			<option value="2">초록</option>
			<option value="3">파랑</option>
		</select> <input type="submit" value="전송">
	</form>
</body>
</html>