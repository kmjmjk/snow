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
		String last = temp[0]; //���������� �����̳�
		int extra = Integer.parseInt(temp[1]); //�߰���
		String off = temp[2]; //���� ����
		
		String[] day7nu = {"0", "1", "2", "3", "4", "5", "6"};
		String[] day7ko = {"�Ͽ���", "������", "ȭ����", "������", "�����", "�ݿ���", "�����"};
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
		}// ���� ���� ���ڷ� �Ѿ�°�(��:50)�� �ѱ۷� �ٲ���(��: �ݿ���, �Ͽ���)
		
		System.out.println(last + " " + extra + " " + off + " " +offinfo);
		
		HttpSession session = request.getSession(false);
		
		session.setAttribute("last", last); //���������� ������ �����̳� �̸�
		session.setAttribute("extra", extra);
		session.setAttribute("off", off);
		session.setAttribute("offinfo", offinfo);
		
		RequestDispatcher dis = request.getRequestDispatcher("booking_process3.jsp");
		dis.forward(request,response);	
	}
}
