<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog listpage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>


table {
	border-top : solid #50729F		;
	border-bottom : solid #50729F	;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	width: 60%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

</style>

</head>
<body>

	<%
		String pnum;
		int pageNUM, pagecount;
		int start, end; //start는 n번 클릭 후 처음 나오는 행  (n-1)*10+1
		int startpage, endpage; //startpage 는 [1] endpage는 [10] 인데 다음을 눌렀을땐 [11]~[20]이 된다
		int temp;

		//검색에 필요한 변수
		String sqry;
		String skey, sval;
		String returnpage; //검색 후 나오는 페이지

		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
		System.out.println("검색필드keyfield=" + skey + " keyword=" + sval);

		if (skey == null || skey == "" || sval == null || sval == "") { //skey값과 sval의 값이 널일경우는 전체 데이터를 출력하기 위해서 
			sqry = " where title like '%%' order by wdate desc"; //skey값과 sval의 값이 널일경우는 전체 데이터를 출력하고
			skey = "";
			sval = "";
		} else {
			sqry = " where " + skey + " like '%" + sval + "%'";
		} //값이 입력이 되었을경우에는 예를들어 where title like '%p%';와 같은 문장이지만 title부분이 키필드이고 sval이 키워드니까 이렇게 지정해주었다

		returnpage = "&keyfield=" + skey + "&keyword=" + sval; //페이지 검색 후 발생하는 페이지에 관한 것으로 주소창에 출력되기 때문에 &를 이용하여 연결이 되게끔 해주었다
		//returnpage의 값을 주지 않으면 검색 후 페이지를 변경할 시에 다른 페이지로 넘어가면 초기값으로 넘어간다(다음페이지 클릭 시 검색한 값이 저장되지 않는다) 

		pnum = request.getParameter("pageNum");
		if (pnum == "" || pnum == null) {
			pnum = "1";
		} //페이지번호를 선택안하면 자동으로 1페이지가 나오게끔
		pageNUM = Integer.parseInt(pnum);

		start = (pageNUM - 1) * 10 + 1;
		end = (pageNUM * 10);

		msg = "select count (*) as cnt from blog" + sqry;
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		while (RS.next() == true) {
			Gtotal = RS.getInt("cnt"); //RS.next=Gtotal
		}

		if (Gtotal % 10 == 0) {
			pagecount = Gtotal / 10;
		} else {
			pagecount = (Gtotal / 10) + 1;
		}

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;
	%>

	<jsp:include page="b_header.jsp">
	<jsp:param value="1" name="active"/>
	</jsp:include>

	<br>
	<table style="width:80%;">
		<tr style="background-color:hsl(217, 43%, 93%);  border-bottom:2px solid #50729F;">
			<td style="text-align: center; width: 100px;">No.</td>
			<td style="text-align: center; width: 520px;">Title</td>
			<td style="text-align: center; width: 130px;">Writer</td>
			<td style="text-align: center; width: 180px;">Date</td>
			<td style="text-align: center;">Hits</td>
		</tr>

		<%
			//Gnum = request.getParameter("num");//////////////////////////////////////í•´ê²°
			ST = CN.createStatement();

			String a = "select * from (";
			String b = "select rownum rn, num, title, name, wdate, hit ";
			String z = "from (select * from blog " + sqry + ")";
			String c = ")where rn between " + start + " and " + end + " order by wdate desc";
			msg = a + b + z + c;
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				Qnum = RS.getInt("num");
				Gtitle = RS.getString("title");
				//Rnum = RS.getInt("recnt");
				//Gid=RS.getString("id");
				
				 sql="select count (*) as recnt from breply where num="+Qnum;
				 Statement ST2 = CN.createStatement();
				ResultSet RS2 = ST2.executeQuery(sql);
				while(RS2.next()==true){
					Rnum = RS2.getInt("recnt");
				} 			
		%>
		<tr>
			<td style="text-align: center;"><%=Qnum%></td>
			<%
				if (Rnum > 0) {
			%>
			<td><a href="bDetail.jsp?num=<%=Qnum%>"> <%=Gtitle%>
					<font style="color:#50729F;">[<%=Rnum%>]</font>
			</a></td>
			<%
				} else {
			%>
			<td><a href="bDetail.jsp?num=<%=Qnum%>"> <%=Gtitle%>
			</a></td>
			<%
				}
			%> 
			<td style="text-align: center;"><%=RS.getString("name")%></td> 
			<td style="text-align: center;"><%=RS.getDate("wdate")%></td>
			<td style="text-align: right;"><%=RS.getInt("hit")%></td>
		</tr>
		<%
			}
		%>

		<tr>
			<td colspan="6" style="text-align:center">
				<%
					if (startpage != 1) { //startpage가 1인 경우에는 이전버튼이 필요없기때문에 1이 아닐경우에만 이전버튼을 생성해주었다 / (startpage > 10)으로 조건을 줘도 성립
						out.println("<a href=blist.jsp?pageNum=" + (startpage - 10) + returnpage + ">[이전]</a>");
					} //returnpage="&keyfield="+skey+"&keyword="+sval;로 위에서 정의해 주었다 

					if (endpage > pagecount) {
						endpage = pagecount;
					} //endpage가 현재페이지보다 클경우에는 마지막페이지를 현재페이지와 같게 만들어주어서 현재페이지가 마지막이 되도록

					for (int i = startpage; i <= endpage; i++) { //리스트에 페이지넘버 클릭할 수 있는칸
						if (i == pageNUM) { //i는 현재 클릭한 페이지이니까 페이지넘버가 현재 클릭한 넘버일때/ pnum은 String타입이기때문에 pageNUM으로 써줘야한다
							out.println("<a href=\"blist.jsp?pageNum=" + i + returnpage
									+ "\"><font style=\"color:blue; font-size:13pt\">[" + i + "]</font></a>"); //선택한 페이지넘버에 색과 사이즈를 조절해서 알아볼 수 있도록
						} else {
							out.println("<a href=\"blist.jsp?pageNum=" + i + returnpage + "\">[" + i + "]</a>"); //선택하지 않은 부분은 그냥 번호가 출력되게/번호를 누르면 guestList로 넘어간다
						}
					}

					if (endpage < pagecount) { //endpage가 현재페이지보다 작을경우에만 다음버튼이 뜨게해주었다
						out.println("<a href=blist.jsp?pageNum=" + (startpage + 10) + returnpage + ">[다음]</a>");
					}
				%>
			</td>
		</tr>

		<tr align="center" style="background-color:hsl(217, 43%, 93%);  border-top:2px solid #50729F	;">
			<td colspan="6" style="text-align:center">
				<form name="myform" action="blist.jsp">
					<span id="search">검색 : </span> <select name="keyfield">
						<option value="">---선택하세요---</option>
						<!-- <option value="">전체검색</option> -->
						<option value="name">이름검색</option>
						<option value="title">제목검색</option>
						<option value="content">내용검색</option>
					</select> <input type="text" name="keyword" size=12> <input
						type="submit" value="검색">
				</form>
			</td>
		</tr>

	</table>
	<!-- <div class="container" >
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div> -->
				
	<jsp:include page="bottom.jsp"></jsp:include>
	
</body>
</html>