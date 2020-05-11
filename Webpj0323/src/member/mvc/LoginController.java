package member.mvc;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.common.DB;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginController() {
        super(); 
    }
	
	 public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request, response);
		}

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request, response);
		}
	    
		public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		try {
		Connection CN = DB.getConnection();
		int ok=0;
		String userid = request.getParameter("username");
		String userpw = request.getParameter("pass");
		String msg = "select count(*) as cnt from s_member where id=? and pw=?";
		System.out.println(userid+"/"+userpw);
		PreparedStatement PST;	
			PST = CN.prepareStatement(msg);
			PST.setString(1, userid);
			PST.setString(2, userpw);
			ResultSet RS = PST.executeQuery();
			if(RS.next()==true) {
			ok = RS.getInt("cnt");}
			if(ok>0) {
				 HttpSession session = request.getSession();
		     	 session.setAttribute("id", userid); 
		     	 System.out.println("세션설정성공"); 
		     	 response.sendRedirect("main.jsp");
			}else {out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");}  //로그인실패일 경우 팝업 뜨고 한단계 전으로 돌아가게끔
			} catch (SQLException e) {
			System.out.println(e);
		}
		
	}

}
