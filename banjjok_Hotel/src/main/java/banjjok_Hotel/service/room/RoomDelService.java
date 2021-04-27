package banjjok_Hotel.service.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.command.RoomCommand;
import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class RoomDelService {
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	RoomMapper roomMapper;
	
	public void roomDel(RoomCommand roomCommand, Model model, HttpSession session) throws Exception {
		String location="";
		RoomDTO dto = new RoomDTO();
		String roomName = roomCommand.getRoomName();
		dto.setRoomName(roomName);
		
		if(!passwordEncoder.matches(roomCommand.getRoomPw(), dto.getRoomPw())) {
			System.out.println("비밀번호 틀림");
			model.addAttribute("PwErr", "비밀번호가 다릅니다.");
			location = "redirect:/hotel/hotelInfo/"+roomName;
		}
		Integer i = null;
		i = roomMapper.roomDel(dto);
		
	}
	
}
