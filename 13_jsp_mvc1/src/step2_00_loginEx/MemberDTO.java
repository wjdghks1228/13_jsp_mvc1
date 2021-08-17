package step2_00_loginEx;

import java.util.Date;

//bean , dto , vo , pojo 다 비슷한 의미
//DTO : Data Transfer Object : 데이터 전송 객체 -> 틀을 만들어서 이틀로 데이터를 전송하겠다.
public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private Date joindate;
	
	public MemberDTO() {}
	public MemberDTO(String id, String passwd, String name) {
		this.id = id;
		this.passwd = passwd;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}	
}
