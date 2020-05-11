package qna.common;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import qna.common.DB;
import qna.mvc.*;

public class QboardSQL {
	private Connection CN; //DB서버정보기억 및 명령어생성
	private Statement ST; //ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.excuteQuery(sqlmsg)
	private String msg; //sql메세지기억
	
	public QboardSQL(){	
			CN = DB.getConnection();	
	}
	//**질문작성
	public int QnaWrite(QboardDTO dto) {
		try {
			msg = "insert into q_board values(?,q_board_seq.nextval,?,?,sysdate,0)";
			System.out.println(msg);
			PST = CN.prepareStatement(msg);
			PST.setString(1, dto.getQid());
			PST.setString(2, dto.getQtitle());
			PST.setString(3, dto.getQcontent());
			PST.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	
	}
		
	//**답글 작성
		public int replyInsert(QboardDTO rdto) {  
			try {
				msg = "insert into a_board values(?,'admin','shop kim',?,?,sysdate,0)";
				System.out.println(msg);
				PST = CN.prepareStatement(msg);
				PST.setInt(1, rdto.getAnum());
				PST.setString(2, rdto.getAtitle());
				PST.setString(3, rdto.getAcontent());
				PST.executeUpdate();			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		} 
		
		public ArrayList<QboardDTO> qnaList(int start, int end) { 
			ArrayList<QboardDTO> qlist = new ArrayList<QboardDTO>();
			try {
				String a = " select * from (";
				String b = " select rownum rn, qnum, qid, qtitle, qcontent, qdate, qhit ";
				String z = " from (select * from q_board)";
				String c = " ) where rn between "+start+" and "+end+" order by qdate desc";
				msg = a + b + z + c;
				System.out.println(msg);
				ST = CN.createStatement();
				RS = ST.executeQuery(msg);
				while(RS.next()==true) {
					QboardDTO dto = new QboardDTO();
					dto.setQnum(RS.getInt("qnum"));
					dto.setQid(RS.getString("qid"));
					dto.setQtitle(RS.getString("qtitle"));
					dto.setQcontent(RS.getString("qcontent"));
					dto.setQdate(RS.getDate("qdate"));
					dto.setQhit(RS.getInt("qhit"));
					qlist.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return qlist;
		}
			
	public int qnaTotal() {
		int Qtotal = 0;
		try {
			String msg = "select count(*) as cnt from q_board ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				Qtotal = RS.getInt("cnt");
			}
		} catch (Exception e) { }
		return Qtotal;
	}
	
}

