package booking.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.common.BookingDTO;
import booking.common.BookingSQL;


@WebServlet("/bkprocess5.do")
public class ConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		BookingDTO dto = new BookingDTO();
		BookingSQL sql = new BookingSQL();
		
		//누르는 순간 db에 있을 수도 있으니까 한번 더 확인
		HttpSession session = request.getSession(false);
		
		String cid = "imsi";
		int ctcost = (int)session.getAttribute("ttp");
		String cservice = (String)session.getAttribute("srvs");
		int cdtime = (int)session.getAttribute("tdt");
		
		String cstylist = (String)session.getAttribute("last");
		String cdate = (String)session.getAttribute("ldate");
		String ctime = (String)session.getAttribute("ltime"); 
		
		String ok = sql.checkbk(cstylist, cdate, ctime);
		
		if(ok.equals("0")) {
			dto.setBkid(cid);
			dto.setBkstylist(cstylist);
			dto.setBktcost(ctcost);
			dto.setBkvisitdate(cdate);
			dto.setBktime(ctime);
			dto.setBkservice(cservice);
			dto.setBkdtime(cdtime);
			int OK = sql.dbInsert(dto);
			if(OK >0 ) {
				System.out.println("예약 정보 DB 저장 성공~ 꺄악");
				response.sendRedirect("main.html");
			}
			
		}else if(ok.equals("1")) {
			System.out.println("중복이니까 날짜와 시간을 다시 선택하도록 안내하는 예약오류페이지를 만들어야 함"); 
			session.removeAttribute("ldate");
			session.removeAttribute("ltime");
			response.sendRedirect("booking_process3.jsp");
		}

	}
	

}
