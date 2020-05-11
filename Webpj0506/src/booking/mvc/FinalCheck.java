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


@WebServlet("/bkprocess4.do")
public class FinalCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FinalCheck() {
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
		
		String ldate = request.getParameter("sdate");
		String ltime = request.getParameter("stime");
			
		HttpSession session = request.getSession(false);
		
		session.setAttribute("ldate", ldate);
		session.setAttribute("ltime", ltime);
		
		RequestDispatcher dis = request.getRequestDispatcher("booking_process4.jsp");
		dis.forward(request, response);	
	}
	

}
