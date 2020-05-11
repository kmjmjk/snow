package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.guest.GuestDTO;
import net.tis.guest.GuestSQL;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;;

@WebServlet("/glist.tis")  //�� ������ �̸��� ���Ƿ� �־���(����)
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//guestList.jsp�������� ������ ����
		 String pnum;
		 int pageNUM, pagecount;
		 int start, end; 
		 int startpage, endpage;  
		 int temp;
		 String sqry="";
		 String skey="", sval="";
		 String returnpage; 		 
		 int Rnumber;
		 
		 String AA,BB;
		 //�������� ��
		 pnum = request.getParameter("pageNum");
		 if(pnum == null || pnum== "") {pnum="1";}  //������ ���� ���� �ʾ��� ��� �ڵ����� 1������ �����Բ�
		 pageNUM=Integer.parseInt(pnum);  //pnum(��������ȣ)�� String(���ڿ�)�̾��⶧���� int������ ����ȯ
		
		 //----������ �˻�----
		 skey=request.getParameter("keyfield");  //�˻� Ű����
		 sval=request.getParameter("keyword");    //�˻��� ����
		 
		 if(skey=="" || skey==null || sval=="" || sval==null) {
			 sqry=" where title like '%%'";
			 skey=""; sval="";
			 returnpage="";
		 }else {sqry=" where "+skey+" like '%"+sval+"%'";}
		 //--------------
		 
		 returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		 
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  //servlet���� p.66
		
		GuestSQL sql = new GuestSQL();
		GuestDTO dto = new GuestDTO();
		
		int Gtotal = sql.guestTotal();   //guestSQL�� �ִ� ���������� count�� ���� ���� Gtotal�� �� ���� �� �� �ְ� ���־��� /�Ѱ��� ī��Ʈ
		int Atotal = sql.guestATotal(sqry);   //�˻� ������ �˻���� ���� ī��Ʈ
				
		if(Gtotal%10==0) {
			pagecount = Gtotal/10;
		   }else {
			   pagecount = (Gtotal/10)+1;
		}
		
		if(Atotal%10==0) {
			pagecount=Atotal/10;
		}else {pagecount=(Atotal/10)+1;}
		
		//int Atotal = sql.guestATotal(sqry);
		
		start = ((pageNUM-1)*10)+1;  //page ���������� ������ ó������ ���ȣ
		end = pageNUM*10;
		
		temp = (pageNUM-1)%10;
		startpage = pageNUM-temp;
		endpage = startpage+9;
		
		if(endpage>pagecount) {endpage=pagecount;}  //�������� 10���� �������Բ� �������������� �������� ���� ũ�� ������������ �������������� �����
		
		//ArrayList<GuestDTO> LG = sql.guestSelect();
		ArrayList<GuestDTO> LG = sql.guestSelect(start, end, sqry);  //������ Ŭ�� �� ������ ���� ��ȣ ó������ ����ȣ 
		
		request.setAttribute("skey", skey);
		request.setAttribute("sval", sval);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("returnpage", returnpage);
		request.setAttribute("Atotal",Atotal);   //�˻� �� ��ȸ�� ���ڵ� ���� 
		request.setAttribute("Gtotal", Gtotal);  //���ڵ��� �� ����
		
		request.setAttribute("LG", LG);
		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response);

	}

}
