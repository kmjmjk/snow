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
		
		//������ ���� db�� ���� ���� �����ϱ� �ѹ� �� Ȯ��
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
				System.out.println("���� ���� DB ���� ����~ ����");
				response.sendRedirect("main.html");
			}
			
		}else if(ok.equals("1")) {
			System.out.println("�ߺ��̴ϱ� ��¥�� �ð��� �ٽ� �����ϵ��� �ȳ��ϴ� ��������������� ������ ��"); 
			session.removeAttribute("ldate");
			session.removeAttribute("ltime");
			response.sendRedirect("booking_process3.jsp");
		}

	}
	

}
