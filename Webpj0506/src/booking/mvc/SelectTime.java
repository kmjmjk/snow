package booking.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.common.DB;

@WebServlet("/timetable.do")
public class SelectTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectTime() {
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

		try{
		  	Connection CN=DB.getConnection();
		  	int total=0;
		   	
		  	String designer = request.getParameter("assistant");
		   	String date = request.getParameter("date");
		  	//String designer = "우빈";
		  	//String date = "20/03/31";
		   	
		   	System.out.println("디자이너=" + designer + "  선택한 날짜=" + date) ;
		   
	   		String selectable = "";
	   		int i=0;
			String a = " select NVL2(b.bktime, 'N','Y') as opentime ";
			String b = " from (select bkvisitdate, bktime from s_booking where bkstylist=? and bkvisitdate=?) b ";
			String c = " right outer join s_timetable t ";
			String d = " on b.bktime = t.timef2 order by t.timef2 ";
			String msg=a+b+c+d;
				PreparedStatement PST=CN.prepareStatement(msg);
				PST.setString(1, designer);
				PST.setString(2, date);
				ResultSet RS=PST.executeQuery();
			while(RS.next()==true) {
				selectable += RS.getString("opentime");
				if(i<8) { selectable += ",";}
				i++;
			}	
			out.println(selectable);	
			System.out.println(selectable);
			
		}catch (Exception e) { System.out.println(e);}
		   	
	}//doUser end
}//class end
