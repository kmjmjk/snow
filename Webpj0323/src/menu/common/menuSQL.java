package menu.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import booking.common.DB;

public class menuSQL {
	private Connection CN;
	private Statement ST; //ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.excuteQuery(sql message)
	private String msg;
	//private int total;
	
	public menuSQL(){
		try {
			CN = DB.getConnection();
		} catch (Exception e) {	}
	}// end
	
	public ArrayList<menuInfo> menuSelect(int num){
		ArrayList<menuInfo> list = new ArrayList<menuInfo>();
		try {
			msg=" select mnum, mservice, mprice, mdtime from s_menu where floor(mnum/10)= "+num ;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				menuInfo info = new menuInfo();
			    info.setMnum(RS.getInt("mnum"));
			    info.setMservice(RS.getString("mservice"));
			    info.setMprice(RS.getInt("mprice"));
			    info.setMdtime(RS.getInt("mdtime"));
			    list.add(info);
			}//while end
		}catch(Exception ex) {}
		return list;
	}//menuSelect end
	
	public int menuInsert(menuInfo info) {
		int ok = 0;
		try {
			msg= " insert into s_menu values (?,?,?,?,?,?,? ) ";
			PST= CN.prepareStatement(msg);
				PST.setInt(1, info.getMnum());
				PST.setString(2, info.getMservice());
				PST.setString(3, info.getMtype());
				PST.setInt(4, info.getMprice());
				PST.setInt(5, info.getMdtime());
				PST.setString(6, info.getMcontent());
				PST.setString(7, info.getMimage());
			ok = PST.executeUpdate();
			if(ok>0) {System.out.println("새로운 시술메뉴 저장 성공");}
		}catch(Exception ex) {}
		return ok;	
	}//menuInsert end
}
