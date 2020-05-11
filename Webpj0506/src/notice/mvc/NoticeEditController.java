package notice.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.common.NoticeSQL;
import notice.common.NoticeDTO;
import notice.common.*;

@WebServlet("/noticeEdit.do")
public class NoticeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "storage";
		int uploadFileSize = 5*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println(uploadFilePath);
		

		MultipartRequest mr = new MultipartRequest(request, uploadFilePath, uploadFileSize, encType, new DefaultFileRenamePolicy());
		
		String file = mr.getFilesystemName("nfile");
		int Nnum = Integer.parseInt(mr.getParameter("nnum"));
		String content = mr.getParameter("ncontent");
		String title = mr.getParameter("ntitle");
			
		NoticeSQL sql = new NoticeSQL();
		sql.noticeEdit(title, content, Nnum, file);
		
		response.sendRedirect("notice.do");
		
	}
}//class end
