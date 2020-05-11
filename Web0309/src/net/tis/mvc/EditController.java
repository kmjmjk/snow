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

@WebServlet("/gedit.tis")  //�� ������ �̸��� ���Ƿ� �־���(����) �������� ����Ÿ �Ѹ��� �κ�
public class EditController extends HttpServlet {
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
		PrintWriter out = response.getWriter();  //servlet���� p.66
		
		int Gsabun = Integer.parseInt(request.getParameter("sabun"));
		String Gname = request.getParameter("name");
		String Gtitle= request.getParameter("title");
		int Gpay=Integer.parseInt(request.getParameter("pay"));
		String Gemail=request.getParameter("email");
		
		
		GuestSQL sql = new GuestSQL();
		GuestDTO dto = new GuestDTO();
		
		dto.setSabun(Gsabun);
		dto.setName(Gname);
		dto.setTitle(Gtitle);
		dto.setPay(Gpay);
		dto.setEmail(Gemail);
		
		sql.guestEdit(dto);
		response.sendRedirect("glist.tis");
		
	}

}
