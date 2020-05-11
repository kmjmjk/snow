package stylist.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class StylistSQL {
	private Connection CN; //DB서버정보기억 및 명령어생성
	private Statement ST; //ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.excuteQuery(sqlmsg)
	private String msg; //sql메세지기억
	//private int total; //레코드 갯수
	
	public StylistSQL(){
		try {
			CN = DB.getConnection();
		} catch (Exception e) {	}
	}// end
	
	
	public String checkid(String id) {
		String num="0";
		try {
			msg=" select count(*) as cnt from member where id='"+ id +"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true){
				num=RS.getString("cnt");
				if(num.equals("0")){
					num="0";//가능
				 }else if(num.equals("1")){num="1";}//불가능
			}//if end
		} catch (Exception e) { System.out.println("아이디 중복실패.");	}
		return num;
	}//checkid end


	public int dbInsert(StylistDTO bean) {
		int register_ok = 0;
		try {
			msg="insert into s_stylist values (?,?,?,?,?,?,?,sysdate,?)" ;
				PST=CN.prepareStatement(msg);
				PST.setString(1, bean.getSid());
				PST.setString(2, bean.getSname());
				PST.setString(3, bean.getSpos());
				PST.setInt(4, bean.getSprice());
				PST.setString(5, bean.getStel());
				PST.setString(6, bean.getSdayoff());
				PST.setString(7, bean.getSpicture());
				PST.setString(8, bean.getSprofile());
				register_ok = PST.executeUpdate();
		} catch (Exception e){System.out.print("dbInsert(DBbean)저장실패!!! : " + e);}
		return register_ok;
	}//dbInsert end
	
	public ArrayList<StylistDTO> stylistSelect() {
		ArrayList<StylistDTO> list = new ArrayList<StylistDTO>();
		try {
			msg = " select sid, sname, spos, sprice, sdayoff, spicture, sprofile from s_stylist ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()==true) {
				StylistDTO dto = new StylistDTO();
				dto.setSid(RS.getString("sid"));
				dto.setSname(RS.getString("sname"));
				dto.setSpos(RS.getString("spos"));
				dto.setSprice(RS.getInt("sprice"));
				dto.setSdayoff(RS.getString("sdayoff"));
				dto.setSpicture(RS.getString("spicture"));
				dto.setSprofile(RS.getString("sprofile"));
				list.add(dto);
			}	
		}catch(Exception e) {}
		return list;
	}//stylistSelect end
 
}//class END
