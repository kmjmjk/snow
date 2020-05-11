package qna.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.common.QboardDTO;
import qna.common.QboardSQL;
import qna.common.DB;

@WebServlet("/qnalist.do")
public class qnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public qnaListController() {
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

		String pnum;
		int pageNUM, pagecount, pageNum;
		int start=1, end=20 ;
		int startpage, endpage;
		int temp;
		
		pnum = request.getParameter("pageNum");
		if (pnum == null || pnum == "") {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum);
		
		QboardDTO dto = new QboardDTO();
		QboardSQL sql = new QboardSQL();
		

		int Qtotal = sql.qnaTotal();

		if (Qtotal % 10 == 0) {
			pagecount = Qtotal / 10;
		} else {
			pagecount = (Qtotal / 10) + 1;
		}

		start = ((pageNUM - 1) * 10) + 1;
		end = pageNUM * 10;

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;

		if (endpage > pagecount) {
			endpage = pagecount;
		}
		
		
		ArrayList<QboardDTO> qlist = sql.qnaList(1, 50);
	
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("Qtotal", Qtotal);
		
		request.setAttribute("qlist", qlist);
		RequestDispatcher dis = request.getRequestDispatcher("qna_list.jsp");
		dis.forward(request, response);
	}
}
