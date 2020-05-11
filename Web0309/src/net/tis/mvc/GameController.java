package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/game.tis")  //이 서블릿의 이름을 임의로 주었다(매핑)
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  //servlet기초 p.66
		out.println("<img src='images/a1.png' width=120 height=100>");
		out.println("<img src='images/a1.png' width=120 height=100>");
		out.println("<img src='images/a1.png' width=120 height=100> <p>");
		
		out.println("<a href='index.jsp'> [index.jsp] </a>");
		out.println("<a href='guestWrite.jsp'> [신규등록] </a>");
		out.println("<a href='aaa.jsp'> [aaa] </a>");
	}

}
