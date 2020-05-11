<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> guestWrite </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	
		function nullcheck(){
			if(myform.email.value == null || myform.email.value == ""){
				document.getElementById("chk_email").innerHTML = " email을 입력해주세요";
			}else{
				document.getElementById("chk_email").innerHTML = "";
				emailcheck();
			}
		}//end
		
		function emailcheck(){
			var a =0;
			var chkatsign = 0;
			var chkPeriod = 0;
			var emailchk = myform.email.value;
			var b =0;
			
			while(a < emailchk.length){
				if(emailchk.charAt(a) == '@'){
					chkatsign++;	
				}
				a++;
			}
			
			if (chkatsign != 1){
				document.getElementById("chk_email").innerHTML = "email패턴 ex)aaa@tis.net";
			}else{
				var chkArray = emailchk.split('@');
				
				while(b < emailchk.length){
					if(chkArray[1].charAt(b) == '.'){
						chkPeriod++;	
					}
					b++;
				}//while end
				
				if (chkPeriod != 1){
					document.getElementById("chk_email").innerHTML = "email패턴 ex)aaa@tis.net";
				}else{
					document.getElementById("chk_email").innerHTML = "";
				}	
			}
		}//end

		//중복체크
		function info(){
		  var a = document.myform.sabun.value;
		  window.open("openID.jsp","bc","width = 400, height =200, left =750, top = 100");
		  flag=true;
		}
	</script>
	
</head>
<body onload ="first();">
	
	<form method ="get" name = "myform" action ="guestSave.jsp">
		사번 : <input type ="text" name ="sabun" size ="10"> 
		      <input type ="button" onclick = "info();" value ="사번중복"><br>
		이름 : <input type ="text" name ="name" value="choi"><br>
		제목 : <input type ="text" name ="title" value ="snow"><br>
		급여 : <input type ="text" name ="pay" value = "31"><br>
		메일 : <input type ="text" name ="email"><br>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <span id ="chk_email" style="color:red; font-size:24px;"></span><br>
		<input type ="button"  onclick = "nullcheck();" value ="데이터저장">
		<input type ="reset" value ="입력취소">
	
	</form>
	<p>
	<a href ="index.jsp">[index]</a>
	<a href ="guestWrite.jsp">[신규등록]</a>
	<a href ="guestList.jsp">[전체출력]</a>
	
</body>
</html>

