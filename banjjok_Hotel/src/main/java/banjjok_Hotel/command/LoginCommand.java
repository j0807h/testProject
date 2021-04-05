package banjjok_Hotel.command;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginCommand {
	@NotEmpty
	@Size(min = 3, max = 127, message = "아이디를 입력하세요.")
	String userId;
	@NotEmpty(message = "비밀번호를 입력하세요.")
	String userPw;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
}
