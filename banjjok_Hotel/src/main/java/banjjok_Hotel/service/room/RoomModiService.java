package banjjok_Hotel.service.room;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import banjjok_Hotel.command.RoomCommand;
import banjjok_Hotel.domain.RoomDTO;
import banjjok_Hotel.mapper.RoomMapper;

@Service
@Component
public class RoomModiService {
	@Autowired
	RoomMapper roomMapper;
	
	
	public void roomModify(RoomCommand roomCommand, Model model, HttpSession session) throws Exception {
//		String userId = ((AuthInfo) session.getAttribute("authInfo")).getUserId();
		String roomName = roomCommand.getRoomName();
		RoomDTO dto = new RoomDTO();
		dto.setRoomName(roomName);
		List<RoomDTO> list = roomMapper.getRoomList(dto);
		model.addAttribute("list", list.get(0));
		
	}
	
	
	
	
	@Autowired
	PasswordEncoder passwordEncoder;
	public String roomModifyPro(RoomCommand roomCommand, Model model, MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		String location = "";
		RoomDTO dto = new RoomDTO();
		String roomName = roomCommand.getRoomName();
		dto = roomMapper.getRoomList(dto).get(0); //수정할 데이터 DB에서 가져오기
		System.out.println("Dto : " + dto);
		
		//파일(=이미지) 삭제
		String path = "WEB-INF/view/hotel/room/upload";
		List<String> list = (List<String>) session.getAttribute("imgList");
		String filePath = session.getServletContext().getRealPath(path);
		
		if(list != null) {
//			for(int i = 0; i < list.size(); i++) {
			for(String img : list) {
				//String img = list.get(i);
				dto.setRoomImg(dto.getRoomImg().replace(img+"`", ""));
				File file = new File(filePath + "/" + img);
				if(file.exists()) file.delete();
			}
			session.removeAttribute("imgList");
		}
		
		
		//비밀번호 확인
		if(!passwordEncoder.matches(roomCommand.getRoomPw(), dto.getRoomPw())){
			//비밀번호 불일치
			System.out.println("비밀번호 틀림");
			model.addAttribute("pwErr","비밀번호가 틀렸습니다.");
			location = "redirect:/hotel/sitterInfo/" + roomName; //틀리면 다시 상세페이지
		} 
		else {
//			파일(=이미지)
			String roomImg="";
			List<MultipartFile> fileList = mtfRequest.getFiles("roomImg");
//			MultipartFile mf = roomCommand.getRoomImg();
//			String original = mf.getOriginalFilename();

//			if(roomCommand.getRoomImg() != null) { //파일(=이미지)이 있다면
			if(!roomCommand.getRoomImg().isEmpty()) {//multipartFile은 null값 못 받아옴! isEmpty() 사용
				for(MultipartFile mf : fileList) {
					String original = mf.getOriginalFilename();
					System.out.println(original);
					String originalFileExtension = original.substring(original.lastIndexOf("."));
					String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
					roomImg = dto.getRoomImg() + "`" + store + "`";
					mf.transferTo(new File(filePath + "/" + store));
				}	
			}
			else { //파일(=이미지)이 없다면
				roomImg = dto.getRoomImg();
			}
			dto.setRoomImg(roomImg);

			dto.setRoomCode(roomCommand.getRoomCode());
			dto.setRoomName(roomCommand.getRoomName());
			dto.setRoomPrice(roomCommand.getRoomPrice());
			dto.setRoomDesc(roomCommand.getRoomDesc());
			
			Integer result = roomMapper.updateRoom(dto);
			if(result > 0) {
				System.out.println(result + "개의 객실 수정됨");
				location = "redirect:/hotel/roomDetail/" + roomCommand.getRoomName();
			}
		}
		
		return location;
	}
}
	
