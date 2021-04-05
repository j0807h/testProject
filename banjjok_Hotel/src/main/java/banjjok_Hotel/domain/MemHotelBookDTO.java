package banjjok_Hotel.domain;

import java.security.Timestamp;

public class MemHotelBookDTO {
	String reservCode;
	
	String petId;
	String petName;
	
	String memId;
	String memName;
	
	String roomCode;
	String chkInDate;
	String chkOutDate;
	String reservDate;
	String reservDesc;
	String sitterId;
	
	String roomName;
	String roomPrice;
	
	String reservUse; //예약한 적 있으면 1, 없으면 0
	
	
	//결제
	String addPrice;
	String totalPrice;
	String payMethod;

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

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
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

	public String getAddPrice() {
		return addPrice;
	}

	public void setAddPrice(String addPrice) {
		this.addPrice = addPrice;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	
	
}
