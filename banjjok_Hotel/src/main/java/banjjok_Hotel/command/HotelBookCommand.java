package banjjok_Hotel.command;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class HotelBookCommand {
	String bookCode;
	
	
	@NotEmpty(message = "객실코드를 입력하세요.")
	String roomCode;
	
	@NotEmpty(message = "펫 아이디를 입력하세요.")
	String petId;
	
	@NotNull(message = "펫 이름을 입력해주세요.")
	String petName;
	
	@NotEmpty(message = "회원 아이디를 입력하세요.")
	String memId;
	
	@NotNull(message = "회원 이름을 입력해주세요.")
	String memName;
	
	
	@NotEmpty(message = "객실이름를 입력하세요.")
	String roomName;
	
	Integer roomPrice;
	
	@Size(min = 4, max = 12, message = "아이디를 입력하세요.")
	String sitterId;
	
	@Size(min = 3, max = 12, message = "이름을 입력하세요.")
	String sitterName;
	
//	String year;
//	String month;
//	String date;
	
	@NotEmpty(message = "체크인 날짜를 선택해주세요.")
	String ChkInDate;
	
	@NotEmpty(message = "체크아웃  날짜를 선택해주세요.")
	String ChkOutDate;
	
	String bookDesc;


	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Integer getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(Integer roomPrice) {
		this.roomPrice = roomPrice;
	}

	public String getSitterId() {
		return sitterId;
	}

	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}

	public String getSitterName() {
		return sitterName;
	}

	public void setSitterName(String sitterName) {
		this.sitterName = sitterName;
	}
//	public String getYear() {
//		return year;
//	}
//
//	public void setYear(String year) {
//		this.year = year;
//	}
//
//	public String getMonth() {
//		return month;
//	}
//
//	public void setMonth(String month) {
//		this.month = month;
//	}
//
//	public String getDate() {
//		return date;
//	}
//
//	public void setDate(String date) {
//		this.date = date;
//	}
	
	public String getBookDesc() {
		return bookDesc;
	}

	public String getChkInDate() {
		return ChkInDate;
	}

	public void setChkInDate(String chkInDate) {
		ChkInDate = chkInDate;
	}

	public String getChkOutDate() {
		return ChkOutDate;
	}

	public void setChkOutDate(String chkOutDate) {
		ChkOutDate = chkOutDate;
	}

	public void setBookDesc(String bookDesc) {
		this.bookDesc = bookDesc;
	}

	
	
}
