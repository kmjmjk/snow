package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.guest.GuestDTO;
import net.tis.guest.GuestSQL;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;;

@WebServlet("/glist.tis")  //이 서블릿의 이름을 임의로 주었다(매핑)
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//guestList.jsp문서에서 가져온 변수
		 String pnum;
		 int pageNUM, pagecount;
		 int start, end; 
		 int startpage, endpage;  
		 int temp;
		 String sqry="";
		 String skey="", sval="";
		 String returnpage; 		 
		 int Rnumber;
		 
		 String AA,BB;
		 //변수선언 끝
		 pnum = request.getParameter("pageNum");
		 if(pnum == null || pnum== "") {pnum="1";}  //페이지 선택 하지 않았을 경우 자동으로 1페이지 나오게끔
		 pageNUM=Integer.parseInt(pnum);  //pnum(페이지번호)가 String(문자열)이었기때문에 int형으로 형변환
		
		 //----페이지 검색----
		 skey=request.getParameter("keyfield");  //검색 키워드
		 sval=request.getParameter("keyword");    //검색한 내용
		 
		 if(skey=="" || skey==null || sval=="" || sval==null) {
			 sqry=" where title like '%%'";
			 skey=""; sval="";
			 returnpage="";
		 }else {sqry=" where "+skey+" like '%"+sval+"%'";}
		 //--------------
		 
		 returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		 
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  //servlet기초 p.66
		
		GuestSQL sql = new GuestSQL();
		GuestDTO dto = new GuestDTO();
		
		int Gtotal = sql.guestTotal();   //guestSQL에 있는 쿼리문으로 count를 세서 변수 Gtotal로 값 전달 할 수 있게 해주었다 /총갯수 카운트
		int Atotal = sql.guestATotal(sqry);   //검색 했을때 검색결과 갯수 카운트
				
		if(Gtotal%10==0) {
			pagecount = Gtotal/10;
		   }else {
			   pagecount = (Gtotal/10)+1;
		}
		
		if(Atotal%10==0) {
			pagecount=Atotal/10;
		}else {pagecount=(Atotal/10)+1;}
		
		//int Atotal = sql.guestATotal(sqry);
		
		start = ((pageNUM-1)*10)+1;  //page 선택했을때 나오는 처음으로 행번호
		end = pageNUM*10;
		
		temp = (pageNUM-1)%10;
		startpage = pageNUM-temp;
		endpage = startpage+9;
		
		if(endpage>pagecount) {endpage=pagecount;}  //페이지를 10개씩 나눠지게끔 마지막페이지가 페이지수 보다 크면 현재페이지를 마지막페이지로 만든다
		
		//ArrayList<GuestDTO> LG = sql.guestSelect();
		ArrayList<GuestDTO> LG = sql.guestSelect(start, end, sqry);  //페이지 클릭 시 나오는 행의 번호 처음부터 끝번호 
		
		request.setAttribute("skey", skey);
		request.setAttribute("sval", sval);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("returnpage", returnpage);
		request.setAttribute("Atotal",Atotal);   //검색 후 조회된 레코드 갯수 
		request.setAttribute("Gtotal", Gtotal);  //레코드의 총 갯수
		
		request.setAttribute("LG", LG);
		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response);

	}

}
