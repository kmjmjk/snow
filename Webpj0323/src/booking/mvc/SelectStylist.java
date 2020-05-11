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

@WebServlet("/bkprocess2.do")
public class SelectStylist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectStylist() {
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
		
		StylistDTO dto = new StylistDTO();
		StylistSQL sql = new StylistSQL();
		
		String[] services = request.getParameterValues("service");
		int nss = services.length; //number of services selected
		String[] temp;
		StringBuilder builder = new StringBuilder();
		String srvs = ""; //선택한 서비스
		int ttp = 0; //총 예상 가격
		int tdt = 0; //총 예상 소요시간
		for(int i=0;i<nss;i++) {
			temp = services[i].split("&");
			builder.append(temp[0]);
			if(++i<nss) {
				builder.append(",");
			}
			--i;
			ttp += Integer.parseInt(temp[1]);
			tdt += Integer.parseInt(temp[2]);
		} 
		srvs = builder.toString();
		System.out.println(srvs + " " + ttp + " " + tdt);
		
		ArrayList<StylistDTO> slist = sql.stylistSelect();
		
		System.out.println(slist);
		
		request.setAttribute("slist", slist);
		
		HttpSession session = request.getSession(false);
		
		session.setAttribute("srvs", srvs);
		session.setAttribute("ttp", ttp);
		session.setAttribute("tdt", tdt);
		
		RequestDispatcher dis = request.getRequestDispatcher("booking_process2.jsp");
		dis.forward(request,response);	
	}
}
