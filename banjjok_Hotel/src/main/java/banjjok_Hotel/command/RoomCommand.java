package banjjok_Hotel.command;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class RoomCommand {
	@NotEmpty(message = "객실코드를 입력하세요.")
	String roomCode;
	@NotEmpty(message = "객실이름를 입력하세요.")
	String roomName;
	MultipartFile roomImg;
	MultipartFile[] roomImg_mapVer;
	Integer roomPrice;
	String roomDesc;
	@NotEmpty(message = "객실이름를 입력하세요.")
	String roomPw;
	String roomUse;
	
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
	public MultipartFile getRoomImg() {
		return roomImg;
	}
	public void setRoomImg(MultipartFile roomImg) {
		this.roomImg = roomImg;
	}
	public MultipartFile[] getRoomImg_mapVer() {
		return roomImg_mapVer;
	}
	public void setRoomImg_mapVer(MultipartFile[] roomImg_mapVer) {
		this.roomImg_mapVer = roomImg_mapVer;
	}
	public Integer getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(Integer roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getRoomDesc() {
		return roomDesc;
	}
	public void setRoomDesc(String roomDesc) {
		this.roomDesc = roomDesc;
	}
	public String getRoomPw() {
		return roomPw;
	}
	public void setRoomPw(String roomPw) {
		this.roomPw = roomPw;
	}
	public String getRoomUse() {
		return roomUse;
	}
	public void setRoomUse(String roomUse) {
		this.roomUse = roomUse;
	}
	
	
	
}
