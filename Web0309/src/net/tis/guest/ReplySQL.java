package net.tis.guest;



import java.util.ArrayList;

import javafx.scene.control.Alert;
import net.tis.common.DB;
import net.tis.common.Global;

public class ReplySQL extends Global { 
	
	public ReplySQL() {//리플생성자
		 CN=DB.getConnection();
	}//end
	 
	 public void dbReplyInsert(String w, String c, int sabun) {
		 try {
			 msg="insert into guestreply values(guestreply_seq.nextval, ?, ?, ? )" ;
			 PST=CN.prepareStatement(msg);
			 	   PST.setString(1, w);
			 	   PST.setString(2, c);
			 	   PST.setInt(3,sabun);
			 PST.executeUpdate();
		 }catch(Exception ex) {System.out.println("댓글저장에러:"+ex); }
	 }//end
	 
	 
	public ArrayList<ReplyDTO> dbReplySelect(int  Rdata){ //사번조건
		 ArrayList<ReplyDTO> list=new ArrayList<ReplyDTO>();
		 try {
			StringBuffer sb=new StringBuffer();
		  sb.append("select rownum rn, g.sabun, r.num, r.writer,r.content from guest g ");
		  sb.append(" inner join guestreply r  ");
		  sb.append(" on g.sabun = r.sabun ");
		  sb.append(" and r.sabun = " +  Rdata);
		  ST=CN.createStatement();
		  RS=ST.executeQuery(sb.toString());
		  while(RS.next()==true) {
		  	ReplyDTO rdto=new ReplyDTO();
		  	  rdto.setRrn(RS.getInt("rn"));
		  	  rdto.setNum(RS.getInt("num"));
		  	  rdto.setWriter(RS.getString("writer"));
		  	  rdto.setContent(RS.getString("content"));
		  	  rdto.setSabun(RS.getInt("sabun"));
		  	list.add(rdto);
		  }
		 }catch(Exception ex) {System.out.println("리플전체출력에러:"+ex); }
		 return list;
	}//end
	 
	 public void dbReplyDelete(int rnum) { //리플한건삭제
		 try {
			 msg="delete from guestreply where num = " + rnum ;
			 ST=CN.createStatement();
			 ST.executeUpdate(msg);
			 System.out.println(rnum + "번 리플데이터삭제 성공");
		 }catch(Exception ex){System.out.println("리플삭제에러:"+ex);}
	 }//end
	 
	 public void dbReplyUpdate(ReplyDTO rdto) {//댓글수정
		 try {
			 msg="update guestreply set writer=?, content=?  where num=?" ;
			 PST=CN.prepareStatement(msg);
					 PST.setString(1, rdto.getWriter());
					 PST.setString(2, rdto.getContent());
					 PST.setInt(3, rdto.getNum());  
				PST.executeUpdate(); //진짜수정
					 System.out.println(rdto.getWriter()+ " 님 데이터수정갱신 성공");
		 }catch(Exception ex) {System.out.println("리플update에러:"+ex); }	 
	 }//end
	 
	 public int dbReplyCount(int Rdata) {
		 int count=0;
		 try {
			 msg="select  count(*) as cnt from guestreply where sabun = " + Rdata ;
			 ST=CN.createStatement();
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true) { count=RS.getInt("cnt");}
		 }catch(Exception ex) { }
		 return count;
	 }//end
	 	 
	 
	 //리플 페이징
	 public ArrayList<ReplyDTO> dbRelpySelect(int Rdata, int start, int end){ 
		 ArrayList<ReplyDTO> list=new ArrayList<ReplyDTO>();
		 try {
			 String x="select rownum rn,  r.* from  guestreply r where sabun = " + Rdata ;
		 }catch(Exception ex) {System.out.println("리플에러:"+ex); }
		 return list;
	 }//end	 
	
}//ReplySQL class END








