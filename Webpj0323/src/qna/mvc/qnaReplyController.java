package qna.mvc;

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
import javax.websocket.Session;

import qna.common.QboardDTO;
import qna.common.QboardSQL;
import qna.common.DB;

import qna.mvc.*;

@WebServlet("/replywrite.do")
public class qnaReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public qnaReplyController() {
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
		  
		  int anum = Integer.parseInt(request.getParameter("qnum"));
		  String atitle = request.getParameter("atitle");
		  String acontent = request.getParameter("acontent");
		  
		 QboardSQL sql = new QboardSQL();
		 QboardDTO rdto = new QboardDTO();
		
		 rdto.setAcontent(acontent);
		 rdto.setAtitle(atitle);
		 rdto.setAnum(anum);
		 
		 int ok = sql.replyInsert(rdto);
		 if(ok>0) {
			 System.out.println("글쓰기 완료");
		  response.sendRedirect("qnalist.do");
		 }
	}
		 		 
}
