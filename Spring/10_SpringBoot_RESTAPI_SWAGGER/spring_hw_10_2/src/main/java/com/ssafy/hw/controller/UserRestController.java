package com.ssafy.hw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.hw.model.dto.SearchCondition;
import com.ssafy.hw.model.dto.User;
import com.ssafy.hw.model.service.UserService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "user-rest-controller", description = "User Rest Controller")
@RestController
@RequestMapping("/userapi")
@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST })
public class UserRestController {

	private final UserService uService;

	@Autowired
	public UserRestController(UserService uService) {
		this.uService = uService;
	}

	@GetMapping("/user")
	@Operation(summary = "등록된 모든 사용자 정보를 반환한다.", description = "사용자 목록 조회")
	public ResponseEntity<?> list() {
		try {
			List<User> users = uService.selectAll();
			if (users == null) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<>(users, HttpStatus.OK);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	private ResponseEntity<?> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/user")
	@Operation(summary = "사용자 정보를 삽입한다.", description = "사용자 등록")
	public ResponseEntity<?> registUser(@RequestBody User user) {
		try {
			int result = uService.insert(user);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	@GetMapping("/user/{id}")
	@Operation(summary = "{id}에 해당하는 사용자 정보를 반환한다.", description = "사용자 조회")
	public ResponseEntity<?> getUser(@PathVariable("id") String id) {
		try {
			User user = uService.searchById(id);
			if (user == null) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<>(user, HttpStatus.OK);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	@GetMapping("/user/search")
	@Operation(summary="SearchCondition에 부합하는 조건을 가진 사용자 목록을 반환한다.", description="사용자 검색 결과")
	public ResponseEntity<?> search(@ModelAttribute SearchCondition con) {
		try {
			List<User> users = uService.searchByCondition(con);
			if (users == null) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);

			} else {
				return new ResponseEntity<>(users, HttpStatus.OK);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

}
