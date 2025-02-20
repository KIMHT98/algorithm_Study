package com.ssafy.ws.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.dto.User;
import com.ssafy.ws.service.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookController {
	private final BookService bookService;

	@Autowired
	public BookController(BookService bookService) {
		this.bookService = bookService;
	}
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
	 * 사용자의 요청에서 계정 정보를 추출해 로그인 처리한다. 일단 사용자 id가 ssafy, 비밀번호가 1234면 로그인에 성공으로 간주한다.
	 * 로그인 성공 시 session에 정보를 담고 redirect로 index로 이동한다. 그렇지 않을 경우는 로그인 실패 메시지를 model에
	 * 담고 forward로 index로 이동한다.
	 * 
	 * @param user    전달된 파라미터는 ModelAttribute를 통해서 객체로 받을 수 있다.
	 * @param session 사용자 정보를 세션에 저장하기 위해 사용한다.
	 * @param model   Request scope에 정보를 저장하기 위해서 사용된다.
	 * @return
	 */
	@PostMapping("/login")
	public String doLogin(@ModelAttribute User user, HttpSession session, Model model) {
		if (user.getId().equals("ssafy") && user.getPass().equals("1234")) {
			user.setName("김싸피");
			session.setAttribute("loginUser", user);
			return "redirect:/";
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
	 * /list를 get 방식으로 요청할 때 도서 정보를 보여준다.
	 * </pre>
	 * 
	 * 아직 MVC의 model 영역을 완성하지 않았기 때문에 여러 개의 Book을 직접 생성해서 List 형태로 전달한다. 정보를 Model
	 * 객체에 저장 후 forward로 list를 호출한다.
	 * 
	 * @return
	 */
	@GetMapping("/list")
	public String showList(Model model) {
		List<Book> books = bookService.getBookList();
		model.addAttribute("books", books);
		return "list";
	}

	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("isbn") String isbn) {
		Book book = bookService.readBook(isbn);
		model.addAttribute("book",book);
		return "detail"; 
	}
	
	@GetMapping("/regist")
	public String showRegistForm() {
		return "regist";
	}

	
	@PostMapping("/regist")
	public String doRegist(@ModelAttribute Book book) {
		bookService.writeBook(book);
		return "regist_result";
	}
	@GetMapping("/updateform")
	public String updateform(Model model, @RequestParam("isbn") String isbn) {
		model.addAttribute("book",bookService.readBook(isbn));
		return "updateform";
	}
	@PostMapping("/update")
	public String update(@ModelAttribute Book book) {
		bookService.modifyBook(book);
		return "redirect:detail?isbn="+book.getIsbn();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("isbn") String isbn) {
		bookService.removeBook(isbn);
		return "redirect:list";
	}
	
	@RequestMapping("/error/404")
	public String showError404() {
		return "error/404";
	}

	/**
	 * <pre>
	 * /error/commonerr 요청이 get 방식으로 들어왔을 때 error/commonerr로 연결한다.
	 * </pre>
	 * 
	 * @return
	 */
	@RequestMapping("/error/commonerr")
	public String showError500() {
		return "error/commonerr";
	}
}
