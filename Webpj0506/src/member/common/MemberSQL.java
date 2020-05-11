package member.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberSQL {
	private Connection CN; //DB����������� �� ��ɾ����
	private Statement ST; //ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.excuteQuery(sqlmsg)
	private String msg; //sql�޼������
	
	
	public MemberSQL(){
		try {
			CN = DB.getConnection();
		} catch (Exception e) {	}
	}// end
	
	
	public int dbInsert(MemberDTO bean) {
		int ok = 0;
		try {
			String msg="insert into s_member values(?,?,?,?,?,?,?,?,?,?,sysdate)";
		
			PST=CN.prepareStatement(msg);
			PST.setString(1, bean.getId());
			PST.setString(2, bean.getPw());
			PST.setString(3, bean.getName());
			PST.setString(4, bean.getTel());
			PST.setString(5, bean.getEmail());
			PST.setString(6, bean.getGender());
			PST.setString(7, bean.getZipcode());
			PST.setString(8, bean.getAdd1());
			PST.setString(9, bean.getAdd2());
			PST.setString(10, bean.getBirth());
			PST.executeQuery();	
			ok=1;
		} catch (Exception e){System.out.print("���� : " + e);}
		return ok;
	}//dbInsert end
	
	public int memDelete(String id) {
		int ok=0;
		try {
			msg="delete from s_member where id=?";
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			ok=PST.executeUpdate();		
		}catch(Exception e) { }
		return ok;	
	}
	

	
}//class END

