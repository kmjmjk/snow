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
			// System.out.println("����Ŭ���� ����!");
		} catch (Exception ex) {
			System.out.println("db���� ���� : " + ex.toString());
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
					return 1; // �α��� ����
				} else {
					return 0;  //��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ����
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}

}
