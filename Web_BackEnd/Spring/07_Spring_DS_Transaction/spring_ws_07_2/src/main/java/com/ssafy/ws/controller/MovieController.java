package com.ssafy.ws.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.ws.model.dto.Movie;
import com.ssafy.ws.model.dto.SearchCondition;
import com.ssafy.ws.model.dto.User;
import com.ssafy.ws.model.service.MovieService;
import com.ssafy.ws.model.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	// resource 경로를 가져오기 위해 ResourceLoader를 주입 받는다.
	@Autowired
	ResourceLoader resLoader;

	/**
	 * MovieService를 주입받는다.
	 */
	@Autowired
	MovieService mService;
	/**
	 * UserService를 주입받는다.
	 */
	@Autowired
	UserService uService;

	/**
	 * <pre>
	 *  / 또는 /index 요청이 get 방식으로 들어왔을 때 index 로 연결한다.
	 * </pre>
	 * 
	 * @return
	 */
	@GetMapping({ "/", "/index" })
	public String showRoot() {
		return "index";
	}

	/**
	 * <pre>
	 * /login 요청이 post 방식으로 왔을 때 login 처리한다.
	 * </pre>
	 * 
	 * 사용자의 요청에서 계정 정보를 추출해 로그인 처리한다. 로그인 성공 시 session에 정보를 담고 redirect로 index로
	 * 이동한다. 그렇지 않을 경우는 로그인 실패 메시지를 model에 담고 forward로 index로 이동한다.
	 * 
	 * @param user    전달된 파라미터는 ModelAttribute를 통해서 객체로 받을 수 있다.
	 * @param session 사용자 정보를 세션에 저장하기 위해 사용한다.
	 * @param model   Request scope에 정보를 저장하기 위해서 사용된다.
	 * @return
	 */
	@PostMapping("/login")
	public String doLogin(@ModelAttribute User user, HttpSession session, Model model) {
		// UserService를 통해 사용자 계정을 가져온다.
		// 코드작성
		User loginUser = uService.select(user.getId());
		System.out.println(loginUser);
		if (loginUser != null && user.getPass().equals(loginUser.getPass())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/index";
		} else {
			model.addAttribute("msg", "로그인 실패");
			return "index";
		}
	}

	/**
	 * <pre>
	 * /logout을 get 방식으로 요청했을 때 session을 만료 시키고 로그아웃 처리한다.
	 * </pre>
	 * 
	 * 다음 경로는 redirect 형태로 /index로 이동한다.
	 * 
	 * @param session
	 * @return
	 */

	@GetMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

	/**
	 * <pre>
	 * /list를 get 방식으로 요청할 때 영화 정보를 보여준다.
	 * </pre>
	 * 
	 * 아직 MVC의 model 영역을 완성하지 않았기 때문에 여러 개의 Movie을 직접 생성해서 List 형태로 전달한다. 정보를 Model
	 * 객체에 저장 후 forward로 list를 호출한다.
	 * 
	 * @return
	 */
	@GetMapping("/list")
	public String showList(Model model) {
		// 코드작성
		List<Movie> movies = mService.selectAll();
		model.addAttribute("movies",movies);
		return "list";
	}

	/**
	 * get 방식의 regist 요청이 오면 regist 페이지를 forward로 연결한다.
	 * 
	 * @return
	 */
	@GetMapping("/regist")
	public String showRegistForm() {
		return "regist";
	}

	/**
	 * post 방식의 regist 요청이 오면 요청으로 전달된 movie 객체와 file을 활용한다. 파일의 저장 위치는
	 * resources/upload 아래로 지정한다. 이를 위해 ResourceLoader의 getResource를 사용할 수 있다. 파일의
	 * 이름이 중복되는 것을 막기 위해 file에서 가져온 이름(orgImg)과 이 이름에 시간 정보를 추가한 img(저장될 파일 이름)를 만들어
	 * movie 객체에 설정한다. 파일을 저장 후 regist_result에 forward로 이동한다.
	 * 
	 * @param car
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping("/regist")
	public String doRegist(@ModelAttribute Movie movie) throws IllegalStateException, IOException {
		// 변경된 파일 이름이 적용된 Movie를 MovieService를 통해 DB에 저장한다.
		// T.X 처리를 위해 파일 저장에 대한 부분을 service로 이동시킨다.
		// 코드자성
		mService.insert(movie);
		return "regist_result";
	}

	/**
	 * '/search' 요청이 get 방식으로 들어왔을때 주어진 modelName을 모델명에 포함하는 자동차 리스트를 보여준다.
	 * 
	 * @param modelName
	 * @return
	 */
	@GetMapping("/search")
	public String showSearchModelNameList(Model model, SearchCondition con) {
		List<Movie> movies = mService.searchByCondition(con);
		model.addAttribute("movies",movies);
		// 코드작성
		return "list";
	}


}
