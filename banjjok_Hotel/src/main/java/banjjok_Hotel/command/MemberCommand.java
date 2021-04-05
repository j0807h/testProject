package banjjok_Hotel.command;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class MemberCommand {
	// 회원정보
	@NotEmpty(message = "아이디를 입력하세요.")
	@Size(min = 3, max = 12)
	String memId;
	@Size(min = 3, max = 16)
	@NotEmpty(message = "비밀번호를 입력하세요.")
//		@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
//	    message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	String memPw;
	@NotEmpty(message = "연락처를 입력하세요.")
	@Size(min = 13)
//		@Pattern(regexp=" /^\\d{3}-\\d{3,4}-\\d{4}$/")
	String memMobile;
	@NotEmpty(message = "이메일 입력하세요.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	String memEmail;
	@NotEmpty(message = "성함을 입력하세요.")
	String memName;
	String nicName;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemMobile() {
		return memMobile;
	}

	public void setMemMobile(String memMobile) {
		this.memMobile = memMobile;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

}
