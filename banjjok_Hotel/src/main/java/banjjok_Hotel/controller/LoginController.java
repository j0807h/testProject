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

import banjjok_Hotel.command.LoginCommand;
import banjjok_Hotel.service.login.LoginService;

@Controller
//@RequestMapping("/")
public class LoginController {
	@ModelAttribute
	public LoginCommand setLoginCommand() {
		return new LoginCommand();
	}
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	@RequestMapping(value = "loginAct", method = RequestMethod.POST)
	public String loginAct(@Validated LoginCommand loginCommand, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "login/login";
		}
		String location = loginService.login(loginCommand, session, model);
		return location;
	}
	@RequestMapping(value = "/main/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
