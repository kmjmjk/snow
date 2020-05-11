package net.tis.guest;

import java.sql.SQLException;
import java.util.ArrayList;

import net.tis.common.DB;
import net.tis.common.Global;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;;

public class GuestSQL extends Global {	
  public GuestSQL() {
	 CN = DB.getConnection();
	 if(CN==null) {
	    System.out.println("GuestSQL생성자 db연결실패");
	 }
   }//end
	
  
  public int guestInsert(GuestDTO dto) {
	int ok = 0;
	try {
	 msg="insert into guest values(?, ?, ?, sysdate, ?, 0, ?)";
	 PST = CN.prepareStatement(msg);
	 	   PST.setInt(1, dto.getSabun()); //PST.setInt(1, a);
	 	   PST.setString(2, dto.getName()); //PST.setString(2, b);
	 	   PST.setString(3, dto.getTitle()); //PST.setString(3, c);
	 	   PST.setInt(4, dto.getPay());  //PST.setInt(4, d);
	 	   PST.setString(5, dto.getEmail()); //PST.setString(5, e);
	 ok = PST.executeUpdate();
	 if(ok>0) { System.out.println("guest저장성공"); }
	}catch(Exception ex){ }
	return ok ;
  }//end


  public ArrayList<GuestDTO> guestSelect(int start, int end) { //ListController.java연결 댓글갯수
	  ArrayList<GuestDTO> list= new ArrayList<GuestDTO>();
	 try {
	  String a=" select * from ( ";
	  String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from guest";
	  String c=" ) where rn between "+start+" and "+end ; 
	  msg=a+b+c;
	  ST = CN.createStatement();
	  RS = ST.executeQuery(msg);
	  while(RS.next()==true) {
		  GuestDTO dto = new GuestDTO(); //dto객체는 while반복문안쪽에 위치
		  dto.setRn(RS.getInt("rn")); 
		  dto.setSabun(RS.getInt("sabun"));  
		  dto.setName(RS.getString("name"));  
		  dto.setTitle(RS.getString("title"));
		  dto.setWdate(RS.getDate("wdate"));
		  dto.setPay(RS.getInt("pay"));    
		  dto.setHit(RS.getInt("hit")); 
		  dto.setEmail(RS.getString("email"));
		  list.add(dto); //필수항목
	  }//while end
	 }catch(Exception e) { }
	 return list;
  }//guestSelect end
  
  public ArrayList<GuestDTO> guestSelect(int start, int end, String sqry) { //댓글 갯수 표시하는 쿼리문
	  ArrayList<GuestDTO> list= new ArrayList<GuestDTO>();
	 try {
	  String a=" select * from ( ";
	 // String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from guest";
	 // String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email"; 
	  //String z=" from (select *  from guest "+sqry+")";
	  String b=" select rownum rn, g.*,(select count(*) from guestreply r where r.sabun=g.sabun) as rcnt from ";
	  String z=" (select * from guest "+sqry+") g";
	  String c=" ) where rn between "+start+" and "+end ; 		
	  msg=a+b+z+c;
	  ST = CN.createStatement();
	  RS = ST.executeQuery(msg);
	  while(RS.next()==true) {
		  GuestDTO dto = new GuestDTO(); //dto객체는 while반복문안쪽에 위치
		  dto.setRn(RS.getInt("rn")); 
		  dto.setSabun(RS.getInt("sabun"));  
		  dto.setName(RS.getString("name"));  
		  dto.setTitle(RS.getString("title"));
		  dto.setWdate(RS.getDate("wdate"));
		  dto.setPay(RS.getInt("pay"));    
		  dto.setHit(RS.getInt("hit")); 
		  dto.setEmail(RS.getString("email"));
		  dto.setRcnt(RS.getInt("rcnt"));
		  list.add(dto); //필수항목
	  }//while end
	 }catch(Exception e) { }
	 return list;
  }//guestSelect end
  
	
  public int guestTotal() {
	int count=0;
	try {
	 msg="select count(*) as cnt from guest ";
	 ST=CN.createStatement();
	 RS=ST.executeQuery(msg);
	 if(RS.next()==true) { count=RS.getInt("cnt"); }
	}catch(Exception ex) { }
	return count;
  }//end
  
  
  public int guestATotal(String sqry) {   //검색했을 때 나오는 카운트갯수
		int Atotal=0;
		try {
		 msg="select count(*) as cnt from guest "+sqry;
		 ST=CN.createStatement();
		 RS=ST.executeQuery(msg);
		 if(RS.next()==true) { Atotal=RS.getInt("cnt"); }
		}catch(Exception ex) { }
		return Atotal;
	  }//end
  
  
  public GuestDTO guestDetail(String data) { //한건상세출력
	 GuestDTO dto = new GuestDTO(); 
	try {
	  msg="select * from guest where sabun = " + data ;
	  ST=CN.createStatement();
	  RS=ST.executeQuery(msg);
	  if(RS.next()==true) {
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
  
	 public int guestHit(String data) { 
		 int ghit=0; 
		 try {
	    msg="update guest set hit=hit+1 where sabun="+data; 
		ST = CN.createStatement();
		ghit = ST.executeUpdate(msg);
	  }catch(Exception ex) {}
	  return ghit; 
	  }
  
  public int guestDelete( String my ) { 
  	 int ok=0;
	 try {
		msg="delete from guest where sabun = ? " ;
		PST=CN.prepareStatement(msg);
		PST.setString(1, my);
		ok = PST.executeUpdate();
		System.out.println("사번 "+ my +" 데이터 삭제성공");
	 }catch (Exception e){System.out.println(e);}
	 return ok; 
   }//guestDelete end 

  
  public void guestEdit(GuestDTO dto) {
	 try { 
	  msg="update guest set name=?, title=?, wdate=sysdate, pay=?, email=? where sabun=? ";
	  PST=CN.prepareStatement(msg);  
	    PST.setString(1, dto.getName());
		PST.setString(2, dto.getTitle());
		PST.setInt(3, dto.getPay());
		PST.setString(4, dto.getEmail());
		PST.setInt(5, dto.getSabun());
	    PST.executeUpdate();
	    System.out.println("사번 "+ dto.getSabun() +" 데이터 수정성공");
	 }catch(Exception e) { }
	
  }//end
  
}//GuestSQL class END



