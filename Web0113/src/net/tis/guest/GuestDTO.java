package net.tis.guest;
//java, xml, jsp 문서와 연결해주는 다리역할을 해준다 DTO(data transfer object)/ VO(Value object)라고도 한다
public class GuestDTO {

	private int sabun, pay, hit;
	private String name, title;
	private java.util.Date wdate;
	private int rn;
	private String email;
	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public int getSabun() {return sabun;}
	public void setSabun(int sabun) {this.sabun = sabun;}
	public int getPay() {return pay;}
	public void setPay(int pay) {this.pay = pay;}
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public java.util.Date getWdate() {return wdate;}
	public void setWdate(java.util.Date wdate) {this.wdate = wdate;}
	public int getRn() {return rn;}
	public void setRn(int rn) {this.rn = rn;}
	
}
//오른쪽버튼 클릭 source->Generate Getter and Setters..->select all클릭 하면 자동으로 퍼블릭 생성