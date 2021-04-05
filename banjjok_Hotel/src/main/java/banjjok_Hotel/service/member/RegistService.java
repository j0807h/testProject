package banjjok_Hotel.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.command.SignUpCommand;
import banjjok_Hotel.domain.MemberDTO;
import banjjok_Hotel.domain.MyPetDTO;
import banjjok_Hotel.mapper.MemberMapper;
import banjjok_Hotel.mapper.MyPetMapper;

@Component
@Service
public class RegistService {
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MyPetMapper myPetMapper;

	public String regist(SignUpCommand signUpCommand, Model model) throws Exception {
		String path = "";
		if(!signUpCommand.isEqualPw()) {
			model.addAttribute("notEqual", "비밀번호가 일치하지 않습니다.");
			return "login/signUpForm";
		}
		if(!signUpCommand.getDuplicate().equals("false")) {
			// 아이디가 중복되었다면
			model.addAttribute("noUseId", "사용할 수 없는 아이디입니다.");
			return "login/signUpForm";
		}
		// 문자인증 확인?
		if(signUpCommand.getIsMChecked().equals("n")) {
			model.addAttribute("notEqual", "인증번호가 다릅니다.");
			return "login/signUpForm";
		}
		// dto 저장
		MemberDTO dto = new MemberDTO();
		dto.setMemEmail(signUpCommand.getMemEmail());
		dto.setMemId(signUpCommand.getMemId());
		dto.setMemMobile(signUpCommand.getMemMobile());
		dto.setMemName(signUpCommand.getMemName());
		dto.setMemPw(passwordEncoder.encode(signUpCommand.getMemPw()));
		dto.setNicName(signUpCommand.getNicName());
		
		Integer member = memberMapper.insertMem(dto);
		
		MyPetDTO myPetDTO = new MyPetDTO();
		myPetDTO.setAge(signUpCommand.getAge());
		myPetDTO.setGender(signUpCommand.getGender());
		myPetDTO.setIsNeutral(signUpCommand.getIsNeutral());
		myPetDTO.setKind(signUpCommand.getKind());
		myPetDTO.setMicroNum(signUpCommand.getMicroNum());
		myPetDTO.setPetDesc(signUpCommand.getPetDesc());
		myPetDTO.setPetName(signUpCommand.getPetName());
		myPetDTO.setWeight(signUpCommand.getWeight());
		myPetDTO.setMemId(signUpCommand.getMemId());
		myPetDTO.setPetRep("1");	// 회원가입 시 등록하는 펫은 무조건 대표펫
		Integer pet = myPetMapper.insertMyPet(myPetDTO);
				
		path = (member > 0 && pet > 0) ? "redirect:/" : "login/signUpForm";
		
		return path;
//		return "redirect:/";
	}
	
}
