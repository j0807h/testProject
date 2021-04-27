package banjjok_Hotel.service.book;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.MemHotelBookDTO;
import banjjok_Hotel.domain.PetSitterDTO;
import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.HotelBookMapper;
import banjjok_Hotel.mapper.PetSitterMapper;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class BookInfoService {
	@Autowired
	HotelBookMapper hotelBookMapper;
	@Autowired
	RoomMapper roomMapper;
	@Autowired
	PetSitterMapper sitterMapper;
	
	public void bookInfo(String userId, Model model, HttpSession session) throws Exception {
		MemHotelBookDTO dto = new MemHotelBookDTO();
//		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
//		String userId = authInfo.getUserId();
		dto.setMemId(userId);
		List<MemHotelBookDTO> list = hotelBookMapper.getBookInfoList(dto);
		System.out.println(list.get(0).getChkInDate());
		System.out.println(list.get(0).getChkOutDate());
		model.addAttribute("bookInfo",list.get(0)); 
		
		// 객실
		RoomDTO rDto = new RoomDTO();
		rDto.setRoomCode(dto.getRoomCode());
		rDto = roomMapper.getRoomList(rDto).get(0);
		model.addAttribute("room", rDto);
		
		// 펫시터
		PetSitterDTO pDto = new PetSitterDTO();
		pDto.setSitterId(dto.getSitterId());
		pDto = sitterMapper.getSitterList(pDto).get(0);
		model.addAttribute("sitter", pDto);
	
		
	}
	
}
