package banjjok_Hotel.service.room;


import java.io.File;
import java.io.IOException;
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
public class RoomRegistService {
	@Autowired
	RoomMapper roomMapper;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	public void roomRegistOk(RoomCommand roomCommand, Model model, MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		
		RoomDTO dto = new RoomDTO();
		String roomCode = roomMapper.createCode(); //코드 생성
		
		System.out.println("룸코드 : " + roomCode);
		
		// 객실 저장
		dto.setRoomCode(roomCommand.getRoomName()+roomCode); //코드저장
		dto.setRoomName(roomCommand.getRoomName());
		dto.setRoomPrice(roomCommand.getRoomPrice());
		dto.setRoomDesc(roomCommand.getRoomDesc());
		dto.setRoomPw(passwordEncoder.encode(roomCommand.getRoomPw()));
		
		
		// 이미지 파일 저장
				String path = "WEB-INF/view/hotel/room/upload";
				// "WEB-INF/view/hotel/room/upload"까지의 절대 경로 
				String filePath = session.getServletContext().getRealPath(path);
//				System.out.println(filePath);
				
				///이미지 파일명을 저장하기 위한 변수
				String roomImg = "";
				List<MultipartFile> fileList = mtfRequest.getFiles("roomImg");
//				String src = mtfRequest.getParameter("src");
				
				if(roomCommand.getRoomImg() != null) {
					for(MultipartFile mf : fileList) {
						//브라우저에서 전송될 때 사용했던 이름.
						String original = mf.getOriginalFilename();
						// 확장자만 가져오기 (.hwp , .txt, .doc)
						String originalFileExtension = 
								original.substring(original.lastIndexOf("."));
						// UUID로 임의의 값 가져오기
						String store = //임의의 값에 확장자를 붙이기
								UUID.randomUUID().toString().replace("-", "")
								+originalFileExtension;
						// 반복문이 실행이 될 때 store 에 있는 값이 goodsImage에 추가
//						roomImg += store+"`";
						roomImg += original+"`"; //원래 이름으로 저장
						
						// store파일 객체 생성
//						File file = new File(filePath + "\\" + store);
						
//						String saveFile = path + System.currentTimeMillis() + original;
						
						try {
//							mf.transferTo(new File(saveFile));
							mf.transferTo(new File(filePath + "/" + original));
						} catch (IllegalStateException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				// dto에 디비에 저장할 파일명 저장
				dto.setRoomImg(roomImg);
//				System.out.println(roomCommand.getRoomImg());
//				System.out.println(roomImg);
//				
//				System.out.println(dto.getRoomCode());
//				System.out.println(dto.getRoomName());
//				System.out.println(dto.getRoomPrice());
//				System.out.println(dto.getRoomDesc());
				Integer code = null;
				code = roomMapper.insertRoom(dto);
//				model.addAttribute("roomCode", code);
				
	}
	
}
