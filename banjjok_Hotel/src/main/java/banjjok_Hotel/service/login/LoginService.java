package banjjok_Hotel.service.login;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.command.LoginCommand;

@Service
public class LoginService {

	public String login(LoginCommand loginCommand, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		return null;
	}
//	@Autowired
//	LoginMapper loginMapper;
//	@Autowired
//	PasswordEncoder passwordEncoder;
//	AuthInfo authInfo;
//
//	public String login(LoginCommand loginCommand, HttpSession session, Model model) {
//		String location = "";
//		LoginDTO dto = new LoginDTO();
//		dto.setUserId(loginCommand.getUserId());
//		List<LoginDTO> list = null;
//		try {
//			list = loginMapper.getUsers(dto);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
////		System.out.println("크기 : " + list.size());
//		if(list.size() == 0) {
//			// 사용자 없음
//			model.addAttribute("valid_userId", "아이디가 존재하지 않습니다.");
//			location =  "login/login";
//		} else if(passwordEncoder.matches(loginCommand.getUserPw(), list.get(0).getUserPw())) {
//			// 비밀번호가 일치하면
//			authInfo = new AuthInfo(list.get(0).getUserId(), list.get(0).getUserName(), list.get(0).getGrade());
//			session.setAttribute("authInfo", authInfo);
//			location = "redirect:/";
//		} else {
//			// 비밀번호 틀림
//			System.out.println("비밀번호 틀림");
//			model.addAttribute("valid_userPw", "비밀번호가 다릅니다.");
//			location = "login/login";
//		}
//		return location;
////		return "redirect:/";
//	}

}
