package banjjok_Hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import banjjok_Hotel.command.SignUpCommand;
import banjjok_Hotel.service.login.CheckIdService;
import banjjok_Hotel.service.login.ChkNumService;
import banjjok_Hotel.service.login.SendSMSService;
import banjjok_Hotel.service.member.RegistService;

@Controller
public class SignUpController {
	@ModelAttribute
	SignUpCommand setSignUpCommand() {
		return new SignUpCommand();
	}
	@Autowired
	RegistService registService; 
	@Autowired
	CheckIdService checkIdService;
	@Autowired
	SendSMSService sendSMSService;
	@Autowired
	ChkNumService chkNumService;
	
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp() {
		return "login/signUpForm";
	}
//	@RequestMapping(value = "checkMem", method = RequestMethod.POST)
//	public String chcekMem(@Validated SignUpCommand signUpCommand, BindingResult result, Model model) {
//		System.out.println(result.hasErrors());
//		if(result.hasErrors()) {
//			model.addAttribute("isErr", true);
////			return "login/signUpForm";
//			return "login/checkMem";
//		}
//		return "redirect:/signUp";
//	}
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	public String checkId(@RequestParam(value = "userId") String userId, Model model) throws Exception {
		// 아이디 중복검사
		checkIdService.isDuplicate(userId, model);
		return "salon/imgDel";
	}
	@RequestMapping(value = "registMem", method = RequestMethod.POST)
	public String registMem(@Validated SignUpCommand signUpCommand, BindingResult result, Model model) throws Exception {
		if(result.hasErrors()) {
			return "login/signUpForm";
		}
		String path = registService.regist(signUpCommand, model);
		return path;
	}
	@RequestMapping(value = "chkSMS", method = RequestMethod.POST)
	public String checkSMS(@RequestParam(value = "mobile") String mobile, HttpSession session, Model model) {
		// 랜덤번호 만들어서 넘김 -> 세션에 저장해서 값 비교 -> 일치하면 세션 삭제
		sendSMSService.send(mobile, session, model);
		return "salon/imgDel";
	}
	@RequestMapping(value = "checkNum", method = RequestMethod.POST)
	public String checkNum(@RequestParam(value = "number") String number, Model model, HttpSession session) {
		chkNumService.isEqual(number, model, session);
		return "salon/imgDel";
	}
	
}
