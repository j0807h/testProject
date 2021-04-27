package banjjok_Hotel.command;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class PetSitterCommand {
	@Size(min = 4, max = 12, message = "아이디를 입력하세요.")
	String sitterId;
	
	@NotEmpty(message = "비밀번호를 입력하세요.")
	String sitterPw;
	
	@NotBlank(message = "비밀번호 확인을 입력하세요.")
	String sitterPwCon;
	
	@Size(min = 3, max = 12, message = "이름을 입력하세요.")
	String sitterName;
	
	MultipartFile sitterImg;
	
	@Size(min = 13, message = "휴대폰번호를 입력하세요.")
	String sitterPh;
	
	
	@NotNull(message = "정기 휴무일을 입력하세요.")
	String sitterOff;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	LocalDateTime sitterReg;
	
	@NotNull(message = "입사일을 입력하세요.")
	String sitterEnter;
	
	String sitterUse;
	
	public boolean isEqualPw() {
		if (sitterPw.equals(sitterPwCon)) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean isEmptyImg() {
		if(sitterImg.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}

	public String getSitterId() {
		return sitterId;
	}

	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}

	public String getSitterPw() {
		return sitterPw;
	}

	public void setSitterPw(String sitterPw) {
		this.sitterPw = sitterPw;
	}

	public String getSitterPwCon() {
		return sitterPwCon;
	}

	public void setSitterPwCon(String sitterPwCon) {
		this.sitterPwCon = sitterPwCon;
	}

	public String getSitterName() {
		return sitterName;
	}

	public void setSitterName(String sitterName) {
		this.sitterName = sitterName;
	}

	public MultipartFile getSitterImg() {
		return sitterImg;
	}

	public void setSitterImg(MultipartFile sitterImg) {
		this.sitterImg = sitterImg;
	}

	public String getSitterPh() {
		return sitterPh;
	}

	public void setSitterPh(String sitterPh) {
		this.sitterPh = sitterPh;
	}

	public String getSitterOff() {
		return sitterOff;
	}

	public void setSitterOff(String sitterOff) {
		this.sitterOff = sitterOff;
	}

	public LocalDateTime getSitterReg() {
		return sitterReg;
	}

	public void setSitterReg(LocalDateTime sitterReg) {
		this.sitterReg = sitterReg;
	}

	public String getSitterEnter() {
		return sitterEnter;
	}

	public void setSitterEnter(String sitterEnter) {
		this.sitterEnter = sitterEnter;
	}

	public String getSitterUse() {
		return sitterUse;
	}

	public void setSitterUse(String sitterUse) {
		this.sitterUse = sitterUse;
	}
	
}
