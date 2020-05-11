package join;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BlogDAO {
	private Connection CN;
	private PreparedStatement PST;
	private ResultSet RS;

	public BlogDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url, "system", "1234");
			// System.out.println("오라클연결 성공!");
		} catch (Exception ex) {
			System.out.println("db연결 에러 : " + ex.toString());
		}

	}

	public int login(String id, String pass1) {

		String msg = "select pass1 from bmember where id=?";
		try {
			PST = CN.prepareStatement(msg);
			PST.setString(1, id);
			RS = PST.executeQuery();
			if (RS.next()) {
				if (RS.getString(1).equals(pass1)) {
					return 1; // 로그인 성공
				} else {
					return 0;  //비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

}
