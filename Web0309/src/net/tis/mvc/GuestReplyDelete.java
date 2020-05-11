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
import net.tis.guest.ReplyDTO;
import net.tis.guest.ReplySQL;


@WebServlet("/greplyDelete.tis")
public class GuestReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		
		System.out.println("GuestReplyDelete.jsp = greplyDelete.tis  ¿Ãµø");
		ReplyDTO  rdto = new ReplyDTO();
		ReplySQL  rsql = new ReplySQL();
			
		int rsabun=Integer.parseInt(request.getParameter("Gidx"));
		System.out.println("ªË¡¶¥Ò±€greplyDelete.tis  Gidx=" + rsabun);
		int rnum=Integer.parseInt(request.getParameter("Gnum"));
		System.out.println("ªË¡¶¥Ò±€greplyDelete.tis  Gnum=" + rnum);
		
		rsql.dbReplyDelete(rnum);		
		response.sendRedirect("gdetail.tis?Gidx="+rsabun);
		
		//RequestDispatcher dis =  request.getRequestDispatcher(".jsp");
		//dis.forward(request, response);
	}//end
	
}//class END













