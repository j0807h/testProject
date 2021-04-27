package banjjok_Hotel.service.petSitter;

import java.io.File;
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
public class PetSitterModifyService {
	@Autowired
	PetSitterMapper sitterMapper;
	@Autowired
	PasswordEncoder passwordEncoder;

	public String sitterModify(PetSitterCommand sitterCommand, Model model, HttpSession session) throws Exception {
		String location = null;
		PetSitterDTO dto = new PetSitterDTO();
		String sitterId = sitterCommand.getSitterId();
		dto.setSitterId(sitterId);
		dto = sitterMapper.getSitterList(dto).get(0);		
		
		// 파일
		String path = "/WEB-INF/view/hotel/petSitter/upload"; // 파일 저장 경로
		String filePath = session.getServletContext().getRealPath(path);
//		String originalFileNames = "";
//		String storeFileNames = ""; // 임의 지정
		
		
		if(!passwordEncoder.matches(sitterCommand.getSitterPw(), dto.getSitterPw())) {
			// 불일치한다면
			System.out.println("비밀번호 틀림");
			model.addAttribute("PwErr", "비밀번호가 다릅니다.");
			location = "redirect:/hotel/sitterInfo/"+sitterId;
		} else {
			// 일치한다면
			String sitterImg = "";
			dto.setSitterName(sitterCommand.getSitterName());
			// 추가하는 파일이 있으면
			MultipartFile mf = sitterCommand.getSitterImg();
			String original = mf.getOriginalFilename();
			if (!original.equals("")) {
				String originalFileExtension = original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
				sitterImg = original + "`";
				File file = new File(filePath + "/" + store);
				mf.transferTo(file);
			} else {
				//추가하는 파일 없으면
				sitterImg = dto.getSitterImg();
				if(sitterImg.equals("")) {
					location = "redirect:/hotel/sitterInfo/"+sitterId;
				}
			}
			dto.setSitterImg(sitterImg);
			
			dto.setSitterPh(sitterCommand.getSitterPh());
			dto.setSitterOff(sitterCommand.getSitterOff());
			dto.setSitterEnter(sitterCommand.getSitterEnter());
			
			Integer result = sitterMapper.updateSitter(dto);
			System.out.println(result + "개 수정");
			if(result > 0) {
				location = "redirect:/hotel/sitterList";
			}
			
		}
		System.out.println("dto : " +dto.getSitterOff());
		System.out.println("command : " +sitterCommand.getSitterOff());
		return location;
	}
	
}


