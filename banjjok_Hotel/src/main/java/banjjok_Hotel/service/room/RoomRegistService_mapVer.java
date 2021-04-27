package banjjok_Hotel.service.room;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import banjjok_Hotel.command.RoomCommand;
import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class RoomRegistService_mapVer {
	@Autowired
	RoomMapper roomMapper;

	public void roomRegistOk(RoomCommand roomCommand, HttpSession session) throws Exception {
		// dto 생성
		RoomDTO dto = new RoomDTO();
		// dto에 넣을 변수
		String fileName = "";
//		String strFile = "";
		// 객실 저장
		Map<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		String path = "/WEB-INF/view/hotel/room/upload";
		String filePath = session.getServletContext().getRealPath(path);
		for (int i = 0; i < roomCommand.getRoomImg_mapVer().length; i++) {
			map.put("roomImg" + (i+1), roomCommand.getRoomImg_mapVer()[i]);
//			System.out.println("map : " + map.get("roomImg" + (i+1)));
//			System.out.println("map size : " + map.size());
			
			String original = map.get("roomImg" + (i+1)).getOriginalFilename();	// 업로드 할 때의 파일 이름
			String extension = original.substring(original.lastIndexOf("."));	// 확장자
			String store = UUID.randomUUID().toString().replace("-", "") + extension;
			fileName += original + "`" + store + "`";
			File file = new File(filePath + "/" + store);
			try {
				map.get("roomImg" + (i+1)).transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		dto.setRoomImg(fileName);
		dto.setRoomCode("test");
		dto.setRoomName("test");
		Integer result = roomMapper.insertRoom(dto);
	}
	
}
