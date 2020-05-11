package notice.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.common.NoticeSQL;
import notice.common.NoticeDTO;

@WebServlet("/notice.do")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String pnum;
		int pageNUM, pagecount, pageNum;
		int start, end;
		int startpage, endpage;
		int temp;

		pnum = request.getParameter("pageNum");
		if (pnum == null || pnum == "") {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum);
		
		start = ((pageNUM - 1) * 10) + 1; 
		end = pageNUM * 10;
		

		NoticeSQL sql = new NoticeSQL();
		NoticeDTO dto = new NoticeDTO();

		int Ntotal = sql.noticeTotal(); 

		if (Ntotal % 10 == 0) {
			pagecount = Ntotal / 10;
		} else {
			pagecount = (Ntotal / 10) + 1;
		}

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;

		if (endpage > pagecount) {
			endpage = pagecount;
		} 

		ArrayList<NoticeDTO> list = sql.noticeList(start, end);

		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("list", list);

		RequestDispatcher dis = request.getRequestDispatcher("notice_list.jsp");
		dis.forward(request, response);
	}
}// class end
