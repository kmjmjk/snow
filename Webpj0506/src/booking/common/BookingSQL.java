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
					num="0";//가능
				 }else if(num.equals("1")){num="1";}//불가능
			}//if end
		} catch (Exception e) { System.out.println("아이디 중복.");	}
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
	
	//DB
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

	public int checkbk(String mid) {
		int count=0;
		try {
		 msg="select count(*) as cnt from s_booking where bkid= '"+mid+"'";
		 ST=CN.createStatement();
		 RS=ST.executeQuery(msg);
		 if(RS.next()==true) { count=RS.getInt("cnt"); }
		}catch(Exception ex) { }
		return count;
	}
	
	public BookingDTO selectbyId(String mid) {
		BookingDTO dto = new BookingDTO();
		try {
			String a = " select bknum, bkid, to_char(bkvisitdate,'yyyy\"년\" mm\"월\" dd\"일\"') as bkvisitdate, bktime, bkstylist, bkservice, bktcost, bkdtime from s_booking ";
			String z = " where bkid = \'"+ mid + "\' ";
			String b = " and to_char(bkvisitdate, 'yyyymmdd')||substr(bktime,0,2)||'00' >= to_char(sysdate, 'yyyymmddhh24mi') ";
			String c = " order by bkvisitdate, bktime ";
			msg = a + z + b + c;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) {
				dto.setBknum(RS.getInt("bknum"));
				dto.setBkid(RS.getNString("bkid"));
				dto.setBkvisitdate(RS.getString("bkvisitdate"));
				dto.setBktime(RS.getString("bktime"));
				dto.setBkstylist(RS.getString("bkstylist"));
				dto.setBkservice(RS.getString("bkservice"));
				dto.setBktcost(RS.getInt("bktcost"));
				dto.setBkdtime(RS.getInt("bkdtime"));
			}
		} catch (Exception e) {System.out.println(e);}
		return dto;
	}

	public int dbInsert(BookingDTO bean) {
		int register_ok = 0;
		try {
			msg="insert into s_booking values (s_booking_seq.nextval,?,?,?,to_date(?),?,?,sysdate,?,'booked')" ;
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
