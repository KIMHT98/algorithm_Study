package com.ssafy.ws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.ws.model.dto.User;
import com.ssafy.ws.model.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	private final UserService uService;
	
	@Autowired
	public UserController(UserService uService) {
		this.uService = uService;
	}
	
	@PostMapping("/login")
	public String doLogin(@ModelAttribute User user, HttpSession session, Model model) {
		String view = "/index";
		User loginUser = uService.getUser(user.getUserId());
		if (loginUser != null && loginUser.getUserPass().equals(user.getUserPass())) {
			session.setAttribute("loginUser", loginUser);
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
