package banjjok_Hotel.service.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ChkNumService {

	public void isEqual(String number, Model model, HttpSession session) {
		String ranNum = (String) session.getAttribute("smsNum");	// 전송된 4자리 번호
		String result = number.equals(ranNum) ? "0" : "1";
		model.addAttribute("val", result);
	}

}
