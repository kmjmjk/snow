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
		
		String savePath = "storage";  //����� ������ �̸�
		int uploadFileSizeLimit = 5*1024*1024;  //������ �ִ� ������ ���� ���� 5�� 5mb�� ũ�⸦ �����ϰڴٴ� ��
		String encType="UTF-8";  
		
		ServletContext context = getServletContext();  //�������� ���� ��� ã�ƿ���
		String uploadFilePath = context.getRealPath(savePath); //������ ��δ� ���� �������� storage�� ���Բ�
		System.out.println("�������� ���� ���丮");
		System.out.println(uploadFilePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			String fileName =multi.getFilesystemName("uploadFile");
			
			if(fileName != null) {					
				System.out.print("<br>���ε�� ���ϸ�: "+fileName);				
			}	
			request.setAttribute("fileName", fileName);
			RequestDispatcher dis = request.getRequestDispatcher("01_upload_img.jsp");
			dis.forward(request, response);
			
		}catch(Exception e) { System.out.println("���ܹ߻� "+e); }		
		
	}
}
