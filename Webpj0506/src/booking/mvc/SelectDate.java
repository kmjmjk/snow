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
		String last = temp[0]; //理쒖쥌 �꽑�깮�븳 �뵒�옄�씠�꼫
		int extra = Integer.parseInt(temp[1]); //異붽�湲�
		String off = temp[2]; //�돩�뒗 �슂�씪
		
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
		}// �돩�뒗 �슂�씪 �닽�옄濡� �꽆�뼱�삩嫄�(�삁:50)瑜� �븳湲�濡� 諛붽퓭以�(�삁: 湲덉슂�씪, �씪�슂�씪)
		
		System.out.println(last + " " + extra + " " + off + " " +offinfo);
		
		HttpSession session = request.getSession(false);
		
		session.setAttribute("last", last); //理쒖쥌�쟻�쑝濡� �꽑�깮�븳 �뵒�옄�씠�꼫 �씠由�
		session.setAttribute("extra", extra);
		session.setAttribute("off", off);
		session.setAttribute("offinfo", offinfo);
		
		RequestDispatcher dis = request.getRequestDispatcher("booking_process3.jsp");
		dis.forward(request,response);	
	}
}
