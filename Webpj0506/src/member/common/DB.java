package member.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {     //ssi.jsp 문서 역할

	public static Connection getConnection() {
		Connection CN=null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN=DriverManager.getConnection(url,"system","1234");
			//System.out.println("오라클연결 성공!");
			}catch(Exception ex){
				System.out.println("db연결 에러 : "+ex.toString());
			}
		return CN;
	}
}
