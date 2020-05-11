package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter; //추가

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
		doUser(request, response); // 호출
	}// end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response); // 호출
	}// end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println("Photo컨트롤문서 1234 ");
		out.println("<h2>Photo컨트롤문서10:59</h2>");
		for (int i = 0; i < 5; i++) {
			out.println("<img src='images/aaa.gif'>");
		}

		out.println("<hr color=blue size=2>");
		
		GuestSQL gs = new GuestSQL();
		GuestDTO dto = new GuestDTO();
	
		  int num1 = 22; 
		  int num2 = 55; 
		  int add = num1 + num2;
		  
		  request.setAttribute("num1", num1); //"" 안에 들어있는 num1은 임의로 지어준 이름(진짜 값이 들어있는num1과 같게 지정해서 편의를 주었다) 
		  request.setAttribute("num2", num2);  //request 값전달하면 EL태그로 사용가능하다
		  request.setAttribute("add", add);
		  
		  int Gtotal = gs.guestGtotal();  //guestSQL에 guestGtotal이라는 guest의 총 count를 구하는 쿼리문을 작성해 놓았다
		  request.setAttribute("Gtotal", Gtotal);
		  
		  RequestDispatcher dis = request.getRequestDispatcher("add03.jsp");
		  dis.forward(request, response);
		 
		// response.sendRedirect("add03.jsp"); 도 문서 이동을 하는 방법중 하나이지만 문서이동은 되지만 값전달이 되지않는다
		  
	}// doUser end

}// class END========================================================
