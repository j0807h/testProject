package banjjok_Hotel.service.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class RoomListService {
	@Autowired
	RoomMapper roomMapper;
	
	public void getRoomList(Model model) throws Exception {
		// 객실 리스트 받아오기
		RoomDTO dto = new RoomDTO();
		List<RoomDTO> list = roomMapper.getRoomList(dto);
		model.addAttribute("lists", list);
		
		
	}
	
}
