package booking.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class BookingSQL {
	private Connection CN;
	private Statement ST; //ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.excuteQuery(sqlmsg)
	private String msg;
	//private int total;
	
	public BookingSQL(){
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
					num="0";//ï¿½ï¿½ï¿½ï¿½
				 }else if(num.equals("1")){num="1";}//ï¿½Ò°ï¿½ï¿½ï¿½
			}//if end
		} catch (Exception e) { System.out.println("ï¿½ï¿½ï¿½Ìµï¿½ ï¿½ßºï¿½ï¿½ï¿½ï¿½ï¿½.");	}
		return num;
	}//checkid end
	
	public String[] checktime(String designer, String date) {
		//String selectable = "";
		String[] selectable = new String[9];
		int i=0;
		try {
			String a = " select NVL2(b.bktime, 'N','Y') as opentime ";
			String b = " from (select bkvisitdate, bktime from s_booking where bkstylist=? and bkvisitdate=?) b ";
			String c = " right outer join s_timetable t ";
			String d = " on b.bktime = t.timef2 order by t.timef2 ";
			msg=a+b+c+d;
				PST=CN.prepareStatement(msg);
				PST.setString(1, designer);
				PST.setString(2, date);
				RS=PST.executeQuery();
			while(RS.next()==true) {
				selectable[i] = RS.getString("opentime");
				i++;
			}
			
		}catch (Exception e) { System.out.println(e);}
		return selectable;
	}//checktime end
	
	//DB¿¡ ÃÖÁ¾ ÀÔ·ÂÇÏ±â Àü¿¡ ÀÌ¹Ì ±× ÀÚ¸®¿¡ ¿¹¾àÇÑ »ç¶÷ÀÌ ÀÖ´ÂÁö ÃÖÁ¾È®ÀÎ¿ë
	public String checkbk(String designer, String date, String time) {
	    String bnum = "0";
		try {
			msg=" select count(*) as cnt from s_booking where bkstylist=? and bkvisitdate=? and bktime=? ";
				PST=CN.prepareStatement(msg);
				PST.setString(1, designer);
				PST.setString(2, date);
				PST.setString(3, time);
				RS=PST.executeQuery();
				if(RS.next()==true) {
					bnum = RS.getString("cnt");
					if(bnum.equals("0")) {
						bnum="0";
					}else if(bnum.equals("1")) {bnum="1";}
				}//if end
		} catch (Exception e) { System.out.println(e);}
		return bnum;
	}

	

	public int dbInsert(BookingDTO bean) {
		int register_ok = 0;
		try {
			msg="insert into s_booking values (s_booking_seq.nextval,?,?,?,to_date(?),?,?,sysdate,?)" ;
				PST=CN.prepareStatement(msg);
				PST.setString(1, bean.getBkid());
				PST.setString(2, bean.getBkstylist());
				PST.setInt(3, bean.getBktcost());
				PST.setString(4, bean.getBkvisitdate());
				PST.setString(5, bean.getBktime());
				PST.setString(6, bean.getBkservice());
				PST.setInt(7, bean.getBkdtime());
				register_ok = PST.executeUpdate();
		} catch (Exception e){System.out.print("dbInsert(BookingDTO) Success!!! : " + e);}
		return register_ok;
	}//dbInsert end
 
}//class END
