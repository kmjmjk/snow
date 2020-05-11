package net.tis.board;

import java.sql.SQLException;

import net.tis.common.DB;
import net.tis.common.Global;

public class BoardSQL extends Global {
	
	public BoardSQL() {
		
	}

	public void boardInsert() {		
		try {
			msg="insert into values()";
			PST = CN.prepareStatement(msg);
		} catch (Exception e) { }
	}
}
