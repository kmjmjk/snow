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

import qna.common.QboardDTO;
import qna.common.QboardSQL;

@WebServlet("/qnawrite.do")
public class qnaWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PreparedStatement PST;
	private Connection CN;
	private ResultSet RS;

	public qnaWriteController() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}// end

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}// end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String qid = request.getParameter("qid");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");

		QboardSQL sql = new QboardSQL();
		QboardDTO dto = new QboardDTO();

		dto.setQid(qid);
		dto.setQcontent(qcontent);
		dto.setQtitle(qtitle);

		sql.QnaWrite(dto);
		
			response.sendRedirect("qnalist.do");
		
	}

}
