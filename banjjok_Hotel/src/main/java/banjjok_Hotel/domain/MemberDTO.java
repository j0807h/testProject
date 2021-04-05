package banjjok_Hotel.domain;

import java.sql.Timestamp;

public class MemberDTO {
	// 회원
	String memId;
	String memPw;
	String memMobile;
	String memName;
	String memEmail;
	Timestamp registDt;
	String nicName;
	String memUse;

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

	public Timestamp getRegistDt() {
		return registDt;
	}

	public void setRegistDt(Timestamp registDt) {
		this.registDt = registDt;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

	public String getMemUse() {
		return memUse;
	}

	public void setMemUse(String memUse) {
		this.memUse = memUse;
	}
	
	

}
