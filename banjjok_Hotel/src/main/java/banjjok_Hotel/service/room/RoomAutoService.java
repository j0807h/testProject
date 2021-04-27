package banjjok_Hotel.service.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class RoomAutoService {
	@Autowired
	RoomMapper roomMapper;
	public void createRoomCode(Model model) throws Exception {
		RoomDTO dto = new RoomDTO();
//		String roomCode=roomMapper.createCode(dto);
//		System.out.println(roomCode);
//		model.addAttribute("roomCode",roomCode);
		
	}

}
