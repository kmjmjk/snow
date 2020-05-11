package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter; //�߰�

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.guest.GuestDTO;
import net.tis.guest.GuestSQL;

@WebServlet("/photo.tis")
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response); // ȣ��
	}// end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response); // ȣ��
	}// end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println("Photo��Ʈ�ѹ��� 1234 ");
		out.println("<h2>Photo��Ʈ�ѹ���10:59</h2>");
		for (int i = 0; i < 5; i++) {
			out.println("<img src='images/aaa.gif'>");
		}

		out.println("<hr color=blue size=2>");
		
		GuestSQL gs = new GuestSQL();
		GuestDTO dto = new GuestDTO();
	
		  int num1 = 22; 
		  int num2 = 55; 
		  int add = num1 + num2;
		  
		  request.setAttribute("num1", num1); //"" �ȿ� ����ִ� num1�� ���Ƿ� ������ �̸�(��¥ ���� ����ִ�num1�� ���� �����ؼ� ���Ǹ� �־���) 
		  request.setAttribute("num2", num2);  //request �������ϸ� EL�±׷� ��밡���ϴ�
		  request.setAttribute("add", add);
		  
		  int Gtotal = gs.guestGtotal();  //guestSQL�� guestGtotal�̶�� guest�� �� count�� ���ϴ� �������� �ۼ��� ���Ҵ�
		  request.setAttribute("Gtotal", Gtotal);
		  
		  RequestDispatcher dis = request.getRequestDispatcher("add03.jsp");
		  dis.forward(request, response);
		 
		// response.sendRedirect("add03.jsp"); �� ���� �̵��� �ϴ� ����� �ϳ������� �����̵��� ������ �������� �����ʴ´�
		  
	}// doUser end

}// class END========================================================
