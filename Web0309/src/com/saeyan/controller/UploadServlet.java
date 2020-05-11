package com.saeyan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "storage";  //저장될 폴더의 이름
		int uploadFileSizeLimit = 5*1024*1024;  //파일의 최대 사이즈 제한 앞의 5는 5mb로 크기를 제한하겠다는 뜻
		String encType="UTF-8";  
		
		ServletContext context = getServletContext();  //서버상의 실제 경로 찾아오기
		String uploadFilePath = context.getRealPath(savePath); //파일의 경로는 위에 지정해준 storage로 들어가게끔
		System.out.println("서버상의 실제 디렉토리");
		System.out.println(uploadFilePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			String fileName =multi.getFilesystemName("uploadFile");
			
			if(fileName != null) {					
				System.out.print("<br>업로드된 파일명: "+fileName);				
			}	
			request.setAttribute("fileName", fileName);
			RequestDispatcher dis = request.getRequestDispatcher("01_upload_img.jsp");
			dis.forward(request, response);
			
		}catch(Exception e) { System.out.println("예외발생 "+e); }		
		
	}
}
