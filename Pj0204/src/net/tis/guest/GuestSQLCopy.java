package net.tis.guest;

import net.tis.common.DB;
import net.tis.common.Global;

import java.sql.Statement;
import java.util.concurrent.ExecutionException;

public class GuestSQLCopy extends Global{

	public GuestSQLCopy() {
		CN = DB.getConnection();  //Global�� CN�� ������ ������ DB������ ���������� ������ �߱⶧���� ����� �� ����
		System.out.println("GuestSQL.java �⺻������ db���Ἲ�� 200121");
		
		// Connection CN = DB.getConnection();  //���� ���� ������ �������� ����� �� �ִ�
		//DB.getConnection(); //�� �������� ��� �ȵ� �̷��� �ϸ� �ؿ� �ִ� CN�� null���� �ȴ�
		//GuestSQL sql = new GuestSQL(); ����ϸ� CN���������� DB�� ������ ����ϰԵȴ�
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
