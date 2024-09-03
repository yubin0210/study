package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Autowired private SessionController sessionController;
	
	@GetMapping("/")
	public ModelAndView home() {	
		// 로그인 페이지
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@PostMapping("/")
	public String login(String username, HttpSession session) {
		// 로그인 처리
		session.setAttribute("login", username);
		sessionController.add(username);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 로그아웃 처리
		String login = (String) session.getAttribute("login");
		sessionController.remove(login);
		session.invalidate();
		return "redirect:/";
	}
}
