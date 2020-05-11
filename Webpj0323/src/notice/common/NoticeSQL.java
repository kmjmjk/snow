package notice.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import notice.common.DB;

public class NoticeSQL {
	private Connection CN; // DB서버정보기억 및 명령어생성
	private Statement ST; // ST=CN.createStatement()
	private PreparedStatement PST; // insert, update
	private ResultSet RS; // RS=ST.excuteQuery(sqlmsg)

	public NoticeSQL() {
		CN = DB.getConnection();
	}
	
/*	public int noticeInsert(NoticeDTO ndto) {
		int ok = 0;
		String msg="insert into s_notice values(s_notice_seq.nextval ,'admin',?,?,sysdate,0,?)";
		try {
			PST=CN.prepareStatement(msg);
			PST.setString(1, ndto.getNtitle());
			PST.setString(3, ndto.getNcontent());
			PST.setString(4, ndto.getNfile());
			ok=PST.executeUpdate();
			if(ok>0) {
				System.out.println("글쓰기 성공");
			}
		} catch (SQLException e1) {	
			e1.printStackTrace();
		}return ok;
	}
	
*/	
	public int noticeWrite(String title, String content, String file) {
		int ok = 0;
		String msg="insert into s_notice values(s_notice_seq.nextval ,'admin','"+title+"','"+content+"',sysdate,0,'"+file+"')";
		try {
			ST=CN.createStatement();
			ok=ST.executeUpdate(msg);
			if(ok>0) {
				System.out.println("글쓰기 성공");
			}
		} catch (SQLException e1) {	
			e1.printStackTrace();
		}return ok;
	}
	
	public int noticeEdit(String title, String content, int Nnum, String file) {    //**공지사항 수정
		int ok = 0;
		try {
		String msg = "update s_notice set ntitle='"+title+"', ncontent='"+content+"', nfile='"+file+"' where nnum="+Nnum;
		System.out.println(msg);
		ST=CN.createStatement();
		ok = ST.executeUpdate(msg);
		if(ok>0) {
			System.out.println("수정 완료");
			}
		} catch (SQLException e) {
		}return ok;
	}
	
	public ArrayList<NoticeDTO> noticeList(int start, int end) { 
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			String a = " select * from (";
			String b = " select rownum rn, nnum, nid, ntitle, ncontent, ndate, nhit, nfile ";
			String z = " from (select * from s_notice)";
			String c = " ) where rn between "+start+" and "+end+" order by nnum desc";
			String msg = a + b + z + c;
			System.out.println(msg);
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				NoticeDTO dto = new NoticeDTO(); 
				dto.setNnum(RS.getInt("nnum"));
				dto.setNid(RS.getString("nid"));
				dto.setNtitle(RS.getString("ntitle"));
				dto.setNcontent(RS.getString("ncontent"));
				dto.setNdate(RS.getDate("ndate"));
				dto.setNhit(RS.getInt("nhit"));
				dto.setNfile(RS.getString("nfile"));
				list.add(dto);
			}
		} catch (Exception e) {
		}
		return list;
	}
	
/*	public NoticeDTO noticeDetail(int nnum) {
		NoticeDTO dt = new NoticeDTO();
		String msg = "select * from s_notice where nnum="+nnum;
		try {
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()==true) {
				dt.setNnum(RS.getInt("nnum"));
				dt.setNtitle(RS.getString("ntitle"));
				dt.setNcontent(RS.getString("ncontent"));
				dt.setNdate(RS.getDate("ndate"));
				dt.setNhit(RS.getInt("nhit"));
				dt.setNfile(RS.getString("nfile"));
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		return dt;
	} */
//*********토탈 구하기	
	public int noticeTotal() {
		int Ntotal = 0;
		String msg = "select count(*) as cnt from s_notice ";
		try {
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next() == true) {
				Ntotal = RS.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Ntotal;
	}
	
	public int noticeDelete(int nnum) {
		int ok=0;
		try {
		String msg="delete from s_notice where nnum="+nnum;
		ST = CN.createStatement();
		ok=ST.executeUpdate(msg);
		}catch(Exception ex) { 
		}return ok;
	}


}// class end
