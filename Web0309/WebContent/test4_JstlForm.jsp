<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<!DOCTYPE html>
<html>
<head>  
<title> [test4_Form.jsp]</title>
   <style type="text/css">
      * {
         font-size: 20pt; 
         font-weight: bold; 
         font-family: Comic Sans MS ; 
         margin-left:10px;
        }     
   </style>
</head>
<body>
<div>
 <form method="get" action="test4_JstlSave.jsp">
   		<h2>좋아하는 동물을 선택하세요</h2>
   		<input type="checkbox" name="item" value="zebra" > 얼룩말
   		<input type="checkbox" name="item" value="pig" > 돼지
   		<input type="checkbox" name="item" value="chick"> 치킨<br>
   		<input type="checkbox" name="item" value="crab"> 크랩
   		<input type="checkbox" name="item" value="tiger"> 호랑이
   		<input type="checkbox" name="item" value="whale"> 돌고래 <br>
 
  	<div>
   		&nbsp;
   		<input type="submit"  value=전송 >
   		<input type="reset" value="취소" >
   	</div>
 </form>
</div>  
</body>
</html>







