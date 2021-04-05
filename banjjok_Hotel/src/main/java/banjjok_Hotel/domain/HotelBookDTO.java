package banjjok_Hotel.domain;

public class HotelBookDTO {
	String reservCode;
	String petId;
	String memId;
	String roomCode;
	String chkInDate;
	String chkOutDate;
	String reservDate;
	String reservDesc;
	String reservUse; //예약한 적 있으면 1, 없으면 0
	String sitterId;
	
	public String getReservCode() {
		return reservCode;
	}
	public void setReservCode(String reservCode) {
		this.reservCode = reservCode;
	}
	public String getPetId() {
		return petId;
	}
	public void setPetId(String petId) {
		this.petId = petId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getChkInDate() {
		return chkInDate;
	}
	public void setChkInDate(String chkInDate) {
		this.chkInDate = chkInDate;
	}
	public String getChkOutDate() {
		return chkOutDate;
	}
	public void setChkOutDate(String chkOutDate) {
		this.chkOutDate = chkOutDate;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservDesc() {
		return reservDesc;
	}
	public void setReservDesc(String reservDesc) {
		this.reservDesc = reservDesc;
	}
	public String getReservUse() {
		return reservUse;
	}
	public void setReservUse(String reservUse) {
		this.reservUse = reservUse;
	}
	public String getSitterId() {
		return sitterId;
	}
	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}
	
	
}
