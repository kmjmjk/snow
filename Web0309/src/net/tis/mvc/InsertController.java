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

@WebServlet("/ginsert.tis")  //이 서블릿의 이름을 임의로 주었다(매핑)
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
		PrintWriter out = response.getWriter();  //servlet기초 p.66
		
		String savePath = "storage";
		
		ServletContext context = this.getServletContext();
		DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();  
		String uploadFilePath = context.getRealPath(savePath); 
		int sizeLimit = 5*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, uploadFilePath, sizeLimit, "UTF-8", dfp); //파일업로드 하려고 멀티파트어쩌구 정의해줌
		
		int Gsabun = Integer.parseInt(request.getParameter("sabun"));
		String Gname = request.getParameter("name");
		String Gtitle= request.getParameter("title");
		int Gpay=Integer.parseInt(request.getParameter("pay"));
		String Gemail=request.getParameter("email");
		String file = mr.getFilesystemName("uploadFile");  //***파일업로드
		
		/*
		 * System.out.println("InsertController.java 서블릿문서");
		 * System.out.println("넘어온 사번 : "+Gsabun);
		 * System.out.println("넘어온 이름 : "+Gname);
		 * System.out.println("넘어온 제목 : "+Gtitle); System.out.println("넘어온 급여 : "+Gpay);
		 * System.out.println("넘어온 메일 : "+Gemail + "\n");
		 */
	
		GuestDTO dto = new GuestDTO();
		GuestSQL sql = new GuestSQL();
		
		dto.setSabun(Gsabun);
		dto.setName(Gname);
		dto.setTitle(Gtitle);
		dto.setPay(Gpay);
		dto.setEmail(Gemail);
		
		dto.setFile(file);    //***파일업로드
		
		int OK = sql.guestInsert(dto);
		if(OK > 0){
			System.out.println("저장 성공");
			response.sendRedirect("glist.tis");  //listController.jsp 문서의 가짜이름
		}else{
		out.println("<a href='index.jsp'> [index.jsp] </a>");
		out.println("<a href='guestWrite.jsp'> [신규등록] </a>");
		out.println("<a href='glist.tis'> [list] </a>"); 
		}
		
		out.println("<h2>");
		out.println("<a href='index.jsp'> [index.jsp] </a>");
		out.println("<a href='guestWrite.jsp'> [신규등록] </a>");
		out.println("<a href='glist.tis'> [list] </a>");
		out.println("</h2>");
	
	}

}
