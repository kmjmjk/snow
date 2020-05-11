<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>[loginAjax.jsp]</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
input, b {
	font-size: 14pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 20pt;
	font-weight: bold;
}

a:hover {
	color: red;
	font-size: 20pt;
	font-weight: bold;
}

#btnlogin {
	font-size: 26pt;
	font-weight: bold;
	font-color: white;
	background: "white";
	height: 120;
}

#loading-mask {
	display: none;
	width: 500px;
	height: 500px;
}
</style>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">
	$(function() {
		$('#btlogin')
				.click(
						function() {
							$
									.ajax({
										"url" : "login.tis",
										"type" : "get",
										"data" : {
											UID : $('#userid').val(),
											UPWD : $('#pwd').val()
										},
										"beforeSend" : function() {
											$('#loading-mask').show();
											$('#msgIN').empty();
											$('#loading-mask')
													.html(
															"<div align=center><img src='./images/ajax-loader.gif' width=200 height=150></div> ");
											$("#loading-mask").css("opacity",
													"0.9").stop().animate({
												opacity : 3
											}, 5000);
										},
										"success" : function(data) {
											setTimeout(function() {
												$('#loading-mask').fadeOut();
												$('#msgIN').empty();
												$('#msg').html(data);
											}, 1000);
										},
										"error" : function(data) {
											$('#loading-mask').fadeOut();
										}
									});
						});
		//////////////////////////////////////////////////////////////////////////
	});
</script>
</head>
<body>

	<div id="msg" align="center">
		<div id="msgIN">
			<table width="450" border="1" cellspacing="0">
				<form name="myform" method="get">
					<tr>
						<td><b> <img src="images/login.png" width="30"></b></td>
						<td><input type="text" name="userid" id="userid"
							placeholder="아이디를 입력해주세요"></td>
					</tr>
					<tr>
						<td><b><img src="images/pwd.png" width="30"></b></td>
						<td><input type="password" name="pwd" id="pwd"
							placeholder="비밀번호를 입력해주세요" width="200"></td>
					</tr>
				</form>
			</table>
			
			 <button type="button" class="btn btn-outline-secondary">로그인</button>		
		</div>
	</div>
</body>
</html>

