package banjjok_Hotel.service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.AuthInfo;
import banjjok_Hotel.domain.MemberDTO;
import banjjok_Hotel.mapper.MemberMapper;

@Service
public class ChkPassService {
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	PasswordEncoder passwordEncoder;

	public String check(String memPw, Model model, HttpSession session) throws Exception {
		String path = "";
		MemberDTO dto = new MemberDTO();
		String memId = ((AuthInfo) session.getAttribute("authInfo")).getUserId();
		dto.setMemId(memId);
		dto = memberMapper.getUserList(dto).get(0);
		
		if(passwordEncoder.matches(memPw, dto.getMemPw())) {
			model.addAttribute("mem", dto);
			path = "member/memModify";
		} else {
			model.addAttribute("pwErr", "비밀번호가 일치하지 않습니다.");
			path = "member/checkPw";
		}
		return path;
	}
	
}
