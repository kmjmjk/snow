package net.tis.common;

import java.sql.*;
import java.util.Date;
import java.util.ArrayList;  //전체조회, 한건조회

public class Global {
	
	public Connection CN;  //DB서버정보 및 user/pwq 기억, CN참조해서 명령어를 생성한다
	public Statement ST;  //정적인 명령어
	public PreparedStatement PST;  //동적인명령어 / 함수를 여기에 만들어놓고 다른곳에서 불러올 수 있는 역할
	public CallableStatement CS;
	public ResultSet RS;  //조회한 결과를 기억 RS=ST.executeQuery(select~,RS.next()
			
	public int Grn, Gsabun, Gpay, Ghit;  //사번 급여 조회수
	public String Gname, Gtitle, Gemail;  //이름 제목 메일
	public java.util.Date Gwdate;  //날짜
	
	public int Gdata;
	public int Gtotal;  //검색 후 레코드갯수
	public int Atotal;  //총 레코드 수
	public String msg;  //쿼리문 기억하는 문자열
	public ArrayList Glist;

}
