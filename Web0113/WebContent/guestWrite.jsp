<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWrite.jsp] </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 26pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	<script type="text/javascript">
	  function info(){
		open("openID.jsp", "kb", "width=500,height=150,left=400,top=250"); 
	  }//end
	  
	  
	  function nullCheck() {
		var a=document.myform.sabun.value;
		var b=document.myform.name.value;
		var size=document.myform.sabun.value.length; //문자열길이
		
		if(a==null || a==""){
		 alert("sabun데이터가 공백입니다");
		 myform.sabun.focus();
		 return ; //아래문장수행안하고 함수탈출
		}else{ myform.name.focus(); }
		
		if( size != 4){
		 alert("사번데이터 자릿수는 4자릿수입니다");
		 myform.sabun.value="";
		 myform.sabun.focus();
		 return;
		}
		
		if(b==null || b==""){
		 alert("name데이터가 공백입니다");
		 myform.name.focus();
		 return ; //아래문장수행안하고 함수탈출
		}else{ myform.title.focus(); }
		
		//모든조건을 만족하면 버튼이 action속성에 연결된 문서로 이동
		//document.myform.submit(); input type=submit역할 action=guestWriteSave.jsp 연결
	  }//end
	</script>
</head>
<body>
	guestWrite.jsp <p>
	<form method="get" name="myform" action="guestWriteSave.jsp" >
		사번: <input type="text" name="sabun" > <br>
		이름: <input type="text" name="name" value="LEE" > <br>
		제목: <input type="text" name="title" value="spring"> <br>
		급여: <input type="text" name="pay"  value="72"> <br>
		메일: <input type="text" name="email" value="pk@DK.org"> <br>
		      <span id="chk_email" > </span> <p>
		    <input type="submit" value="서브밋저장"> &nbsp;
		    <input type="reset" value="입력취소">
	</form>
	
	<!--  여기에 직접 GuestSQL.java문서를 왜 연결안하느냐? -->
	<p>
	<a href="index.jsp">[index]</a> 
  	<a href="guestWrite.jsp">[신규등록]</a>
  	<a href="guestList.jsp">[전체출력]</a>
  	
 <p> 	
<jsp:include page="guest_footer.jsp" />  	
</body>
</html>






