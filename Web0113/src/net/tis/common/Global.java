package net.tis.common;

import java.sql.*;
import java.util.Date;
import java.util.ArrayList;  //��ü��ȸ, �Ѱ���ȸ

public class Global {
	
	public Connection CN;  //DB�������� �� user/pwq ���, CN�����ؼ� ��ɾ �����Ѵ�
	public Statement ST;  //������ ��ɾ�
	public PreparedStatement PST;  //�����θ�ɾ� / �Լ��� ���⿡ �������� �ٸ������� �ҷ��� �� �ִ� ����
	public CallableStatement CS;
	public ResultSet RS;  //��ȸ�� ����� ��� RS=ST.executeQuery(select~,RS.next()
			
	public int Grn, Gsabun, Gpay, Ghit;  //��� �޿� ��ȸ��
	public String Gname, Gtitle, Gemail;  //�̸� ���� ����
	public java.util.Date Gwdate;  //��¥
	
	public int Gdata;
	public int Gtotal;  //�˻� �� ���ڵ尹��
	public int Atotal;  //�� ���ڵ� ��
	public String msg;  //������ ����ϴ� ���ڿ�
	public ArrayList Glist;

}
