package banjjok_Hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import banjjok_Hotel.domain.AuthInfo;


@Controller
public class HotelController {
	
	@RequestMapping(value = "hotel", method = RequestMethod.GET)
	public String hotel(HttpSession session) throws Exception {
//		// 로그인 안 했으면 로그인페이지로
		if(((AuthInfo) session.getAttribute("authInfo")) == null ) {
			return "redirect:/login";
		} else {
//			return "/hotel/hotelMain";
			return "redirect:/hotel/roomList";
			
		}
	}
}

	