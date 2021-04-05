package banjjok_Hotel.domain;

public class AuthInfo {
	private String userId;
	private String userName;
	private String grade;
	
	public AuthInfo(String userId, String userName, String grade) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.grade = grade;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	

}
