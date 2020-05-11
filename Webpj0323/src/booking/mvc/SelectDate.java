package booking.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stylist.common.StylistDTO;
import stylist.common.StylistSQL;

@WebServlet("/bkprocess3.do")
public class SelectDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectDate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String stinfo = request.getParameter("sstylist");
		String[] temp = stinfo.split("&");
		String last = temp[0]; //최종선택한 디자이너
		int extra = Integer.parseInt(temp[1]); //추가금
		String off = temp[2]; //쉬는 요일
		
		String[] day7nu = {"0", "1", "2", "3", "4", "5", "6"};
		String[] day7ko = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		String offinfo = "";
		int cnt = 0;
		for(int i=0;i<7;i++) {
			if(off.indexOf(day7nu[i])>-1) {
				offinfo += day7ko[i];
				cnt++;
				if(cnt<off.length()) {
					offinfo += ",";
				}
			}
		}// 쉬는 요일 숫자로 넘어온거(예:50)를 한글로 바꿔줌(예: 금요일, 일요일)
		
		System.out.println(last + " " + extra + " " + off + " " +offinfo);
		
		HttpSession session = request.getSession(false);
		
		session.setAttribute("last", last); //최종적으로 선택한 디자이너 이름
		session.setAttribute("extra", extra);
		session.setAttribute("off", off);
		session.setAttribute("offinfo", offinfo);
		
		RequestDispatcher dis = request.getRequestDispatcher("booking_process3.jsp");
		dis.forward(request,response);	
	}
}
