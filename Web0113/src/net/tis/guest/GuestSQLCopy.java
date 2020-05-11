package net.tis.guest;

import net.tis.common.DB;
import net.tis.common.Global;

import java.sql.Statement;
import java.util.concurrent.ExecutionException;

public class GuestSQLCopy extends Global{

	public GuestSQLCopy() {
		CN = DB.getConnection();  //Global의 CN을 가져온 것이지 DB에서는 지역변수로 설정을 했기때문에 사용할 수 없다
		System.out.println("GuestSQL.java 기본생성자 db연결성공 200121");
		
		// Connection CN = DB.getConnection();  //으로 쓰면 생성자 내에서만 사용할 수 있다
		//DB.getConnection(); //은 담을곳이 없어서 안됨 이렇게 하면 밑에 있는 CN이 null값이 된다
		//GuestSQL sql = new GuestSQL(); 기술하면 CN전역변수가 DB의 정보를 기억하게된다
	}
	
	public void dbInsert() {  
		try {
			
		}catch(Exception e) {System.out.println(e);}	
	}
	
	public int guestDelete(String my) {
		int ok=0;
		try {
		msg="delete from guest where sabun="+my;
		ST=CN.createStatement();
		ok=ST.executeUpdate(msg);
		}catch(Exception e) {System.out.println(e);}
		return ok;
		
	}
}//GuestSQL class END
