package banjjok_Hotel.service.login;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class SendSMSService {
	// 문자인증
	public void send(String mobile, HttpSession session, Model model) {
		Random rd = new Random();
		String ranNum = "";
		for (int i = 0; i < 4; i++) {
			ranNum += String.valueOf(rd.nextInt(10));
		}
		
//		SmsSend ss = new SmsSend();
//		ss.smsSend(mobile, "인증번호는 [" + ranNum + "] 입니다.");
		
		if(session.getAttribute("smsNum") != null) {
			session.removeAttribute("smsNum");
		}
		session.setAttribute("smsNum", ranNum);
		model.addAttribute("val", ranNum);
	}

}
