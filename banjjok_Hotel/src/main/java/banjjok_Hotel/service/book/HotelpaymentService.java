package banjjok_Hotel.service.book;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import banjjok_Hotel.command.HotelPaymentCommand;
import banjjok_Hotel.domain.HotelBookDTO;
import banjjok_Hotel.domain.HotelPaymentDTO;
import banjjok_Hotel.mapper.HotelBookMapper;

@Service
@Component
public class HotelpaymentService {
	@Autowired
	HotelBookMapper hotelBookMapper;
	
	public void payment(HotelPaymentCommand hotelPaymentCommand, HttpSession session) throws Exception {
		HotelPaymentDTO dto = new HotelPaymentDTO();
		dto.setReservCode(hotelPaymentCommand.getBookCode());
		dto.setRoomPrice(hotelPaymentCommand.getRoomPrice());
		dto.setTotalPrice(hotelPaymentCommand.getTotalPrice());
		//추후에 서비스 추가하면
//		dto.setAddPrice(hotelPaymentCommand.getAddPrice()); 
//		dto.setTotalPrice(hotelPaymentCommand.getAddPrice()+hotelPaymentCommand.getRoomPrice());
		dto.setPayMethod(hotelPaymentCommand.getPayMethod());
		Integer result = hotelBookMapper.insertPayment(dto);
		HotelBookDTO bDto = new HotelBookDTO();
		hotelBookMapper.insertBookList(bDto); //예약리스트(결제완료되면)
		System.out.println(result + "개의 결제정보 입력됨");
	}

}
