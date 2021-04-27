package banjjok_Hotel.service.book;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.command.HotelBookCommand;
import banjjok_Hotel.domain.AuthInfo;
import banjjok_Hotel.domain.HotelBookDTO;
import banjjok_Hotel.mapper.HotelBookMapper;

@Service
@Component
public class BookActService {
	@Autowired
	HotelBookMapper hotelBookMapper;
	
	public void bookAct(HotelBookCommand command, HttpSession session, Model model) throws Exception {
		HotelBookDTO dto = new HotelBookDTO();

		String userId = ((AuthInfo)session.getAttribute("authInfo")).getUserId();
		
		dto.setMemId(userId);
		
		String bookCode = hotelBookMapper.createCode(); //예약코드 생성
		dto.setReservCode(bookCode); 
		
		dto.setRoomCode(command.getRoomCode());
		dto.setPetId(command.getPetId());
		dto.setChkInDate(command.getChkInDate());
		dto.setChkOutDate(command.getChkOutDate());
		dto.setChkOutDate(command.getChkOutDate());
		String bookDesc = command.getBookDesc();
		if (bookDesc == "") {
			dto.setReservDesc("요청사항 없음");
		} else {
			dto.setReservDesc(command.getBookDesc());
		}
		dto.setSitterId(command.getSitterId());
		
		
		Integer result = hotelBookMapper.insertBook(dto); //예약
		System.out.println(result + "개가 예약되었습니다. 결제 완료시 최종 예약 완료 됩니다.");
		
		
	}

}
