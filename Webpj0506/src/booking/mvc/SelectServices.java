package booking.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import menu.common.menuInfo;
import menu.common.menuSQL;

@WebServlet("/bkprocess1.do")
public class SelectServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectServices() {
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

		HttpSession session = request.getSession(false);
		
//		String a = (String)session.getAttribute("id");
//		if(a == null || a == "") {
//			out.println("<script>alert('ï¿½ï¿½ï¿½ï¿½ï¿½Ï½Ã·ï¿½ï¿½ï¿½ ï¿½Î±ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ö¼ï¿½ï¿½ï¿½.'); history.go(-1);</script>");
//		}
//		
//		System.out.println("id:" + a);
		
		menuInfo info = new menuInfo();
		menuSQL sql = new menuSQL();
		
		String assistant = request.getParameter("Sid");
		if(assistant.equals("") || assistant == null || assistant == "") { //µðÀÚÀÌ³Ê¸¦ ¼±ÅÃÇÏÁö ¾Ê¾ÒÀ» °æ¿ì NA(not assigned)¸¦ ÁÜ
			assistant = "NA";
		}
		session.setAttribute("assistant", assistant);
		
		ArrayList<menuInfo> service1 = sql.menuSelect(1);
		ArrayList<menuInfo> service2 = sql.menuSelect(2);
		ArrayList<menuInfo> service3 = sql.menuSelect(3);
		ArrayList<menuInfo> service4 = sql.menuSelect(4);
		
		System.out.println(service1);
		
		request.setAttribute("service1", service1);
		request.setAttribute("service2", service2);
		request.setAttribute("service3", service3);
		request.setAttribute("service4", service4);
				
		RequestDispatcher dis = request.getRequestDispatcher("booking_process1.jsp");
		dis.forward(request,response);	
	}
}
