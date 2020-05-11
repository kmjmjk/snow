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

@WebServlet("/gpreedit.tis")  //이 서블릿의 이름을 임의로 주었다(매핑) 수정전에 데이타 뿌리는 부분
public class EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  //servlet기초 p.66
		
		String data = request.getParameter("idx");
		
		GuestSQL sql = new GuestSQL();
		GuestDTO dto = sql.guestDetail(data);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("guestEdit.jsp");
		dis.forward(request, response);
			
	}

}
