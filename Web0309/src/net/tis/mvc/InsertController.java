package net.tis.mvc;

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

import net.tis.guest.GuestDTO;
import net.tis.guest.GuestSQL;

@WebServlet("/ginsert.tis")  //�� ������ �̸��� ���Ƿ� �־���(����)
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doUser(request, response);
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  //servlet���� p.66
		
		String savePath = "storage";
		
		ServletContext context = this.getServletContext();
		DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();  
		String uploadFilePath = context.getRealPath(savePath); 
		int sizeLimit = 5*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, uploadFilePath, sizeLimit, "UTF-8", dfp); //���Ͼ��ε� �Ϸ��� ��Ƽ��Ʈ��¼�� ��������
		
		int Gsabun = Integer.parseInt(request.getParameter("sabun"));
		String Gname = request.getParameter("name");
		String Gtitle= request.getParameter("title");
		int Gpay=Integer.parseInt(request.getParameter("pay"));
		String Gemail=request.getParameter("email");
		String file = mr.getFilesystemName("uploadFile");  //***���Ͼ��ε�
		
		/*
		 * System.out.println("InsertController.java ��������");
		 * System.out.println("�Ѿ�� ��� : "+Gsabun);
		 * System.out.println("�Ѿ�� �̸� : "+Gname);
		 * System.out.println("�Ѿ�� ���� : "+Gtitle); System.out.println("�Ѿ�� �޿� : "+Gpay);
		 * System.out.println("�Ѿ�� ���� : "+Gemail + "\n");
		 */
	
		GuestDTO dto = new GuestDTO();
		GuestSQL sql = new GuestSQL();
		
		dto.setSabun(Gsabun);
		dto.setName(Gname);
		dto.setTitle(Gtitle);
		dto.setPay(Gpay);
		dto.setEmail(Gemail);
		
		dto.setFile(file);    //***���Ͼ��ε�
		
		int OK = sql.guestInsert(dto);
		if(OK > 0){
			System.out.println("���� ����");
			response.sendRedirect("glist.tis");  //listController.jsp ������ ��¥�̸�
		}else{
		out.println("<a href='index.jsp'> [index.jsp] </a>");
		out.println("<a href='guestWrite.jsp'> [�űԵ��] </a>");
		out.println("<a href='glist.tis'> [list] </a>"); 
		}
		
		out.println("<h2>");
		out.println("<a href='index.jsp'> [index.jsp] </a>");
		out.println("<a href='guestWrite.jsp'> [�űԵ��] </a>");
		out.println("<a href='glist.tis'> [list] </a>");
		out.println("</h2>");
	
	}

}
