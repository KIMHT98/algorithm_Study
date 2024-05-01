package com.ssafy.ws.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.dto.User;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private ResourceLoader resLoader;
	
	private List<User> users = new ArrayList<>();
	
	@Bean(name = "users")
	public List<User> getUsers() {
		return users;
	}

	public UserController() {
		users.add(new User("ssafy", "1234", "싸피", "ssafy@ssafy.com", "010-1234-5678"));
		users.add(new User("multi", "qwer", "멀티캠퍼스", "multi@multicampus.com", "010-5678-1234"));
		users.add(new User("samsung", "1q2w3e", "삼성", "samsung@samsung.com", "010-1111-2222"));
	}
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("login")
	public String loginForm() {
		return "login";
	}

	@PostMapping("login")
	public String login(HttpSession session, String id, String pw) {
		// 사용자가 입력한 id, pw가 users에 있는지 확인
		for (User user : users) {
			if (user.getId().equals(id) && user.getPw().equals(pw)) {
				// 있다면 세션에 id를 저장하고 메인페이지로 이동
				session.setAttribute("id", id);
				return "redirect:/";
			}
		}

		// 아니라면 로그인페이지로 다시 이동
		return "redirect:/login";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
//			session.invalidate(); 
		return "redirect:/";
	}
	
	@GetMapping("register")
	public String registerForm() {
		return "register";
	}
	
	/*
	 * Q. 사용자 등록 기능을 구현하세요.
	 * 1. 해당 사용자가 등록된 사용자인지 확인한다.
	 * 2. 사용자가 등록되지 않은 사용자라면 사용자 객체를 생성한 후,
	 *    프로필 이미지를 resources/profile 폴더에 저장한다.
	 *    (프로필 이미지가 없을 경우 default.png를 사용한다.)
	 * 3. 사용자가 등록된 사용자라면 존재하는 계정이라는 메시지를 모델에 담아서 register.jsp로 이동한다.
	 * 4. 사용자가 등록되지 않은 사용자라면 사용자 정보를 users에 추가하고, 로그인페이지로 이동한다.
	 */
	@PostMapping("register")
	public String register(@ModelAttribute User user, 
			@RequestParam(name="file", required = false) MultipartFile file, Model model) throws IllegalStateException, IOException{
		// 사용자의 아이디가 중복되는지 확인
		for (User u : users) {
			if (u.getId().equals(user.getId())) {
				model.addAttribute("msg", "이미 존재하는 아이디입니다.");
				return "register";
			}
		}
	    // 중복되지 않는다면 사용자 추가
	    if (file != null && file.getSize() > 0) {
	    	// 파일을 저장할 폴더 지정
        	Resource res = resLoader.getResource("/resources/profile");
        	// 파일이 존재하면 파일을 저장한다.
        	String filename = System.currentTimeMillis() + "_" + user.getId()+file.getOriginalFilename();
        	File target = new File(res.getFile().getCanonicalPath(), filename);
        	// 파일을 저장한다.
        	file.transferTo(target);
        
        	// 모델에 파일명을 담는다.
        	user.setProfileImg(filename);
        }
		
		// 중복되지 않는다면 users에 사용자 정보를 추가하고 로그인페이지로 이동
		users.add(user);
		return "redirect:/login";
	}

	@GetMapping("profile/{id}")
	public String profile(@PathVariable String id, Model model) {
		// id를 이용하여 사용자 정보를 찾아서 모델에 담는다.
		for (User user : users) {
			if (user.getId().equals(id)) {
				model.addAttribute("user", user);
				return "profile";
			}
		}
		return "redirect:/login";
	}
}
