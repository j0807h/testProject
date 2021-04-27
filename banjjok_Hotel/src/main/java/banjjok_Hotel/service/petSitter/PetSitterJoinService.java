package banjjok_Hotel.service.petSitter;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import banjjok_Hotel.command.PetSitterCommand;
import banjjok_Hotel.domain.PetSitterDTO;
import banjjok_Hotel.mapper.PetSitterMapper;

@Service
@Component
public class PetSitterJoinService {
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	PetSitterMapper petSitterMapper;
	
	public String insertSitter(PetSitterCommand petSitterCommand, Model model, HttpSession session) throws Exception{
//		String location = "";	
//		Integer cnt = null;
		if(!petSitterCommand.isEqualPw()) {
			model.addAttribute("pwErr", "비밀번호가 일치하지 않습니다.");
//			location = "hotel/petSitter/petSitterForm";
			return "hotel/petSitter/petSitterForm";
		}
		if(!petSitterCommand.isEmptyImg()) {
			model.addAttribute("noImg", "이미지를 첨부해주세요.");
		}
		if(petSitterCommand.getSitterId().equals("")) {
//			cnt = 0;
			model.addAttribute("duplicateId", "사용중인 아이디입니다.");
			return "hotel/petSitter/petSitterForm";
		}
		
		PetSitterDTO petSitterDTO = new PetSitterDTO();
		
			petSitterDTO.setSitterPw(passwordEncoder.encode(petSitterCommand.getSitterPw()));
			petSitterDTO.setSitterId(petSitterCommand.getSitterId());
			petSitterDTO.setSitterName(petSitterCommand.getSitterName());
			
			// 이미지 파일 업로드
			String path = "/WEB-INF/view/hotel/petSitter/upload";
			String filePath = session.getServletContext().getRealPath(path);
			System.out.println(filePath);
			String sitterImg = "";
			String storeFileNames = "";
			if(petSitterCommand.getSitterImg() != null) {
				MultipartFile mf = petSitterCommand.getSitterImg();
				String original = mf.getOriginalFilename();
				if(!original.equals("")) {
					String extenstion = original.substring(original.lastIndexOf("."));
					String store = UUID.randomUUID().toString().replace("-", "") + extenstion;
					sitterImg = original + "`" + store;
					File file = new File(filePath + "/" + store);
					try {
						mf.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				} 
				
				petSitterDTO.setSitterImg(sitterImg);
			}
			
			petSitterDTO.setSitterPh(petSitterCommand.getSitterPh());
			petSitterDTO.setSitterOff(petSitterCommand.getSitterOff());
			
	//		Timestamp sitterReg = Timestamp.valueOf(petSitterCommand.getSitterReg());
	//		petSitterDTO.setSitterReg(sitterReg);
	//		Timestamp sitterEnter = Timestamp.valueOf(petSitterCommand.getSitterEnter());
			petSitterDTO.setSitterEnter(petSitterCommand.getSitterEnter());
			
			Integer cnt = petSitterMapper.insertSitter(petSitterDTO);
//		if(cnt == null) {
//			// 인서트 안됨
//			model.addAttribute("duplicateId", "사용중인 아이디입니다.");
//		}
		return "redirect:/hotel/sitterList";
	}

}
