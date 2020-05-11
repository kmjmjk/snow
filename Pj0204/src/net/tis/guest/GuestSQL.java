package net.tis.guest;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import net.tis.common.DB;
import net.tis.common.Global;

public class GuestSQL extends Global {	
   public GuestSQL() {
	 CN = DB.getConnection();
	 if(CN==null) {
	    System.out.println("GuestSQL기본생성자 db연결실패 1월29일 수요일");
	 }
   }//end
	
  public int guestInsert(int a,String b, String c, int d, String e) { //guestWriteSave.jsp문서에서 호출됨
	  int ok=0;
	  try {
	 //msg="insert into guest values(a,'b','c',sysdate,d,0,'e')";
	 //msg="insert into guest values("+a+",'"+b+"','"+c+"', sysdate,"+d+",0,'"+e+"')";
	 msg="insert into guest values(?, ?, ?, sysdate, ?, 0)";
	 PST = CN.prepareStatement(msg); //해석컴파일
	 	   PST.setInt(1, a);
	 	   PST.setString(2, b);
	 	   PST.setString(3, c);
	 	   PST.setInt(4, d);
	 ok = PST.executeUpdate(); //진짜저장 
	 if(ok>0) { System.out.println("guest테이블 저장성공"); }
	}catch(Exception ex){ }
	  return ok;
  }//end
	
  
  public void guestInsert(GuestDTO dto) { 
	int ok=0;
	try {
	 msg="insert into guest values(?, ?, ?, sysdate, ?, 0, ?)";
	 PST = CN.prepareStatement(msg);
	 	   PST.setInt(1, dto.getSabun()); //PST.setInt(1, a);
	 	   PST.setString(2, dto.getName()); //PST.setString(2, b);
	 	   PST.setString(3, dto.getTitle()); //PST.setString(3, c);
	 	   PST.setInt(4, dto.getPay());  //PST.setInt(4, d);
	 	   PST.setString(5, dto.getEmail()); //PST.setString(5, e);
	 ok = PST.executeUpdate();
	 if(ok>0) { System.out.println("GuestDTO매개인자이용 저장성공"); }
	}catch(Exception ex){ }
  }//end

  
  public ArrayList<GuestDTO> guestSelect( ) { //guestList0130.jsp연결출력
	ArrayList<GuestDTO> list = new ArrayList<GuestDTO>();
	 try {
	  String a=" select * from ( ";
	  String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from guest";
	  String c=" ) ";
	  msg=a+b+c;
	  ST = CN.createStatement();
	  RS = ST.executeQuery(msg);
	  while(RS.next()==true) {
		  GuestDTO dto=new GuestDTO();
		  dto.setRn(RS.getInt("rn")); 
		  dto.setSabun(RS.getInt("sabun"));  
		  dto.setName(RS.getString("name"));  
		  dto.setTitle(RS.getString("title"));
		  dto.setWdate(RS.getDate("wdate"));
		  dto.setPay(RS.getInt("pay"));    
		  dto.setHit(RS.getInt("hit")); 
		  dto.setEmail(RS.getString("email"));	  
		  list.add(dto);
	  }//while end
	 }catch(Exception e) { }
	 return list;
  }//guestSelect end
	
  
  public int guestGtotal() {
	  int count=0;	
		try {
			msg="select count(*) as cnt from guest";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) {
			count=RS.getInt("cnt"); }
		}catch(Exception ex) { }
	 return count; 
	}//
  
	
  public GuestDTO guestDetail(String data) {
	  GuestDTO dto = new GuestDTO();
	  try {
		  msg="select * from guest where sabun="+data;
		  ST=CN.createStatement();
		  RS=ST.executeQuery(msg);
		  if(RS.next()==true) {			  
			  dto.setRn(RS.getInt("rn")); 
			  dto.setSabun(RS.getInt("sabun"));  
			  dto.setName(RS.getString("name"));  
			  dto.setTitle(RS.getString("title"));
			  dto.setWdate(RS.getDate("wdate"));
			  dto.setPay(RS.getInt("pay"));    
			  dto.setHit(RS.getInt("hit")); 
			  dto.setEmail(RS.getString("email"));	    
		  }
	  }catch(Exception ex) { }
	  return dto;
  }//guestDetail end
  
  
  public int guestDelete( String my ) { //guestDelete.jsp문서에서사용
  	 int ok=0;
	 try {
		msg="delete from guest where sabun = ? " ;
		//msg="delete from guest where sabun = " +  my ; 
		//ST=CN.createStatement( );
		//ok = ST.executeUpdate(msg);
		
		PST = CN.prepareStatement(msg);
			  PST.setString(1, my);
		ok = PST.executeUpdate();
		System.out.println(my +" 데이터 삭제 성공 1월29일 수요일 오후");
	 }catch (Exception e){System.out.println(e);}
	 return ok; 
	}//guestDelete end
	
}//GuestSQL class END





