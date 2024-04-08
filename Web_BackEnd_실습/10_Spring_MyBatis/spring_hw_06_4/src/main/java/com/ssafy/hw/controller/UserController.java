package com.ssafy.hw.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.hw.model.dto.User;

@Controller
public class UserController {
	
	
	@PostMapping("/login")
	public String doLogin(User user, HttpSession session, Model model) {
		String view = "/index";

		if (user.getUserId().equals("ssafy") && user.getUserPass().equals("1234")) {
			user.setUserName("김싸피");
			session.setAttribute("loginUser", user);
			view = "redirect:/";
		} else {
			model.addAttribute("msg", "로그인 실패");
		}

		return view;
	}

	@GetMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
