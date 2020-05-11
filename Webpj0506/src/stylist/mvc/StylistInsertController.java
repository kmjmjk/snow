package stylist.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import stylist.common.StylistDTO;
import stylist.common.StylistSQL;


@WebServlet("/sinsert.do")
public class StylistInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		ServletContext context = this.getServletContext();
		ServletContext application = this.getServletContext();
		String path = context.getRealPath("storage");
		int size = 10 * 1024 * 1024;
		
		DefaultFileRenamePolicy dfp=new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", dfp);
		
		String Sid = mr.getParameter("sid");
		String Sname = mr.getParameter("sname");
		String Spos = mr.getParameter("spos");
		int Sprice = Integer.parseInt(mr.getParameter("sprice"));
		String Stel = mr.getParameter("num1")+"-"+mr.getParameter("num2")+"-"+mr.getParameter("num3");
//		String[] temp1 = mr.getParameterValues("swdays");
//		StringBuffer temp2 = new StringBuffer();
//		for(String wd:temp1) {temp2.append(wd); temp2.append("/");}
//		String temp3 = temp2.toString();
//		String[] temp4 = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
//		String Swdays = "";
//		for(int i=0;i<temp4.length;i++) {
//			if(temp3.indexOf(temp4[i])>-1) {
//				Swdays+="1";
//			}else Swdays+="0";
//		}
		String[] tmp = mr.getParameterValues("sdayoff");
		String Sdayoff = "";
		for(int i=0;i<tmp.length;i++) {
			Sdayoff += tmp[i];
		}
		
		String Spicture = mr.getFilesystemName("spicture");
		String Sprofile = mr.getParameter("sprofile");
		
		StylistDTO bean = new StylistDTO();
		StylistSQL sql = new StylistSQL();
		
		bean.setSid(Sid);
		bean.setSname(Sname);
		bean.setSpos(Spos);
		bean.setSprice(Sprice);
		bean.setStel(Stel);
		bean.setSdayoff(Sdayoff);
		bean.setSpicture(Spicture);
		bean.setSprofile(Sprofile);
		
		int insert_ok = sql.dbInsert(bean);
		if(insert_ok>0) { 
			System.out.println("디자이너 " +Sname+ "님 등록 성공");
			response.sendRedirect("slist.do");
		}
	}

}
