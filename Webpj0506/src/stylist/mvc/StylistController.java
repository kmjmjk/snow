package stylist.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import stylist.common.StylistDTO;
import stylist.common.StylistSQL;


@WebServlet("/slist.do")
public class StylistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		StylistSQL sql = new StylistSQL();
		
		HttpSession session = request.getSession(false);
		String a = (String)session.getAttribute("id");
		if(a==null) a="null";
		
		ArrayList<StylistDTO> slist = sql.stylistSelect();
		
		request.setAttribute("slist", slist);
		
		if(a.equals("admin")) {
			RequestDispatcher dis = request.getRequestDispatcher("admin_stylist.jsp");
			dis.forward(request,response);
		}
		RequestDispatcher dis = request.getRequestDispatcher("stylist.jsp");
		dis.forward(request,response);
	}
}
