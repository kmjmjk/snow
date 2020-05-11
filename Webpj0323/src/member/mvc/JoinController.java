package member.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.common.*;
import member.mvc.*;

@WebServlet("/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinController() {
        super(); 
    }
    
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
		 
		  String id=request.getParameter("id");
		  String pw=request.getParameter("pw");
		  String name=request.getParameter("name");
		  String tel=request.getParameter("tel");
		  String email=request.getParameter("email");
		  String gender=request.getParameter("gender");
		  String zipcode=request.getParameter("zipcode");
		  String add1=request.getParameter("add1");
		  String add2=request.getParameter("add2");
		  String year=request.getParameter("year");
		  String month=request.getParameter("month");
		  String day=request.getParameter("day");
		 
		  String birth = year+"."+month+"."+day;
		 
			MemberSQL dbsql = new MemberSQL();
			MemberDTO bean = new MemberDTO();
			bean.setId(id);
			bean.setPw(pw);
			bean.setName(name);
			bean.setTel(tel);
			bean.setEmail(email);
			bean.setGender(gender);
			bean.setZipcode(zipcode);
			bean.setAdd1(add1);
			bean.setAdd2(add2);
			bean.setBirth(birth);
			int ok = dbsql.dbInsert(bean);
			if(ok>0){
				System.out.println("회원가입 성공");
				request.setAttribute("id", id);
				request.setAttribute("name", name);
				request.setAttribute("pw", pw);
				request.setAttribute("dbsql", dbsql);
				
				RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
				dis.forward(request, response);
			} else if (ok == 0){
				response.sendRedirect("main.html");
			}
	}
}
