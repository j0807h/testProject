package banjjok_Hotel.command;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class SignUpCommand {
	// 회원정보
	@NotEmpty(message = "아이디를 입력하세요.")
	@Size(min = 3, max = 12)
	String memId;
	@Size(min=3, max=16)
	@NotEmpty(message = "비밀번호를 입력하세요.")
//	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
//    message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	String memPw;
	@NotEmpty(message = "비밀번호 확인을 입력하세요.")
	String memPwCon;
	@NotEmpty(message = "연락처를 입력하세요.")
	@Size(min=13)
//	@Pattern(regexp=" /^\\d{3}-\\d{3,4}-\\d{4}$/")
	String memMobile;
	@NotEmpty(message = "이메일 입력하세요.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	String memEmail;
	@NotEmpty(message = "성함을 입력하세요.")
	String memName;
	String nicName;
	@NotEmpty(message = "아이디 중복검사를 해주세요.")
	String duplicate;	// 아이디 중복검사 확인

	// 펫 정보
	@NotEmpty(message = "펫 이름을 입력하세요.")
	String petName;
	String kind;
	@NotNull(message = "몸무게를 입력하세요.")
	Long weight;
	@NotNull(message = "나이를 입력하세요.")
	Long age;
	@NotEmpty(message = "성별을 선택하세요.")
	String gender;
	@NotEmpty(message = "중성화 여부를 선택하세요.")
	String isNeutral;
	@NotEmpty(message = "전자칩번호를 입력하세요.")
	String microNum;
	String petDesc;
	String petRep;
	
	String isMChecked;	// 문자인증 여부
	
	public boolean isEqualPw() {
		return memPw.equals(memPwCon) ? true : false;
	}

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

	public String getMemPwCon() {
		return memPwCon;
	}

	public void setMemPwCon(String memPwCon) {
		this.memPwCon = memPwCon;
	}

	public String getMemMobile() {
		return memMobile;
	}

	public void setMemMobile(String memMobile) {
		this.memMobile = memMobile;
	}
	
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}
	
	public String getDuplicate() {
		return duplicate;
	}

	public void setDuplicate(String duplicate) {
		this.duplicate = duplicate;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public Long getWeight() {
		return weight;
	}

	public void setWeight(Long weight) {
		this.weight = weight;
	}

	public Long getAge() {
		return age;
	}

	public void setAge(Long age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIsNeutral() {
		return isNeutral;
	}

	public void setIsNeutral(String isNeutral) {
		this.isNeutral = isNeutral;
	}

	public String getMicroNum() {
		return microNum;
	}

	public void setMicroNum(String microNum) {
		this.microNum = microNum;
	}

	public String getPetDesc() {
		return petDesc;
	}

	public void setPetDesc(String petDesc) {
		this.petDesc = petDesc;
	}

	public String getPetRep() {
		return petRep;
	}

	public void setPetRep(String petRep) {
		this.petRep = petRep;
	}

	public String getIsMChecked() {
		return isMChecked;
	}

	public void setIsMChecked(String isMChecked) {
		this.isMChecked = isMChecked;
	}
	

}
