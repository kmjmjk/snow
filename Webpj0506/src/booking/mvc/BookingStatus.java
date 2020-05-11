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

@WebServlet("/bkstatus.do")
public class BookingStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookingStatus() {
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
		
		HttpSession session = request.getSession(false);
		
		String mid = (String)session.getAttribute("id");
		int cnt = sql.checkbk(mid);
		dto = sql.selectbyId(mid);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("dto", dto);		
		RequestDispatcher rd = request.getRequestDispatcher("my_bookings.jsp");
		rd.forward(request, response);
	}
}
