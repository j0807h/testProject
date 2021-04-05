package banjjok_Hotel.domain;

public class HotelPaymentDTO {
	String reservCode;
	String roomPrice;
	String addPrice;
	String totalPrice;
	String payMethod;
	public String getReservCode() {
		return reservCode;
	}
	public void setReservCode(String reservCode) {
		this.reservCode = reservCode;
	}
	public String getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
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
